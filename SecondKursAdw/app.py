# библиотеки
from flask import Flask, render_template, request, g, flash, abort, redirect, url_for, make_response 
import os
import pyodbc
import flask_wtf
# библиотека с авторизацией
from flask_login import LoginManager, login_user, login_required, logout_user, current_user, UserMixin
# подключаем остальные классы
from fDataBase import fDataBase
from UserLogin import UserLogin
import random
import datetime
app = Flask(__name__)
CSRF_ENABLED = True 
SECRET_KEY= '327327373838382912ekdndd1210dqdqdjddsd1dasdqed3fd3er4f53445j' # секретный ключ 
app.config['SECRET_KEY'] = SECRET_KEY

# логин менеджер
login_manager = LoginManager(app)
login_manager.login_view = 'login'
login_manager.login_message = "Авторизуйтесь для доступа к закрытым страницам"
login_manager.login_message_category = "success"

wsgi_app = app.wsgi_app

# главная страница
@app.route('/')
@app.route('/index')
def hello():
    if current_user.is_authenticated: # Если пользовать уже авторизован
        return redirect(url_for('profile', user_id = current_user.get_id()))
    # Default значение
    return render_template('MainPage.html', title = 'Главная')

conn = None # Соединение
mainCursor = None   # Курсор БД

@app.before_request
def before_request():
    """Установление соединения с БД перед выполнением запроса"""
    global conn
    conn = pyodbc.connect(
    "Driver={ODBC Driver 17 for SQL Server};"
    "Server=ZHEREBEC;"
    "Database=AdwiserLogDataBase;"
    "Trusted_Connection=yes;")

    global mainCursor
    mainCursor = conn.cursor()

@app.teardown_appcontext
def close_db(error):
    '''Закрываем соединение с БД, если оно было установлено'''
    if hasattr(g, 'link_db'):
        g.link_db.close()
    
@login_manager.user_loader
def load_user(user_id):
    '''Загрузка пользователя'''
    print("load_user")
    return UserLogin().fromDb(user_id, mainCursor)

@app.route('/profile/<user_id>/registration', methods=["POST", "GET"])
@login_required
def RegTest(user_id):
    '''Регистрация нового пользователя'''
    if current_user.is_admin(mainCursor): # если пользователь админ
        if request.method=="POST": 
            if len(request.form['login']) > 4 and len(request.form['psw']) > 4 and request.form['psw'] == request.form['psw2']: # простая проверка
                res = AddUser(request.form['login'], request.form['psw'])
                if res:
                    flash("Вы успешно зарегистрировали нового пользователя", "success") # Сообщение пользователю
                    return redirect(url_for('RegTest', user_id = current_user.get_id())) # Переход на эту же страницу
                else:
                    flash ("Ошибка при добавлении в БД", "error") # Сообщение пользователю
            else:
                flash("Неверно заполнены поля", "error") # Сообщение пользователю
    else: # если пользователь не админ
        flash("У вас нет прав доступа к данной странице", "error") # Сообщение пользователю
        return redirect(url_for('login'))
 
    return render_template("testreg.html", title="Регистрация") # отображение страницы


def AddUser(login, psw):
    '''Добавление пользователя'''
    try:
        # Проверка на наличие пользователя в БД
        mainCursor.execute(f"SELECT Users.UserLogin FROM Users WHERE UserLogin LIKE '{login}';")
        res = mainCursor.fetchone()
        if res is not None:
            print ("Пользователь с таким логином уже существует")   
            return False
        # Добавляем в БД
        mainCursor.execute("SET IDENTITY_INSERT Users ON")
        mainCursor.execute("INSERT INTO Users(UserID, UserLogin, UserPassword, IsAdmin) VALUES ((SELECT COUNT(Users.UserID) from Users)+1, ?, ?, 0);", (login, psw))
        mainCursor.execute("SET IDENTITY_INSERT Users OFF")
        
        # Работаем с таблицей "Recording(listOfLists, numberOfIteration)"
        mainCursor.execute("SELECT COUNT(Users.UserID) from Users")
        count = mainCursor.fetchone()

        listA = [count[0], count[0], count[0], count[0]]
        listB = ["'Users'","'Users'","'Users'","'Users'"]
        listC = ["'StudentID'", "'UserLogin'", "'UserPassword'", "'IsAdmin'"]
        listD = ["'Admin'","'Admin'","'Admin'","'Admin'"]
        listE = ['Null', 'Null', 'Null', 'Null']
        listF = [count[0], f"'{login}'", f"'{psw}'", "'0'"]
        listOfLists = [listA, listB, listC,listD, listE, listF]
        Recording(listOfLists, 4)
    except:
        print("Ошибка добавления пользователя в БД - AddUser")
        return False

    return True

def Recording(listOfLists, numberOfIteration):
    '''Добавление записей в БД. listOfLists = Лист Листов, numberOfIteration - Количество строк, необходимых внести в БД'''
    mainCursor.execute("SET IDENTITY_INSERT Recording ON")
    for i in range(numberOfIteration):
        mainCursor.execute(f"Insert into Recording (RecordID, PKKeyOfTable, DateOfRecord, NameOfTable, NameOfColumn, Executor, OldValue, NewValue) \
            VALUES ((Select count(Recording.RecordID) from Recording)+1,{listOfLists[0][i]}, GETDATE(), {listOfLists[1][i]},  {listOfLists[2][i]}, {listOfLists[3][i]}, {listOfLists[4][i]}, {listOfLists[5][i]})")
    mainCursor.execute("SET IDENTITY_INSERT Recording OFF")   
    conn.commit()


@app.route('/profile/<user_id>/createstudent', methods = ["POST","GET"])
@login_required
def CreateStudent(user_id):
    '''Добавление студента в систему'''
    if current_user.is_admin(mainCursor):  # если пользователь админ
        if request.method == "POST":
            if len(request.form['fstName']) > 1 and len(request.form['scdName']) > 2 and request.form['userId'] is not None and request.form['groupId'] is not None:    # простая проверка
                res = AddStudent(request.form['fstName'], request.form['scdName'], request.form['thrName'], request.form['userId'], request.form['groupId'])    # создаем студента
                if res:
                    flash("Вы успешно добавили студента", "success") # Сообщение пользователю
                    return redirect(url_for('CreateStudent', user_id = current_user.get_id())) # переход на эту же страницу
                else:
                    flash ("Ошибка при добавлении в БД", "error") # Сообщение пользователю
            else:
                flash("Неверно заполнены поля", "error") # Сообщение пользователю
    else:
        flash("У вас нет прав доступа к данной странице", "error") # Сообщение пользователю
        return redirect(url_for('login'))

    return render_template("createstudent.html", title="Добавление студента")


def AddStudent(name, lastName, middleName, userId, groupId):
    '''Создание студента'''
    try:
        # Проверка на наличие пользователя в БД
        mainCursor.execute(f"SELECT Students.StudentID FROM Students WHERE UserID LIKE {userId}") 
        res = mainCursor.fetchone()
        if res is not None:
            print ("Пользователь с таким login/password уже существует (student)")
            return False
        mainCursor.execute(f"SELECT Professors.ProfessorID FROM Professors WHERE UserID LIKE {userId}")
        res2 = mainCursor.fetchone()
        if res2 is not None:
            print ("Пользователь с таким login/password уже существует (professor)")
            return False
        # Добавление в бд
        mainCursor.execute("SET IDENTITY_INSERT Students ON")
        mainCursor.execute("INSERT INTO Students(StudentID, UserID, StudentFirstName, StudentLastName, StudentMiddleName, GroupID) \
            VALUES ((SELECT COUNT(Students.StudentID) from Students)+1, ?, ?, ?, ?, ?)", (userId, name, lastName, middleName, groupId))
        mainCursor.execute("SET IDENTITY_INSERT Students OFF")

        # Работаем с таблицей "Recording(listOfLists, numberOfIteration)"
        mainCursor.execute("SELECT COUNT(Students.StudentID) from Students")
        count = mainCursor.fetchone()

        listA = [count[0], count[0], count[0], count[0], count[0], count[0]]
        listB = ["'Students'","'Students'","'Students'","'Students'","'Students'","'Students'"]
        listC = ["'StudentID'", "'UserID'", "'StudentFirstName'", "'StudentLastName'", "'StudentMiddleName'", "'GroupID'"]
        listD = ["'Admin'","'Admin'","'Admin'","'Admin'", "'Admin'", "'Admin'"]
        listE = ['Null', 'Null', 'Null', 'Null', 'Null', 'Null']
        listF = [count[0], f"'{userId}'", f"'{name}'", f"'{lastName}'", f"'{middleName}'", f"'{groupId}'"]
        listOfLists = [listA, listB, listC,listD, listE, listF]
        Recording(listOfLists, 6)
    except:
        print("Ошибка добавления пользователя в БД - AddStudent")
        return False

    return True

@app.route('/profile/<user_id>/createprofessor', methods = ["POST","GET"])
@login_required
def CreateProfessor(user_id):
    '''Добавление преподвателя в систему'''
    if current_user.is_admin(mainCursor):  # если пользователь админ
        if request.method == "POST":
            if len(request.form['fstName']) > 1 and len(request.form['scdName']) > 2 and request.form['userId'] is not None:    # простая проверка
                res = AddProfessor(request.form['fstName'], request.form['scdName'], request.form['thrName'], request.form['userId'])   # создание преподавателя
                if res:
                    flash("Вы успешно добавили преподавателя", "success") # Сообщение пользователю
                    return redirect(url_for('CreateProfessor', user_id = current_user.get_id()))    # переход на эту же страницу
                else:
                    flash ("Ошибка при добавлении в БД", "error") # Сообщение пользователю
            else:
                flash("Неверно заполнены поля", "error") # Сообщение пользователю
    else:
        flash("У вас нет прав доступа к данной странице", "error") # Сообщение пользователю
        return redirect(url_for('login'))

    return render_template("createprofessor.html", title="Добавление преподавателя")


def AddProfessor(name, lastName, middleName, userId):
    '''Создание нового преподавателя'''
    try:
        # проверка на наличие пользователя в бд
        mainCursor.execute(f"SELECT Students.StudentID FROM Students WHERE UserID LIKE {userId}") 
        res = mainCursor.fetchone()
        if res is not None:
            print ("Пользователь с таким login/password уже существует (student)")
            return False
        mainCursor.execute(f"SELECT Professors.ProfessorID FROM Professors WHERE UserID LIKE {userId}")
        res2 = mainCursor.fetchone()
        if res2 is not None:
            print ("Пользователь с таким login/password уже существует (professor)")
            return False
        # добавление преподавателя в бд
        mainCursor.execute("SET IDENTITY_INSERT Professors ON")
        mainCursor.execute("INSERT INTO Professors(ProfessorID, UserID, ProfessorFirstName, ProfessorLastName, ProfessorMiddleName) \
            VALUES ((SELECT COUNT(Professors.ProfessorID) from Professors)+1, ?, ?, ?, ?)", (userId, name, lastName, middleName))
        mainCursor.execute("SET IDENTITY_INSERT Professors OFF")
        
        # Работаем с таблицей "Recording(listOfLists, numberOfIteration)"
        mainCursor.execute("SELECT COUNT(Professors.ProfessorID) from Professors")
        count = mainCursor.fetchone()

        listA = [count[0], count[0], count[0], count[0], count[0]]
        listB = ["'Professors'","'Professors'","'Professors'","'Professors'","'Professors'"]
        listC = ["'ProfessorID'", "'UserID'", "'ProfessorFirstName'", "'ProfessorLastName'", "'ProfessorMiddleName'"]
        listD = ["'Admin'","'Admin'","'Admin'","'Admin'", "'Admin'"]
        listE = ['Null', 'Null', 'Null', 'Null', 'Null']
        listF = [count[0], f"'{userId}'", f"'{name}'", f"'{lastName}'", f"'{middleName}'"]
        listOfLists = [listA, listB, listC,listD, listE, listF]
        Recording(listOfLists, 5)
    except:
        print("Ошибка добавления пользователя в БД - AddProfessor")
        return False

    return True


@app.route('/login', methods = ["POST", "GET"])
def login():
    '''Авторизация'''
    # если пользователь уже авторизован
    if current_user.is_authenticated:
        return redirect(url_for('profile', user_id = current_user.get_id()))

    # если метод пост
    if request.method == "POST":
        user = fDataBase.getUserByLogin(mainCursor, request.form['login'])  # поиск логина в бд
        psw = fDataBase.getUserPassword(mainCursor,request.form['login'])   # поиск пароля по логину в бд
        if user and psw[0] == request.form['psw']:  # если совпадают пароль и логин
            userlogin = UserLogin().create(user)    # авторизация пользователя, запоминаем ID текущего пользователя для дальнейшей работы
            login_user(userlogin)   # передаем объект класса UserLogin в login_user
            print(f"Вход выполнен успешно. Текущий пользователь: {request.form['login']}")
            return redirect(url_for('profile', user_id = current_user.get_id()))    # переход в профиль
        flash("Неверная пара логин/пароль", "error") # Иначе: Сообщение пользователю
   
    return render_template("login.html", title = "Авторизация")

    
@app.route('/profile/<user_id>/creatework', methods = ["POST","GET"])
@login_required
def createWork(user_id):
    '''Создание новой работы студентам'''
    if current_user.is_professor(mainCursor): #если пользователь преподаватель
        if request.method == "POST":
            if len(request.form['nameOfWork']) > 5 and len(request.form['Task']) > 10 and request.form['numberOfGroup'] is not None and request.form['day'] is not None \
                and request.form['month'] is not None and request.form['year'] is not None and request.form['hour'] is not None and request.form['minute']:     # простая проверка
                res = AddWork(request.form['nameOfWork'], request.form['Task'], request.form['numberOfGroup'], request.form['year'], request.form['month'], request.form['day'], request.form['hour'], request.form['minute']) # создание записи в бд
                if res:
                    flash("Вы успешно добавили задание", "success") # Сообщение пользователю
                    return redirect(url_for('profile', user_id = current_user.get_id()))
                else:
                    flash ("Ошибка при добавлении в БД", "error") # Сообщение пользователю
            else:
                flash("Неверно заполнены поля", "error") # Сообщение пользователю
    else:
        flash("У вас нет прав доступа к данной странице", "error") # Сообщение пользователю
        return redirect(url_for('login'))

    return render_template("createWork.html", title="Добавление задания")


def AddWork(nameOfWork, Task, numberOfGroup, year, month, day, hour, minute):
    '''Создание новой работы преподавателем в БД'''
    try:
        # Url работы, оказался бесполезным.
        stringNameWork = nameOfWork.replace(" ", "-")
        now = datetime.datetime.now()
        stringNameWork = stringNameWork + "-" + str(now.strftime("%Y-%m-%d"))
        # запись в бд
        mainCursor.execute("SET IDENTITY_INSERT Works ON")
        mainCursor.execute(f"INSERT INTO Works(WorkID, ProfessorsID, Task, DateOfBegin, DateOfEnd, NameOfWork, UrlOfWork, GroupID) \
            VALUES ((SELECT COUNT(Works.WorkID) from Works)+ 4, {current_user.id_of_professor(mainCursor)}, '{Task}', GETDATE(), DATETIMEFROMPARTS({year}, {month}, {day}, {hour}, {minute}, 00, 000), '{nameOfWork}', '{stringNameWork}', {numberOfGroup})")
        mainCursor.execute("SET IDENTITY_INSERT Works OFF")

        # Работаем с таблицей "Recording(listOfLists, numberOfIteration)"
        mainCursor.execute("SELECT COUNT(Works.WorkID) from Works")
        count = mainCursor.fetchone()
        count[0] = count[0] + 3
        strName = current_user.name_of_professor(mainCursor)
        listA = [count[0], count[0], count[0], count[0], count[0], count[0], count[0], count[0]]
        listB = ["'Works'","'Works'","'Works'","'Works'","'Works'","'Works'","'Works'","'Works'"]
        listC = ["'WorkID'", "'ProfessorID'", "'Task'", "'DateOfBegin'", "'DateOfEnd'", "'NameOfWork'", "'UrlOfWork'", "'GroupID'"]
        listD = [f"'{strName}'",f"'{strName}'",f"'{strName}'",f"'{strName}'",f"'{strName}'",f"'{strName}'",f"'{strName}'",f"'{strName}'"]
        listE = ['Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null']
        listF = [count[0], f'{current_user.get_id()}', f"'{Task}'", 'GETDATE()', f'DATETIMEFROMPARTS({year}, {month}, {day}, {hour}, {minute}, 00, 000)', f"'{nameOfWork}'", f"'{stringNameWork}'", f"'{numberOfGroup}'"]
        listOfLists = [listA, listB, listC,listD, listE, listF]
        Recording(listOfLists, 8)
    except:
        print("Ошибка добавления задания в БД - AddWork")
        return False

    return True


@app.route('/profile/<user_id>')
@login_required
def profile(user_id): 
    '''Функция, отображающая профиль студента'''
    if current_user.is_student(mainCursor):     #Если студент
        nameOfUser = current_user.name_of_student(mainCursor)
        role = "Студент"

        if current_user.is_admin(mainCursor):   #Если админ. !!!Важно - Админ имеет роль студента!!!
            role = "Администратор"
            return render_template("profileadm.html", title=f"Профиль - {nameOfUser}", nameOfAdmin = nameOfUser, role = role)
        
        return render_template("profilestd.html", title=f"Профиль - {nameOfUser}", nameOfStudent = nameOfUser, tasksBeforeDeadline=fDataBase.getTaskBeforeDeadline(mainCursor, current_user.get_id()), \
            role = role, tasksAfterDeadline = fDataBase.getTaskAfterDeadline(mainCursor, current_user.get_id()))

    elif current_user.is_professor(mainCursor): #Если преподаватель
        nameOfUser = current_user.name_of_professor(mainCursor)
        role = "Преподаватель"
        return render_template("profiletchr.html", title=f"Профиль - {nameOfUser}", nameOfTeacher = nameOfUser, role = role)
    
    # Default значение
    return render_template("profiledefault.html", title="Профиль")
    
@app.route('/profile/<user_id>/task/<id_post>', methods=["POST", "GET"])
@login_required
def showTask(user_id, id_post):
    '''Функция отображения задания'''
    if current_user.is_student(mainCursor):     # если студент
        title, task, DateOfBegin, DateOfEnd = fDataBase.getTask(mainCursor, id_post)
        professor = fDataBase.getProffesorByTask(mainCursor, id_post)
        if not title:
            abort(404)
        tf = False      # true / false насчёт прошёл ли дедлайн
        eu = False      # true / false насчёт есть ли такое эссе в бд
        if fDataBase.getIdTaskBeforeDeadline(mainCursor, id_post):  # смотрим, прошёл ли дедлайн
            tf = True   # Если не прошёл, то tf = True
    
        if request.method == "POST":
            if len(request.form['sea']) > 10:   # если длина текста >10, простая проверка
                res = CreateEssayResponce(current_user.get_id(), id_post, request.form['sea'])  #Создается запись в бд
                if res:
                    flash("Вы успешно отправили эссе на проверку", "success") # Сообщение пользователю
                else:
                    flash ("Ошибка при добавлении в БД", "error") # Сообщение пользователю
            else:
                flash("Неверно заполнены поля", "error") # Сообщение пользователю
    
        if fDataBase.isEssayFromDB(mainCursor, id_post, current_user.get_id()):
            studentEssayArea, resultEssayArea, gradeEssay, commentEssay, dateOfUploadEssay = fDataBase.getEssayFromDB(mainCursor, id_post, current_user.get_id())   #получаем эссе из бд
            eu = True   # если эссе уже есть в бд, то eu = true
            return render_template("task.html", title= title, task = task, DateOfBeginHTML = DateOfBegin, DateOfEndHTML = DateOfEnd, professorHTML = professor, tf = tf, sea = studentEssayArea, \
                rea = resultEssayArea, ge = gradeEssay, ce = commentEssay, doue = dateOfUploadEssay, eu = eu, post = id_post)   # получаем страницу
    else:
        flash("У вас нет прав доступа к данной странице", "error") # Сообщение пользователю
        return redirect(url_for('login'))
    return render_template("task.html", title= title, task = task, DateOfBeginHTML = DateOfBegin, DateOfEndHTML = DateOfEnd, professorHTML = professor, tf = tf, post = id_post)


@app.route('/profile/<user_id>/checkonwarnings', methods=["GET", "POST"])
@login_required
def checkonwarnings(user_id):
    '''Функция проверки на ошибки без записи в бд'''
    gradeRandom = 0
    rea = ""
    sea = ""
    if request.method == "POST":
        if len(request.form['sea']) > 10:   #простая проверка
            rea = request.form['sea']   #как заглушка, встанет адвайзер
            sea = request.form['sea']
            gradeRandom = random.randint(1,10)  # как заглушка, встанет адвайзер
        else:
            flash("Длина исходного текста меньше 10 символов") # Сообщение пользователю
    return render_template("checkonwarnings.html", title= "Проверить эссе", grade = gradeRandom, rea = rea, sea = sea, user_id = current_user.get_id())


def CreateEssayResponce(UserId, idPost, stdResponce):
    '''Добавление ответа студента на задание препода в БД'''
    try:
        # Пока стоят заглушки (оценка, результат)
        gradeRandom = random.randint(1,10)
        # добавление записи в бд
        mainCursor.execute("SET IDENTITY_INSERT Essay ON")
        mainCursor.execute(f"Insert into Essay(EssayID, WorkID, UserID, StudentEssay, ResultEssay, Grade, Comment, DateOfUpload) \
        VALUES ((SELECT COUNT(Essay.EssayID) from Essay)+3, {idPost}, {UserId}, '{stdResponce}', '{stdResponce}2', {gradeRandom}, NULL, GETDATE())")
        mainCursor.execute("SET IDENTITY_INSERT Essay OFF")

        # Работаем с таблицей "Recording(listOfLists, numberOfIteration)"
        mainCursor.execute("SELECT COUNT(Essay.EssayID) from Essay")
        count = mainCursor.fetchone()
        count[0] = count[0] + 2
        strName = current_user.name_of_student(mainCursor)

        listA = [count[0], count[0], count[0], count[0], count[0], count[0], count[0], count[0]]
        listB = ["'Essay'", "'Essay'","'Essay'","'Essay'","'Essay'","'Essay'","'Essay'","'Essay'"]
        listC = ["'EssayID'", "'WorkID'", "'UserID'","'StudentEssay'","'ResultEssay'","'Grade'","'Comment'","'DateOfUpload'"]
        listD = [f"'{strName}'",f"'{strName}'",f"'{strName}'",f"'{strName}'",f"'{strName}'",f"'{strName}'",f"'{strName}'",f"'{strName}'"]
        listE = ['Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null']
        listF = [count[0], f"'{idPost}'", f"'{UserId}'", f"'{stdResponce}'", f"'{stdResponce}2'", f"'{gradeRandom}'", 'NULL', 'GETDATE()']
        listOfLists = [listA, listB, listC,listD, listE, listF]
        Recording(listOfLists, 8)
    except:
        print("Ошибка добавления данных в БД - CreateEssayResponce")
        return False
    return True

@app.route('/profile/<user_id>/worksbyme/')
@login_required
def showWorksByMe(user_id):
    '''Просмотр заданий, выданных преподавателем'''
    if current_user.is_professor(mainCursor):   # если пользователь препод
        print(current_user.id_of_professor(mainCursor))
    else:
        flash("У вас нет прав доступа к данной странице", "error") # Сообщение пользователю
        return redirect(url_for('login'))
    return render_template("wrkbyme.html", title="Выданные мной задания", tasksBeforeDeadline=fDataBase.getTaskAnnonceByMe(mainCursor, current_user.id_of_professor(mainCursor)),\
        tasksAfterDeadline = fDataBase.getTaskAfterDeadline(mainCursor, current_user.id_of_professor(mainCursor)))


@app.route('/profile/<user_id>/worksbyme/<post_id>')
@login_required
def essayResp(post_id, user_id):
    '''Просмотр всех ответов студентов на задание'''
    nameOfWork = ""
    if current_user.is_professor(mainCursor):   # если пользователь препод
        nameOfWork = fDataBase.getWorkName(mainCursor, post_id) # получаем имя работы
        taskOfWork = fDataBase.getWorkTask(mainCursor, post_id) # получаем задание работы
    else:
        flash("У вас нет прав доступа к данной странице", "error") # Сообщение пользователю
        return redirect(url_for('login'))
    return render_template("essayresponse.html", title = f"Ответы к заданию {nameOfWork}", nameOfWork = nameOfWork, task = taskOfWork, responses = fDataBase.getEssayResponse(current_user.id_of_professor(mainCursor), mainCursor, post_id))


@app.route('/profile/<user_id>/worksbyme/<post_id>/<student_id>', methods=["GET", "POST"])
@login_required
def ShowEssays(post_id, user_id, student_id):
    '''Функция просмотра определенного эссе определенного студента'''
    stdEssay = ""
    rslEssay = ""
    grdEssay = ""
    comEssay = "" 
    douEssay = ""
    wkTask = ""
    if current_user.is_professor(mainCursor): # если пользователь препод
        stdEssay, rslEssay, grdEssay, comEssay, douEssay, wkTask = fDataBase.getMainInfoEssay(post_id, student_id, mainCursor)  # получаем данные по эссе
        titleOfEssay = fDataBase.getEssayWorkName(mainCursor,current_user.id_of_professor(mainCursor),post_id)
        if request.method == "POST":
            if len(request.form['comment']) > 2:    # процесс добавление комментария. минимум 2 знака.
                comOldEssay = comEssay
                comEssay = request.form['comment']
                UpdateComment(request.form['comment'], post_id, comOldEssay, student_id)    # изменяем комментарий к работе
                flash("Комментарий успешно добавлен") # Сообщение пользователю
            else:
                flash("Длина исходного текста меньше 2 символов") # Сообщение пользователю
    else:
        flash("У вас нет прав доступа к данной странице", "error") # Сообщение пользователю
        return redirect(url_for('login'))
    return render_template("essay.html", title = f"Ответ к заданию {titleOfEssay}", task = wkTask, essay = stdEssay, result = rslEssay, titleEs = titleOfEssay, grade = grdEssay, dateOfUpload = douEssay, comment = comEssay, post = post_id, student=student_id)


def UpdateComment(comment, post_id, comOldEssay, student_id):
    '''Функция изменения комментария к работе студента преподавателем'''
    try:
        userID = fDataBase.getUserIdByStudentId(student_id, mainCursor) # получаем ID пользователя студента
        essayID = fDataBase.idEssayFromDB(mainCursor, post_id, userID[0])       # получаем, является ли эссе в бд
        # заносим информацию в бд
        mainCursor.execute("SET IDENTITY_INSERT Essay ON")
        mainCursor.execute(f"Update Essay SET Comment = '{comment}' WHERE WorkID = {post_id} and UserID = {userID[0]}")
        mainCursor.execute("SET IDENTITY_INSERT Essay OFF")

        # Работаем с таблицей "Recording(listOfLists, numberOfIteration)"
        strName = current_user.name_of_professor(mainCursor)

        listA = [f'{essayID[0]}']
        listB = ["'Essay'"]
        listC = ["'Comment'"]
        listD = [f"'{strName}'"]
        listE = [f"'{comOldEssay}'"]
        listF = [f"'{comment}'"]
        listOfLists = [listA, listB, listC,listD, listE, listF]
        Recording(listOfLists, 1)
    except:
        print("Ошибка захода в БД - UpdateComment")
        return False
    return True


@app.route('/logout')
@login_required
def logout():
    '''Выход из системы'''
    logout_user()   # login_manager в деле
    flash("Вы вышли из аккаунта", "success") # Сообщение пользователю
    return redirect(url_for('login'))

@app.errorhandler(404)
def http_404_handler(error):
    '''Обработчик 404 ошибки'''
    return "<p>HTTP 404 Error Encountered</p>", 404

@app.errorhandler(500)
def http_500_handler(error):
    '''Обработчик 500 ошибки'''
    return "<p>HTTP 500 Error Encountered</p>", 500

# Запуск сервера
if __name__ == '__main__':
    import os
    HOST = os.environ.get('SERVER_HOST', 'localhost')
    try:
        PORT = int(os.environ.get('SERVER_PORT', '5555'))
    except ValueError:
        PORT = 5555
    app.run(HOST, PORT, debug)

    
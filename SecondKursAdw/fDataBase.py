class fDataBase:
    def getUser(user_id, mainCursor):
        '''Функция получения юзера'''
        try:
            mainCursor.execute(f"SELECT * FROM Users WHERE UserID = {user_id}")
            res = mainCursor.fetchone()
            if res is None:
                print("Пользователь не найден - getUser")
                return False
            return res  # возвращаем пользователя
        except:
            print("Ошибка получения данных из БД - getUser")
        return False    # иначе false

    def getUserPassword(mainCursor, login):
        '''Функция получения пароль пользователя'''
        try:
            mainCursor.execute(f"SELECT Users.UserPassword FROM Users WHERE UserLogin LIKE '{login}';")
            res = mainCursor.fetchone()
            return res  # возвращаем пароль
        except:
            print("Ошибка получения пароля пользователя - getUserPassword")
        return False

    def getUserByLogin(mainCursor, login):
        '''Функция получения пользователя по логину'''
        try:
            mainCursor.execute(f"SELECT * FROM Users WHERE UserLogin LIKE '{login}';")
            res = mainCursor.fetchone()
            return res
        except:
            print("Ошибка получения пароля пользователя - getUserByLogin")
        return False

    def getProffesorByTask(mainCursor, id_post):
        '''Функция получения ФИО преподавателя по ID работы'''
        try:
            mainCursor.execute(f"SELECT Professors.ProfessorLastName + ' ' + Professors.ProfessorFirstName + ' ' + Professors.ProfessorMiddleName as ФИО from Professors join Works ON Professors.ProfessorID = Works.ProfessorsID WHERE Works.WorkID = {id_post}")
            res = mainCursor.fetchone() #получаем кортеж
            res2 = res[0]   # достаем 1-ый элемент кортежа 
            return res2
        except:
            print("Ошибка добавления пользователя в БД - getProffesorByTask")
        return False

    def getTask(mainCursor, id_post):
        '''Функция получения работы'''
        try:
            mainCursor.execute(f"SELECT NameOfWork, Task, DateOfBegin, DateOfEnd FROM Works WHERE WorkID = {id_post}")
            res = mainCursor.fetchall() #получаем кортеж
            return res[0]   # достаем 1-ый элемент кортежа
        except:
            print("Ошибка добавления пользователя в БД - getTask")
        return False

    def getIdTaskBeforeDeadline(mainCursor, id_post):
        '''Функция получения ID работы, у которой НЕ прошёл дедлайн работы'''
        try:
            mainCursor.execute(f"SELECT Works.WorkID, Works.NameOfWork from Works where Works.DateOfEnd > GETDATE() and Works.WorkID = {id_post}")
            res = mainCursor.fetchone()
            if res: return True # возвращаем True
        except:
            print("Ошибка захода в БД - getIdTaskBeforeDeadline")
        return False     # иначе False


    def getTaskBeforeDeadline(mainCursor, currentID):
        '''Функция получения задания работы, у которой НЕ прошёл дедлайн'''
        try:
            mainCursor.execute(f"SELECT Works.WorkID, Works.NameOfWork FROM Works INNER JOIN Groups ON Groups.GroupID = Works.GroupID INNER JOIN Students ON Students.GroupID = Groups.GroupID Where Students.StudentID = {currentID} AND Works.DateOfEnd > GETDATE()")
            res = mainCursor.fetchall()
            return res
        except:
            print("Ошибка захода в БД - getTaskBeforeDeadline")
        return False 


    def getTaskAfterDeadline(mainCursor, currentID):
        '''Функция получения задания работы, у которой прошёл дедлайн'''
        try:
            mainCursor.execute(f"SELECT Works.WorkID, Works.NameOfWork FROM Works INNER JOIN Groups ON Groups.GroupID = Works.GroupID INNER JOIN Students ON Students.GroupID = Groups.GroupID Where Students.StudentID = {currentID} AND Works.DateOfEnd < GETDATE()")
            res = mainCursor.fetchall()
            return res
        except:
            print("Ошибка захода в БД - getTaskAfterDeadline")
        return False 


    def getTaskAnnonceByMe(mainCursor, currentID):
        '''Функция получения ID и наименования работы по ID профессора ДО дедлайна'''
        try:
            mainCursor.execute(f"select Works.WorkID, Works.NameOfWork from Works INNER JOIN Professors ON works.ProfessorsID = Professors.ProfessorID WHERE Professors.ProfessorID = {currentID} and Works.DateOfEnd > GETDATE()")
            res = mainCursor.fetchall()
            return res
        except:
            print("Ошибка захода в БД - getTasksAnnonceByMe")
        return False 

    def getTaskAnnonceByMeAfterDeadLine(mainCursor, currentID):
        '''Функция получения ID и наименования работы по ID профессора ПОСЛЕ дедлайна'''
        try:
            mainCursor.execute(f"select Works.WorkID, Works.NameOfWork from Works INNER JOIN Professors ON works.ProfessorsID = Professors.ProfessorID WHERE Professors.ProfessorID = {currentID} and Works.DateOfEnd < GETDATE()")
            res = mainCursor.fetchall()
            return res
        except:
            print("Ошибка захода в БД - getTaskAnnonceByMeAfterDeadLine")
        return False     

    def isEssayFromDB(mainCursor, idPost, UserId):
        '''Функция определения, находится ли данное эссе в бд'''
        try:
            mainCursor.execute(f"SELECT Essay.EssayID from Essay inner join Users on Users.UserID = Essay.UserID inner join Works on \
                Works.WorkID = Essay.WorkID where Users.UserID = {UserId} and Works.WorkID = {idPost}")
            res = mainCursor.fetchone()
            if res: return True
        except:
            print("Ошибка захода в БД - isEssayFromDB")
        return False

    def idEssayFromDB(mainCursor, idPost, UserId):
        '''Функция поиска ID эссе из БД'''
        try:
            mainCursor.execute(f"SELECT Essay.EssayID from Essay inner join Users on Users.UserID = Essay.UserID inner join Works on \
                Works.WorkID = Essay.WorkID where Users.UserID = {UserId} and Works.WorkID = {idPost}")
            res = mainCursor.fetchone()
            if res: return res
        except:
            print("Ошибка захода в БД - isEssayFromDB")
        return False

    def getEssayFromDB(mainCursor, idPost, UserId):
        '''Функция получения эссе из БД'''
        try:
            mainCursor.execute(f"SELECT Essay.StudentEssay, Essay.ResultEssay, Essay.Grade, Essay.Comment, Essay.DateOfUpload FROM \
                Essay Inner join Users on Users.UserID = Essay.UserID Inner join Works on Essay.WorkID = Works.WorkID WHERE Users.UserID = {UserId} and Works.WorkID = {idPost}")
            res = mainCursor.fetchall()
            return res[0]
        except:
            print("Ошибка захода в БД - getEssayFromDB")
        return "","","","",""

    def getEssayWorkName(mainCursor, professorID, idPost):
        '''Функция получения наименования работы по ID преподавателя и работы'''
        try:
            mainCursor.execute(f"SELECT Works.NameOfWork FROM Students INNER JOIN Users ON Users.UserID = Students.UserID Inner join Essay ON Users.UserID = Essay.UserID INNER join Works on Works.WorkID = Essay.WorkID inner join Professors on Professors.ProfessorID = Works.ProfessorsID where Professors.ProfessorID = {professorID} and Works.WorkID = {idPost}")
            res = mainCursor.fetchone()
            return res[0]
        except:
            print("Ошибка захода в БД - getEssayWorkName")
        return False
            
    def getWorkName(mainCursor, idPost):
        '''Функция получения наименование работы по ID работы'''
        try:
            mainCursor.execute(f"select Works.NameOfWork from Works where Works.WorkID = {idPost}")
            res = mainCursor.fetchone()
            return res[0]
        except:
            print("Ошибка захода в БД - getWorkName")
        return False

    def getWorkTask(mainCursor, idPost):
        '''Функция получения задания работы по ID работы'''
        try:
            mainCursor.execute(f"select Works.Task from Works where Works.WorkID = {idPost}")
            res = mainCursor.fetchone()
            return res[0]
        except:
            print("Ошибка захода в БД - getWorkTask")
        return False


    def getEssayResponse(professorID, mainCursor, idPost):
        '''Функция получения ФИО студента, ID работы и ID студента по ID преподавателя и работы'''
        try:
            mainCursor.execute(f"SELECT Students.StudentLastName + ' ' + Students.StudentFirstName + ' ' + Students.StudentMiddleName as ФИО, Works.WorkID, Students.StudentID FROM Students INNER JOIN Users ON Users.UserID = Students.UserID Inner join Essay ON Users.UserID = Essay.UserID INNER join Works on Works.WorkID = Essay.WorkID inner join Professors on Professors.ProfessorID = Works.ProfessorsID where Professors.ProfessorID = {professorID} and Works.WorkID = {idPost}")
            res = mainCursor.fetchall()
            return res
        except:
            print("Ошибка захода в БД - getEssayResponse")
        return False


    def getMainInfoEssay(idPost, idStudent, mainCursor):
        '''Функция получения основной информации по эссе из БД по ID студента и работы'''
        try:
            mainCursor.execute(f"SELECT Essay.StudentEssay, Essay.ResultEssay, Essay.Grade, Essay.Comment, Essay.DateOfUpload, Works.Task FROM Essay Inner join Users on Users.UserID = Essay.UserID Inner join Works on Essay.WorkID = Works.WorkID INNER JOIN Students on Users.UserID = Students.UserID WHERE Students.StudentID ={idStudent} and Works.WorkID = {idPost}")
            res = mainCursor.fetchone()
            return res
        except:
            print("Ошибка захода в БД - getMainInfoEssay")
        return False

    def getUserIdByStudentId(student_id, mainCursor):
        '''Получение ID пользователя по ID студента'''
        try:
            mainCursor.execute(f"select Users.UserID from Users inner join Students on Students.UserID = Users.UserID where Students.StudentID = {student_id}")
            res = mainCursor.fetchone()
            return res
        except:
            print("Ошибка захода в БД - getUserIdByStudentId")
        return False
        

from fDataBase import fDataBase
from flask_login import UserMixin
from flask import url_for
class UserLogin(UserMixin):
    def fromDb(self, user_id, mainCursor):
        '''Процесс создание объекта класса UserLogin'''
        self.__user = fDataBase.getUser(user_id, mainCursor)
        return self

    def create(self, user):
        '''Функция создания нового пользователя'''
        self.__user = user
        return self

    def is_authenticated(self):
        '''Функция проверки, авторизован ли пользователь'''
        return True

    def is_active(self):
        '''Функция проверки, активен ли пользователь'''
        return True

    def is_anonymous(self):
        '''Функция проверки, аноним ли пользователь'''
        return False

    def get_id(self):
        '''Функция получения ID пользователя'''
        return str(self.__user[0])

    def is_admin(self, mainCursor):
        '''Функция проверяющая, является ли пользователь админом'''
        try:
            mainCursor.execute(f"SELECT Users.UserID FROM Users WHERE Users.IsAdmin = '1' AND Users.UserID = {self.get_id()}")
            res = mainCursor.fetchone()
            if not res:
                print("Пользователь не найден - is_admin")
                return False
            return True
        except:
            print("Ошибка получения данных из БД - is_admin")
        return False

    def is_student(self, mainCursor):
        '''Функция проверяющая, является ли пользователь студентом'''
        try:
            mainCursor.execute(f"SELECT Students.StudentFirstName, Students.StudentLastName, Students.StudentMiddleName FROM Users INNER JOIN Students ON Users.UserID = Students.UserID WHERE Students.UserID={self.get_id()}; ")
            res = mainCursor.fetchone()
            if not res:
                print("Пользователь не найден - is_student")
                return False
            return True
        except:
            print("Ошибка получения данных из БД - is_student")
        return False

    def id_of_professor(self, mainCursor):
        '''Функция получения ID преподавателя'''
        try:
            mainCursor.execute(f"select Professors.ProfessorID FROM Professors Inner join Users on Users.UserID = Professors.UserID WHERE Users.UserID = {self.get_id()} ")
            res = mainCursor.fetchone()
            if not res:
                print("Пользователь не найден - id_of_professor")
                return False
            return res[0]
        except:
            print("Ошибка получения данных из БД - id_of_professor")
        return False

    def is_professor(self, mainCursor):
        '''Функция проверяющая, является ли пользователь преподавателем'''
        try:
            mainCursor.execute(f"SELECT Professors.ProfessorFirstName, Professors.ProfessorLastName, Professors.ProfessorMiddleName FROM Users INNER JOIN Professors ON Users.UserID = Professors.UserID WHERE Professors.UserID={self.get_id()}; ")
            res = mainCursor.fetchone()
            if not res:
                print("Пользователь не найден - is_professor")
                return False
            return True
        except:
            print("Ошибка получения данных из БД - is_professor")
        return False

    def name_of_student(self, mainCursor):
        '''Функция получения имени студента'''
        try:
            mainCursor.execute(f"SELECT Students.StudentLastName + ' ' + Students.StudentFirstName + ' ' + Students.StudentMiddleName as ФИО FROM Users INNER JOIN Students ON Users.UserID = Students.UserID WHERE Students.UserID={self.get_id()}; ")
            res = mainCursor.fetchone()
            if not res:
                print("Пользователь не найден - name_of_student")
                return False
            return res[0]
        except:
            print("Ошибка получения данных из БД - name_of_student")
        return False

    def name_of_professor(self, mainCursor):
        '''Функция получения имени студента'''
        try:
            mainCursor.execute(f"SELECT Professors.ProfessorLastName + ' ' + Professors.ProfessorFirstName + ' ' + Professors.ProfessorMiddleName FROM Users INNER JOIN Professors ON Users.UserID = Professors.UserID WHERE Professors.UserID={self.get_id()}; ")
            res = mainCursor.fetchone()
            if not res:
                print("Пользователь не найден - name_of_professor")
                return False
            return res[0]
        except:
            print("Ошибка получения данных из БД - name_of_professor")
        return False

            
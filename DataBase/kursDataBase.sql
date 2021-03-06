USE [master]
GO
/****** Object:  Database [AdwiserLogDataBase]    Script Date: 24.03.2021 14:58:14 ******/
CREATE DATABASE [AdwiserLogDataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdwiserLogDataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AdwiserLogDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdwiserLogDataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AdwiserLogDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AdwiserLogDataBase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdwiserLogDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdwiserLogDataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdwiserLogDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdwiserLogDataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdwiserLogDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdwiserLogDataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET RECOVERY FULL 
GO
ALTER DATABASE [AdwiserLogDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [AdwiserLogDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdwiserLogDataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdwiserLogDataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdwiserLogDataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdwiserLogDataBase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AdwiserLogDataBase', N'ON'
GO
ALTER DATABASE [AdwiserLogDataBase] SET QUERY_STORE = OFF
GO
USE [AdwiserLogDataBase]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 24.03.2021 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[DirectionID] [int] NULL,
	[CourseNameID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseNames]    Script Date: 24.03.2021 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseNames](
	[CourseNameID] [int] IDENTITY(1,1) NOT NULL,
	[NameOfCourse] [int] NOT NULL,
	[LevelOfCourse] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direction]    Script Date: 24.03.2021 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direction](
	[DirectionID] [int] IDENTITY(1,1) NOT NULL,
	[DirectionName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DirectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Essay]    Script Date: 24.03.2021 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Essay](
	[EssayID] [int] IDENTITY(1,1) NOT NULL,
	[WorkID] [int] NULL,
	[UserID] [int] NULL,
	[StudentEssay] [nvarchar](4000) NOT NULL,
	[ResultEssay] [nvarchar](4000) NOT NULL,
	[Grade] [int] NOT NULL,
	[Comment] [nvarchar](4000) NULL,
	[DateOfUpload] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[EssayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 24.03.2021 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[NumberOfGroup] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professors]    Script Date: 24.03.2021 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[ProfessorID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProfessorFirstName] [nvarchar](50) NOT NULL,
	[ProfessorLastName] [nvarchar](50) NOT NULL,
	[ProfessorMiddleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProfessorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recording]    Script Date: 24.03.2021 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recording](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[DateOfRecord] [datetime] NULL,
	[NameOfTable] [nvarchar](4000) NULL,
	[NameOfColumn] [nvarchar](4000) NULL,
	[Executor] [nvarchar](4000) NULL,
	[OldValue] [nvarchar](4000) NULL,
	[NewValue] [nvarchar](4000) NULL,
	[PKKeyOfTable] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 24.03.2021 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[StudentFirstName] [nvarchar](50) NOT NULL,
	[StudentLastName] [nvarchar](50) NOT NULL,
	[StudentMiddleName] [nvarchar](50) NULL,
	[GroupID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24.03.2021 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserLogin] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK__Users__1788CCAC6A84E5FB] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Works]    Script Date: 24.03.2021 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Works](
	[WorkID] [int] IDENTITY(1,1) NOT NULL,
	[ProfessorsID] [int] NOT NULL,
	[Task] [nvarchar](4000) NOT NULL,
	[DateOfBegin] [datetime] NULL,
	[DateOfEnd] [datetime] NULL,
	[NameOfWork] [nvarchar](4000) NOT NULL,
	[UrlOfWork] [nvarchar](4000) NULL,
	[GroupID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [DirectionID], [CourseNameID]) VALUES (1, 1, 2)
INSERT [dbo].[Course] ([CourseID], [DirectionID], [CourseNameID]) VALUES (2, 1, 5)
INSERT [dbo].[Course] ([CourseID], [DirectionID], [CourseNameID]) VALUES (3, 1, 9)
INSERT [dbo].[Course] ([CourseID], [DirectionID], [CourseNameID]) VALUES (4, 1, 6)
INSERT [dbo].[Course] ([CourseID], [DirectionID], [CourseNameID]) VALUES (5, 1, 2)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseNames] ON 

INSERT [dbo].[CourseNames] ([CourseNameID], [NameOfCourse], [LevelOfCourse]) VALUES (1, 1, N'Бакалавр')
INSERT [dbo].[CourseNames] ([CourseNameID], [NameOfCourse], [LevelOfCourse]) VALUES (2, 2, N'Бакалавр')
INSERT [dbo].[CourseNames] ([CourseNameID], [NameOfCourse], [LevelOfCourse]) VALUES (4, 3, N'Бакалавр')
INSERT [dbo].[CourseNames] ([CourseNameID], [NameOfCourse], [LevelOfCourse]) VALUES (5, 4, N'Бакалавр')
INSERT [dbo].[CourseNames] ([CourseNameID], [NameOfCourse], [LevelOfCourse]) VALUES (6, 1, N'Магистратура')
INSERT [dbo].[CourseNames] ([CourseNameID], [NameOfCourse], [LevelOfCourse]) VALUES (7, 2, N'Магистратура')
INSERT [dbo].[CourseNames] ([CourseNameID], [NameOfCourse], [LevelOfCourse]) VALUES (8, 1, N'Специалитет')
INSERT [dbo].[CourseNames] ([CourseNameID], [NameOfCourse], [LevelOfCourse]) VALUES (9, 2, N'Специалитет')
INSERT [dbo].[CourseNames] ([CourseNameID], [NameOfCourse], [LevelOfCourse]) VALUES (10, 3, N'Специалитет')
INSERT [dbo].[CourseNames] ([CourseNameID], [NameOfCourse], [LevelOfCourse]) VALUES (11, 4, N'Специалитет')
SET IDENTITY_INSERT [dbo].[CourseNames] OFF
GO
SET IDENTITY_INSERT [dbo].[Direction] ON 

INSERT [dbo].[Direction] ([DirectionID], [DirectionName]) VALUES (1, N'Программная инженерия')
SET IDENTITY_INSERT [dbo].[Direction] OFF
GO
SET IDENTITY_INSERT [dbo].[Essay] ON 

INSERT [dbo].[Essay] ([EssayID], [WorkID], [UserID], [StudentEssay], [ResultEssay], [Grade], [Comment], [DateOfUpload]) VALUES (3, 4, 5, N'Я лю есть', N'Я люблю есть', 5, N'net', CAST(N'2021-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Essay] ([EssayID], [WorkID], [UserID], [StudentEssay], [ResultEssay], [Grade], [Comment], [DateOfUpload]) VALUES (4, 4, 1, N'Эсе', N'Эссе', 8, N'Мне понравилось, класс!', CAST(N'2021-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Essay] ([EssayID], [WorkID], [UserID], [StudentEssay], [ResultEssay], [Grade], [Comment], [DateOfUpload]) VALUES (5, 5, 3, N'ГгВп', N'ГГВП', 10, N'Привет всем! Проверяю подключение БД!', CAST(N'2021-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Essay] ([EssayID], [WorkID], [UserID], [StudentEssay], [ResultEssay], [Grade], [Comment], [DateOfUpload]) VALUES (6, 5, 1, N'првт', N'Привет', 4, N'12 марта', CAST(N'2021-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Essay] ([EssayID], [WorkID], [UserID], [StudentEssay], [ResultEssay], [Grade], [Comment], [DateOfUpload]) VALUES (7, 13, 1, N'13 задание', N'13 задание2', 8, NULL, CAST(N'2021-03-04T15:21:07.657' AS DateTime))
INSERT [dbo].[Essay] ([EssayID], [WorkID], [UserID], [StudentEssay], [ResultEssay], [Grade], [Comment], [DateOfUpload]) VALUES (8, 1004, 1, N'Для создания отношения один-ко-многим нужно разместить внешний ключ в дочерней таблице. Это самый распространенный тип отношений. Для создания отношения один-ко-многим в SQLAlchemy нужно выполнить следующие шаги:', N'Для создания отношения один-ко-многим нужно разместить внешний ключ в дочерней таблице. Это самый распространенный тип отношений. Для создания отношения один-ко-многим в SQLAlchemy нужно выполнить следующие шаги:2', 1, NULL, CAST(N'2021-03-05T13:16:47.433' AS DateTime))
INSERT [dbo].[Essay] ([EssayID], [WorkID], [UserID], [StudentEssay], [ResultEssay], [Grade], [Comment], [DateOfUpload]) VALUES (9, 15, 1, N'Хэй, это Джесси Пинкман!', N'Хэй, это Джесси Пинкман!2', 8, NULL, CAST(N'2021-03-06T15:47:59.170' AS DateTime))
INSERT [dbo].[Essay] ([EssayID], [WorkID], [UserID], [StudentEssay], [ResultEssay], [Grade], [Comment], [DateOfUpload]) VALUES (10, 19, 1, N'Пользователям HBOMax вместо "Тома и Джерри" показывали первый час "Лиги Справедливости" Зака Снайдера. Ошибку обнаружили только спустя 2 часа.', N'Пользователям HBOMax вместо "Тома и Джерри" показывали первый час "Лиги Справедливости" Зака Снайдера. Ошибку обнаружили только спустя 2 часа.2', 5, N'Хорошо, круто, молодец', CAST(N'2021-03-09T12:27:27.143' AS DateTime))
INSERT [dbo].[Essay] ([EssayID], [WorkID], [UserID], [StudentEssay], [ResultEssay], [Grade], [Comment], [DateOfUpload]) VALUES (11, 23, 1, N'Получаю задание Ютубовский', N'Получаю задание Ютубовский2', 8, N'И ещё один новый комментарий', CAST(N'2021-03-13T13:45:26.723' AS DateTime))
INSERT [dbo].[Essay] ([EssayID], [WorkID], [UserID], [StudentEssay], [ResultEssay], [Grade], [Comment], [DateOfUpload]) VALUES (12, 27, 1, N'Напомню, у США на данный момент 11 авианосцев, у Европы – 6.

Россия же имеет всего 1 авианосец (столько же, сколько имеет Таиланд). Да и тот – не совсем авианосец, а авианесущий крейсер.

В чем причина такого отставания?

На самом деле, авианосцев не было даже у СССР, хотя он являлся второй по мощности экономикой мира и денег на вооружение явно не жалел.

Чтобы понять, почему в нашей стране построили уже кучу атомных ледоколов, но не построили ни одного авианосца – достаточно посмотреть на карту мира.

Многие, особо одаренные, считают, что география никак не отражается на стратегии государства, но каждый адекватный человек понимает, что именно география является определяющим фактором развития любой страны.

Итак, если посмотреть на США, Европу, Китай, Индию или даже тот же самый Таиланд, то неожиданно выяснится, что бОльшая часть их населения и промышленности сосредоточены вблизи моря.

', N'Напомню, у США на данный момент 11 авианосцев, у Европы – 6.

Россия же имеет всего 1 авианосец (столько же, сколько имеет Таиланд). Да и тот – не совсем авианосец, а авианесущий крейсер.

В чем причина такого отставания?

На самом деле, авианосцев не было даже у СССР, хотя он являлся второй по мощности экономикой мира и денег на вооружение явно не жалел.

Чтобы понять, почему в нашей стране построили уже кучу атомных ледоколов, но не построили ни одного авианосца – достаточно посмотреть на карту мира.

Многие, особо одаренные, считают, что география никак не отражается на стратегии государства, но каждый адекватный человек понимает, что именно география является определяющим фактором развития любой страны.

Итак, если посмотреть на США, Европу, Китай, Индию или даже тот же самый Таиланд, то неожиданно выяснится, что бОльшая часть их населения и промышленности сосредоточены вблизи моря.

2', 10, NULL, CAST(N'2021-03-22T15:27:31.603' AS DateTime))
SET IDENTITY_INSERT [dbo].[Essay] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([GroupID], [CourseID], [NumberOfGroup]) VALUES (1, 1, 1)
INSERT [dbo].[Groups] ([GroupID], [CourseID], [NumberOfGroup]) VALUES (2, 1, 2)
INSERT [dbo].[Groups] ([GroupID], [CourseID], [NumberOfGroup]) VALUES (3, 2, 1)
INSERT [dbo].[Groups] ([GroupID], [CourseID], [NumberOfGroup]) VALUES (4, 2, 2)
INSERT [dbo].[Groups] ([GroupID], [CourseID], [NumberOfGroup]) VALUES (5, 3, 1)
INSERT [dbo].[Groups] ([GroupID], [CourseID], [NumberOfGroup]) VALUES (6, 3, 2)
INSERT [dbo].[Groups] ([GroupID], [CourseID], [NumberOfGroup]) VALUES (7, 4, 1)
INSERT [dbo].[Groups] ([GroupID], [CourseID], [NumberOfGroup]) VALUES (8, 4, 2)
INSERT [dbo].[Groups] ([GroupID], [CourseID], [NumberOfGroup]) VALUES (9, 5, 1)
INSERT [dbo].[Groups] ([GroupID], [CourseID], [NumberOfGroup]) VALUES (10, 5, 2)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Professors] ON 

INSERT [dbo].[Professors] ([ProfessorID], [UserID], [ProfessorFirstName], [ProfessorLastName], [ProfessorMiddleName]) VALUES (1, 4, N'Юлия', N'Григорян', N'Александровна')
INSERT [dbo].[Professors] ([ProfessorID], [UserID], [ProfessorFirstName], [ProfessorLastName], [ProfessorMiddleName]) VALUES (2, 11, N'Just', N'man', N'')
INSERT [dbo].[Professors] ([ProfessorID], [UserID], [ProfessorFirstName], [ProfessorLastName], [ProfessorMiddleName]) VALUES (3, 6, N'Just', N'Gone', N'Максимович')
INSERT [dbo].[Professors] ([ProfessorID], [UserID], [ProfessorFirstName], [ProfessorLastName], [ProfessorMiddleName]) VALUES (4, 8, N'Roman', N'Gone', N'123')
INSERT [dbo].[Professors] ([ProfessorID], [UserID], [ProfessorFirstName], [ProfessorLastName], [ProfessorMiddleName]) VALUES (5, 12, N'Привет', N'Как', N'Дела')
INSERT [dbo].[Professors] ([ProfessorID], [UserID], [ProfessorFirstName], [ProfessorLastName], [ProfessorMiddleName]) VALUES (6, 13, N'123', N'Gone', N'Da')
INSERT [dbo].[Professors] ([ProfessorID], [UserID], [ProfessorFirstName], [ProfessorLastName], [ProfessorMiddleName]) VALUES (7, 18, N'Алексей', N'Павлинов', N'Олегович')
SET IDENTITY_INSERT [dbo].[Professors] OFF
GO
SET IDENTITY_INSERT [dbo].[Recording] ON 

INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (1, CAST(N'2021-03-06T14:27:29.270' AS DateTime), N'Works', N'WorkID, ProfessorsID, Task, DateOfBegin, DateOfEnd, UrlOfWork, GroupID', N'Admin', NULL, N'20, 1, dadada, 16, 17, data-url, 1', NULL)
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (2, CAST(N'2021-03-06T15:00:02.590' AS DateTime), N'Works', N'WorkID', N'1', NULL, N'14', N'14')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (3, CAST(N'2021-03-06T15:02:19.173' AS DateTime), N'Works', N'Task', N'1', NULL, N'NewTask', N'14')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (4, CAST(N'2021-03-06T15:08:55.733' AS DateTime), N'Works', N'WorkID', N'1', NULL, N'16', N'16')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (5, CAST(N'2021-03-06T15:12:06.050' AS DateTime), N'Works', N'WorkID', N'Григорян Юлия Александровна', NULL, N'18', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (6, CAST(N'2021-03-06T15:12:06.053' AS DateTime), N'Works', N'ProfessorID', N'Григорян Юлия Александровна', NULL, N'4', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (7, CAST(N'2021-03-06T15:12:06.057' AS DateTime), N'Works', N'Task', N'Григорян Юлия Александровна', NULL, N'Привет, меня зовут Роман Решетняк', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (8, CAST(N'2021-03-06T15:12:06.060' AS DateTime), N'Works', N'DateOfBegin', N'Григорян Юлия Александровна', NULL, N'мар  6 2021  3:12PM', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (9, CAST(N'2021-03-06T15:12:06.060' AS DateTime), N'Works', N'DateOfEnd', N'Григорян Юлия Александровна', NULL, N'мар  9 2021  3:12PM', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (10, CAST(N'2021-03-06T15:12:06.063' AS DateTime), N'Works', N'NameOfWork', N'Григорян Юлия Александровна', NULL, N'Роман Решетняк', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (11, CAST(N'2021-03-06T15:12:06.067' AS DateTime), N'Works', N'UrlOfWork', N'Григорян Юлия Александровна', NULL, N'Роман-Решетняк-2021-03-06', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (12, CAST(N'2021-03-06T15:12:06.070' AS DateTime), N'Works', N'GroupID', N'Григорян Юлия Александровна', NULL, N'1', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (13, CAST(N'2021-03-06T15:24:10.020' AS DateTime), N'Professors', N'ProfessorID', N'Admin', NULL, N'7', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (14, CAST(N'2021-03-06T15:24:10.020' AS DateTime), N'Professors', N'UserID', N'Admin', NULL, N'13', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (15, CAST(N'2021-03-06T15:24:10.023' AS DateTime), N'Professors', N'ProfessorFirstName', N'Admin', NULL, N'123', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (16, CAST(N'2021-03-06T15:24:10.027' AS DateTime), N'Professors', N'ProfessorLastName', N'Admin', NULL, N'Gone', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (17, CAST(N'2021-03-06T15:24:10.030' AS DateTime), N'Professors', N'ProfessorMiddleName', N'Admin', NULL, N'Da', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (18, CAST(N'2021-03-06T15:35:44.397' AS DateTime), N'Students', N'StudentID', N'Admin', NULL, N'7', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (19, CAST(N'2021-03-06T15:35:44.397' AS DateTime), N'Students', N'UserID', N'Admin', NULL, N'14', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (20, CAST(N'2021-03-06T15:35:44.400' AS DateTime), N'Students', N'StudentFirstName', N'Admin', NULL, N'Санче', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (21, CAST(N'2021-03-06T15:35:44.403' AS DateTime), N'Students', N'StudentLastName', N'Admin', NULL, N'Панце', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (22, CAST(N'2021-03-06T15:35:44.403' AS DateTime), N'Students', N'StudentMiddleName', N'Admin', NULL, N'Дадада', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (23, CAST(N'2021-03-06T15:35:44.423' AS DateTime), N'Students', N'GroupID', N'Admin', NULL, N'1', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (24, CAST(N'2021-03-06T15:42:10.590' AS DateTime), N'Users', N'StudentID', N'Admin', NULL, N'15', N'15')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (25, CAST(N'2021-03-06T15:42:10.590' AS DateTime), N'Users', N'UserLogin', N'Admin', NULL, N'newUzwer', N'15')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (26, CAST(N'2021-03-06T15:42:10.597' AS DateTime), N'Users', N'UserPassword', N'Admin', NULL, N'123456', N'15')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (27, CAST(N'2021-03-06T15:42:10.600' AS DateTime), N'Users', N'IsAdmin', N'Admin', NULL, N'0', N'15')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (28, CAST(N'2021-03-06T15:47:59.173' AS DateTime), N'Works', N'EssayID', N'Иванов Дмитрий Алексеевич', NULL, N'10', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (29, CAST(N'2021-03-06T15:47:59.177' AS DateTime), N'Works', N'WorkID', N'Иванов Дмитрий Алексеевич', NULL, N'15', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (30, CAST(N'2021-03-06T15:47:59.180' AS DateTime), N'Works', N'UserID', N'Иванов Дмитрий Алексеевич', NULL, N'1', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (31, CAST(N'2021-03-06T15:47:59.180' AS DateTime), N'Works', N'StudentEssay', N'Иванов Дмитрий Алексеевич', NULL, N'Хэй, это Джесси Пинкман!', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (32, CAST(N'2021-03-06T15:47:59.183' AS DateTime), N'Works', N'ResultEssay', N'Иванов Дмитрий Алексеевич', NULL, N'Хэй, это Джесси Пинкман!2', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (33, CAST(N'2021-03-06T15:47:59.187' AS DateTime), N'Works', N'Grade', N'Иванов Дмитрий Алексеевич', NULL, N'8', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (34, CAST(N'2021-03-06T15:47:59.190' AS DateTime), N'Works', N'Comment', N'Иванов Дмитрий Алексеевич', NULL, NULL, N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (35, CAST(N'2021-03-06T15:47:59.190' AS DateTime), N'Works', N'DateOfUpload', N'Иванов Дмитрий Алексеевич', NULL, N'мар  6 2021  3:47PM', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (36, CAST(N'2021-03-07T15:37:52.230' AS DateTime), N'Works', N'WorkID', N'Григорян Юлия Александровна', NULL, N'21', N'21')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (37, CAST(N'2021-03-07T15:37:52.230' AS DateTime), N'Works', N'ProfessorID', N'Григорян Юлия Александровна', NULL, N'4', N'21')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (38, CAST(N'2021-03-07T15:37:52.230' AS DateTime), N'Works', N'Task', N'Григорян Юлия Александровна', NULL, N'Дебил, у тебя 2 запроса работают хреново. Один работает по ЮЗЕР ИД, другой по СТУДЕНТ ИД. Исправь!', N'21')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (39, CAST(N'2021-03-07T15:37:52.230' AS DateTime), N'Works', N'DateOfBegin', N'Григорян Юлия Александровна', NULL, N'мар  7 2021  3:37PM', N'21')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (40, CAST(N'2021-03-07T15:37:52.233' AS DateTime), N'Works', N'DateOfEnd', N'Григорян Юлия Александровна', NULL, N'мар 11 2021  4:00PM', N'21')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (41, CAST(N'2021-03-07T15:37:52.237' AS DateTime), N'Works', N'NameOfWork', N'Григорян Юлия Александровна', NULL, N'Новое задание', N'21')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (42, CAST(N'2021-03-07T15:37:52.237' AS DateTime), N'Works', N'UrlOfWork', N'Григорян Юлия Александровна', NULL, N'Новое-задание-2021-03-07', N'21')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (43, CAST(N'2021-03-07T15:37:52.240' AS DateTime), N'Works', N'GroupID', N'Григорян Юлия Александровна', NULL, N'2', N'21')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (44, CAST(N'2021-03-09T12:27:27.147' AS DateTime), N'Essay', N'EssayID', N'Иванов Дмитрий Алексеевич', NULL, N'10', N'10')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (45, CAST(N'2021-03-09T12:27:27.160' AS DateTime), N'Essay', N'WorkID', N'Иванов Дмитрий Алексеевич', NULL, N'19', N'10')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (46, CAST(N'2021-03-09T12:27:27.163' AS DateTime), N'Essay', N'UserID', N'Иванов Дмитрий Алексеевич', NULL, N'1', N'10')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (47, CAST(N'2021-03-09T12:27:27.167' AS DateTime), N'Essay', N'StudentEssay', N'Иванов Дмитрий Алексеевич', NULL, N'Пользователям HBOMax вместо "Тома и Джерри" показывали первый час "Лиги Справедливости" Зака Снайдера. Ошибку обнаружили только спустя 2 часа.', N'10')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (48, CAST(N'2021-03-09T12:27:27.170' AS DateTime), N'Essay', N'ResultEssay', N'Иванов Дмитрий Алексеевич', NULL, N'Пользователям HBOMax вместо "Тома и Джерри" показывали первый час "Лиги Справедливости" Зака Снайдера. Ошибку обнаружили только спустя 2 часа.2', N'10')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (49, CAST(N'2021-03-09T12:27:27.170' AS DateTime), N'Essay', N'Grade', N'Иванов Дмитрий Алексеевич', NULL, N'5', N'10')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (50, CAST(N'2021-03-09T12:27:27.173' AS DateTime), N'Essay', N'Comment', N'Иванов Дмитрий Алексеевич', NULL, NULL, N'10')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (51, CAST(N'2021-03-09T12:27:27.177' AS DateTime), N'Essay', N'DateOfUpload', N'Иванов Дмитрий Алексеевич', NULL, N'мар  9 2021 12:27PM', N'10')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (52, CAST(N'2021-03-09T13:15:41.160' AS DateTime), N'Users', N'StudentID', N'Admin', NULL, N'16', N'16')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (53, CAST(N'2021-03-09T13:15:41.163' AS DateTime), N'Users', N'UserLogin', N'Admin', NULL, N'ASUSHalliday', N'16')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (54, CAST(N'2021-03-09T13:15:41.167' AS DateTime), N'Users', N'UserPassword', N'Admin', NULL, N'123456', N'16')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (55, CAST(N'2021-03-09T13:15:41.167' AS DateTime), N'Users', N'IsAdmin', N'Admin', NULL, N'0', N'16')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (56, CAST(N'2021-03-09T13:16:40.070' AS DateTime), N'Users', N'StudentID', N'Admin', NULL, N'17', N'17')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (57, CAST(N'2021-03-09T13:16:40.073' AS DateTime), N'Users', N'UserLogin', N'Admin', NULL, N'anotherOne', N'17')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (58, CAST(N'2021-03-09T13:16:40.073' AS DateTime), N'Users', N'UserPassword', N'Admin', NULL, N'123456', N'17')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (59, CAST(N'2021-03-09T13:16:40.073' AS DateTime), N'Users', N'IsAdmin', N'Admin', NULL, N'0', N'17')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (60, CAST(N'2021-03-09T13:17:26.387' AS DateTime), N'Users', N'StudentID', N'Admin', NULL, N'18', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (61, CAST(N'2021-03-09T13:17:26.390' AS DateTime), N'Users', N'UserLogin', N'Admin', NULL, N'userAnother', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (62, CAST(N'2021-03-09T13:17:26.393' AS DateTime), N'Users', N'UserPassword', N'Admin', NULL, N'youtube', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (63, CAST(N'2021-03-09T13:17:26.393' AS DateTime), N'Users', N'IsAdmin', N'Admin', NULL, N'0', N'18')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (64, CAST(N'2021-03-09T13:24:07.490' AS DateTime), N'Works', N'WorkID', N'Григорян Юлия Александровна', NULL, N'22', N'22')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (65, CAST(N'2021-03-09T13:24:07.493' AS DateTime), N'Works', N'ProfessorID', N'Григорян Юлия Александровна', NULL, N'4', N'22')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (66, CAST(N'2021-03-09T13:24:07.497' AS DateTime), N'Works', N'Task', N'Григорян Юлия Александровна', NULL, N'Ещё одно задание добавлено!', N'22')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (67, CAST(N'2021-03-09T13:24:07.500' AS DateTime), N'Works', N'DateOfBegin', N'Григорян Юлия Александровна', NULL, N'мар  9 2021  1:24PM', N'22')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (68, CAST(N'2021-03-09T13:24:07.503' AS DateTime), N'Works', N'DateOfEnd', N'Григорян Юлия Александровна', NULL, N'мар 14 2021  4:50PM', N'22')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (69, CAST(N'2021-03-09T13:24:07.507' AS DateTime), N'Works', N'NameOfWork', N'Григорян Юлия Александровна', NULL, N'Ещё одно задание', N'22')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (70, CAST(N'2021-03-09T13:24:07.510' AS DateTime), N'Works', N'UrlOfWork', N'Григорян Юлия Александровна', NULL, N'Ещё-одно-задание-2021-03-09', N'22')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (71, CAST(N'2021-03-09T13:24:07.513' AS DateTime), N'Works', N'GroupID', N'Григорян Юлия Александровна', NULL, N'2', N'22')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (72, CAST(N'2021-03-10T00:31:20.427' AS DateTime), N'Essay', N'Comment', N'Григорян Юлия Александровна', N'None', N'Дада я', N'5')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (73, CAST(N'2021-03-10T00:31:59.497' AS DateTime), N'Essay', N'Comment', N'Григорян Юлия Александровна', N'Дада я', N'Дада я', N'5')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (74, CAST(N'2021-03-10T00:32:35.747' AS DateTime), N'Essay', N'Comment', N'Григорян Юлия Александровна', N'None', N'Мне понравилось, класс!', N'4')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (75, CAST(N'2021-03-10T00:34:01.420' AS DateTime), N'Essay', N'Comment', N'Григорян Юлия Александровна', N'None', N'Класс, мне понравилось!', N'6')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (76, CAST(N'2021-03-12T15:08:27.790' AS DateTime), N'Essay', N'Comment', N'Григорян Юлия Александровна', N'Дада я', N'Привет всем! Проверяю подключение БД!', N'5')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (77, CAST(N'2021-03-12T19:48:41.397' AS DateTime), N'Essay', N'Comment', N'Григорян Юлия Александровна', N'Класс, мне понравилось!', N'12 марта', N'6')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (78, CAST(N'2021-03-13T12:18:19.633' AS DateTime), N'Users', N'StudentID', N'Admin', NULL, N'19', N'19')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (79, CAST(N'2021-03-13T12:18:19.633' AS DateTime), N'Users', N'UserLogin', N'Admin', NULL, N'ElonMask', N'19')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (80, CAST(N'2021-03-13T12:18:19.637' AS DateTime), N'Users', N'UserPassword', N'Admin', NULL, N'123456', N'19')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (81, CAST(N'2021-03-13T12:18:19.637' AS DateTime), N'Users', N'IsAdmin', N'Admin', NULL, N'0', N'19')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (82, CAST(N'2021-03-13T12:29:03.933' AS DateTime), N'Students', N'StudentID', N'Admin', NULL, N'8', N'8')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (83, CAST(N'2021-03-13T12:29:03.937' AS DateTime), N'Students', N'UserID', N'Admin', NULL, N'19', N'8')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (84, CAST(N'2021-03-13T12:29:03.937' AS DateTime), N'Students', N'StudentFirstName', N'Admin', NULL, N'Just', N'8')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (85, CAST(N'2021-03-13T12:29:03.940' AS DateTime), N'Students', N'StudentLastName', N'Admin', NULL, N'New', N'8')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (86, CAST(N'2021-03-13T12:29:03.943' AS DateTime), N'Students', N'StudentMiddleName', N'Admin', NULL, N'Man', N'8')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (87, CAST(N'2021-03-13T12:29:03.947' AS DateTime), N'Students', N'GroupID', N'Admin', NULL, N'2', N'8')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (88, CAST(N'2021-03-13T12:33:45.823' AS DateTime), N'Professors', N'ProfessorID', N'Admin', NULL, N'7', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (89, CAST(N'2021-03-13T12:33:45.823' AS DateTime), N'Professors', N'UserID', N'Admin', NULL, N'18', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (90, CAST(N'2021-03-13T12:33:45.827' AS DateTime), N'Professors', N'ProfessorFirstName', N'Admin', NULL, N'Алексей', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (91, CAST(N'2021-03-13T12:33:45.830' AS DateTime), N'Professors', N'ProfessorLastName', N'Admin', NULL, N'Павлинов', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (92, CAST(N'2021-03-13T12:33:45.830' AS DateTime), N'Professors', N'ProfessorMiddleName', N'Admin', NULL, N'Олегович', N'7')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (93, CAST(N'2021-03-13T12:44:39.190' AS DateTime), N'Works', N'WorkID', N'Григорян Юлия Александровна', NULL, N'23', N'23')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (94, CAST(N'2021-03-13T12:44:39.193' AS DateTime), N'Works', N'ProfessorID', N'Григорян Юлия Александровна', NULL, N'4', N'23')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (95, CAST(N'2021-03-13T12:44:39.197' AS DateTime), N'Works', N'Task', N'Григорян Юлия Александровна', NULL, N'Новое задание - Ютубовский', N'23')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (96, CAST(N'2021-03-13T12:44:39.200' AS DateTime), N'Works', N'DateOfBegin', N'Григорян Юлия Александровна', NULL, N'GETDATE()', N'23')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (97, CAST(N'2021-03-13T12:44:39.200' AS DateTime), N'Works', N'DateOfEnd', N'Григорян Юлия Александровна', NULL, N'DATETIMEFROMPARTS(2021, 3, 14, 16, 00, 00, 000)', N'23')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (98, CAST(N'2021-03-13T12:44:39.200' AS DateTime), N'Works', N'NameOfWork', N'Григорян Юлия Александровна', NULL, N'Ютубовский', N'23')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (99, CAST(N'2021-03-13T12:44:39.203' AS DateTime), N'Works', N'UrlOfWork', N'Григорян Юлия Александровна', NULL, N'Ютубовский-2021-03-13', N'23')
GO
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (100, CAST(N'2021-03-13T12:44:39.210' AS DateTime), N'Works', N'GroupID', N'Григорян Юлия Александровна', NULL, N'2', N'23')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (101, CAST(N'2021-03-13T13:21:56.960' AS DateTime), N'Users', N'StudentID', N'Admin', NULL, N'20', N'20')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (102, CAST(N'2021-03-13T13:21:56.960' AS DateTime), N'Users', N'UserLogin', N'Admin', NULL, N'NiceWorkElon', N'20')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (103, CAST(N'2021-03-13T13:21:56.963' AS DateTime), N'Users', N'UserPassword', N'Admin', NULL, N'123456', N'20')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (104, CAST(N'2021-03-13T13:21:56.963' AS DateTime), N'Users', N'IsAdmin', N'Admin', NULL, N'0', N'20')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (105, CAST(N'2021-03-13T13:27:35.287' AS DateTime), N'Works', N'WorkID', N'Григорян Юлия Александровна', NULL, N'24', N'24')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (106, CAST(N'2021-03-13T13:27:35.287' AS DateTime), N'Works', N'ProfessorID', N'Григорян Юлия Александровна', NULL, N'4', N'24')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (107, CAST(N'2021-03-13T13:27:35.290' AS DateTime), N'Works', N'Task', N'Григорян Юлия Александровна', NULL, N'Маил ру почта новости', N'24')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (108, CAST(N'2021-03-13T13:27:35.300' AS DateTime), N'Works', N'DateOfBegin', N'Григорян Юлия Александровна', NULL, N'мар 13 2021  1:27PM', N'24')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (109, CAST(N'2021-03-13T13:27:35.300' AS DateTime), N'Works', N'DateOfEnd', N'Григорян Юлия Александровна', NULL, N'мар 19 2021  4:00PM', N'24')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (110, CAST(N'2021-03-13T13:27:35.303' AS DateTime), N'Works', N'NameOfWork', N'Григорян Юлия Александровна', NULL, N'Маил ру почта', N'24')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (111, CAST(N'2021-03-13T13:27:35.307' AS DateTime), N'Works', N'UrlOfWork', N'Григорян Юлия Александровна', NULL, N'Маил-ру-почта-2021-03-13', N'24')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (112, CAST(N'2021-03-13T13:27:35.310' AS DateTime), N'Works', N'GroupID', N'Григорян Юлия Александровна', NULL, N'2', N'24')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (113, CAST(N'2021-03-13T13:45:26.730' AS DateTime), N'Essay', N'EssayID', N'Иванов Дмитрий Алексеевич', NULL, N'11', N'11')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (114, CAST(N'2021-03-13T13:45:26.730' AS DateTime), N'Essay', N'WorkID', N'Иванов Дмитрий Алексеевич', NULL, N'23', N'11')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (115, CAST(N'2021-03-13T13:45:26.733' AS DateTime), N'Essay', N'UserID', N'Иванов Дмитрий Алексеевич', NULL, N'1', N'11')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (116, CAST(N'2021-03-13T13:45:26.737' AS DateTime), N'Essay', N'StudentEssay', N'Иванов Дмитрий Алексеевич', NULL, N'Получаю задание Ютубовский', N'11')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (117, CAST(N'2021-03-13T13:45:26.740' AS DateTime), N'Essay', N'ResultEssay', N'Иванов Дмитрий Алексеевич', NULL, N'Получаю задание Ютубовский2', N'11')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (118, CAST(N'2021-03-13T13:45:26.740' AS DateTime), N'Essay', N'Grade', N'Иванов Дмитрий Алексеевич', NULL, N'8', N'11')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (119, CAST(N'2021-03-13T13:45:26.743' AS DateTime), N'Essay', N'Comment', N'Иванов Дмитрий Алексеевич', NULL, NULL, N'11')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (120, CAST(N'2021-03-13T13:45:26.747' AS DateTime), N'Essay', N'DateOfUpload', N'Иванов Дмитрий Алексеевич', NULL, N'мар 13 2021  1:45PM', N'11')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (121, CAST(N'2021-03-13T13:49:39.867' AS DateTime), N'Essay', N'Comment', N'Григорян Юлия Александровна', N'None', N'Новый комментарий', N'11')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (122, CAST(N'2021-03-13T13:50:14.137' AS DateTime), N'Essay', N'Comment', N'Григорян Юлия Александровна', N'Новый комментарий', N'И ещё один новый комментарий', N'11')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (123, CAST(N'2021-03-15T16:30:59.260' AS DateTime), N'Essay', N'Comment', N'Григорян Юлия Александровна', N'None', N'Хорошо', N'10')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (124, CAST(N'2021-03-15T16:31:18.610' AS DateTime), N'Essay', N'Comment', N'Григорян Юлия Александровна', N'Хорошо', N'Хорошо', N'10')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (125, CAST(N'2021-03-15T16:31:41.820' AS DateTime), N'Essay', N'Comment', N'Григорян Юлия Александровна', N'Хорошо', N'Хорошо, круто', N'10')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (126, CAST(N'2021-03-15T16:32:55.240' AS DateTime), N'Essay', N'Comment', N'Григорян Юлия Александровна', N'Хорошо, круто', N'Хорошо, круто, молодец', N'10')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (127, CAST(N'2021-03-15T16:34:54.810' AS DateTime), N'Essay', N'Comment', N'Григорян Юлия Александровна', N'Хорошо, круто, молодец', N'Хорошо, круто, молодец', N'10')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (128, CAST(N'2021-03-16T15:41:11.893' AS DateTime), N'Users', N'StudentID', N'Admin', NULL, N'21', N'21')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (129, CAST(N'2021-03-16T15:41:11.897' AS DateTime), N'Users', N'UserLogin', N'Admin', NULL, N'приветкакдела', N'21')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (130, CAST(N'2021-03-16T15:41:11.900' AS DateTime), N'Users', N'UserPassword', N'Admin', NULL, N'123456', N'21')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (131, CAST(N'2021-03-16T15:41:11.900' AS DateTime), N'Users', N'IsAdmin', N'Admin', NULL, N'0', N'21')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (132, CAST(N'2021-03-22T15:14:48.460' AS DateTime), N'Works', N'WorkID', N'Григорян Юлия Александровна', NULL, N'25', N'25')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (133, CAST(N'2021-03-22T15:14:48.477' AS DateTime), N'Works', N'ProfessorID', N'Григорян Юлия Александровна', NULL, N'4', N'25')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (134, CAST(N'2021-03-22T15:14:48.490' AS DateTime), N'Works', N'Task', N'Григорян Юлия Александровна', NULL, N'Новое задание от 22.03.2021. 
Напишите эссе на английском языке на тему "Русский мир - какой он?"', N'25')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (135, CAST(N'2021-03-22T15:14:48.503' AS DateTime), N'Works', N'DateOfBegin', N'Григорян Юлия Александровна', NULL, N'мар 22 2021  3:14PM', N'25')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (136, CAST(N'2021-03-22T15:14:48.507' AS DateTime), N'Works', N'DateOfEnd', N'Григорян Юлия Александровна', NULL, N'мар 30 2021 10:20AM', N'25')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (137, CAST(N'2021-03-22T15:14:48.507' AS DateTime), N'Works', N'NameOfWork', N'Григорян Юлия Александровна', NULL, N'Задание от 22.03.2021', N'25')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (138, CAST(N'2021-03-22T15:14:48.510' AS DateTime), N'Works', N'UrlOfWork', N'Григорян Юлия Александровна', NULL, N'Задание-от-22.03.2021-2021-03-22', N'25')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (139, CAST(N'2021-03-22T15:14:48.510' AS DateTime), N'Works', N'GroupID', N'Григорян Юлия Александровна', NULL, N'1', N'25')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (140, CAST(N'2021-03-22T15:17:32.283' AS DateTime), N'Works', N'WorkID', N'Григорян Юлия Александровна', NULL, N'26', N'26')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (141, CAST(N'2021-03-22T15:17:32.283' AS DateTime), N'Works', N'ProfessorID', N'Григорян Юлия Александровна', NULL, N'4', N'26')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (142, CAST(N'2021-03-22T15:17:32.287' AS DateTime), N'Works', N'Task', N'Григорян Юлия Александровна', NULL, N'Напишите эссе на английском языке на тему "ЧВК России в Сирии. Что они там забыли?"', N'26')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (143, CAST(N'2021-03-22T15:17:32.290' AS DateTime), N'Works', N'DateOfBegin', N'Григорян Юлия Александровна', NULL, N'мар 22 2021  3:17PM', N'26')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (144, CAST(N'2021-03-22T15:17:32.290' AS DateTime), N'Works', N'DateOfEnd', N'Григорян Юлия Александровна', NULL, N'апр 12 2021  2:00PM', N'26')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (145, CAST(N'2021-03-22T15:17:32.293' AS DateTime), N'Works', N'NameOfWork', N'Григорян Юлия Александровна', NULL, N'Задание от 23.03.2021', N'26')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (146, CAST(N'2021-03-22T15:17:32.297' AS DateTime), N'Works', N'UrlOfWork', N'Григорян Юлия Александровна', NULL, N'Задание-от-23.03.2021-2021-03-22', N'26')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (147, CAST(N'2021-03-22T15:17:32.300' AS DateTime), N'Works', N'GroupID', N'Григорян Юлия Александровна', NULL, N'1', N'26')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (148, CAST(N'2021-03-22T15:18:17.693' AS DateTime), N'Works', N'WorkID', N'Григорян Юлия Александровна', NULL, N'27', N'27')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (149, CAST(N'2021-03-22T15:18:17.697' AS DateTime), N'Works', N'ProfessorID', N'Григорян Юлия Александровна', NULL, N'4', N'27')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (150, CAST(N'2021-03-22T15:18:17.700' AS DateTime), N'Works', N'Task', N'Григорян Юлия Александровна', NULL, N'Напишите эссе на английском языке на тему "Почему у Российской Федерации всего 1 авианосец"', N'27')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (151, CAST(N'2021-03-22T15:18:17.700' AS DateTime), N'Works', N'DateOfBegin', N'Григорян Юлия Александровна', NULL, N'мар 22 2021  3:18PM', N'27')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (152, CAST(N'2021-03-22T15:18:17.703' AS DateTime), N'Works', N'DateOfEnd', N'Григорян Юлия Александровна', NULL, N'апр 15 2021  3:00PM', N'27')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (153, CAST(N'2021-03-22T15:18:17.703' AS DateTime), N'Works', N'NameOfWork', N'Григорян Юлия Александровна', NULL, N'Задание от 24.03.2021', N'27')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (154, CAST(N'2021-03-22T15:18:17.707' AS DateTime), N'Works', N'UrlOfWork', N'Григорян Юлия Александровна', NULL, N'Задание-от-24.03.2021-2021-03-22', N'27')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (155, CAST(N'2021-03-22T15:18:17.707' AS DateTime), N'Works', N'GroupID', N'Григорян Юлия Александровна', NULL, N'2', N'27')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (156, CAST(N'2021-03-22T15:19:37.170' AS DateTime), N'Works', N'WorkID', N'Григорян Юлия Александровна', NULL, N'28', N'28')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (157, CAST(N'2021-03-22T15:19:37.170' AS DateTime), N'Works', N'ProfessorID', N'Григорян Юлия Александровна', NULL, N'4', N'28')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (158, CAST(N'2021-03-22T15:19:37.170' AS DateTime), N'Works', N'Task', N'Григорян Юлия Александровна', NULL, N'Напишите эссе на английском языке на тему "Что нужно сделать для сохранения экологии в РФ"', N'28')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (159, CAST(N'2021-03-22T15:19:37.173' AS DateTime), N'Works', N'DateOfBegin', N'Григорян Юлия Александровна', NULL, N'мар 22 2021  3:19PM', N'28')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (160, CAST(N'2021-03-22T15:19:37.177' AS DateTime), N'Works', N'DateOfEnd', N'Григорян Юлия Александровна', NULL, N'апр 12 2021  2:00PM', N'28')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (161, CAST(N'2021-03-22T15:19:37.180' AS DateTime), N'Works', N'NameOfWork', N'Григорян Юлия Александровна', NULL, N'Что нужно сделать для сохранения экологии в РФ', N'28')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (162, CAST(N'2021-03-22T15:19:37.183' AS DateTime), N'Works', N'UrlOfWork', N'Григорян Юлия Александровна', NULL, N'Что-нужно-сделать-для-сохранения-экологии-в-РФ-2021-03-22', N'28')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (163, CAST(N'2021-03-22T15:19:37.183' AS DateTime), N'Works', N'GroupID', N'Григорян Юлия Александровна', NULL, N'1', N'28')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (164, CAST(N'2021-03-22T15:21:00.347' AS DateTime), N'Works', N'WorkID', N'Григорян Юлия Александровна', NULL, N'29', N'29')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (165, CAST(N'2021-03-22T15:21:00.350' AS DateTime), N'Works', N'ProfessorID', N'Григорян Юлия Александровна', NULL, N'4', N'29')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (166, CAST(N'2021-03-22T15:21:00.350' AS DateTime), N'Works', N'Task', N'Григорян Юлия Александровна', NULL, N'Напишите эссе на английском языке на тему "Насколько близка война в космосе?"', N'29')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (167, CAST(N'2021-03-22T15:21:00.360' AS DateTime), N'Works', N'DateOfBegin', N'Григорян Юлия Александровна', NULL, N'мар 22 2021  3:21PM', N'29')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (168, CAST(N'2021-03-22T15:21:00.363' AS DateTime), N'Works', N'DateOfEnd', N'Григорян Юлия Александровна', NULL, N'мар 22 2021  3:22PM', N'29')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (169, CAST(N'2021-03-22T15:21:00.367' AS DateTime), N'Works', N'NameOfWork', N'Григорян Юлия Александровна', NULL, N'Насколько близка война в космосе?', N'29')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (170, CAST(N'2021-03-22T15:21:00.383' AS DateTime), N'Works', N'UrlOfWork', N'Григорян Юлия Александровна', NULL, N'Насколько-близка-война-в-космосе?-2021-03-22', N'29')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (171, CAST(N'2021-03-22T15:21:00.383' AS DateTime), N'Works', N'GroupID', N'Григорян Юлия Александровна', NULL, N'2', N'29')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (172, CAST(N'2021-03-22T15:21:47.810' AS DateTime), N'Works', N'WorkID', N'Григорян Юлия Александровна', NULL, N'30', N'30')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (173, CAST(N'2021-03-22T15:21:47.813' AS DateTime), N'Works', N'ProfessorID', N'Григорян Юлия Александровна', NULL, N'4', N'30')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (174, CAST(N'2021-03-22T15:21:47.817' AS DateTime), N'Works', N'Task', N'Григорян Юлия Александровна', NULL, N'Напишите эссе на английском языке на тему "Зачем нужны видеоигры?"', N'30')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (175, CAST(N'2021-03-22T15:21:47.820' AS DateTime), N'Works', N'DateOfBegin', N'Григорян Юлия Александровна', NULL, N'мар 22 2021  3:21PM', N'30')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (176, CAST(N'2021-03-22T15:21:47.820' AS DateTime), N'Works', N'DateOfEnd', N'Григорян Юлия Александровна', NULL, N'мар 25 2021 11:00PM', N'30')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (177, CAST(N'2021-03-22T15:21:47.823' AS DateTime), N'Works', N'NameOfWork', N'Григорян Юлия Александровна', NULL, N'Зачем нужны видеоигры?', N'30')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (178, CAST(N'2021-03-22T15:21:47.823' AS DateTime), N'Works', N'UrlOfWork', N'Григорян Юлия Александровна', NULL, N'Зачем-нужны-видеоигры?-2021-03-22', N'30')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (179, CAST(N'2021-03-22T15:21:47.827' AS DateTime), N'Works', N'GroupID', N'Григорян Юлия Александровна', NULL, N'1', N'30')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (180, CAST(N'2021-03-22T15:23:28.820' AS DateTime), N'Works', N'WorkID', N'Григорян Юлия Александровна', NULL, N'31', N'31')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (181, CAST(N'2021-03-22T15:23:28.823' AS DateTime), N'Works', N'ProfessorID', N'Григорян Юлия Александровна', NULL, N'4', N'31')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (182, CAST(N'2021-03-22T15:23:28.823' AS DateTime), N'Works', N'Task', N'Григорян Юлия Александровна', NULL, N'Напишите эссе на английском языке на тему "Как скоро человек вылетит за пределы Солнечной системы"', N'31')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (183, CAST(N'2021-03-22T15:23:28.827' AS DateTime), N'Works', N'DateOfBegin', N'Григорян Юлия Александровна', NULL, N'мар 22 2021  3:23PM', N'31')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (184, CAST(N'2021-03-22T15:23:28.830' AS DateTime), N'Works', N'DateOfEnd', N'Григорян Юлия Александровна', NULL, N'мар 22 2021  3:25PM', N'31')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (185, CAST(N'2021-03-22T15:23:28.830' AS DateTime), N'Works', N'NameOfWork', N'Григорян Юлия Александровна', NULL, N'Как скоро человек вылетит за пределы Солнечной системы', N'31')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (186, CAST(N'2021-03-22T15:23:28.833' AS DateTime), N'Works', N'UrlOfWork', N'Григорян Юлия Александровна', NULL, N'Как-скоро-человек-вылетит-за-пределы-Солнечной-системы-2021-03-22', N'31')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (187, CAST(N'2021-03-22T15:23:28.837' AS DateTime), N'Works', N'GroupID', N'Григорян Юлия Александровна', NULL, N'2', N'31')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (188, CAST(N'2021-03-22T15:27:31.603' AS DateTime), N'Essay', N'EssayID', N'Иванов Дмитрий Алексеевич', NULL, N'12', N'12')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (189, CAST(N'2021-03-22T15:27:31.607' AS DateTime), N'Essay', N'WorkID', N'Иванов Дмитрий Алексеевич', NULL, N'27', N'12')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (190, CAST(N'2021-03-22T15:27:31.610' AS DateTime), N'Essay', N'UserID', N'Иванов Дмитрий Алексеевич', NULL, N'1', N'12')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (191, CAST(N'2021-03-22T15:27:31.610' AS DateTime), N'Essay', N'StudentEssay', N'Иванов Дмитрий Алексеевич', NULL, N'Напомню, у США на данный момент 11 авианосцев, у Европы – 6.

Россия же имеет всего 1 авианосец (столько же, сколько имеет Таиланд). Да и тот – не совсем авианосец, а авианесущий крейсер.

В чем причина такого отставания?

На самом деле, авианосцев не было даже у СССР, хотя он являлся второй по мощности экономикой мира и денег на вооружение явно не жалел.

Чтобы понять, почему в нашей стране построили уже кучу атомных ледоколов, но не построили ни одного авианосца – достаточно посмотреть на карту мира.

Многие, особо одаренные, считают, что география никак не отражается на стратегии государства, но каждый адекватный человек понимает, что именно география является определяющим фактором развития любой страны.

Итак, если посмотреть на США, Европу, Китай, Индию или даже тот же самый Таиланд, то неожиданно выяснится, что бОльшая часть их населения и промышленности сосредоточены вблизи моря.

', N'12')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (192, CAST(N'2021-03-22T15:27:31.610' AS DateTime), N'Essay', N'ResultEssay', N'Иванов Дмитрий Алексеевич', NULL, N'Напомню, у США на данный момент 11 авианосцев, у Европы – 6.

Россия же имеет всего 1 авианосец (столько же, сколько имеет Таиланд). Да и тот – не совсем авианосец, а авианесущий крейсер.

В чем причина такого отставания?

На самом деле, авианосцев не было даже у СССР, хотя он являлся второй по мощности экономикой мира и денег на вооружение явно не жалел.

Чтобы понять, почему в нашей стране построили уже кучу атомных ледоколов, но не построили ни одного авианосца – достаточно посмотреть на карту мира.

Многие, особо одаренные, считают, что география никак не отражается на стратегии государства, но каждый адекватный человек понимает, что именно география является определяющим фактором развития любой страны.

Итак, если посмотреть на США, Европу, Китай, Индию или даже тот же самый Таиланд, то неожиданно выяснится, что бОльшая часть их населения и промышленности сосредоточены вблизи моря.

2', N'12')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (193, CAST(N'2021-03-22T15:27:31.613' AS DateTime), N'Essay', N'Grade', N'Иванов Дмитрий Алексеевич', NULL, N'10', N'12')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (194, CAST(N'2021-03-22T15:27:31.617' AS DateTime), N'Essay', N'Comment', N'Иванов Дмитрий Алексеевич', NULL, NULL, N'12')
INSERT [dbo].[Recording] ([RecordID], [DateOfRecord], [NameOfTable], [NameOfColumn], [Executor], [OldValue], [NewValue], [PKKeyOfTable]) VALUES (195, CAST(N'2021-03-22T15:27:31.620' AS DateTime), N'Essay', N'DateOfUpload', N'Иванов Дмитрий Алексеевич', NULL, N'мар 22 2021  3:27PM', N'12')
SET IDENTITY_INSERT [dbo].[Recording] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentID], [UserID], [StudentFirstName], [StudentLastName], [StudentMiddleName], [GroupID]) VALUES (1, 1, N'Дмитрий', N'Иванов', N'Алексеевич', 2)
INSERT [dbo].[Students] ([StudentID], [UserID], [StudentFirstName], [StudentLastName], [StudentMiddleName], [GroupID]) VALUES (2, 3, N'Антон', N'Олегович', N'Антонович', 3)
INSERT [dbo].[Students] ([StudentID], [UserID], [StudentFirstName], [StudentLastName], [StudentMiddleName], [GroupID]) VALUES (3, 5, N'Аркадий', N'Шорохов', N'Иванович', 5)
INSERT [dbo].[Students] ([StudentID], [UserID], [StudentFirstName], [StudentLastName], [StudentMiddleName], [GroupID]) VALUES (4, 7, N'roma', N'newest', N'middle', NULL)
INSERT [dbo].[Students] ([StudentID], [UserID], [StudentFirstName], [StudentLastName], [StudentMiddleName], [GroupID]) VALUES (5, 10, N'Dmitry', N'Gones', N'Da', 1)
INSERT [dbo].[Students] ([StudentID], [UserID], [StudentFirstName], [StudentLastName], [StudentMiddleName], [GroupID]) VALUES (6, 9, N'Роман', N'Решетняк', N'Максимович', 2)
INSERT [dbo].[Students] ([StudentID], [UserID], [StudentFirstName], [StudentLastName], [StudentMiddleName], [GroupID]) VALUES (7, 14, N'Санче', N'Панце', N'Дадада', 1)
INSERT [dbo].[Students] ([StudentID], [UserID], [StudentFirstName], [StudentLastName], [StudentMiddleName], [GroupID]) VALUES (8, 19, N'Just', N'New', N'Man', 2)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (1, N'firstUser', N'fstUser', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (3, N'secondUser', N'scdUser', 1)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (4, N'teachetUser', N'tchUser', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (5, N'thirdUser', N'thrUser', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (6, N'newlog2', N'232322', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (7, N'newlogs2', N'232322', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (8, N'newlogass2', N'232322', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (9, N'newlogassss2', N'232322', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (10, N'newlogasssdadss2', N'232322', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (11, N'Asfering', N'12345fgh', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (12, N'd@mail.ru', N'12345', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (13, N'TaZzz', N'123456', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (14, N'TaZzzz', N'12345', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (15, N'newUzwer', N'123456', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (16, N'ASUSHalliday', N'123456', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (17, N'anotherOne', N'123456', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (18, N'userAnother', N'youtube', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (19, N'ElonMask', N'123456', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (20, N'NiceWorkElon', N'123456', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (21, N'приветкакдела', N'123456', 0)
INSERT [dbo].[Users] ([UserID], [UserLogin], [UserPassword], [IsAdmin]) VALUES (1002, N'newlog', N'23232', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Works] ON 

INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (4, 1, N'Написать Фудзияму Это Задание', CAST(N'2021-01-16T00:00:00.000' AS DateTime), CAST(N'2021-02-28T00:00:00.000' AS DateTime), N'Напиать Фудзияму', N'Напиать-Фудзияму-2021-01-16', 1)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (5, 1, N'Япона мать задание', CAST(N'2021-01-16T00:00:00.000' AS DateTime), CAST(N'2021-01-30T00:00:00.000' AS DateTime), N'Япона', N'Япона-2021-01-16', 2)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (6, 1, N'Anona', CAST(N'2021-03-01T17:39:01.103' AS DateTime), CAST(N'2021-03-04T17:39:01.103' AS DateTime), N'An', N'An-2021-01-16', 3)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (7, 1, N'Кикните меня', CAST(N'2021-01-16T00:00:00.000' AS DateTime), CAST(N'2021-01-28T00:00:00.000' AS DateTime), N'Кик', N'Кик-2021-01-16', 2)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (8, 1, N'Anona', CAST(N'2021-03-01T17:39:21.550' AS DateTime), CAST(N'2021-03-04T17:39:21.550' AS DateTime), N'An', N'An-2021-01-16', 5)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (9, 1, N'Anona', CAST(N'2021-03-01T18:10:52.580' AS DateTime), CAST(N'2021-03-04T18:10:52.580' AS DateTime), N'An', N'An-2021-01-16', 6)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (10, 1, N'Hello world, privet mir', CAST(N'2021-03-01T18:15:19.620' AS DateTime), CAST(N'2021-03-04T18:15:19.620' AS DateTime), N'Hello world', N'Hello-world-2021-03-01', 7)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (11, 1, N'ttt', CAST(N'2021-03-02T15:45:02.890' AS DateTime), CAST(N'2021-03-05T15:45:02.890' AS DateTime), N'nowww', N'nowwwww', NULL)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (12, 1, N'TTnew', CAST(N'2021-03-03T13:45:57.477' AS DateTime), CAST(N'2021-03-06T13:45:57.477' AS DateTime), N'TT`s', N'TT`sWorkURL', 4)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (13, 1, N'Привет, мой Любимый мир!', CAST(N'2021-03-03T14:05:07.773' AS DateTime), CAST(N'2021-03-06T14:05:07.773' AS DateTime), N'Привет, Мир!', N'Привет,-Мир!-2021-03-03', 2)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (15, 1, N'Привет, Я Роман Решетняк', CAST(N'2021-03-06T15:07:42.223' AS DateTime), CAST(N'2021-03-09T15:07:42.223' AS DateTime), N'Роман Решетняк', N'Роман-Решетняк-2021-03-06', 2)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (16, 1, N'Привет, я Роман Решетняк', CAST(N'2021-03-06T15:08:26.540' AS DateTime), CAST(N'2021-03-09T15:08:26.540' AS DateTime), N'Роман Решетняк', N'Роман-Решетняк-2021-03-06', 1)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (17, 1, N'Привет, меня зовут Роман Решетняк', CAST(N'2021-03-06T15:10:29.863' AS DateTime), CAST(N'2021-03-09T15:10:29.863' AS DateTime), N'Роман Решетняк', N'Роман-Решетняк-2021-03-06', 1)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (18, 1, N'Привет, меня зовут Роман Решетняк', CAST(N'2021-03-06T15:12:06.043' AS DateTime), CAST(N'2021-03-09T15:12:06.043' AS DateTime), N'Роман Решетняк', N'Роман-Решетняк-2021-03-06', 1)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (19, 1, N'{Task}', CAST(N'2021-03-07T15:34:22.620' AS DateTime), CAST(N'2021-03-16T17:00:00.000' AS DateTime), N'{nameOfWork}', N'{stringNameWork}', 2)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (20, 1, N'{Task2}', CAST(N'2021-03-07T15:37:10.183' AS DateTime), CAST(N'2021-03-11T16:00:00.000' AS DateTime), N'{nameOfWork2}', N'{stringNameWork2}', 2)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (21, 1, N'Дебил, у тебя 2 запроса работают хреново. Один работает по ЮЗЕР ИД, другой по СТУДЕНТ ИД. Исправь!', CAST(N'2021-03-07T15:37:52.230' AS DateTime), CAST(N'2021-03-11T16:00:00.000' AS DateTime), N'Новое задание', N'Новое-задание-2021-03-07', 2)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (22, 1, N'Ещё одно задание добавлено!', CAST(N'2021-03-09T13:24:07.487' AS DateTime), CAST(N'2021-03-14T16:50:00.000' AS DateTime), N'Ещё одно задание', N'Ещё-одно-задание-2021-03-09', 2)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (23, 1, N'Новое задание - Ютубовский', CAST(N'2021-03-13T12:44:39.187' AS DateTime), CAST(N'2021-03-14T16:00:00.000' AS DateTime), N'Ютубовский', N'Ютубовский-2021-03-13', 2)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (24, 1, N'Маил ру почта новости', CAST(N'2021-03-13T13:27:35.283' AS DateTime), CAST(N'2021-03-19T16:00:00.000' AS DateTime), N'Маил ру почта', N'Маил-ру-почта-2021-03-13', 2)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (25, 1, N'Новое задание от 22.03.2021. 
Напишите эссе на английском языке на тему "Русский мир - какой он?"', CAST(N'2021-03-22T15:14:48.423' AS DateTime), CAST(N'2021-03-30T10:20:00.000' AS DateTime), N'Задание от 22.03.2021', N'Задание-от-22.03.2021-2021-03-22', 1)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (26, 1, N'Напишите эссе на английском языке на тему "ЧВК России в Сирии. Что они там забыли?"', CAST(N'2021-03-22T15:17:32.280' AS DateTime), CAST(N'2021-04-12T14:00:00.000' AS DateTime), N'Задание от 23.03.2021', N'Задание-от-23.03.2021-2021-03-22', 1)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (27, 1, N'Напишите эссе на английском языке на тему "Почему у Российской Федерации всего 1 авианосец"', CAST(N'2021-03-22T15:18:17.690' AS DateTime), CAST(N'2021-04-15T15:00:00.000' AS DateTime), N'Задание от 24.03.2021', N'Задание-от-24.03.2021-2021-03-22', 2)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (28, 1, N'Напишите эссе на английском языке на тему "Что нужно сделать для сохранения экологии в РФ"', CAST(N'2021-03-22T15:19:37.167' AS DateTime), CAST(N'2021-04-12T14:00:00.000' AS DateTime), N'Что нужно сделать для сохранения экологии в РФ', N'Что-нужно-сделать-для-сохранения-экологии-в-РФ-2021-03-22', 1)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (29, 1, N'Напишите эссе на английском языке на тему "Насколько близка война в космосе?"', CAST(N'2021-03-22T15:21:00.337' AS DateTime), CAST(N'2021-03-22T15:22:00.000' AS DateTime), N'Насколько близка война в космосе?', N'Насколько-близка-война-в-космосе?-2021-03-22', 2)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (30, 1, N'Напишите эссе на английском языке на тему "Зачем нужны видеоигры?"', CAST(N'2021-03-22T15:21:47.807' AS DateTime), CAST(N'2021-03-25T23:00:00.000' AS DateTime), N'Зачем нужны видеоигры?', N'Зачем-нужны-видеоигры?-2021-03-22', 1)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (31, 1, N'Напишите эссе на английском языке на тему "Как скоро человек вылетит за пределы Солнечной системы"', CAST(N'2021-03-22T15:23:28.817' AS DateTime), CAST(N'2021-03-22T15:25:00.000' AS DateTime), N'Как скоро человек вылетит за пределы Солнечной системы', N'Как-скоро-человек-вылетит-за-пределы-Солнечной-системы-2021-03-22', 2)
INSERT [dbo].[Works] ([WorkID], [ProfessorsID], [Task], [DateOfBegin], [DateOfEnd], [NameOfWork], [UrlOfWork], [GroupID]) VALUES (1004, 1, N'Хеллоу ворд', CAST(N'2021-03-04T15:38:00.000' AS DateTime), CAST(N'2021-03-09T19:00:00.000' AS DateTime), N'Хеллоу', N'Хеллоу-Ворд', 2)
SET IDENTITY_INSERT [dbo].[Works] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__7F8E8D5E29947775]    Script Date: 24.03.2021 14:58:14 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__7F8E8D5E29947775] UNIQUE NONCLUSTERED 
(
	[UserLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([CourseNameID])
REFERENCES [dbo].[CourseNames] ([CourseNameID])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([DirectionID])
REFERENCES [dbo].[Direction] ([DirectionID])
GO
ALTER TABLE [dbo].[Essay]  WITH CHECK ADD  CONSTRAINT [FK__Operation__DateO__797309D9] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Essay] CHECK CONSTRAINT [FK__Operation__DateO__797309D9]
GO
ALTER TABLE [dbo].[Essay]  WITH CHECK ADD FOREIGN KEY([WorkID])
REFERENCES [dbo].[Works] ([WorkID])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK__Professor__UserI__5DCAEF64] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK__Professor__UserI__5DCAEF64]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK__Students__UserID__5812160E] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK__Students__UserID__5812160E]
GO
ALTER TABLE [dbo].[Works]  WITH CHECK ADD FOREIGN KEY([ProfessorsID])
REFERENCES [dbo].[Professors] ([ProfessorID])
GO
ALTER TABLE [dbo].[Works]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[CourseNames]  WITH CHECK ADD CHECK  (([LevelOfCourse]<>''))
GO
ALTER TABLE [dbo].[CourseNames]  WITH CHECK ADD CHECK  (([NameOfCourse]>(0) AND [NameOfCourse]<(5)))
GO
ALTER TABLE [dbo].[Direction]  WITH CHECK ADD CHECK  (([DirectionName]<>''))
GO
ALTER TABLE [dbo].[Essay]  WITH CHECK ADD CHECK  (([Grade]>(-1) AND [Grade]<(11)))
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD CHECK  (([ProfessorFirstName]<>''))
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD CHECK  (([ProfessorLastName]<>''))
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD CHECK  (([StudentFirstName]<>''))
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD CHECK  (([StudentLastName]<>''))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK__Users__UserLogin__44FF419A] CHECK  (([UserLogin]<>''))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK__Users__UserLogin__44FF419A]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK__Users__UserPassw__45F365D3] CHECK  (([UserPassword]<>''))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK__Users__UserPassw__45F365D3]
GO
USE [master]
GO
ALTER DATABASE [AdwiserLogDataBase] SET  READ_WRITE 
GO

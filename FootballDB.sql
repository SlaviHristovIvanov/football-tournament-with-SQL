USE [master]
GO
/****** Object:  Database [Football]    Script Date: 8.12.2021 г. 9:09:44 ******/
CREATE DATABASE [Football]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Football', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Football.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Football_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Football_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Football] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Football].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Football] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Football] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Football] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Football] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Football] SET ARITHABORT OFF 
GO
ALTER DATABASE [Football] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Football] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Football] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Football] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Football] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Football] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Football] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Football] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Football] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Football] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Football] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Football] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Football] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Football] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Football] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Football] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Football] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Football] SET RECOVERY FULL 
GO
ALTER DATABASE [Football] SET  MULTI_USER 
GO
ALTER DATABASE [Football] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Football] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Football] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Football] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Football] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Football] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Football', N'ON'
GO
ALTER DATABASE [Football] SET QUERY_STORE = OFF
GO
USE [Football]
GO
/****** Object:  Table [dbo].[FootbalPlayers]    Script Date: 8.12.2021 г. 9:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FootbalPlayers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[second_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[PIN] [int] NOT NULL,
	[appointment_date] [date] NOT NULL,
	[end_contract_date] [date] NOT NULL,
	[team_number] [int] NOT NULL,
	[lastSeas_goals] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
 CONSTRAINT [PK_FootbalPlayers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 8.12.2021 г. 9:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Judge]    Script Date: 8.12.2021 г. 9:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Judge](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[lastSeas_yellow_card] [int] NOT NULL,
	[lastSeas_red_card] [int] NOT NULL,
	[lastSeas_foul] [int] NOT NULL,
	[lastSeas_penalty] [int] NOT NULL,
 CONSTRAINT [PK_Judge] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 8.12.2021 г. 9:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[second_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[PIN] [int] NOT NULL,
	[appointment_date] [date] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone_number] [int] NOT NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meetings]    Script Date: 8.12.2021 г. 9:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meetings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hostTeamID] [int] NOT NULL,
	[host_result] [int] NOT NULL,
	[guest_result] [int] NOT NULL,
	[guestTeamID] [int] NOT NULL,
	[host_yellow_card] [int] NOT NULL,
	[guest_yellow_card] [int] NOT NULL,
	[host_red_card] [int] NOT NULL,
	[guest_red_card] [int] NOT NULL,
	[JudgeID] [int] NOT NULL,
	[meet_date] [date] NOT NULL,
 CONSTRAINT [PK_Meetings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 8.12.2021 г. 9:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FootbalPlayers] ON 

INSERT [dbo].[FootbalPlayers] ([id], [first_name], [second_name], [last_name], [PIN], [appointment_date], [end_contract_date], [team_number], [lastSeas_goals], [TeamID]) VALUES (1, N'Димитър', N'Иванов', N'Бербатов', 1523400378, CAST(N'1989-11-12' AS Date), CAST(N'2022-01-12' AS Date), 9, 149, 5)
INSERT [dbo].[FootbalPlayers] ([id], [first_name], [second_name], [last_name], [PIN], [appointment_date], [end_contract_date], [team_number], [lastSeas_goals], [TeamID]) VALUES (2, N'Стилиян', N'Петров', N'Петров', 2000245768, CAST(N'1997-02-06' AS Date), CAST(N'2029-03-07' AS Date), 5, 125, 5)
INSERT [dbo].[FootbalPlayers] ([id], [first_name], [second_name], [last_name], [PIN], [appointment_date], [end_contract_date], [team_number], [lastSeas_goals], [TeamID]) VALUES (3, N'Kristiano', N'Ivanov', N'Ronaldo', 2101149013, CAST(N'1999-09-23' AS Date), CAST(N'2023-04-17' AS Date), 7, 302, 7)
INSERT [dbo].[FootbalPlayers] ([id], [first_name], [second_name], [last_name], [PIN], [appointment_date], [end_contract_date], [team_number], [lastSeas_goals], [TeamID]) VALUES (4, N'Leo', N'Neo', N'Messi', 1780266231, CAST(N'1998-08-01' AS Date), CAST(N'2024-09-30' AS Date), 10, 391, 6)
INSERT [dbo].[FootbalPlayers] ([id], [first_name], [second_name], [last_name], [PIN], [appointment_date], [end_contract_date], [team_number], [lastSeas_goals], [TeamID]) VALUES (5, N'Robert', N'Petrov', N'Levandovski', 2098755612, CAST(N'2000-02-02' AS Date), CAST(N'2022-05-31' AS Date), 31, 81, 10)
INSERT [dbo].[FootbalPlayers] ([id], [first_name], [second_name], [last_name], [PIN], [appointment_date], [end_contract_date], [team_number], [lastSeas_goals], [TeamID]) VALUES (11, N'Muhamad', N'Balabanov', N'Sallah', 1093266901, CAST(N'2012-02-02' AS Date), CAST(N'2024-12-31' AS Date), 12, 56, 8)
SET IDENTITY_INSERT [dbo].[FootbalPlayers] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([id], [Name]) VALUES (1, N'BulgarianLeague')
INSERT [dbo].[Groups] ([id], [Name]) VALUES (2, N'LaLeague')
INSERT [dbo].[Groups] ([id], [Name]) VALUES (3, N'PremierLeague')
INSERT [dbo].[Groups] ([id], [Name]) VALUES (4, N'BundesLeague')
INSERT [dbo].[Groups] ([id], [Name]) VALUES (5, N'MajorLeague')
INSERT [dbo].[Groups] ([id], [Name]) VALUES (6, N'HolandLeague')
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Judge] ON 

INSERT [dbo].[Judge] ([id], [first_name], [last_name], [lastSeas_yellow_card], [lastSeas_red_card], [lastSeas_foul], [lastSeas_penalty]) VALUES (1, N'John', N'Mader', 32, 14, 49, 31)
INSERT [dbo].[Judge] ([id], [first_name], [last_name], [lastSeas_yellow_card], [lastSeas_red_card], [lastSeas_foul], [lastSeas_penalty]) VALUES (2, N'Kiril', N'Petkov', 43, 9, 36, 21)
INSERT [dbo].[Judge] ([id], [first_name], [last_name], [lastSeas_yellow_card], [lastSeas_red_card], [lastSeas_foul], [lastSeas_penalty]) VALUES (3, N'Boiko', N'Karaivanov', 56, 28, 28, 40)
INSERT [dbo].[Judge] ([id], [first_name], [last_name], [lastSeas_yellow_card], [lastSeas_red_card], [lastSeas_foul], [lastSeas_penalty]) VALUES (4, N'Uti', N'Papazov', 19, 3, 31, 23)
SET IDENTITY_INSERT [dbo].[Judge] OFF
GO
SET IDENTITY_INSERT [dbo].[Managers] ON 

INSERT [dbo].[Managers] ([id], [first_name], [second_name], [last_name], [PIN], [appointment_date], [email], [phone_number]) VALUES (1, N'Алекс', N'Петков', N'Иванов', 1111122222, CAST(N'2000-01-01' AS Date), N'al@abv.bg', 1888812345)
INSERT [dbo].[Managers] ([id], [first_name], [second_name], [last_name], [PIN], [appointment_date], [email], [phone_number]) VALUES (2, N'Калоян', N'Иванов', N'Петков', 2078934342, CAST(N'1999-03-24' AS Date), N'kl@abv.bg', 1999923234)
INSERT [dbo].[Managers] ([id], [first_name], [second_name], [last_name], [PIN], [appointment_date], [email], [phone_number]) VALUES (3, N'Kondio', N'Papa', N'Salov', 1909054321, CAST(N'2005-12-03' AS Date), N'ko@gmail.com', 1111190902)
INSERT [dbo].[Managers] ([id], [first_name], [second_name], [last_name], [PIN], [appointment_date], [email], [phone_number]) VALUES (4, N'Salim', N'Kezov', N'Kokov', 2078433521, CAST(N'1993-11-05' AS Date), N'sa@yahoo.com', 2034589891)
INSERT [dbo].[Managers] ([id], [first_name], [second_name], [last_name], [PIN], [appointment_date], [email], [phone_number]) VALUES (5, N'Karat', N'Bon', N'Sahalimov', 1745690021, CAST(N'2006-05-30' AS Date), N'karst@gmail.com', 1777798231)
INSERT [dbo].[Managers] ([id], [first_name], [second_name], [last_name], [PIN], [appointment_date], [email], [phone_number]) VALUES (11, N'Hsamna', N'Sasoli', N'Cocors', 1228964274, CAST(N'2012-04-30' AS Date), N'sas@abv.bg', 2033621013)
SET IDENTITY_INSERT [dbo].[Managers] OFF
GO
SET IDENTITY_INSERT [dbo].[Meetings] ON 

INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (1, 1, 3, 2, 5, 2, 0, 0, 0, 2, CAST(N'2021-05-04' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (2, 5, 2, 2, 1, 1, 1, 0, 0, 1, CAST(N'2021-05-24' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (3, 6, 4, 1, 7, 0, 2, 0, 1, 2, CAST(N'2021-04-01' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (4, 7, 3, 2, 6, 3, 3, 0, 0, 1, CAST(N'2021-04-19' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (5, 9, 6, 5, 8, 0, 0, 0, 0, 3, CAST(N'2021-05-02' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (6, 8, 3, 4, 9, 2, 0, 0, 0, 3, CAST(N'2021-05-30' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (7, 11, 3, 3, 10, 1, 1, 1, 1, 4, CAST(N'2021-04-18' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (8, 10, 1, 0, 11, 1, 0, 0, 1, 4, CAST(N'2021-04-29' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (9, 1, 2, 1, 10, 1, 0, 0, 0, 2, CAST(N'2021-07-08' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (10, 5, 2, 2, 7, 0, 1, 0, 0, 3, CAST(N'2021-07-30' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (11, 6, 0, 0, 1, 0, 2, 0, 0, 4, CAST(N'2021-08-03' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (12, 11, 6, 0, 6, 1, 0, 0, 1, 3, CAST(N'2021-08-23' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (13, 7, 1, 1, 5, 1, 0, 0, 1, 1, CAST(N'2021-06-17' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (14, 8, 3, 4, 9, 0, 0, 0, 0, 4, CAST(N'2021-05-06' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (15, 9, 2, 2, 11, 1, 1, 2, 0, 2, CAST(N'2021-05-24' AS Date))
INSERT [dbo].[Meetings] ([id], [hostTeamID], [host_result], [guest_result], [guestTeamID], [host_yellow_card], [guest_yellow_card], [host_red_card], [guest_red_card], [JudgeID], [meet_date]) VALUES (16, 10, 0, 3, 8, 0, 0, 1, 0, 1, CAST(N'2021-04-28' AS Date))
SET IDENTITY_INSERT [dbo].[Meetings] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([id], [Name], [GroupID]) VALUES (1, N'FC Levski Sofia', 1)
INSERT [dbo].[Teams] ([id], [Name], [GroupID]) VALUES (5, N'CSKA Sofia', 1)
INSERT [dbo].[Teams] ([id], [Name], [GroupID]) VALUES (6, N'FC Barselona', 2)
INSERT [dbo].[Teams] ([id], [Name], [GroupID]) VALUES (7, N'Real Madrit', 2)
INSERT [dbo].[Teams] ([id], [Name], [GroupID]) VALUES (8, N'Liverpool', 3)
INSERT [dbo].[Teams] ([id], [Name], [GroupID]) VALUES (9, N'Arsenal', 3)
INSERT [dbo].[Teams] ([id], [Name], [GroupID]) VALUES (10, N'Bayern Munchen', 4)
INSERT [dbo].[Teams] ([id], [Name], [GroupID]) VALUES (11, N'Stuttgart', 4)
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
ALTER TABLE [dbo].[FootbalPlayers]  WITH CHECK ADD  CONSTRAINT [FK_FootbalPlayers_Teams] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[FootbalPlayers] CHECK CONSTRAINT [FK_FootbalPlayers_Teams]
GO
ALTER TABLE [dbo].[Managers]  WITH CHECK ADD  CONSTRAINT [FK_Managers_FootbalPlayers] FOREIGN KEY([id])
REFERENCES [dbo].[FootbalPlayers] ([id])
GO
ALTER TABLE [dbo].[Managers] CHECK CONSTRAINT [FK_Managers_FootbalPlayers]
GO
ALTER TABLE [dbo].[Meetings]  WITH CHECK ADD  CONSTRAINT [FK_Meetings_Judge] FOREIGN KEY([JudgeID])
REFERENCES [dbo].[Judge] ([id])
GO
ALTER TABLE [dbo].[Meetings] CHECK CONSTRAINT [FK_Meetings_Judge]
GO
ALTER TABLE [dbo].[Meetings]  WITH CHECK ADD  CONSTRAINT [FK_Meetings_Teams_guest] FOREIGN KEY([guestTeamID])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[Meetings] CHECK CONSTRAINT [FK_Meetings_Teams_guest]
GO
ALTER TABLE [dbo].[Meetings]  WITH CHECK ADD  CONSTRAINT [FK_Meetings_Teams_host] FOREIGN KEY([hostTeamID])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[Meetings] CHECK CONSTRAINT [FK_Meetings_Teams_host]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Groups]
GO
/****** Object:  StoredProcedure [dbo].[Points]    Script Date: 8.12.2021 г. 9:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Points] @Teamid INT, @DateTime DATE AS 
SELECT t.Name, SUM(CASE
					WHEN m.hostTeamID = t.id AND m.host_result > m.guest_result THEN 3
					WHEN m.guestTeamID = t.id AND m.host_result < m.guest_result THEN 3
					WHEN m.host_result = m.guest_result THEN 1
					ELSE 0
					END) AS Points
FROM Meetings AS m
JOIN Teams AS t
ON t.id = m.hostTeamID OR t.id = m.guestTeamID
WHERE t.id = @Teamid AND m.meet_date <= @DateTime
GROUP BY t.id, t.Name;
GO
USE [master]
GO
ALTER DATABASE [Football] SET  READ_WRITE 
GO

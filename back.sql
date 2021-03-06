USE [master]
GO
/****** Object:  Database [Flex]    Script Date: 17/01/2022 02:39:10 a. m. ******/
CREATE DATABASE [Flex]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Flex', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Flex.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Flex_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Flex_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Flex] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Flex].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Flex] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Flex] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Flex] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Flex] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Flex] SET ARITHABORT OFF 
GO
ALTER DATABASE [Flex] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Flex] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Flex] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Flex] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Flex] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Flex] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Flex] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Flex] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Flex] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Flex] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Flex] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Flex] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Flex] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Flex] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Flex] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Flex] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Flex] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Flex] SET RECOVERY FULL 
GO
ALTER DATABASE [Flex] SET  MULTI_USER 
GO
ALTER DATABASE [Flex] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Flex] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Flex] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Flex] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Flex] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Flex] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Flex', N'ON'
GO
ALTER DATABASE [Flex] SET QUERY_STORE = OFF
GO
USE [Flex]
GO
/****** Object:  User [root]    Script Date: 17/01/2022 02:39:10 a. m. ******/
CREATE USER [root] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [root]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [root]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [root]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [root]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [root]
GO
ALTER ROLE [db_datareader] ADD MEMBER [root]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [root]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [root]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [root]
GO
/****** Object:  Table [dbo].[certificaciones]    Script Date: 17/01/2022 02:39:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[certificaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[id_empleado] [int] NOT NULL,
	[porcentaje] [int] NOT NULL,
	[id_estacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 17/01/2022 02:39:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apepat] [varchar](50) NOT NULL,
	[apemat] [varchar](50) NOT NULL,
	[id_supervisor] [int] NULL,
	[id_puesto] [int] NOT NULL,
	[id_turno] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estaciones_trabajo]    Script Date: 17/01/2022 02:39:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estaciones_trabajo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[id_linea] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lineas_produccion]    Script Date: 17/01/2022 02:39:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lineas_produccion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[puestos]    Script Date: 17/01/2022 02:39:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[puestos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[turnos]    Script Date: 17/01/2022 02:39:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turnos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[turno] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[certificaciones] ON 

INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (1, CAST(N'2022-01-17' AS Date), 11, 100, 1)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (2, CAST(N'2022-01-17' AS Date), 14, 100, 1)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (3, CAST(N'2022-01-17' AS Date), 23, 0, 1)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (4, CAST(N'2021-02-01' AS Date), 28, 100, 1)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (5, CAST(N'2022-01-17' AS Date), 13, 80, 1)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (6, CAST(N'2022-01-17' AS Date), 15, 100, 1)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (7, CAST(N'2022-01-17' AS Date), 24, 10, 1)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (8, CAST(N'2021-05-05' AS Date), 29, 100, 1)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (9, CAST(N'2022-01-17' AS Date), 13, 80, 6)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (10, CAST(N'2022-01-17' AS Date), 23, 100, 6)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (11, CAST(N'2021-03-02' AS Date), 14, 100, 6)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (12, CAST(N'2022-01-17' AS Date), 14, 80, 6)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (13, CAST(N'2022-01-17' AS Date), 29, 100, 6)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (14, CAST(N'2022-01-17' AS Date), 31, 10, 6)
INSERT [dbo].[certificaciones] ([id], [fecha], [id_empleado], [porcentaje], [id_estacion]) VALUES (15, CAST(N'2021-01-02' AS Date), 32, 100, 6)
SET IDENTITY_INSERT [dbo].[certificaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[empleados] ON 

INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (2, N'Adrian', N'Caloca', N'Diaz', NULL, 1, 1)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (7, N'Eduardo', N'Caloca', N'Diaz', 2, 1, 1)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (11, N'Luis', N'Hernandez', N'Martinez', 2, 2, 1)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (13, N'Carolina', N'Hernandez', N'Guzman', 7, 2, 2)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (14, N'Jose ', N'Alcantar ', N'Camacho', 2, 2, 1)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (15, N'Manuel', N'Bautista ', N'Mejía', 7, 2, 2)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (16, N'Valeria', N'Rodriguez', N'Hernandez', NULL, 1, 1)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (17, N'Fernanda', N'Martinez', N'Reyes', NULL, 1, 2)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (18, N'Jose ', N'Morales', N'Jimenez', NULL, 1, 2)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (19, N'Guadalupe', N'Caballero', N'Perez', NULL, 1, 2)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (20, N'Gerardo', N'Navarro', N'Alonso', NULL, 1, 3)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (21, N'Gerardo', N'Domínguez', N'Velasco', NULL, 1, 3)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (22, N'David', N'Delgado', N'Delgado', NULL, 1, 3)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (23, N'Ana', N'Diaz', N'Azse', 2, 2, 1)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (24, N'Elva', N'Alcantar', N'Gonzalez', 16, 2, 2)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (25, N'Juan', N'Dominguez', N'Esparza', 22, 2, 1)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (26, N'Edgar', N'Perez', N'Diaz', 21, 2, 3)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (27, N'Zaid', N'Gutierrez', N'Muñoz', 20, 2, 1)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (28, N'Humberto', N'Lopez', N'Santillan', 18, 2, 1)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (29, N'Carolina', N'Diaz', N'Diaz', 17, 2, 2)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (30, N'Perez', N'Diaz', N'Reyes', 7, 2, 1)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (31, N'Yoselin', N'Ramirez', N'Gamez', 16, 2, 2)
INSERT [dbo].[empleados] ([id], [nombre], [apepat], [apemat], [id_supervisor], [id_puesto], [id_turno]) VALUES (32, N'Yara', N'Salazar', N'Teran', 2, 2, 2)
SET IDENTITY_INSERT [dbo].[empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[estaciones_trabajo] ON 

INSERT [dbo].[estaciones_trabajo] ([id], [nombre], [id_linea]) VALUES (1, N'Estacion 1', 1)
INSERT [dbo].[estaciones_trabajo] ([id], [nombre], [id_linea]) VALUES (2, N'Estacion 1', 2)
INSERT [dbo].[estaciones_trabajo] ([id], [nombre], [id_linea]) VALUES (3, N'Estacion 1', 3)
INSERT [dbo].[estaciones_trabajo] ([id], [nombre], [id_linea]) VALUES (6, N'Estacion 2', 1)
INSERT [dbo].[estaciones_trabajo] ([id], [nombre], [id_linea]) VALUES (7, N'Estacion 2', 2)
INSERT [dbo].[estaciones_trabajo] ([id], [nombre], [id_linea]) VALUES (8, N'Estacion 2', 3)
INSERT [dbo].[estaciones_trabajo] ([id], [nombre], [id_linea]) VALUES (9, N'Estacion 3', 3)
INSERT [dbo].[estaciones_trabajo] ([id], [nombre], [id_linea]) VALUES (10, N'Estacion 3', 2)
INSERT [dbo].[estaciones_trabajo] ([id], [nombre], [id_linea]) VALUES (11, N'Estacion 3', 1)
SET IDENTITY_INSERT [dbo].[estaciones_trabajo] OFF
GO
SET IDENTITY_INSERT [dbo].[lineas_produccion] ON 

INSERT [dbo].[lineas_produccion] ([id], [nombre]) VALUES (1, N'Linea prod 1')
INSERT [dbo].[lineas_produccion] ([id], [nombre]) VALUES (2, N'Linea prod 2')
INSERT [dbo].[lineas_produccion] ([id], [nombre]) VALUES (3, N'Linea prod 3')
SET IDENTITY_INSERT [dbo].[lineas_produccion] OFF
GO
SET IDENTITY_INSERT [dbo].[puestos] ON 

INSERT [dbo].[puestos] ([id], [nombre]) VALUES (1, N'Supervisor')
INSERT [dbo].[puestos] ([id], [nombre]) VALUES (2, N'Empleado')
SET IDENTITY_INSERT [dbo].[puestos] OFF
GO
SET IDENTITY_INSERT [dbo].[turnos] ON 

INSERT [dbo].[turnos] ([id], [turno]) VALUES (1, N'Matutino')
INSERT [dbo].[turnos] ([id], [turno]) VALUES (2, N'Vespertino')
INSERT [dbo].[turnos] ([id], [turno]) VALUES (3, N'Noche')
SET IDENTITY_INSERT [dbo].[turnos] OFF
GO
ALTER TABLE [dbo].[certificaciones]  WITH CHECK ADD FOREIGN KEY([id_empleado])
REFERENCES [dbo].[empleados] ([id])
GO
ALTER TABLE [dbo].[certificaciones]  WITH CHECK ADD FOREIGN KEY([id_estacion])
REFERENCES [dbo].[estaciones_trabajo] ([id])
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD FOREIGN KEY([id_puesto])
REFERENCES [dbo].[puestos] ([id])
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD FOREIGN KEY([id_supervisor])
REFERENCES [dbo].[empleados] ([id])
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD FOREIGN KEY([id_turno])
REFERENCES [dbo].[turnos] ([id])
GO
ALTER TABLE [dbo].[estaciones_trabajo]  WITH CHECK ADD FOREIGN KEY([id_linea])
REFERENCES [dbo].[lineas_produccion] ([id])
GO
USE [master]
GO
ALTER DATABASE [Flex] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [Hotel]    Script Date: 02-Jul-24 15:39:27 ******/
CREATE DATABASE [Hotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotel', FILENAME = N'C:\Users\Filip\Hotel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hotel_log', FILENAME = N'C:\Users\Filip\Hotel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Hotel] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hotel] SET  MULTI_USER 
GO
ALTER DATABASE [Hotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hotel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hotel] SET QUERY_STORE = OFF
GO
USE [Hotel]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Hotel]
GO
/****** Object:  Table [dbo].[Gost]    Script Date: 02-Jul-24 15:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gost](
	[GostId] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](50) NOT NULL,
	[Prezime] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Telefon] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Gost] PRIMARY KEY CLUSTERED 
(
	[GostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menadzer]    Script Date: 02-Jul-24 15:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menadzer](
	[MenadzerId] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](50) NOT NULL,
	[Prezime] [varchar](50) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Menadzer] PRIMARY KEY CLUSTERED 
(
	[MenadzerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervacija]    Script Date: 02-Jul-24 15:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervacija](
	[RezervacijaId] [int] IDENTITY(1,1) NOT NULL,
	[UkupnaCena] [float] NOT NULL,
	[GostId] [int] NOT NULL,
	[MenadzerId] [int] NOT NULL,
 CONSTRAINT [PK_Rezervacija] PRIMARY KEY CLUSTERED 
(
	[RezervacijaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Soba]    Script Date: 02-Jul-24 15:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Soba](
	[SobaId] [int] IDENTITY(1,1) NOT NULL,
	[Broj] [varchar](50) NOT NULL,
	[CenaPoDanu] [float] NOT NULL,
	[Opis] [varchar](max) NOT NULL,
	[TipSobe] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Soba] PRIMARY KEY CLUSTERED 
(
	[SobaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StavkaRezervacije]    Script Date: 02-Jul-24 15:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StavkaRezervacije](
	[RezervacijaId] [int] NOT NULL,
	[RbStavke] [int] NOT NULL,
	[DatumPocetka] [datetime] NOT NULL,
	[DatumKraja] [datetime] NOT NULL,
	[BrojDana] [int] NOT NULL,
	[CenaStavke] [float] NOT NULL,
	[SobaId] [int] NOT NULL,
	[UslugaId] [int] NOT NULL,
 CONSTRAINT [PK_StavkaRezervacija] PRIMARY KEY CLUSTERED 
(
	[RezervacijaId] ASC,
	[RbStavke] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usluga]    Script Date: 02-Jul-24 15:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usluga](
	[UslugaId] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](50) NOT NULL,
	[Opis] [varchar](max) NOT NULL,
	[CenaPoDanu] [float] NOT NULL,
 CONSTRAINT [PK_Usluga] PRIMARY KEY CLUSTERED 
(
	[UslugaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Gost] ON 

INSERT [dbo].[Gost] ([GostId], [Ime], [Prezime], [Email], [Telefon]) VALUES (2002, N'Petar', N'Petrovic', N'petarp@gmail.com', N'0642255447')
SET IDENTITY_INSERT [dbo].[Gost] OFF
GO
SET IDENTITY_INSERT [dbo].[Menadzer] ON 

INSERT [dbo].[Menadzer] ([MenadzerId], [Ime], [Prezime], [Username], [Password]) VALUES (1, N'Milica', N'Ljubojevic', N'milica', N'milica')
SET IDENTITY_INSERT [dbo].[Menadzer] OFF
GO
SET IDENTITY_INSERT [dbo].[Rezervacija] ON 

INSERT [dbo].[Rezervacija] ([RezervacijaId], [UkupnaCena], [GostId], [MenadzerId]) VALUES (4002, 42899.78, 2002, 1)
SET IDENTITY_INSERT [dbo].[Rezervacija] OFF
GO
SET IDENTITY_INSERT [dbo].[Soba] ON 

INSERT [dbo].[Soba] ([SobaId], [Broj], [CenaPoDanu], [Opis], [TipSobe]) VALUES (1006, N'121', 1099.99, N'odlicna soba sa prelepim pogledom i terasom', N'Dvokrevetna')
INSERT [dbo].[Soba] ([SobaId], [Broj], [CenaPoDanu], [Opis], [TipSobe]) VALUES (1007, N'502', 899.99, N'perfektna soba za jednu osobu', N'Jednokrevetna')
SET IDENTITY_INSERT [dbo].[Soba] OFF
GO
INSERT [dbo].[StavkaRezervacije] ([RezervacijaId], [RbStavke], [DatumPocetka], [DatumKraja], [BrojDana], [CenaStavke], [SobaId], [UslugaId]) VALUES (4002, 1, CAST(N'2024-08-08T12:00:00.000' AS DateTime), CAST(N'2024-08-18T12:00:00.000' AS DateTime), 11, 42899.78, 1006, 5)
GO
SET IDENTITY_INSERT [dbo].[Usluga] ON 

INSERT [dbo].[Usluga] ([UslugaId], [Naziv], [Opis], [CenaPoDanu]) VALUES (1, N'polupansion', N'nocenje i dorucak', 1999.99)
INSERT [dbo].[Usluga] ([UslugaId], [Naziv], [Opis], [CenaPoDanu]) VALUES (2, N'pun pansion', N'nocenje, dorucak i vecera', 2399.99)
INSERT [dbo].[Usluga] ([UslugaId], [Naziv], [Opis], [CenaPoDanu]) VALUES (5, N'sve', N'nocenje, dorucak, rucak, vecera', 2799.99)
SET IDENTITY_INSERT [dbo].[Usluga] OFF
GO
ALTER TABLE [dbo].[Rezervacija]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacija_Gost] FOREIGN KEY([GostId])
REFERENCES [dbo].[Gost] ([GostId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Rezervacija] CHECK CONSTRAINT [FK_Rezervacija_Gost]
GO
ALTER TABLE [dbo].[Rezervacija]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacija_Menadzer] FOREIGN KEY([MenadzerId])
REFERENCES [dbo].[Menadzer] ([MenadzerId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Rezervacija] CHECK CONSTRAINT [FK_Rezervacija_Menadzer]
GO
ALTER TABLE [dbo].[StavkaRezervacije]  WITH CHECK ADD  CONSTRAINT [FK_StavkaRezervacije_Rezervacija] FOREIGN KEY([RezervacijaId])
REFERENCES [dbo].[Rezervacija] ([RezervacijaId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StavkaRezervacije] CHECK CONSTRAINT [FK_StavkaRezervacije_Rezervacija]
GO
ALTER TABLE [dbo].[StavkaRezervacije]  WITH CHECK ADD  CONSTRAINT [FK_StavkaRezervacije_Soba] FOREIGN KEY([SobaId])
REFERENCES [dbo].[Soba] ([SobaId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StavkaRezervacije] CHECK CONSTRAINT [FK_StavkaRezervacije_Soba]
GO
ALTER TABLE [dbo].[StavkaRezervacije]  WITH CHECK ADD  CONSTRAINT [FK_StavkaRezervacije_Usluga] FOREIGN KEY([UslugaId])
REFERENCES [dbo].[Usluga] ([UslugaId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StavkaRezervacije] CHECK CONSTRAINT [FK_StavkaRezervacije_Usluga]
GO
USE [master]
GO
ALTER DATABASE [Hotel] SET  READ_WRITE 
GO

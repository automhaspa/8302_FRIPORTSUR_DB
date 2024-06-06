CREATE TABLE [TESTS].[ShapeData]
(
[LuCode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Height] [int] NOT NULL CONSTRAINT [DF_Tests.ShapeData_Height] DEFAULT ((0)),
[Width] [int] NOT NULL CONSTRAINT [DF_Tests.ShapeData_Width] DEFAULT ((0)),
[Length] [int] NOT NULL CONSTRAINT [DF_Tests.ShapeData_Length] DEFAULT ((0)),
[Weight] [int] NOT NULL CONSTRAINT [DF_Tests.ShapeData_Weight] DEFAULT ((0)),
[Tare] [int] NOT NULL CONSTRAINT [DF_Tests.ShapeData_Tare] DEFAULT ((0)),
[HeightSurplus] [int] NOT NULL CONSTRAINT [DF_Tests.ShapeData_HeightSurplus] DEFAULT ((0)),
[LengthSide1Surplus] [int] NOT NULL CONSTRAINT [DF_Tests.ShapeData_LengthSide1Surplus] DEFAULT ((0)),
[LengthSide2Surplus] [int] NOT NULL CONSTRAINT [DF_Tests.ShapeData_LengthSide2Surplus] DEFAULT ((0)),
[WidthSide1Surplus] [int] NOT NULL CONSTRAINT [DF_Tests.ShapeData_WidthSide1Surplus] DEFAULT ((0)),
[WidthSide2Surplus] [int] NOT NULL CONSTRAINT [DF_Tests.ShapeData_WidthSide2Surplus] DEFAULT ((0)),
[Quantity] [decimal] (18, 0) NULL,
[LuType] [char] (1) COLLATE Latin1_General_CI_AS NULL,
[Sku] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[ProductionBatch] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[StorageBatch] [nchar] (10) COLLATE Latin1_General_CI_AS NULL,
[ExpirationDate] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[ProductionDate] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[Uom] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO

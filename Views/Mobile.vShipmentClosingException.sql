SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Mobile].[vShipmentClosingException]
AS
SELECT        Id, Label, Categoria AS ClosingStatus
FROM            [dbo].[Tipo_EccezioneChiusuraSpedizione]
GO

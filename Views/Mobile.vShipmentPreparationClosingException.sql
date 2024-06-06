SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [Mobile].[vShipmentPreparationClosingException]
AS
SELECT        Id, Label, Categoria AS ClosingStatus
FROM            [dbo].[Tipo_EccezionePreparazioneSpedizione]
GO

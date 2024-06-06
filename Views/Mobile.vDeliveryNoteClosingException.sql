SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Mobile].[vDeliveryNoteClosingException]
AS
-- Da definire: riga di prova. Per Ruata il dizionario è su db di appoggio
SELECT Id, Label, Categoria as ClosingStatus
FROM dbo.Tipo_EccezioneChiusuraAccettazioneMerce
GO

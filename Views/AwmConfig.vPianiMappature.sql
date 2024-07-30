SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE     VIEW [AwmConfig].[vPianiMappature]
AS
WITH NumeroMissioniPerPianoMappatura AS
(
    SELECT 
        Id_Piano_Mappatura,
        SUM(CASE WHEN Id_Tipo_Stato_Percorso = 9 THEN 1 ELSE 0 END) AS EsitiMissioniInErrore,
        SUM(CASE WHEN Id_Tipo_Stato_Percorso = 3 THEN 1 ELSE 0 END) AS MissioniSvolte
    FROM 
        dbo.esito_Passi_Mappatura
    GROUP BY 
        Id_Piano_Mappatura
),
InfoNumericheSulleMissioni AS
(
    SELECT 
        pm.Id_Piano_Mappatura, 
        ((MIN(pm.A_Colonna)+1)-MIN(pm.Da_Colonna))*((MIN(pm.A_Piano)+1)-MIN(pm.Da_Piano))*((MIN(pm.A_Profondita)+1)-MIN(pm.Da_Profondita)) AS NumeroTotaleMissioni,
        MIN(nmppm.EsitiMissioniInErrore) AS EsitiMissioniInErrore,  -- Assegnamento di un nome alla colonna
        MIN(nmppm.MissioniSvolte) AS MissioniSvolte  -- Assegnamento di un nome alla colonna
    FROM 
        dbo.Piani_Mappature pm
    LEFT JOIN 
        NumeroMissioniPerPianoMappatura nmppm 
        ON pm.Id_Piano_Mappatura = nmppm.Id_Piano_Mappatura
    GROUP BY 
        pm.Id_Piano_Mappatura
)
SELECT
    pim.Id_Piano_Mappatura,
    pim.Id_Partizione_Macchina,
    pm.DESCRIZIONE AS Macchina,
    pim.Id_Item_destinazione,
    cs.DESCRIZIONE AS scaffale,
    pim.Da_Colonna,
    pim.A_Colonna,
    pim.Da_Piano,
    pim.A_Piano,
    pim.Da_Profondita,
    pim.A_Profondita,
	pim.CreationDatetime,
	pim.LastUpdateDatetime,
    insm.NumeroTotaleMissioni AS Numero_Totale_Missioni,
    insm.EsitiMissioniInErrore AS Missioni_In_Errore,
    (insm.NumeroTotaleMissioni-insm.MissioniSvolte)-insm.EsitiMissioniInErrore AS Missioni_Ancora_Da_Svolgere
FROM	dbo.Piani_Mappature pim
LEFT 
JOIN	dbo.Partizioni pm 
ON		pm.ID_PARTIZIONE = pim.Id_Partizione_Macchina
LEFT 
JOIN	dbo.Componenti cs 
ON		cs.ID_COMPONENTE = pim.Id_Item_destinazione
LEFT 
JOIN	InfoNumericheSulleMissioni insm 
ON		insm.Id_Piano_Mappatura = pim.Id_Piano_Mappatura;
GO

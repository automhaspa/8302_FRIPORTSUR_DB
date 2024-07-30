INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:PianiMappature:OrderParameter', N'[    {     "Name" : "LastUpdateDatetime",     "DbType":"DateTime",     "Descending" : true    }    ]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Regole:HiddenFields', N'["Id_Regola"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Regole:OrderParameter', N'[{"Name" : "Nome","DbType":"Varchar","Descending" : false}]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:RegoleSequenzaDettaglio:Actions', N'[17]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:RegoleSequenzaDettaglio:ActionsHeader', N'[15,16]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:RegoleSequenzaDettaglio:HiddenFields', N'["Id_Sequenza_Regole","Id_Sequenza_Regole_Dettaglio"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:RegoleSequenzaDettaglio:OrderParameter', N'[{"Name" : "Tipo_Missione","DbType":"Varchar","Descending" : false},{"Name" : "Sequenza","DbType":"Int","Descending" : false} ]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:RegoleSequenzaTestata:HiddenFields', N'["Id_Sequenza_Regole"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Alarms:DataTable:OrderParameter', N'[{"Name" : "Data","DbType":"DateTime","Descending" : false}]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Articoli:DataTable:HiddenFields', N'["Id_Articolo"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Articoli:NavigateItem', N'[
        {
            "FieldNameSource": "Codice",
            "FieldNameDest": "Codice_Articolo",
            "FieldTypeDest": "VarChar",
            "EntityNameDest": "UdcDettaglio",
            "ComponentNameDest": "Blazor.Components.ModalComponents.EntitiesModalComponent"
        }
    ]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Articoli:OrderParameter', N'[{"Name" : "Presenza_Udc","DbType":"Int","Descending" : true}]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:AsiInfoComponent:FrontendActionsId', N'[32,30,31,12,46]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:AsiInfoComponent:HiddenFields', N'["ImagePath", "ID_PARTIZIONE", "Asi"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:AsiManager', N'{"HiddenMissionTypes": ["IFR","OUL"], "DefaultMissionType" : "MNT" }')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Capienza_Magazzino', N'{"CacheControl":{"Public":true, "MaxAge": "00:00:30"}, "UpdateInteval":15000,"IdleTimeout":2000}')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Charts:EntityNames', N'["gStatisticheGiornaliere", "gOreLavoro", "gStatisticheOrarie", "gMissioniFinestra"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Charts:Liste:EntityNames', N'["gDimensioniListeUscita","gTempoEsecuzioneListeUscita", "gStatisticheListeOrarie"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Charts:TempiMissioni:EntityNames', N'["gTempoEsecuzioneIngressi", "gTempoEsecuzioneUscite", "gNumeroIngressi", "gNumeroUscite"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Dashboard:Charts:EntityNames', N'["gStatisticheOrarie", "gStatisticheListeOrarie"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:DefaultEntity:NavMenu:MenuItems', N'[
    {
        "Href": "dashboard",
        "Title": "Dashboard",
        "ImageSrc": "Scada.svg",
        "HasSeparator": true
    },
    {
        "Href": "v/UdcTestata",
        "Title": "Stock",
        "ImageSrc": "search sku.svg"
    },
    {
        "Href": "v/Articoli",
        "Title": "Products",
        "ImageSrc": "search sku.svg"
    },
    {
        "Href": "v/Missioni",
        "Title": "Mission",
        "ImageSrc": "tasks.svg"
    },
    {
        "Href": "v/PassiInCorso",
        "Title": "Pending steps",
        "ImageSrc": "tasks.svg",
        "HasSeparator": true
    },
    {
        "Href": "v/Partizioni",
        "Title": "Partitions",
        "ImageSrc": "Partitions.svg"
    },
    {
        "Title": "SCADA",
        "ImageSrc": "Scada.svg",
        "hasSubMenuitems": true,
        "subMenuitems": [
            {
                "Href": "Scada2/Inbound",
                "Title": "Inbound",
                "ImageSrc": "Inbound.svg"
            },
            {
                "Href": "Scada2/Outbound",
                "Title": "Outbound",
                "ImageSrc": "Outbound.svg"
            },
            {
                "Href": "Scada",
                "Title": "Warehouse",
                "ImageSrc": "warehouse.svg"
            }
        ]
    },
    {
        "Href": "v/Alarms",
        "Title": "Faults",
        "ImageSrc": "Scada.svg"
    },
    {
        "Href": "v/Storico_Allarmi",
        "Title": "Fault History",
        "ImageSrc": "Picking list.svg",
        "HasSeparator": true
    },
    {
        "Href": "v/Liste_Ingresso",
        "Title": "Inbound Orders",
        "ImageSrc": "manage pallets.svg"
    },
    {
        "Href": "v/Liste_Uscita",
        "Title": "Outbound Orders",
        "ImageSrc": "manage pallets.svg"
    },
    {
        "Href": "v/Monitor_Uscite",
        "Title": "Outbound Monitor",
        "ImageSrc": "manage pallets.svg",
        "HasSeparator": true
    },
    {
        "title": "Logistics KPI",
        "imageSrc": "chart.svg",
        "subMenuitems": [
            {
                "href": "charts",
                "Title": "Performance",
                "ImageSrc": "chart.svg"
            },
            {
                "href": "charts/Liste",
                "Title": "Orders",
                "ImageSrc": "chart.svg"
            },
            {
                "href": "charts/TempiMissioni",
                "Title": "Missions",
                "ImageSrc": "chart.svg"
            }
        ]
    },
    {
        "Href": "v/AdiacenzeTempiMedi",
        "Title": "Automation KPI",
        "ImageSrc": "utility.svg",
        "HasSeparator": true
    },
    {
        "Href": "v/MissioniStorico",
        "Title": "Mission History",
        "ImageSrc": "tasks history.svg"
    },
    {
        "Href": "v/UdcStorico",
        "Title": "Loading Unit History",
        "ImageSrc": "tasks history.svg",
        "HasSeparator": true
    },
    {
        "Title": "Automation Tools",
        "ImageSrc": "utility.svg",
        "Roles": 2048,
        "subMenuitems": [
            {
                "href": "AsiManager",
                "Title": "Asi Manager",
                "ImageSrc": "utility.svg"
            },
            {
                "href": "PositioningManager",
                "Title": "Positioning Manager",
                "ImageSrc": "utility.svg"
            },
            {
                "href": "plantManager",
                "Title": "Plant Manager",
                "ImageSrc": "utility.svg"
            }
        ]
    }
]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:EsitoPassiMappatura:Actions', N'[49]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:EsitoPassiMappatura:DataTable:HiddenFields', N'["Id_Piano_Mappatura","Id","Id_Partizione_Sorgente","Id_Partizione_Destinazione","Id_Sequenza","Id_Tipo_Stato_Percorso"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:gDimensioniListeUscita:ChartPanel', N'{"DisplayTimeSpan":"7.00:00:00", "Title": "Dimensione ordini d''uscita" }')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:gMissioniFinestra:ChartPanel', N'{"DisplayTimeSpan":"01:00:00", "Title": "Numero missioni completate in 30 minuti" }')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:gNumeroIngressi:ChartPanel', N'{"DisplayTimeSpan":"7.00:00:00", "Title": "Missioni d''ingresso completate" }')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:gNumeroUscite:ChartPanel', N'{"DisplayTimeSpan":"7.00:00:00", "Title": "Missioni d''uscita completate" }')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:gOreLavoro:ChartPanel', N'{"DisplayTimeSpan":"7.00:00:00", "Title": "Ore lavoro ultimi 7 giorni" }')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:gStatisticheGiornaliere:ChartPanel', N'{"DisplayTimeSpan":"7.00:00:00", "Title": "Statistiche giornaliere" }')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:gStatisticheListeOrarie:ChartPanel', N'{"DisplayTimeSpan":"1.00:00:00", "Title": "Ordini d''uscita evasi per ora" }')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:gStatisticheOrarie:ChartPanel', N'{"DisplayTimeSpan":"1.00:00:00", "Title": "Statistiche orarie" }')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:gTempoEsecuzioneIngressi:ChartPanel', N'{"DisplayTimeSpan":"7.00:00:00", "Title": "Tempo esecuzione missioni d''ingresso in secondi" }')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:gTempoEsecuzioneListeUscita:ChartPanel', N'{"DisplayTimeSpan":"7.00:00:00", "Title": "Tempo esecuzione ordini d''uscita in minuti" }')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:gTempoEsecuzioneUscite:ChartPanel', N'{"DisplayTimeSpan":"7.00:00:00", "Title": "Tempo esecuzione missioni d''uscita in secondi" }')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Macchine', N'{"CacheControl":{"Public":true, "MaxAge": "01:00:00"}, "UpdateInteval":0}')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Mapping:Actions', N'[47,48]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Mapping:DataTable:HiddenFields', N'["Id_Macchina","Id_Scaffale"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Missioni:Actions', N'[11,25,23]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Missioni:DataTable:ActionValidationOption', N'[
{   "ActionId": 11,   "Template": "Do you really want to {action} {0}?",   "Fields": ["Id_Missione" ] },
{   "ActionId": 23,   "Template": "Do you really want to {action} {0}?",  "Fields": ["Id_Missione" ] },
{   "ActionId": 25,   "Template": "Do you really want to {action} {0}?",   "Fields": ["Id_Missione" ] }
]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Missioni:DataTable:HiddenFields', N'["Id_Partizione_Sorgente","Id_Partizione_Destinazione","Id_Udc","Id_Tipo_Missione"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Missioni:NavigateItem', N'
	[
		{
			"FieldNameSource"  : "Codice_Udc",
			"FieldNameDest"   : "Codice_Udc",
			"FieldTypeDest"   : "VarChar",
			"EntityNameDest"  : "UdcTestata",
			"ComponentNameDest" : "Blazor.Components.ModalLoadUnitInfo"
		},
		{
			"FieldNameSource"  : "Sorgente",
			"FieldNameDest"   : "Asi",
			"FieldTypeDest"   : "VarChar",
			"EntityNameDest"  : "AsiInfoComponent",
			"ComponentNameDest" : "Blazor.Components.AsiInfoComponent"
		},
		{
			"FieldNameSource"  : "Destinazione",
			"FieldNameDest"   : "Asi",
			"FieldTypeDest"   : "VarChar",
			"EntityNameDest"  : "AsiInfoComponent",
			"ComponentNameDest" : "Blazor.Components.AsiInfoComponent"
		},
		{
			"FieldNameSource"  : "Posizione",
			"FieldNameDest"   : "Asi",
			"FieldTypeDest"   : "VarChar",
			"EntityNameDest"  : "AsiInfoComponent",
			"ComponentNameDest" : "Blazor.Components.AsiInfoComponent"
		}
	]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:MissioniStorico:DataTable:HiddenFields', N'["Id_Udc"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:MissioniStorico:OrderParameter', N'[
		{
			"Name" : "Data_Storicizzazione",
			"DbType":"DateTime",
			"Descending" : true
		}
	 ]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:ModalLoadUnitInfo', N'{
"HiddenFields" :["Id_Udc", "Id_Missione", "Id_Sequenza_Percorso","Error_Description","Error_SourceAsi","Error_DestAsi","Error_Type"],
"ActionValidationOption":
[
	{   "ActionId": 25,   "Template": "Do you really want to {action} {0} with code {1}?",    "Fields": ["Id_Udc","Codice_Udc" ] },
	{   "ActionId": 1,   "Template": "Do you really want to launch {action} for lu {0} with code {1}?",   "Fields": ["Id_Udc","Codice_Udc" ] },
	{   "ActionId": 2,   "Template": "Do you really want to {action} {0} with code {1}?",     "Fields": ["Id_Udc","Codice_Udc" ] },
	{   "ActionId": 11,   "Template": "Do you really want to {action} {0} with code {1}?",    "Fields": ["Id_Udc","Codice_Udc" ] } 
]}')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Partizioni:Actions', N'[32,30,31,12,46]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Partizioni:DataTable:HiddenFields', N'["Id_Partizione","Id_Magazzino"
,"ID_AREA"
,"ID_SOTTOAREA"
,"ID_COMPONENTE"
,"ID_SOTTOCOMPONENTE"
,"ID_PARTIZIONE"
,"ID_TIPO_PARTIZIONE"
,"ID_TIPO_COMPONENTE"
,"TIPO_PARTIZIONE"
,"CODPLC"
,"ASI"
,"SUBITEM"
,"PARTITION"]
')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Partizioni:OrderParameter', N'[{"Name" : "ASI","DbType":"varchar","Descending" : false}]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:PassiInCorso:Actions', N'[4,5]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:PassiInCorso:ActionValidationOption', N'[
{   "ActionId": 4,   "Template": "Do you really want to {action} step {0} of mission {1}? You should make this action using the bell on the top",   "Fields": ["Id_Sequenza_Percorso","Id_Missione"]  },  
{   "ActionId": 5,   "Template": "Do you really want to {action} step {0} of mission {1}? You should make this action using the bell on the top",   "Fields": ["Id_Sequenza_Percorso","Id_Missione"]  }]  ')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:PassiInCorso:NavigateItem', N'
	[
		{
			"FieldNameSource"  : "Sorgente",
			"FieldNameDest"   : "Asi",
			"FieldTypeDest"   : "VarChar",
			"EntityNameDest"  : "AsiInfoComponent",
			"ComponentNameDest" : "Blazor.Components.AsiInfoComponent"
		},
		{
			"FieldNameSource"  : "Destinazione",
			"FieldNameDest"   : "Asi",
			"FieldTypeDest"   : "VarChar",
			"EntityNameDest"  : "AsiInfoComponent",
			"ComponentNameDest" : "Blazor.Components.AsiInfoComponent"
		},
		{
			"FieldNameSource"  : "Codice_Udc",
			"FieldNameDest"   : "Codice_Udc",
			"FieldTypeDest"   : "VarChar",
			"EntityNameDest"  : "UdcTestata",
			"ComponentNameDest" : "Blazor.Components.ModalLoadUnitInfo"
		},
		{
			"FieldNameSource"  : "Id_Missione",
			"FieldNameDest"   : "Id_Missione",
			"FieldTypeDest"   : "Int",
			"EntityNameDest"  : "v/Missioni",
			"ComponentNameDest" : "Blazor.Components.DataTable"
		}
	]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:PassiInCorso:OrderParameter', N'[      {          "Name": "Secondi_Esecuz",          "DbType": "int",          "Descending": true      } ]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Percorso:Actions', N'[4,5]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Percorso:ActionValidationOption', N'[  {   "ActionId": 4,   "Template": "Do you really want to {action} step {0} of mission {1}? You should make this action using the bell on the top",   "Fields": ["Id_Sequenza_Percorso","Id_Missione"]  },   
	{   "ActionId": 5,   "Template": "Do you really want to {action} step {0} of mission {1}? You should make this action using the bell on the top",   "Fields": ["Id_Sequenza_Percorso","Id_Missione"]  }]  ')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Percorso:DataTable:HiddenFields', N'["Id_Tipo_Stato_Percorso","Codice_Udc"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Percorso:NavigateItem', N'
	[
		{
			"FieldNameSource"  : "Sorgente",
			"FieldNameDest"   : "Asi",
			"FieldTypeDest"   : "VarChar",
			"EntityNameDest"  : "AsiInfoComponent",
			"ComponentNameDest" : "Blazor.Components.AsiInfoComponent"
		},
		{
			"FieldNameSource"  : "Destinazione",
			"FieldNameDest"   : "Asi",
			"FieldTypeDest"   : "VarChar",
			"EntityNameDest"  : "AsiInfoComponent",
			"ComponentNameDest" : "Blazor.Components.AsiInfoComponent"
		}
	]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:PianiMappature:Actions', N'[50]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:PianiMappature:DataTable:HiddenFields', N'["Id_Item_destinazione","Id_Partizione_Macchina"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Quote:DataTable:HiddenFields', N'["Id_Riferimento","Id_Partizione"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Rush:Actions', N'[40]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:ScadaLoadUnitInfo:FrontendActionsId', N'[1,2,11,25]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:ScadaLoadUnitInfo:NavigateItem', N'
	[
		{
			"FieldNameSource": "Destinazione",
			"FieldNameDest": "Asi",
			"FieldTypeDest": "VarChar",
			"EntityNameDest": "AsiInfoComponent",
			"ComponentNameDest": "Blazor.Components.AsiInfoComponent"
		}
	]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:StatisticheDashboard', N'{"CacheControl":{"Public":true, "MaxAge": "00:00:03"}, "UpdateInteval":5000,"IdleTimeout":2000}')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Storico_Allarmi:OrderParameter', N'[    {     "Name" : "Data",     "DbType":"DateTime",     "Descending" : true    }    ]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Udc_Baia:DataTable:HiddenFields', N'["Id_Udc","Id_Partizione","Id_Destinazione"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Udc_Baia:InBound:DefaultViewNavigationItems', N'[
                        {
                            "EntityName": "Udc_Baia",
                            "ActiveImageName": "ListActive",
                            "InactiveImageName": "ListInactive",
                            "ComponentCode": "D"
                        },
                        {
                            "EntityName": "Udc_Baia",
                            "ActiveImageName": "TabActive",
                            "InactiveImageName": "TabInactive",
                            "ComponentCode": "B"
                        }
                    ]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Udc_Baia_Outbound:DataTable:HiddenFields', N'["Id_Udc","Id_Partizione","Id_Destinazione","Id_Tipo_Missione","Id_Stato_Missione"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:Udc_Baia_Picking:DataTable:HiddenFields', N'["Id_Udc","Id_Partizione","Id_Destinazione","Id_Tipo_Missione","Id_Stato_Missione"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:UdcDettaglio:DataTable:HiddenFields', N'["Id_Udc","Id_UdcDettaglio", "Id_Articolo"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:UdcDettaglio:NavigateItem', N'
	[
		{
			"FieldNameSource"  : "Codice_Articolo",
			"FieldNameDest"   : "Codice",
			"FieldTypeDest"   : "VarChar",
			"EntityNameDest"  : "Articoli",
			"ComponentNameDest" : "Blazor.Components.ModalComponents.EntityModalComponent"
		}
	]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:UdcStorico:DataTable:HiddenFields', N'["Id_Tipo_Udc", "Id_Partizione"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:UdcStorico:OrderParameter', N'[    {     "Name" : "Data_Cancellazione",     "DbType":"DateTime",     "Descending" : true    }    ]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:UdcTestata:DataTable:Actions', N'[1,2]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:UdcTestata:DataTable:ActionValidationOption', N'[
{   "ActionId": 1,   "Template": "Do you really want to launch {action} for lu {0} with code {1}?",   "Fields": ["Id_Udc","Codice_Udc" ] },
{   "ActionId": 2,   "Template": "Do you really want to {action} {0} with code {1}?",     "Fields": ["Id_Udc","Codice_Udc" ] }
]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:UdcTestata:DataTable:HiddenFields', N'["Id_Udc","Id_Partizione"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:UdcTestata:NavigateItem', N'
	[
		{
			"FieldNameSource"  : "Partizione",
			"FieldNameDest"   : "Asi",
			"FieldTypeDest"   : "VarChar",
			"EntityNameDest"  : "AsiInfoComponent",
			"ComponentNameDest" : "Blazor.Components.AsiInfoComponent"
		}
	]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:UdcTestata_Outbound:Actions', N'[1]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:UdcTestata_Outbound:DataTable:Actions', N'[2]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:UdcTestata_Outbound:DataTable:HiddenFields', N'["Id_Udc"]')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'PhysicalStateManager', N'{"StopSubareaForSequenceReset": false}')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'Blazor:ScadaLayout:Main', N'{"SvgSource" : "Scada/8302/Friportsur.Scada.svg","FloorFilterVisible":true, "Scale":278}')
INSERT INTO [dbo].[Configurazioni] ([Chiave], [Valore]) VALUES (N'CoreService:CommunicationChannels', N'[
    {
        "id": 1,
        "description": "QG1",
        "communicationChannelType": "MockUdpCommunicationChannel",
        "configuration": {
            "PlcIpAddress": "172.31.1.1",
            "UdpReceivePort": 2012,
            "UdpSendPort": 2011,
            "AckTimeOut": 5,
            "StayingAliveTime": 8,
            "ReceivedMessageDefaultPlant": "0001",
            "ReceivedMessageDefaultWarehouse": "0001",
            "LuOnAsi":["2A01"]
        }
    }
]')

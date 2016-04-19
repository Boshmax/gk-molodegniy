/****** Object:  StoredProcedure [dbo].[CorrectM2]    Script Date: 09/15/2014 09:28:57 ******/
set ANSI_NULLS on
go
set QUOTED_IDENTIFIER on
go


--AS

begin

declare @tCorrect table (HReal varchar(10), Hsroy varchar(10), HsroyFract int default(0), HRealApart int default(0))
update F
set F.FlatStr = F.Flat
from dbo.tUser F
where F.HouseId = 3 and F.FlatStr is null


insert @tCorrect(HReal, Hsroy)
select '1','5'
 union all select '2','6'
 union all select '3','7'
 union all select '4','8'
 union all select '5','9'
 union all select '6','9a'
 union all select '7','1'
 union all select '8','2'
 union all select '9','3'
 union all select '10','4'
 union all select '10a','4a'
 union all select '11','14'
 union all select '12','15'
 union all select '13','16'
 union all select '14','17'
 union all select '15','18'
 union all select '16','18a'
 union all select '17','10'
 union all select '18','11'
 union all select '19','12'
 union all select '20','13'
 union all select '20a','13a'
 union all select '21','23'
 union all select '22','24'
 union all select '23','25'
 union all select '24','26'
 union all select '25','27'
 union all select '26','27a'
 union all select '27','19'
 union all select '28','20'
 union all select '29','21'
 union all select '30','22'
 union all select '30a','22a'
 union all select '31','32'
 union all select '32','33'
 union all select '33','34'
 union all select '34','35'
 union all select '35','36'
 union all select '36','36a'
 union all select '37','28'
 union all select '38','29'
 union all select '39','30'
 union all select '40','31'
 union all select '40a','31a'
 union all select '41','41'
 union all select '42','42'
 union all select '43','43'
 union all select '44','44'
 union all select '45','45'
 union all select '46','45a'
 union all select '47','37'
 union all select '48','38'
 union all select '49','39'
 union all select '50','40'
 union all select '50a','40a'
 union all select '51','50'
 union all select '52','51'
 union all select '53','52'
 union all select '54','53'
 union all select '55','54'
 union all select '56','54a'
 union all select '57','46'
 union all select '58','47'
 union all select '59','48'
 union all select '60','49'
 union all select '60a','49a'
 union all select '61','59'
 union all select '62','60'
 union all select '63','61'
 union all select '64','62'
 union all select '65','63'
 union all select '66','63a'
 union all select '67','55'
 union all select '68','56'
 union all select '69','57'
 union all select '70','58'
 union all select '70a','58a'
 union all select '71','68'
 union all select '72','69'
 union all select '73','70'
 union all select '74','71'
 union all select '75','72'
 union all select '76','72a'
 union all select '77','64'
 union all select '78','65'
 union all select '79','66'
 union all select '80','67'
 union all select '80a','67a'
 union all select '81','77'
 union all select '82','78'
 union all select '83','79'
 union all select '84','80'
 union all select '85','81'
 union all select '86','81a'
 union all select '87','73'
 union all select '88','74'
 union all select '89','75'
 union all select '90','76'
 union all select '90a','76a'
 union all select '91','86'
 union all select '92','87'
 union all select '93','88'
 union all select '94','89'
 union all select '95','90'
 union all select '96','90a'
 union all select '97','82'
 union all select '98','83'
 union all select '99','84'
 union all select '100','85'
 union all select '100a','85a'
 union all select '101','95'
 union all select '102','96'
 union all select '103','97'
 union all select '104','98'
 union all select '105','99'
 union all select '106','99a'
 union all select '107','91'
 union all select '108','92'
 union all select '109','93'
 union all select '110','94'
 union all select '110a','94a'
 union all select '111','104'
 union all select '112','105'
 union all select '113','106'
 union all select '114','107'
 union all select '115','108'
 union all select '116','108a'
 union all select '117','100'
 union all select '118','101'
 union all select '119','102'
 union all select '120','103'
 union all select '120a','103a'
 union all select '121','114'
 union all select '122','115'
 union all select '123','116'
 union all select '124','117'
 union all select '125','118'
 union all select '126','118a'
 union all select '127','110'
 union all select '128','111'
 union all select '129','112'
 union all select '130','113'
 union all select '130a','113a'
 union all select '131','123'
 union all select '132','124'
 union all select '133','125'
 union all select '134','126'
 union all select '135','127'
 union all select '136','127a'
 union all select '137','119'
 union all select '138','120'
 union all select '139','121'
 union all select '140','122'
 union all select '140a','122a'
 union all select '141','132'
 union all select '142','133'
 union all select '143','134'
 union all select '144','135'
 union all select '145','136'
 union all select '146','136a'
 union all select '147','128'
 union all select '148','129'
 union all select '149','130'
 union all select '150','131'
 union all select '150a','131a'
 union all select '151','141'
 union all select '152','142'
 union all select '153','143'
 union all select '154','144'
 union all select '155','145'
 union all select '156','145a'
 union all select '157','137'
 union all select '158','138'
 union all select '159','139'
 union all select '160','140'
 union all select '160a','140a'
 union all select '161','150'
 union all select '162','151'
 union all select '163','152'
 union all select '164','153'
 union all select '165','154'
 union all select '166','154a'
 union all select '167','146'
 union all select '168','147'
 union all select '169','148'
 union all select '170','149'
 union all select '170a','149a'
 union all select '171','159'
 union all select '172','160'
 union all select '173','161'
 union all select '174','162'
 union all select '175','163'
 union all select '176','163a'
 union all select '177','155'
 union all select '178','156'
 union all select '179','157'
 union all select '180','158'
 union all select '180a','158a'
 union all select '181','168'
 union all select '182','169'
 union all select '183','170'
 union all select '184','171'
 union all select '185','172'
 union all select '186','172a'
 union all select '187','164'
 union all select '188','165'
 union all select '189','166'
 union all select '190','167'
 union all select '190a','167a'
 union all select '191','177'
 union all select '192','178'
 union all select '193','179'
 union all select '194','180'
 union all select '195','181'
 union all select '196','181a'
 union all select '197','173'
 union all select '198','174'
 union all select '199','175'
 union all select '200','176'
 union all select '200a','176a'
 union all select '201','186'
 union all select '202','187'
 union all select '203','188'
 union all select '204','189'
 union all select '205','190'
 union all select '206','190a'
 union all select '207','182'
 union all select '208','183'
 union all select '209','184'
 union all select '210','185'
 union all select '210a','185a'
 union all select '211','195'
 union all select '212','196'
 union all select '213','197'
 union all select '214','198'
 union all select '215','199'
 union all select '216','199a'
 union all select '217','191'
 union all select '218','192'
 union all select '219','193'
 union all select '220','194'
 union all select '220a','194a'
 union all select '221','203'
 union all select '222','204'
 union all select '223','205'
 union all select '224','206'
 union all select '225','207'
 union all select '226','207a'
 union all select '227','199'
 union all select '228','200'
 union all select '229','201'
 union all select '230','202'
 union all select '230a','202a'
 union all select '231','212'
 union all select '232','213'
 union all select '233','214'
 union all select '234','215'
 union all select '235','216'
 union all select '236','216a'
 union all select '237','208'
 union all select '238','209'
 union all select '239','210'
 union all select '240','211'
 union all select '240a','211a'
 union all select '241','221'
 union all select '242','222'
 union all select '243','223'
 union all select '244','224'
 union all select '245','225'
 union all select '246','217'
 union all select '247','218'
 union all select '248','219'
 union all select '249','220'
 union all select '250','230'
 union all select '251','231'
 union all select '252','232'
 union all select '253','233'
 union all select '254','234'
 union all select '255','226'
 union all select '256','227'
 union all select '257','228'
 union all select '258','229'
 union all select '259','239'
 union all select '260','240'
 union all select '261','241'
 union all select '262','242'
 union all select '263','243'
 union all select '264','235'
 union all select '265','236'
 union all select '266','237'
 union all select '267','238'
 union all select '268','248'
 union all select '269','249'
 union all select '270','250'
 union all select '271','251'
 union all select '272','252'
 union all select '273','244'
 union all select '274','245'
 union all select '275','246'
 union all select '276','247'
 union all select '277','257'
 union all select '278','258'
 union all select '279','259'
 union all select '280','260'
 union all select '281','261'
 union all select '282','253'
 union all select '283','254'
 union all select '284','255'
 union all select '285','256'
 union all select '286','266'
 union all select '287','267'
 union all select '288','268'
 union all select '289','269'
 union all select '290','270'
 union all select '291','262'
 union all select '292','263'
 union all select '293','264'
 union all select '294','265'
 union all select '295','275'
 union all select '296','276'
 union all select '297','277'
 union all select '298','278'
 union all select '299','279'
 union all select '300','271'
 union all select '301','272'
 union all select '302','273'
 union all select '303','274'
 union all select '304','284'
 union all select '305','285'
 union all select '306','286'
 union all select '307','287'
 union all select '308','288'
 union all select '309','280'
 union all select '310','281'
 union all select '311','282'
 union all select '312','283'
 union all select '313','293'
 union all select '314','294'
 union all select '315','295'
 union all select '316','296'
 union all select '317','297'
 union all select '318','289'
 union all select '319','290'
 union all select '320','291'
 union all select '321','292'
 union all select '322','302'
 union all select '323','303'
 union all select '324','304'
 union all select '325','305'
 union all select '326','306'
 union all select '327','298'
 union all select '328','299'
 union all select '329','300'
 union all select '330','301'
 union all select '331','311'
 union all select '332','312'
 union all select '333','313'
 union all select '334','314'
 union all select '335','315'
 union all select '336','307'
 union all select '337','308'
 union all select '338','309'
 union all select '339','310'
 union all select '340','320'
 union all select '341','321'
 union all select '342','322'
 union all select '343','323'
 union all select '344','324'
 union all select '345','316'
 union all select '346','317'
 union all select '347','318'
 union all select '348','319'
 union all select '349','329'
 union all select '350','330'
 union all select '351','331'
 union all select '352','332'
 union all select '353','333'
 union all select '354','325'
 union all select '355','326'
 union all select '356','327'
 union all select '357','328'
 union all select '349','329'
 union all select '350','330'
 union all select '351','331'
 union all select '352','332'
 union all select '353','333'
 union all select '354','325'
 union all select '355','326'
 union all select '356','327'
 union all select '357','328'
 union all select '358','338'
 union all select '359','339'
 union all select '360','340'
 union all select '361','341'
 union all select '362','342'
 union all select '363','334'
 union all select '364','335'
 union all select '365','336'
 union all select '366','337'
 union all select '367','347'
 union all select '368','348'
 union all select '369','349'
 union all select '370','350'
 union all select '371','351'
 union all select '372','343'
 union all select '373','344'
 union all select '374','345'
 union all select '375','346'
 union all select '376','356'
 union all select '377','357'
 union all select '378','358'
 union all select '379','359'
 union all select '380','360'
 union all select '381','352'
 union all select '382','353'
 union all select '383','354'
 union all select '384','355'
 union all select '385','365'
 union all select '386','366'
 union all select '387','367'
 union all select '388','368'
 union all select '389','369'
 union all select '390','361'
 union all select '391','362'
 union all select '392','363'
 union all select '393','364'
 union all select '394','374'
 union all select '395','375'
 union all select '396','376'
 union all select '397','377'
 union all select '398','378'
 union all select '399','370'
 union all select '400','371'
 union all select '401','372'
 union all select '402','373'
 union all select '403','383'
 union all select '404','384'
 union all select '405','385'
 union all select '406','386'
 union all select '407','387'
 union all select '408','379'
 union all select '409','380'
 union all select '410','381'
 union all select '411','382'
 union all select '412','392'
 union all select '413','393'
 union all select '414','394'
 union all select '415','395'
 union all select '416','396'
 union all select '417','388'
 union all select '418','389'
 union all select '419','390'
 union all select '420','391'
 union all select '421','401'
 union all select '422','402'
 union all select '423','403'
 union all select '424','404'
 union all select '425','405'
 union all select '426','397'
 union all select '427','398'
 union all select '428','399'
 union all select '429','400'
 union all select '430','410'
 union all select '431','411'
 union all select '432','412'
 union all select '433','413'
 union all select '434','414'
 union all select '435','406'
 union all select '436','407'
 union all select '437','408'
 union all select '438','409'
 union all select '439','419'
 union all select '440','420'
 union all select '441','421'
 union all select '442','422'
 union all select '443','423'
 union all select '444','415'
 union all select '445','416'
 union all select '446','417'
 union all select '447','418'
 union all select '457','436'
 union all select '458','437'
 union all select '459','438'
 union all select '460','439'
 union all select '461','440'
 union all select '462','441'
 union all select '463','433'
 union all select '464','434'
 union all select '465','435'
 union all select '466','435a'
 union all select '467','445'
 union all select '468','446'
 union all select '469','447'
 union all select '470','448'
 union all select '471','449'
 union all select '472','450'
 union all select '473','442'
 union all select '474','443'
 union all select '475','444'
 union all select '476','444a'
 union all select '477','454'
 union all select '478','455'
 union all select '479','456'
 union all select '480','457'
 union all select '481','458'
 union all select '482','459'
 union all select '483','451'
 union all select '484','452'
 union all select '485','453'
 union all select '486','453a'
 union all select '487','463'
 union all select '488','464'
 union all select '489','465'
 union all select '490','466'
 union all select '491','467'
 union all select '492','468'
 union all select '493','460'
 union all select '494','461'
 union all select '495','462'
 union all select '496','462a'
 union all select '497','472'
 union all select '498','473'
 union all select '499','474'
 union all select '500','475'
 union all select '501','476'
 union all select '502','477'
 union all select '503','469'
 union all select '504','470'
 union all select '505','471'
 union all select '506','471a'
 union all select '507','481'
 union all select '508','482'
 union all select '509','483'
 union all select '510','484'
 union all select '511','485'
 union all select '512','486'
 union all select '513','478'
 union all select '514','479'
 union all select '515','480'
 union all select '516','480a'
 union all select '517','490'
 union all select '518','491'
 union all select '519','492'
 union all select '520','493'
 union all select '521','494'
 union all select '522','495'
 union all select '523','487'
 union all select '524','488'
 union all select '525','489'
 union all select '526','489a'
 union all select '527','499'
 union all select '528','500'
 union all select '529','501'
 union all select '530','502'
 union all select '531','503'
 union all select '532','504'
 union all select '533','496'
 union all select '534','497'
 union all select '535','498'
 union all select '536','498a'
 union all select '537','508'
 union all select '538','509'
 union all select '539','510'
 union all select '540','511'
 union all select '541','512'
 union all select '542','513'
 union all select '543','505'
 union all select '544','506'
 union all select '545','507'
 union all select '546','507a'
 union all select '547','517'
 union all select '548','518'
 union all select '549','519'
 union all select '550','520'
 union all select '551','521'
 union all select '552','522'
 union all select '553','514'
 union all select '554','515'
 union all select '555','516'
 union all select '556','516a'
 union all select '557','526'
 union all select '558','527'
 union all select '559','528'
 union all select '560','529'
 union all select '561','530'
 union all select '562','531'
 union all select '563','523'
 union all select '564','524'
 union all select '565','525'
 union all select '566','525a'
 union all select '567','535'
 union all select '568','536'
 union all select '569','537'
 union all select '570','538'
 union all select '571','539'
 union all select '572','540'
 union all select '573','532'
 union all select '574','533'
 union all select '575','534'
 union all select '576','534a'
 union all select '577','544'
 union all select '578','545'
 union all select '579','546'
 union all select '580','547'
 union all select '581','548'
 union all select '582','549'
 union all select '583','541'
 union all select '584','542'
 union all select '585','543'
 union all select '586','543a'
 union all select '587','553'
 union all select '588','554'
 union all select '589','555'
 union all select '590','556'
 union all select '591','557'
 union all select '592','558'
 union all select '593','550'
 union all select '594','551'
 union all select '595','552'
 union all select '596','552a'
 union all select '597','562'
 union all select '598','563'
 union all select '599','564'
 union all select '600','565'
 union all select '601','566'
 union all select '602','567'
 union all select '603','559'
 union all select '604','560'
 union all select '605','561'
 union all select '606','561a'
 union all select '607','571'
 union all select '608','572'
 union all select '609','573'
 union all select '610','574'
 union all select '611','575'
 union all select '612','576'
 union all select '613','568'
 union all select '614','569'
 union all select '615','570'
 union all select '616','570a'
 union all select '617','580'
 union all select '618','581'
 union all select '619','582'
 union all select '620','583'
 union all select '621','584'
 union all select '622','585'
 union all select '623','577'
 union all select '624','578'
 union all select '625','579'
 union all select '626','579a'
 union all select '627','589'
 union all select '628','590'
 union all select '629','591'
 union all select '630','592'
 union all select '631','593'
 union all select '632','594'
 union all select '633','586'
 union all select '634','587'
 union all select '635','588'
 union all select '636','588a'
 union all select '637','598'
 union all select '638','599'
 union all select '639','600'
 union all select '640','601'
 union all select '641','602'
 union all select '642','603'
 union all select '643','595'
 union all select '644','596'
 union all select '645','597'
 union all select '646','597a'
 union all select '647','607'
 union all select '648','608'
 union all select '649','609'
 union all select '650','610'
 union all select '651','611'
 union all select '652','612'
 union all select '653','604'
 union all select '654','605'
 union all select '655','606'
 union all select '656','606a'
 union all select '657','616'
 union all select '658','617'
 union all select '659','618'
 union all select '660','619'
 union all select '661','620'
 union all select '662','621'
 union all select '663','613'
 union all select '664','614'
 union all select '665','615'
 union all select '666','615a'
 union all select '667','625'
 union all select '668','626'
 union all select '669','627'
 union all select '670','628'
 union all select '671','629'
 union all select '672','630'
 union all select '673','622'
 union all select '674','623'
 union all select '675','624'
 union all select '676','624a'
 union all select '677','634'
 union all select '678','635'
 union all select '679','636'
 union all select '680','637'
 union all select '681','638'
 union all select '682','639'
 union all select '683','631'
 union all select '684','632'
 union all select '685','633'
 union all select '686','633a'
 union all select '687','643'
 union all select '688','644'
 union all select '689','645'
 union all select '690','646'
 union all select '691','647'
 union all select '692','648'
 union all select '693','640'
 union all select '694','641'
 union all select '695','642'
 union all select '696','642a'


update @tCorrect C
set Hsroy = replace(replace(Hsroy, 'a',''), 'а','')
,	HsroyFract = 1
where Hsroy like '%a%' or Hsroy like '%а%'

update @tCorrect C
set HReal = replace(replace(HReal, 'a',''), 'а','')
,	HRealApart = 1
where HReal like '%a%' or HReal like '%а%'

select * from @tCorrect C

update F
set F.Flat = C.HReal
,	F.Apartment = HRealApart
from @tCorrect C
inner join tUser F on cast(F.flatStr as varchar(5)) = C.Hsroy and C.HsroyFract = F.Fraction
where F.HouseId = 3

select * from @tCorrect C
inner join tUser F on cast(F.flatStr as varchar(5)) = C.Hsroy and C.HsroyFract = F.Fraction


end

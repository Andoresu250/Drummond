
worker = Worker.new
worker.first_name = "admin"
worker.last_name = "admin"
worker.cc = "0"
worker.code = "0"
worker.save!

user = User.new
user.email = "admin@admin.com"
user.password = "123456"
user.password_confirmation = '123456'
user.permission_level = 3
user.worker = worker
user.save!

	#GroupId

	GroupId.create(name: 'Grupo 1')
	GroupId.create(name: 'Grupo 2')
	GroupId.create(name: 'Grupo 3')

	g1 = Group.new(group_id_id: 1)
	g2 = Group.new(group_id_id: 2)
	g3 = Group.new(group_id_id: 3)
#=begin
	#subestaciones

	Equipment.create(reference: '25SUB8-16')
	Equipment.create(reference: '25SUB8-13')
	Equipment.create(reference: '25SUB8-12')
	Equipment.create(reference: '25SUB8-20')
	Equipment.create(reference: '25SUB8-25')
	Equipment.create(reference: '25SUB8-15')
	Equipment.create(reference: '25SUB8-24')
	Equipment.create(reference: '25SUB8-05')
	Equipment.create(reference: '25SUB8-04')
	Equipment.create(reference: '25SUB8-10')
	Equipment.create(reference: '25SUB8-14')
	Equipment.create(reference: '25SUB8-02')
	Equipment.create(reference: '25SUB8-08')
	Equipment.create(reference: '25SUB8-27')

	Equipment.create(reference: '25SUB5-23')
	Equipment.create(reference: '25SUB5-39')
	Equipment.create(reference: '25SUB5-19')
	Equipment.create(reference: '25SUB5-20')
	Equipment.create(reference: '25SUB5-22')
	Equipment.create(reference: '25SUB5-38')
	Equipment.create(reference: '25SUB5-41')
	Equipment.create(reference: '25SUB5-09')
	Equipment.create(reference: '25SUB5-36')

	Equipment.create(reference: '8SUB0.6-09')
	Equipment.create(reference: '8SUB0.6-13')
	Equipment.create(reference: '8SUB0.6-06')
	Equipment.create(reference: '8SUB0.6-07')
	Equipment.create(reference: '8SUB0.6-01')
	Equipment.create(reference: '8SUB0.6-04')
	Equipment.create(reference: '8SUB0.6-03')
	Equipment.create(reference: '8SUB0.6-05')
	Equipment.create(reference: '8SUB0.6-02')

	Equipment.create(reference: '5SUB0.6-20')
	Equipment.create(reference: '5SUB0.6-18')
	Equipment.create(reference: '5SUB0.6-02')

	#VCB

	Equipment.create(reference: '25VCB-50')
	Equipment.create(reference: '25VCB-56')
	Equipment.create(reference: '25VCB-20')
	Equipment.create(reference: '25VCB-13')
	Equipment.create(reference: '25VCB-48')
	Equipment.create(reference: '25VCB-36')
	Equipment.create(reference: '25VCB-17')
	Equipment.create(reference: '25VCB-07')
	Equipment.create(reference: '25VCB-18')
	Equipment.create(reference: '25VCB-28')
	Equipment.create(reference: '25VCB-55')
	Equipment.create(reference: '25VCB-21')
	Equipment.create(reference: '25VCB-09')
	Equipment.create(reference: '25VCB-51')
	Equipment.create(reference: '25VCB-49')
	Equipment.create(reference: '25VCB-22')
	Equipment.create(reference: '25VCB-53')
	Equipment.create(reference: '25VCB-25')
	Equipment.create(reference: '25VCB-29')

	Equipment.create(reference: '5VCB-06')
	Equipment.create(reference: '5VCB-07')

	#MCC

	Equipment.create(reference: '5MCC-03')
	Equipment.create(reference: '5MCC-02')
	Equipment.create(reference: '5MCC-21')
	Equipment.create(reference: '5MCC-04')

	Equipment.create(reference: '8MCC-04')
	Equipment.create(reference: '8MCC-05')

	Equipment.create(reference: 'SH-8')
	Equipment.create(reference: 'SH-31')
	Equipment.create(reference: 'SH-33')
	Equipment.create(reference: 'SH-34')
	Equipment.create(reference: 'SH-35')
	Equipment.create(reference: 'SH-37')
	Equipment.create(reference: 'SH-45')
	Equipment.create(reference: 'SH-46')
	Equipment.create(reference: 'ware house')
	Equipment.create(reference: 'HWM')
	Equipment.create(reference: 'Dozer shop')
	Equipment.create(reference: 'WS DEMAG')
	Equipment.create(reference: 'WS LOADOUT')
	Equipment.create(reference: 'WS FIELD SHOP')
	Equipment.create(reference: 'WS CAPORO')
	Equipment.create(reference: 'WS DUMP LDB')
	Equipment.create(reference: 'Draga toby')
	Equipment.create(reference: 'Shop byd')
	Equipment.create(reference: 'Shop 793')
	Equipment.create(reference: 'Shop 777')
	Equipment.create(reference: 'Loader shio')
	Equipment.create(reference: 'Airport')
	Equipment.create(reference: 'werldind shop')
	Equipment.create(reference: 'Pump shop')
	Equipment.create(reference: 'Military base')
	Equipment.create(reference: 'Ligh equip Shop')
	Equipment.create(reference: 'Barracas')
	Equipment.create(reference: 'Food center')
	Equipment.create(reference: 'CAT PLANT')
	Equipment.create(reference: 'Geology')
	Equipment.create(reference: 'Life support')
	Equipment.create(reference: 'Pump 95HP')
	Equipment.create(reference: 'Pump HL8')
	Equipment.create(reference: 'Pump 140HP')
	Equipment.create(reference: 'Pump hazelton')
	Equipment.create(reference: 'Lighting')
	Equipment.create(reference: 'Main Gate')
	Equipment.create(reference: '8JB')
	Equipment.create(reference: '25JB')
	Equipment.create(reference: 'Cable Tower')
	Equipment.create(reference: 'Panel Board')

	#Vehicules

	Vehicle.create(reference: '1016')
	Vehicle.create(reference: '1606')
	Vehicle.create(reference: '1125')
	Vehicle.create(reference: '1265')
	Vehicle.create(reference: '1440')
	Vehicle.create(reference: '1297')
	Vehicle.create(reference: '1116')
	Vehicle.create(reference: 'Boats')
	Vehicle.create(reference: '1809')
	Vehicle.create(reference: '7186')
	Vehicle.create(reference: '7187')
	Vehicle.create(reference: '7368')
	Vehicle.create(reference: '1890')

	#Workers Group 1

	w = Worker.new(first_name:'ALCIDES', last_name:'CARRILLO', cc:77181454, code:'CAR454')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'RAUL', last_name:'PIZARRO', cc:19586136, code:'PI6136')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'ARISTIDES', last_name:'SERNA', cc:12684292, code:'SE4292')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'CARLOS', last_name:'CUELLO', cc:15174954, code:'CU4954')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'DANIEL', last_name:'CABRERA', cc:3741815, code:'CA1815')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'MOISES', last_name:'ZURITA', cc:8747021, code:'ZU7021')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'LUIS', last_name:'FONSECA', cc:77192697, code:'FO2697')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'HUMBERTO', last_name:'MORENO', cc:77174213, code:'MO4213')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'RAFAEL', last_name:'CASTRO', cc:8719547, code:'CA9547')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'JAIRO', last_name:'CASTAÑEDA', cc:9523998, code:'CA3998')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'JULIO', last_name:'ESCOBAR', cc:73102926, code:'ES2926')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'HERALDO', last_name:'SALAS', cc:73559216, code:'JOL')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'OTTO', last_name:'CALVO', cc:77096422, code:'JOL')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'HERIBERTO', last_name:'GARCIA', cc:77173120, code:'JOL')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'MANUEL', last_name:'JIMENEZ', cc:12643955, code:'JOL')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'ANDRES', last_name:'MORA', cc:1067723413, code:'JOL')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'JEAN', last_name:'MARRUGO', cc:77167542, code:'JOL')
	w.save!
	g1.workers.push(w)
	w = Worker.new(first_name:'JORGE', last_name:'DIAZ MARINEZ', cc:1082935255, code:'JOL')
	w.save!
	g1.workers.push(w)

	g1.save!
	#Workers Group 2


	w = Worker.new(first_name:'MAIRO', last_name:'AMARIS', cc:9264750, code:'AM4750')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'ELMER', last_name:'ARREGOCES', cc:17955480, code:'AR5480')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'FRANCISCO', last_name:'GARCIA', cc:87023997, code:'GA2397')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'VICTOR', last_name:'JIMENEZ', cc:15172172, code:'JI2172')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'AMIN', last_name:'MIRANDA', cc:8707663, code:'MI7663')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'RICARDO', last_name:'QUINTERO', cc:77191505, code:'QUI505')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'JAIME', last_name:'SANIN', cc:8724903, code:'SA4903')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'PEDRO', last_name:'SEQUEA', cc:8686649, code:'SE6649')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'GUSTAVO', last_name:'GUZMAN', cc:77151052, code:'GU1052')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'TEOFILO', last_name:'ROBLES', cc:91420329, code:'RO0329')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'SAMUEL', last_name:'PALLARES', cc:77094314, code:'PA4314')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'YESID', last_name:'PEÑALOZA', cc:1065577897, code:'JOL')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'NILSON', last_name:'ROYERO', cc:18901472, code:'JOL')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'LUIS', last_name:'TERAN', cc:1065607978, code:'JOL')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'WILLINTON', last_name:'ROBLES', cc:85441326, code:'JOL')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'JAVIER', last_name:'VILLERO', cc:18957909, code:'JOL')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'JORGE', last_name:'ROBLES', cc:7629847, code:'JOL')
	w.save!
	g2.workers.push(w)
	w = Worker.new(first_name:'EDWIN', last_name:'AGUIRRE', cc:77172564, code:'JOL')
	w.save!
	g2.workers.push(w)

	g2.save!

	#Workers Group 3

	w = Worker.new(first_name:'JONETH', last_name:'BAÑOS', cc:72194987, code:'BA4987')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'ALFREDO', last_name:'CARO', cc:19709004, code:'CA9004')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'JHON', last_name:'CERPA', cc:72130399, code:'CE0399')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'GUILLERMO', last_name:'DIAS', cc:77185208, code:'DIA208')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'JOSE', last_name:'MARTINEZ', cc:77177076, code:'MA7076')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'HARVEY', last_name:'MILLAN', cc:8723837, code:'MI3837')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'ROBERTO', last_name:'CABALLERO', cc:72338824, code:'CA8824')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'ANTONIO', last_name:'VILLA', cc:73152686, code:'VI2686')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'JHON', last_name:'TRILLOS', cc:15174088, code:'TR4088')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'JAIRO', last_name:'QUINTERO', cc:77028902, code:'QU8902')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'JUAN', last_name:'CHICA', cc:1067712564, code:'JOL')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'LUIS', last_name:'ZAMBRANO', cc:77177691, code:'JOL')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'ELMER', last_name:'OCHOA', cc:77168141, code:'JOL')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'CESAR', last_name:'ACUÑA', cc:77163187, code:'JOL')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'JULIO', last_name:'TELLEZ', cc:77184943, code:'JOL')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'CESAR', last_name:'CUETO', cc:7574927, code:'JOL')
	w.save!
	g3.workers.push(w)
	w = Worker.new(first_name:'ADALBERTO', last_name:'MAIGUEL', cc:72146582, code:'JOL')
	w.save!
	g3.workers.push(w)

	g3.save!





#=end

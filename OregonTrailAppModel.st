<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 6:16:04 pm</time-stamp>


<class>
<name>OregonTrailAppModel</name>
<environment>OregonTrail</environment>
<super>UI.ApplicationModel</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>paceRadioButtons rationRadioButtons partyList itemList wagon distanceField locationField turnsField dateField </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>UIApplications-New</category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.OregonTrailAppModel class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<methods>
<class-id>OregonTrail.OregonTrailAppModel class</class-id> <category>interface specs</category>

<body package="OregonTrail" selector="eventSpec">eventSpec
	"Tools.UIPainter new openOnClass: self andSelector: #eventSpec"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: 'Event!' 
			#bounds: #(#{Graphics.Rectangle} 965 646 1331 766 ) ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 68 23 ) 
					#name: #Label1 
					#label: 'A wandering UGA grad steals 8 sets of clothes.' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 8 52 ) 
					#name: #Label2 
					#label: '(Mockup doesn''t do anything yet, will be implemented with a dialog warn)' ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 134 80 215 103 ) 
					#name: #ActionButton1 
					#label: 'OK' 
					#defaultable: true ) ) ) )</body>

<body package="OregonTrail" selector="mapSpec">mapSpec
	"Tools.UIPainter new openOnClass: self andSelector: #mapSpec"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: 'Map' 
			#bounds: #(#{Graphics.Rectangle} 972 642 1556 1131 ) ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 139 194 ) 
					#name: #Label1 
					#label: '(Mockup, map will go here and replace the box with an image)' ) 
				#(#{UI.RegionSpec} 
					#layout: #(#{Graphics.Rectangle} 21 31 565 435 ) 
					#name: #Region1 
					#lineWidth: 1 ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 252.5 450 333.5 473 ) 
					#name: #ActionButton1 
					#label: 'Close' 
					#defaultable: true ) ) ) )</body>

<body package="OregonTrail" selector="newGameSpec">newGameSpec
	"Tools.UIPainter new openOnClass: self andSelector: #newGameSpec"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: 'New Game' 
			#bounds: #(#{Graphics.Rectangle} 1428 453 1749 987 ) ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 174 31 274 54 ) 
					#name: #InputField1 ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 174 71 274 94 ) 
					#name: #InputField2 ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 174 111 274 134 ) 
					#name: #InputField3 ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 174 151 274 174 ) 
					#name: #InputField4 ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 174 191 274 214 ) 
					#name: #InputField5 ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 73 243 ) 
					#name: #RadioButton1 
					#label: 'March' ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 73 274 ) 
					#name: #RadioButton2 
					#label: 'April' ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 73 305 ) 
					#name: #RadioButton3 
					#label: 'May' ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 165 243 ) 
					#name: #RadioButton4 
					#label: 'June' ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 165 275 ) 
					#name: #RadioButton5 
					#label: 'July' ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 165 307 ) 
					#name: #RadioButton6 
					#label: 'August' ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 18 368 ) 
					#name: #RadioButton7 
					#label: 'Banker - $1600' ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 18 405 ) 
					#name: #RadioButton8 
					#label: 'Carpenter - $800, can repair' ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 18 442 ) 
					#name: #RadioButton9 
					#label: 'Farmer - $400, can forage (no ammo neded) and heal oxen' ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 99.5 483 180.5 506 ) 
					#name: #ActionButton1 
					#label: 'Start Game' 
					#defaultable: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 49 33 ) 
					#name: #Label1 
					#label: 'Name your leader:' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 24 73 ) 
					#name: #Label2 
					#label: 'Name your party members:' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 73 216 ) 
					#name: #Label3 
					#label: 'When do you want to start?' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 90 332 ) 
					#name: #Label4 
					#label: 'Choose a profession' ) ) ) )</body>

<body package="OregonTrail" selector="riverSpec">riverSpec
	"Tools.UIPainter new openOnClass: self andSelector: #riverSpec"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: 'River crossing' 
			#bounds: #(#{Graphics.Rectangle} 965 624 1266 824 ) ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.LabelSpec} 
					#properties: #(#{UI.PropertyListDictionary} #labelFromApplication false ) 
					#layout: #(#{Core.Point} 89 25 ) 
					#name: #Label1 
					#label: 'Kansas river is 10 feet deep.' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 24 58 ) 
					#name: #Label2 
					#label: 'You can ford, caulk the wagon, or take the ferry for $50.' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 114 93 ) 
					#name: #Label3 
					#label: 'What will you do?' ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 17 149 98 172 ) 
					#name: #ActionButton1 
					#label: 'Ford' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 114 149 195 172 ) 
					#name: #ActionButton2 
					#label: 'Caulk' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 211 149 292 172 ) 
					#name: #ActionButton3 
					#label: 'Ferry' 
					#defaultable: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 23 116 ) 
					#name: #Label4 
					#label: '(This window is a mockup and doesn''t do anything yet)' ) ) ) )</body>

<body package="OregonTrail" selector="storeSpec">storeSpec
	"Tools.UIPainter new openOnClass: self andSelector: #storeSpec"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: 'Store' 
			#bounds: #(#{Graphics.Rectangle} 965 624 1700 1073 ) ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 192 5 ) 
					#name: #Label1 
					#label: 'Welcome to Independence General Store' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 208 28 ) 
					#name: #Label2 
					#label: '(Mockup doesn''t do anything yet)' ) 
				#(#{UI.SpinButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 237.5 81 337.5 104 ) 
					#name: #SpinButton1 
					#type: #number 
					#formatString: '0' 
					#low: 0 ) 
				#(#{UI.SpinButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 237.5 124 337.5 147 ) 
					#name: #SpinButton2 
					#type: #number 
					#formatString: '0' 
					#low: 0 ) 
				#(#{UI.SpinButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 237.5 167 337.5 190 ) 
					#name: #SpinButton3 
					#type: #number 
					#formatString: '0' 
					#low: 0 ) 
				#(#{UI.SpinButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 237.5 210 337.5 233 ) 
					#name: #SpinButton4 
					#type: #number 
					#formatString: '0' 
					#low: 0 ) 
				#(#{UI.SpinButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 237.5 253 337.5 276 ) 
					#name: #SpinButton5 
					#type: #number 
					#formatString: '0' 
					#low: 0 ) 
				#(#{UI.SpinButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 237.5 296 337.5 319 ) 
					#name: #SpinButton6 
					#type: #number 
					#formatString: '0' 
					#low: 0 ) 
				#(#{UI.SpinButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 237.5 339 337.5 362 ) 
					#name: #SpinButton7 
					#type: #number 
					#formatString: '0' 
					#low: 0 ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 46 57 ) 
					#name: #Label3 
					#label: 'Item' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 109 57 ) 
					#name: #Label4 
					#label: 'Price' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 175 57 ) 
					#name: #Label5 
					#label: 'Weight' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 43 83 ) 
					#name: #Label6 
					#label: 'Oxen' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 104 83 ) 
					#name: #Label7 
					#label: '$20.00' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 188 83 ) 
					#name: #Label8 
					#label: '0



' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 38 126 ) 
					#name: #Label9 
					#label: 'Clothes' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 104 126 ) 
					#name: #Label10 
					#label: '$10.00' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 188 126 ) 
					#name: #Label11 
					#label: '2
' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 26 169 ) 
					#name: #Label12 
					#label: 'Ammo boxes' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 107 169 ) 
					#name: #Label13 
					#label: '$2.00' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 188 169 ) 
					#name: #Label14 
					#label: '3' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 40 212 ) 
					#name: #Label15 
					#label: 'Wheels' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 104 212 ) 
					#name: #Label16 
					#label: '$10.00' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 185 212 ) 
					#name: #Label17 
					#label: '75' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 43 255 ) 
					#name: #Label18 
					#label: 'Axles' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 104 255 ) 
					#name: #Label19 
					#label: '$10.00' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 182 255 ) 
					#name: #Label20 
					#label: '125' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 37 298 ) 
					#name: #Label21 
					#label: 'Tongues' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 104 298 ) 
					#name: #Label22 
					#label: '$10.00' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 182 298 ) 
					#name: #Label23 
					#label: '100' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 44 341 ) 
					#name: #Label24 
					#label: 'Food' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 107 341 ) 
					#name: #Label25 
					#label: '$0.20' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 188 341 ) 
					#name: #Label26 
					#label: '1' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 250 57 ) 
					#name: #Label27 
					#label: 'Quantity to buy' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 471 57 ) 
					#name: #Label28 
					#label: 'Total weight' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 571 57 ) 
					#name: #Label29 
					#label: 'Subtotal' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 364 57 ) 
					#name: #Label31 
					#label: 'Quantity after' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 45 382 ) 
					#name: #Label32 
					#label: 'Total' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 472 380 ) 
					#name: #Label33 
					#label: 'XXXX/3500' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 572 380 ) 
					#name: #Label34 
					#label: '$XX.XX' ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 639 377 720 400 ) 
					#name: #ActionButton1 
					#label: 'Buy' 
					#defaultable: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 221 381 ) 
					#name: #Label35 
					#label: 'Weight/quantity errors will appear here' ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 640 407 721 430 ) 
					#name: #ActionButton2 
					#label: 'Exit' 
					#defaultable: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 393 83 ) 
					#name: #Label36 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 393 126 ) 
					#name: #Label37 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 393 169 ) 
					#name: #Label38 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 393 212 ) 
					#name: #Label39 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 393 255 ) 
					#name: #Label40 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 393 298 ) 
					#name: #Label41 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 393 341 ) 
					#name: #Label42 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 497 83 ) 
					#name: #Label43 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 497 126 ) 
					#name: #Label44 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 497 169 ) 
					#name: #Label45 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 497 212 ) 
					#name: #Label46 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 497 255 ) 
					#name: #Label47 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 497 298 ) 
					#name: #Label48 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 497 341 ) 
					#name: #Label49 
					#label: '0' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 577 83 ) 
					#name: #Label50 
					#label: '$0.00' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 577 126 ) 
					#name: #Label51 
					#label: '$0.00' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 577 169 ) 
					#name: #Label52 
					#label: '$0.00' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 577 212 ) 
					#name: #Label53 
					#label: '$0.00' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 577 255 ) 
					#name: #Label54 
					#label: '$0.00' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 577 298 ) 
					#name: #Label55 
					#label: '$0.00' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 577 341 ) 
					#name: #Label56 
					#label: '$0.00' ) ) ) )</body>

<body package="OregonTrail" selector="tradeSpec">tradeSpec
	"Tools.UIPainter new openOnClass: self andSelector: #tradeSpec"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: 'Trade confirm' 
			#bounds: #(#{Graphics.Rectangle} 965 624 1409 734 ) ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 114 66 195 89 ) 
					#name: #ActionButton1 
					#label: 'OK' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 236 66 317 89 ) 
					#name: #ActionButton2 
					#label: 'Cancel' 
					#defaultable: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 27 11 ) 
					#name: #Label1 
					#label: 'Pioneer Dan wants to trade 2 wagon wheels for 5 of your oxen. Do you accept?' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 37 35 ) 
					#name: #Label2 
					#label: '(This is a mockup. When implemented, this will be done through Dialog confirm.)' ) ) ) )</body>

<body package="OregonTrail" selector="windowSpec">windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: 'Oregon Trail' 
			#bounds: #(#{Graphics.Rectangle} 495 321 1024 740 ) ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 13 16 ) 
					#name: #partyLabel 
					#label: 'Party' ) 
				#(#{UI.SequenceViewSpec} 
					#layout: #(#{Graphics.Rectangle} 14 43 262 188 ) 
					#name: #partyList 
					#model: #partyList 
					#useModifierKeys: true 
					#selectionType: #highlight ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 16 228 ) 
					#name: #inventoryLabel 
					#label: 'Inventory' ) 
				#(#{UI.SequenceViewSpec} 
					#layout: #(#{Graphics.Rectangle} 15 252 261 396 ) 
					#name: #itemList 
					#model: #itemList 
					#useModifierKeys: true 
					#selectionType: #highlight ) 
				#(#{UI.DividerSpec} 
					#layout: #(#{Graphics.Rectangle} 289 18 293 404 ) 
					#name: #Divider1 
					#orientation: #vertical ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 311 15 ) 
					#name: #dateLabel 
					#label: 'Date' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 311 41 ) 
					#name: #distanceLabel 
					#label: 'Distance' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 311 93 ) 
					#name: #locationLabel 
					#label: 'Location' ) 
				#(#{UI.DividerSpec} 
					#layout: #(#{Graphics.Rectangle} 300 125 512 129 ) 
					#name: #Divider2 ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 308 143 ) 
					#name: #paceLabel 
					#label: 'Pace' ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 312 170 ) 
					#name: #paceRadioButton1 
					#model: #paceRadioButtons 
					#label: 'Stopped' 
					#select: #stopped ) 
				#(#{UI.GroupBoxSpec} 
					#layout: #(#{Graphics.Rectangle} 307 164 388 276 ) 
					#name: #paceGroupBox ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 312 196 ) 
					#name: #paceRadioButton2 
					#model: #paceRadioButtons 
					#label: 'Leisurely' 
					#select: #leisurely ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 312 222 ) 
					#name: #paceRadioButton3 
					#model: #paceRadioButtons 
					#label: 'Steady' 
					#select: #steady ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 312 248 ) 
					#name: #paceRadioButton4 
					#model: #paceRadioButtons 
					#label: 'Grueling' 
					#select: #grueling ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 433 143 ) 
					#name: #rationLabel 
					#label: 'Ration' ) 
				#(#{UI.GroupBoxSpec} 
					#layout: #(#{Graphics.Rectangle} 480 212 567 325 ) 
					#name: #GroupBox1 ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 436 196 ) 
					#name: #rationRadioButton1 
					#model: #rationRadioButtons 
					#label: 'Bare Bones' 
					#select: #barebones ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 436 222 ) 
					#name: #rationRadioButton2 
					#model: #rationRadioButtons 
					#label: 'Meager' 
					#select: #meager ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 436 248 ) 
					#name: #rationRadioButton3 
					#model: #rationRadioButtons 
					#label: 'Normal' 
					#select: #normal ) 
				#(#{UI.RadioButtonSpec} 
					#properties: #(#{UI.PropertyListDictionary} #labelFromApplication false ) 
					#layout: #(#{Core.Point} 436 274 ) 
					#name: #rationRadioButton4 
					#model: #rationRadioButtons 
					#label: 'Well Fed' 
					#select: #wellfed ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 307 293 388 316 ) 
					#name: #moveButton 
					#model: #move 
					#label: 'Move' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 307 334 388 357 ) 
					#name: #tradeButton 
					#model: #trade 
					#label: 'Trade' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 307 374 388 397 ) 
					#name: #mapButton 
					#model: #map 
					#label: 'Map' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 433 294 514 317 ) 
					#name: #restButton 
					#model: #rest 
					#label: 'Rest
' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 433 374 514 397 ) 
					#name: #huntButton 
					#model: #hunt 
					#label: 'Hunt' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 433 414 514 437 ) 
					#name: #exitButton 
					#model: #exit 
					#label: 'Exit' 
					#defaultable: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 22 406 ) 
					#name: #Label3 
					#label: 'Total Weight: XXXX/3500' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Core.Point} 311 67 ) 
					#name: #Label4 
					#label: 'Turns taken' ) 
				#(#{UI.RadioButtonSpec} 
					#layout: #(#{Core.Point} 436 170 ) 
					#name: #RadioButton1 
					#model: #rationRadioButtons 
					#label: 'None' 
					#select: #none ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 307 414 388 437 ) 
					#name: #ActionButton1 
					#model: #save 
					#label: 'Save' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.Rectangle} 433 334 514 357 ) 
					#name: #ActionButton2 
					#model: #store 
					#label: 'Store' 
					#defaultable: true ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 414 14 514 37 ) 
					#name: #InputField1 
					#flags: 0 
					#isOpaque: true 
					#model: #dateField 
					#type: #date ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 414 40 514 63 ) 
					#name: #InputField2 
					#flags: 0 
					#isOpaque: true 
					#model: #distanceField 
					#type: #number ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 414 66 514 89 ) 
					#name: #InputField3 
					#flags: 0 
					#isOpaque: true 
					#model: #turnsField 
					#type: #number ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.Rectangle} 414 92 514 115 ) 
					#name: #InputField4 
					#flags: 0 
					#isOpaque: true 
					#model: #locationField ) ) ) )</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.OregonTrailAppModel</class-id>
<body>Main window for Oregon Trail

Instance Variables:
	paceRadioButtons &lt;ValueHolder&gt; There are four choices for pace; Stopped, Slow, Average, Grueling.
	rationRadioButtons &lt;ValueHolder&gt; There are four choices for ration; Starving, Meager, Average, Wellfed.
	itemList &lt;SelectionInList&gt; collection of item
	partyList &lt;SelectionInList&gt; collection of Person		
</body>
</comment>

<methods>
<class-id>OregonTrail.OregonTrailAppModel</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.OregonTrailAppModel</class-id> <category>aspects</category>

<body package="OregonTrail" selector="dateField">dateField
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^dateField isNil
		ifTrue:
			[dateField := ((UI.AspectAdaptor subject: GameData instance sendsUpdates: true) forAspect: #currentDate)]
		ifFalse:
			[dateField]</body>

<body package="OregonTrail" selector="distanceField">distanceField
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^distanceField isNil
		ifTrue:
			[distanceField := ((UI.AspectAdaptor subject: GameData instance sendsUpdates: true) forAspect: #milesTraveled)]
		ifFalse:
			[distanceField]</body>

<body package="OregonTrail" selector="itemList">itemList
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^itemList isNil
		ifTrue:
			[itemList := SelectionInList new.
			itemList listHolder: ((UI.AspectAdaptor subject: wagon sendsUpdates: true) forAspect: #inventoryList).]
		ifFalse:
			[itemList]</body>

<body package="OregonTrail" selector="locationField">locationField
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^locationField isNil
		ifTrue:
			[locationField := ((UI.AspectAdaptor subject: GameData instance sendsUpdates: true) forAspect: #lastLocationName)]
		ifFalse:
			[locationField]</body>

<body package="OregonTrail" selector="paceRadioButtons">paceRadioButtons
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^paceRadioButtons isNil
		ifTrue:
			[paceRadioButtons := wagon pace asValue]
		ifFalse:
			[paceRadioButtons]</body>

<body package="OregonTrail" selector="partyList">partyList
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^partyList isNil
		ifTrue:
			[partyList := SelectionInList new.
			partyList listHolder: ((UI.AspectAdaptor subject: wagon sendsUpdates: true) forAspect: #people).]
		ifFalse:
			[partyList]</body>

<body package="OregonTrail" selector="rationRadioButtons">rationRadioButtons
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^rationRadioButtons isNil
		ifTrue:
			[rationRadioButtons := wagon ration asValue]
		ifFalse:
			[rationRadioButtons]</body>

<body package="OregonTrail" selector="turnsField">turnsField
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^turnsField isNil
		ifTrue:
			[turnsField := ((UI.AspectAdaptor subject: GameData instance sendsUpdates: true) forAspect: #turnsTaken)]
		ifFalse:
			[turnsField]</body>
</methods>

<methods>
<class-id>OregonTrail.OregonTrailAppModel</class-id> <category>accessing</category>

<body package="OregonTrail" selector="wagon">wagon
	^wagon</body>

<body package="OregonTrail" selector="wagon:">wagon: anObject
	wagon := anObject</body>
</methods>

<methods>
<class-id>OregonTrail.OregonTrailAppModel</class-id> <category>actions</category>

<body package="OregonTrail" selector="exit">exit
	"Exit the game"

	self closeRequest.</body>

<body package="OregonTrail" selector="hunt">hunt

	"This stub method was generated by UIDefiner"
	"hunt then rest so time passes"
	EventFactory huntingEvent: wagon.
	wagon rest.
	"Dialog warn: event" 
	^self</body>

<body package="OregonTrail" selector="map">map
	"view map"
	self openDialogInterface: #mapSpec.</body>

<body package="OregonTrail" selector="move">move
	"move wagon"
	wagon pace: paceRadioButtons value. "set this turn's pace"
	wagon ration: rationRadioButtons value. "set this turn's ration"
	wagon move. "move"
	GameData instance nextDay. "next day"
	"make event"</body>

<body package="OregonTrail" selector="rest">rest
	"like moving, but call wagon rest instead"</body>

<body package="OregonTrail" selector="save">save

	"This stub method was generated by UIDefiner"
	"saving starts from the wagon and spreads out from there"
	wagon save.
	^self</body>

<body package="OregonTrail" selector="store">store

	"This stub method was generated by UIDefiner"
	"opens a store if one is available in town"
	^self</body>

<body package="OregonTrail" selector="trade">trade
	"this method probably won't be used. Just in case"
	"allows trading random x for random y"
	self openDialogInterface: #tradeSpec.</body>
</methods>

</st-source>

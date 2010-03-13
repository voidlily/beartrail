<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 6:11:33 pm</time-stamp>


<class>
<name>Profession</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>name starting_money can_repair can_forage can_heal_oxen </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.Profession class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="OregonTrail" selector="populate:">populate: prof_id
	|prof result|
	prof := Profession new.
	result := DBManager selectQuery: 'select prof_name,starting_money,can_repair,can_forage,can_heal_oxen from professions where prof_id=',prof_id printString,';'.
	result isEmpty ifFalse:[
	prof name: ((result at: 1) at: 1).
	prof starting_money: ((result at: 1) at: 2).
	((result at: 1) at: 3) = 1 ifTrue:[prof can_repair: true]
							ifFalse:[prof can_repair: false].
	((result at: 1) at: 4) = 1 ifTrue:[prof can_forage: true]
							ifFalse:[prof can_forage: false].
	((result at: 1) at: 5) = 1 ifTrue:[prof can_heal_oxen: true]
							ifFalse:[prof can_heal_oxen: false].
	].
	^prof</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.Profession</class-id>
<body>Represents a profession in the game - this is written as a class to allow future professions to be made

Instance Variables:
	can_forage	&lt;Boolean&gt;	description of can_forage
	can_heal_oxen	&lt;Boolean&gt;	description of can_heal_oxen
	can_repair	&lt;Boolean&gt;	description of can_repair
	name	&lt;Object | WeakProxy&gt;	description of name
	starting_money	&lt;SmallInteger&gt;	description of starting_money

</body>
</comment>

<methods>
<class-id>OregonTrail.Profession</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."
	can_forage := false.
	can_heal_oxen := false.
	can_repair := false.
	name := nil.
	starting_money := 0.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.Profession</class-id> <category>accessing</category>

<body package="OregonTrail" selector="can_forage">can_forage
	^can_forage</body>

<body package="OregonTrail" selector="can_forage:">can_forage: anObject
	can_forage := anObject</body>

<body package="OregonTrail" selector="can_heal_oxen">can_heal_oxen
	^can_heal_oxen</body>

<body package="OregonTrail" selector="can_heal_oxen:">can_heal_oxen: anObject
	can_heal_oxen := anObject</body>

<body package="OregonTrail" selector="can_repair">can_repair
	^can_repair</body>

<body package="OregonTrail" selector="can_repair:">can_repair: anObject
	can_repair := anObject</body>

<body package="OregonTrail" selector="name">name
	^name</body>

<body package="OregonTrail" selector="name:">name: anObject
	name := anObject</body>

<body package="OregonTrail" selector="starting_money">starting_money
	^starting_money</body>

<body package="OregonTrail" selector="starting_money:">starting_money: anObject
	starting_money := anObject</body>
</methods>

</st-source>

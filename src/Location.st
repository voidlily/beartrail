<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 6:10:38 pm</time-stamp>


<class>
<name>Location</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>name distanceTraveled bridgerDistance hasStore hasRiver columbiaEvent </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.Location class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="at:route:">at: distance route: aSymbol
	"change route to grab current route from Gamedata, or use a separate method?"

	|location| location := Location new.
	aSymbol = #normal ifTrue:[].
	aSymbol = #bridger ifTrue:[].
	"use db queries to set data"
	^location</body>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="OregonTrail" selector="populate:">populate: loc_id

	| loc query result|
	loc := Location new.
	query :=  'SELECT loc_name, distance, bridger_distance, has_store, has_river, columbia_event from locations where loc_id = "', loc_id printString, '";'.
	result := DBManager selectQuery: query.
	result isEmpty ifFalse:
		[loc name: ((result at: 1) at: 1); distanceTraveled: ((result at: 1) at: 2); bridgerDistance: ((result at: 1) at: 3); hasStore: ((result at: 1) at: 4); hasRiver: ((result at: 1) at: 5); columbiaEvent: ((result at: 1) at: 6)].
	^loc</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.Location</class-id>
<body>Represents a location - needs DB queries to get information

Instance Variables:
	bridgerDistance	&lt;Integer&gt;	distance on Bridger route
	columbiaEvent	&lt;Boolean&gt;	If true, trigger Columbia River game when leaving the area
	distanceTraveled	&lt;Integer&gt;	distance on normal route
	hasRiver	&lt;Boolean&gt;	has a river?
	hasStore	&lt;Boolean&gt;	has a store?
	name	&lt;String&gt;	location's name
	river	&lt;River&gt;	location's River, if it has one
	store	&lt;Store&gt;	location's Store, if it has one


</body>
</comment>

<methods>
<class-id>OregonTrail.Location</class-id> <category>accessing</category>

<body package="OregonTrail" selector="bridgerDistance">bridgerDistance
	^bridgerDistance</body>

<body package="OregonTrail" selector="bridgerDistance:">bridgerDistance: anObject
	bridgerDistance := anObject</body>

<body package="OregonTrail" selector="columbiaEvent">columbiaEvent
	"if this is true, leaving this location will start the endgame rafting event"
	^columbiaEvent</body>

<body package="OregonTrail" selector="columbiaEvent:">columbiaEvent: anObject
	columbiaEvent := anObject</body>

<body package="OregonTrail" selector="distanceTraveled">distanceTraveled
	^distanceTraveled</body>

<body package="OregonTrail" selector="distanceTraveled:">distanceTraveled: anObject
	distanceTraveled := anObject</body>

<body package="OregonTrail" selector="hasRiver">hasRiver
	^hasRiver</body>

<body package="OregonTrail" selector="hasRiver:">hasRiver: anObject
	hasRiver := anObject</body>

<body package="OregonTrail" selector="hasStore">hasStore
	^hasStore</body>

<body package="OregonTrail" selector="hasStore:">hasStore: anObject
	hasStore := anObject</body>

<body package="OregonTrail" selector="name">name
	^name</body>

<body package="OregonTrail" selector="name:">name: anObject
	name := anObject</body>
</methods>

<methods>
<class-id>OregonTrail.Location</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Edit the following to properly initialize instance variables ***"
	name := nil.
	distanceTraveled := nil.
	bridgerDistance := nil.
	hasStore := nil.
	hasRiver := nil.
	columbiaEvent := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>

</st-source>

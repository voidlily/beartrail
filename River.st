<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 6:11:36 pm</time-stamp>


<class>
<name>River</name>
<environment>OregonTrail</environment>
<super>OregonTrail.Location</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>depth hasFerry minDepth maxDepth </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.River class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="populate:">populate: loc_id
    "Populates a location instance with all relevant data from the tables."

	|river query result|
	river := River new.
	query :=  'SELECT has_ferry, min_depth, max_depth from rivers where loc_id = "', loc_id printString, '";'.
	result := DBManager selectQuery: query.
	result isEmpty ifFalse:
		[river hasFerry: ((result at: 1) at: 1); minDepth: ((result at: 1) at: 2); maxDepth: ((result at: 1) at: 3)].
     river depth: river generateDepth.
	^river.</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.River</class-id>
<body>The River class embodies a physical river that one might find at locations in the real world.  They represent an impediment to the continued travel of the player's wagon, and a fording challenge to the pioneers or settlers in the player's party.

Instance Variables:
	depth	&lt;Integer&gt; The depth of this river in feet.
	hasFerry	&lt;Boolean&gt; Whether this river has a ferry where, for a toll, safe crossing can be made.
	maxDepth	&lt;Integer&gt; The maximum depth of this river.
	minDepth	&lt;Integer&gt; The minimum depth of this river.

</body>
</comment>

<methods>
<class-id>OregonTrail.River</class-id> <category>accessing</category>

<body package="OregonTrail" selector="depth">depth
	^depth</body>

<body package="OregonTrail" selector="depth:">depth: anObject
	depth := anObject</body>

<body package="OregonTrail" selector="hasFerry">hasFerry
	^hasFerry</body>

<body package="OregonTrail" selector="hasFerry:">hasFerry: anObject
	hasFerry := anObject</body>

<body package="OregonTrail" selector="maxDepth">maxDepth
	^maxDepth</body>

<body package="OregonTrail" selector="maxDepth:">maxDepth: anObject
	maxDepth := anObject</body>

<body package="OregonTrail" selector="minDepth">minDepth
	^minDepth</body>

<body package="OregonTrail" selector="minDepth:">minDepth: anObject
	minDepth := anObject</body>
</methods>

<methods>
<class-id>OregonTrail.River</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	depth := nil.
	hasFerry := nil.
	minDepth := nil.
	maxDepth := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.River</class-id> <category>changing</category>

<body package="OregonTrail" selector="generateDepth">generateDepth
    "Returns an integer that is the depth of this point of fording, between minDepth and maxDepth."
    |random|

    random := Random new.

    ^(random next * (self maxDepth - self minDepth) + self minDepth) rounded.</body>

<body package="OregonTrail" selector="validCrossingType:">validCrossingType: symbolCrossingType
    "Determines whether the given crossing type is valid.  Takes #ford, #caulk, or #ferry as crossing
     type; ford is valid up to 3 feet in depth while caulking is always valid.  Ferry may not be unless the river has a         ferry."

    symbolCrossingType = #ford  ifTrue: [ ^(self depth &lt;= 3) ].
    symbolCrossingType = #caulk ifTrue: [^true].
    symbolCrossingType = #ferry &amp; self hasFerry = 1 ifTrue: [^true]
                                                                              ifFalse: [^false].
    ^false.</body>

<body package="OregonTrail" selector="wagonFlip:">wagonFlip: symbolCrossingType
    "Determines whether the wagon flips while crossing a river, depending on crossing type.
     Returns true if a flip has occurred; false otherwise."
    |probability|

    probability := Random new.

    symbolCrossingType = #ford ifTrue:[
        "10% chance to flip per foot of water forded."
        ^(self depth * 10 &lt; (probability * 100 + 1) rounded).
    ]
    ifFalse: [ symbolCrossingType = #caulk ifTrue: [
        "Caulking allows one to cross deeper rivers, but at the cost of potential catastrophe - 15% per foot or 65%,
          whichever is lesser."
        ^(self depth * 15 &lt; ((probability * 100 + 1) rounded) min: 65).
    ]
    ifFalse: [ symbolCrossingType = #ferry ifTrue: [
        ^true.    
    ]]].</body>
</methods>

</st-source>

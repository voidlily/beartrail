<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 9:15:23 am</time-stamp>


<class>
<name>RiverTest</name>
<environment>OregonTrail</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>river </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.RiverTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.RiverTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.RiverTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testGenerateDepth">testGenerateDepth
    "Tests the generateDepth method."

    river := River populate: 3.
    self assert: (river depth &gt;= river minDepth) &amp; (river depth &lt;= river maxDepth).</body>

<body package="OregonTrail" selector="testPopulate">testPopulate
    "Tests the populate method."

    river := River populate: 2.

    self assert: river hasFerry = 1.
    self assert: river minDepth = 6.
    self assert: river maxDepth = 10.
    self assert: (river depth &gt;= river minDepth) &amp; (river depth &lt;= river maxDepth).</body>

<body package="OregonTrail" selector="testValidCrossingType">testValidCrossingType
    "Tests the validCrossingType method."

    river := River populate: 2.

    self deny: (river validCrossingType: #ford).
    self assert: (river validCrossingType: #caulk).
    self assert: (river validCrossingType: #ferry).

    river := River populate: 3.

    river depth &lt;= 3 ifTrue: [ self assert: (river validCrossingType: #ford) ]
                            ifFalse: [ self deny: (river validCrossingType: #ford) ].

    self assert: (river validCrossingType: #caulk).
    self deny: (river validCrossingType: #ferry).</body>
</methods>

</st-source>

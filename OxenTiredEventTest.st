<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 25, 2008 at 8:25:24 pm</time-stamp>


<class>
<name>OxenTiredEventTest</name>
<environment>OregonTrail</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>wagon event </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.OxenTiredEventTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.OxenTiredEventTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.OxenTiredEventTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testRun">testRun
    "Tests the run method."

    self deny: event run.
    self assert: wagon oxenHealth = #good.

    wagon oxenTiredDays: 10.
    self assert: event run.
    self assert: wagon oxenHealth = #bad.</body>
</methods>

<methods>
<class-id>OregonTrail.OxenTiredEventTest</class-id> <category>Running</category>

<body package="OregonTrail" selector="setUp">setUp
    "Prepares necessary data structures and data for testing."

    wagon := Wagon populate: 1.
    event := OxenTiredEvent for: wagon value: 20.</body>
</methods>

</st-source>

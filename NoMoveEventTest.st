<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 25, 2008 at 12:47:16 pm</time-stamp>


<class>
<name>NoMoveEventTest</name>
<environment>OregonTrail</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>event wagon </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<comment>
<class-id>OregonTrail.NoMoveEventTest</class-id>
<body>This test class tests the run method in NoMoveEvent.

</body>
</comment>

<methods>
<class-id>OregonTrail.NoMoveEventTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.NoMoveEventTest</class-id> <category>Running</category>

<body package="OregonTrail" selector="setUp">setUp
	"Creates data structures necessary for testing."

    wagon := Wagon populate: 1.
    event := NoMoveEvent for: wagon value: 20.
    wagon no_move_turns: 0.</body>
</methods>

<methods>
<class-id>OregonTrail.NoMoveEventTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testRun">testRun
	"Tests the run method of NoMoveEvent."

	self assert: (wagon no_move_turns == 0).
     event run.
     self deny: (wagon no_move_turns == 0).</body>
</methods>

</st-source>

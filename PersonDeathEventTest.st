<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 6:11:25 pm</time-stamp>


<class>
<name>PersonDeathEventTest</name>
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
<class-id>OregonTrail.PersonDeathEventTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.PersonDeathEventTest</class-id>
<body>people die, sucks to be them

Instance Variables:
	event	&lt;AuxCodeInfoExtractor | CodeRegenerator | Event | InputState | LintRule | Smalllint | SmalllintChecker | SmalllintCodeTool | TestCase | TestSuite&gt;	description of event
	wagon	&lt;Wagon&gt;	description of wagon

</body>
</comment>

<methods>
<class-id>OregonTrail.PersonDeathEventTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.PersonDeathEventTest</class-id> <category>Running</category>

<body package="OregonTrail" selector="setUp">setUp
	wagon := Wagon new.
	event := PersonDeathEvent for: wagon value: 1.
	5 timesRepeat: [wagon people add: Person new].</body>

<body package="OregonTrail" selector="testRun">testRun
	wagon people do:[:x | x health: #fair].
	self assert:(event run = true).
	wagon people do:[:x | x health: #good].
	self assert:(event run = false).
	wagon people do:[:x | x health: #dead].
	self assert:(event run = false).</body>
</methods>

</st-source>

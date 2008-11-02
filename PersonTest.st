<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 2, 2008 at 12:02:13 am</time-stamp>


<class>
<name>PersonTest</name>
<environment>OregonTrail</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>p1 </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.PersonTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.PersonTest</class-id>
<body>sunit tests for person

Instance Variables:
	person	&lt;Object&gt;	description of person

</body>
</comment>

<methods>
<class-id>OregonTrail.PersonTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Edit the following to properly initialize instance variables ***"
	p1 := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.PersonTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="setUp">setUp
	p1 := Person named: 'Bob'.</body>

<body package="OregonTrail" selector="testPersonEat">testPersonEat
   p1 eat: #none.
   self assert: (p1 daysStarving = 2).
   p1 eat: #bareBones.
   self assert: (p1 daysStarving = 3).
   p1 eat: #meager.
   self assert: (p1 daysStarving = 3).
   p1 eat: #wellFed.
   self assert: (p1 daysStarving = 1).
   p1 eat: #wellFed.
   self assert: (p1 daysStarving = 0).
   10 timesRepeat: [ p1 eat: #normal ].
   self assert: ( p1 daysStarving = 0).
   10 timesRepeat: [ p1 eat: #none ].
   self assert: (p1 health = #dead).
   self assert: (p1 daysStarving = 10).
   p1 eat: #wellFed.
   self assert: (p1 daysStarving = 10)</body>

<body package="OregonTrail" selector="testPersonisDead">testPersonisDead
   p1 health: #good.
   self deny: (p1 isDead).
   p1 health: #dead.
   self assert: (p1 isDead).</body>

<body package="OregonTrail" selector="testPersonisStarving">testPersonisStarving
   p1 daysStarving: 1.
   self deny: (p1 isStarving).
   p1 daysStarving: 3.
   self assert: (p1 isStarving).</body>

<body package="OregonTrail" selector="testPersonPrintString">testPersonPrintString
   p1 health: #poor.
   p1 daysStarving: 5.
   self assert: (p1 printString = 'Bob #poor 5 days starving').</body>
</methods>

</st-source>

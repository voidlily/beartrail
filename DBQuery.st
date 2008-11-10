<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 10, 2008 at 2:28:42 pm</time-stamp>


<class>
<name>DBQuery</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars>conn sess ans result </class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.DBQuery class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="query:">query: aQuery

	conn := DBInfo connection.
		[conn connect.
		sess := conn getSession.
		sess prepare: aQuery.
		sess bindInput: (Array with: 'SELECT').
		sess execute.
		ans := sess answer.
		[ans = #noMoreAnswers] whileFalse:
		     [ans = #noAnswerStream ifFalse: [result := ans upToEnd].
		     ans := sess answer]]
		ensure: [conn disconnect].
	^result</body>
</methods>

<methods>
<class-id>OregonTrail.DBQuery class</class-id> <category>updating</category>

<body package="OregonTrail" selector="updateQuery:">updateQuery: anUpdate
	conn := DBInfo connection.
	[conn connect.
	sess := conn getSession.
	sess prepare: anUpdate.
	sess execute.
	sess answer.]
	     ensure: [conn disconnect].</body>

<body package="OregonTrail" selector="updates:">updates: aCollection
	conn := DBInfo connection.
	[conn connect.
	aCollection do: [:u |
	sess := conn getSession.
	sess prepare: u.
	sess execute.
	sess answer].
	(Delay forMilliseconds: 500) wait]
	     ensure: [conn disconnect].</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.DBQuery</class-id>
<body>Returns the result of a query with DBQuery query: aQuery.

</body>
</comment>

<methods>
<class-id>OregonTrail.DBQuery</class-id> <category>accessing</category>

<body package="OregonTrail" selector="ans">ans
	^ans</body>

<body package="OregonTrail" selector="ans:">ans: anObject
	ans := anObject</body>

<body package="OregonTrail" selector="conn">conn
	^conn</body>

<body package="OregonTrail" selector="conn:">conn: anObject
	conn := anObject</body>

<body package="OregonTrail" selector="result">result
	^result</body>

<body package="OregonTrail" selector="result:">result: anObject
	result := anObject</body>

<body package="OregonTrail" selector="sess">sess
	^sess</body>

<body package="OregonTrail" selector="sess:">sess: anObject
	sess := anObject</body>
</methods>

<methods>
<class-id>OregonTrail.DBQuery</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	conn := nil.
	sess := nil.
	ans := nil.
	result := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>

</st-source>

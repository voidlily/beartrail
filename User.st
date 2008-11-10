<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 10, 2008 at 2:53:06 pm</time-stamp>


<class>
<name>User</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>username password user_id games </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.User class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.User</class-id> <category>accessing</category>

<body package="OregonTrail" selector="games">games
	^games</body>

<body package="OregonTrail" selector="games:">games: anObject
	games := anObject</body>

<body package="OregonTrail" selector="password">password
	^password</body>

<body package="OregonTrail" selector="password:">password: anObject
	password := anObject</body>

<body package="OregonTrail" selector="populate">populate
	| conn sess ans result |
	conn := DBInfo connection.
	[conn connect.
	sess := conn getSession.
	sess prepare: 'SELECT user_id from users where username = "', username, '" and pass = "', password, '";'.
	sess bindInput: (Array with: 'SELECT').
	sess execute.
	ans := sess answer.
	[ans = #noMoreAnswers] whileFalse:
	     [ans = #noAnswerStream ifFalse: [result := ans upToEnd].
	     ans := sess answer]]
     ensure: [conn disconnect].

	result isEmpty ifFalse: [ 
		user_id := ((result at: 1) at: 1).
		[conn connect.
		sess := conn getSession.
		sess prepare: 'SELECT wagon_id from gamedata where user_id = "', (user_id printString), '";'.
		sess bindInput: (Array with: 'SELECT').
		sess execute.
		ans := sess answer.
		[ans = #noMoreAnswers] whileFalse:
		     [ans = #noAnswerStream ifFalse: [result := ans upToEnd].
		     ans := sess answer].
		result isEmpty ifFalse: [ games := (result at: 1). ]]
		ensure: [conn disconnect].
	].</body>

<body package="OregonTrail" selector="username">username
	^username</body>

<body package="OregonTrail" selector="username:">username: anObject
	username := anObject</body>

<body package="OregonTrail" selector="user_id">user_id
	^user_id</body>

<body package="OregonTrail" selector="user_id:">user_id: anObject
	user_id := anObject</body>
</methods>

<methods>
<class-id>OregonTrail.User</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Edit the following to properly initialize instance variables ***"
	username := nil.
	password := nil.
	user_id := nil.
	games := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>

</st-source>

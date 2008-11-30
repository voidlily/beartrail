<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 30, 2008 at 1:48:50 pm</time-stamp>


<class>
<name>User</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>user_id games </inst-vars>
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

<body package="OregonTrail" selector="populate:password:">populate: username password: pass

	| query result user games |
	user := User new.
	games := OrderedCollection new.
	query := 'SELECT t2.wagon_id, t2.user_id from users as t1, gamedata as t2 where t1.user_id = t2.user_id and t1.username = "', username, '" and t1.pass = "', pass, '";'.
	result := DBManager selectQuery: query.

	result isEmpty ifFalse: [
		result do: [:r | games add: (GameData populate: (r at: 1))].
		user games: games.
		user user_id: ((result at: 1) at: 2)].

	^user</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.User</class-id>
<body>login information for users

Instance Variables:
	games	&lt;Object | WeakProxy&gt;	description of games
	password	&lt;Object | WeakProxy&gt;	description of password
	username	&lt;Object | WeakProxy&gt;	description of username
	user_id	&lt;Object | WeakProxy&gt;	description of user_id

</body>
</comment>

<methods>
<class-id>OregonTrail.User</class-id> <category>accessing</category>

<body package="OregonTrail" selector="games">games
	^games</body>

<body package="OregonTrail" selector="games:">games: anObject
	games := anObject</body>

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
	user_id := nil.
	games := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>

</st-source>

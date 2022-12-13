# winner-of-a-match
find the winner of a match

Question - 
There are 2 tables namely "Players" and "Matches". I needed to find the player who scored maximum points per group. Let me show you the data and explain to you a few more conditions.

Players Table (All the fields are Integers)

Player_ID Group_ID
45 1
30 1
65 1
25 1
50 2
20 2
40 3

Matches (All the fields are Integers)

https://learn.microsoft.com/answers/storage/attachments/58892-image.png



A few points.

Player_ID field in Players table is the Player's ID. This field can be joined to the first_Player or Second_Player fields of Matches tables.

Match_ID is the Primary Key of Matches table and Player_ID is the Primary Key of Players table.

One key thing to note is, a match is only played between same group players (example: Player 50 will never play a match with Player 45 because they both belong to different groups. Player 50 plays only with other player in the same group which in this case is 20)


Going by the above logic Player 40 will never be able to play any match as there isn't any other player in his group

Now the Requirement is:

Get the player from each group who has scored maximum points (among all the different matches they played)

If the scores are tied, select the lowest ID player as the winner


If there is only one player in any group, they will automatically become the winner.


To picturise the answer should be.

Group_ID Winner_ID

1 45

2 20

3 40



Answer -

 ******************************************************************************************************************************
Using Sql -
***********
;WITH cte1 as 
         (SELECT P.group_id,P.Player_ID,COALESCE(M.first_score,0) AS Score FROM matches M
         RIGHT JOIN Players P ON M.first_player = P.Player_id
         UNION ALL
         SELECT P.group_id,P.Player_ID,COALESCE(M.Second_score,0) AS Score FROM matches M
         RIGHT JOIN Players P ON M.Second_player = P.Player_id)
 ,cte2 as
       (SELECT Group_ID,Player_ID,SUM(Score) AS Score,ROW_NUmber() OVER (Partition BY group_id Order by suM(score) desc,player_id) AS RNM 
        FROM cte1
        GROUP BY GROUP_ID, PLAYER_ID)
 SELECT GROUP_iD,Player_ID AS Winner_ID FROM cte2
 WHERE rnm=1

 ******************************************************************************************************************************
Using SqlLite -
**************
 ;WITH cte1 as 
         (SELECT P.group_id,P.Player_ID,COALESCE(M.first_score,0) AS Score FROM matches M
         LEFT JOIN Players P ON M.first_player = P.Player_id
         UNION ALL
         SELECT P.group_id,P.Player_ID,COALESCE(M.Second_score,0) AS Score FROM Players P
         LEFT JOIN  matches M ON M.Second_player = P.Player_id)
 ,cte2 as
       (SELECT Group_ID,Player_ID,SUM(Score) AS Score,ROW_NUmber() OVER (Partition BY group_id Order by suM(score) desc,player_id) AS RNM 
        FROM cte1
        GROUP BY GROUP_ID, PLAYER_ID)
    
 SELECT GROUP_iD,Player_ID AS Winner_ID FROM cte2
 WHERE rnm=1

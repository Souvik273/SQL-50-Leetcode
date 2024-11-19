# Write your MySQL query statement below

With subq1 as(
    Select player_id,min(event_date) as ed1 from Activity 
    group by player_id
)

SELECT Round(Count(DISTINCT a.player_id)/(select count(distinct player_id) from Activity),2) as fraction
FROM Activity a left join subq1 s
on a.player_id=s.player_id
WHERE a.event_date=s.ed1+INTERVAL 1 DAY;
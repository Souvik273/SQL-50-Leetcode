# Write your MySQL query statement below
WITH TEMPTABLE AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
),
workingTABLE AS (
    SELECT id, id AS friends FROM TEMPTABLE
)
SELECT id, COUNT(friends) AS num
FROM workingTABLE
GROUP BY id
ORDER BY num DESC LIMIT 1;

/*---1---*/

SELECT t.id, t.Name, fp.first_name + ' ' + fp.second_name + ' ' + fp.last_name As FullName /*fp.TeamID*/
FROM Teams AS t
JOIN FootbalPlayers AS fp
ON t.id = fp.TeamID;

/*---2---*/

SELECT t.Name, SUM(CASE
					WHEN m.hostTeamID = t.id AND m.host_result > m.guest_result THEN 1
					WHEN m.guestTeamID = t.id AND m.host_result < m.guest_result THEN 1
					ELSE 0
					END) AS Wins,
				SUM(CASE
					WHEN m.hostTeamID = t.id AND m.host_result < m.guest_result THEN 1
					WHEN m.guestTeamID = t.id AND m.host_result > m.guest_result THEN 1
					ELSE 0
					END) AS Loses,
				SUM(CASE
					WHEN m.host_result = m.guest_result THEN 1
					ELSE 0
					END) AS Draws
FROM Meetings AS m
JOIN Teams AS t
ON t.id = m.hostTeamID OR t.id = m.guestTeamID
GROUP BY t.id, t.Name;

/*---3---*/

SELECT t.Name, MAX(m.meet_date)
FROM Meetings AS m
JOIN Teams AS t
ON t.id = m.hostTeamID OR t.id = m.guestTeamID
WHERE t.id = 5 
GROUP BY t.id, t.Name;

/*---4---*/

SELECT t.Name, SUM(CASE
					WHEN m.hostTeamID = t.id AND m.host_result > m.guest_result THEN 1
					WHEN m.guestTeamID = t.id AND m.host_result < m.guest_result THEN 1
					ELSE 0
					END) AS Wins
					
FROM Meetings AS m
JOIN Teams AS t
ON t.id = m.hostTeamID OR t.id = m.guestTeamID
GROUP BY t.id, t.Name

/*---5---*/

GO
CREATE PROCEDURE Points @Teamid INT, @DateTime DATE AS 
SELECT t.Name, SUM(CASE
					WHEN m.hostTeamID = t.id AND m.host_result > m.guest_result THEN 3
					WHEN m.guestTeamID = t.id AND m.host_result < m.guest_result THEN 3
					WHEN m.host_result = m.guest_result THEN 1
					ELSE 0
					END) AS Points
FROM Meetings AS m
JOIN Teams AS t
ON t.id = m.hostTeamID OR t.id = m.guestTeamID
WHERE t.id = @Teamid AND m.meet_date <= @DateTime
GROUP BY t.id, t.Name;
GO
EXEC Points @Teamid = 5, @DateTime = '2021-05-24'


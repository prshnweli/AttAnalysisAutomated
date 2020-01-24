SELECT
STU.ID,
STU.LN + ', ' + STU.FN AS 'Name',
STU.GR AS 'Grade',
Teacher = (SELECT TE FROM TCH WHERE STU.CU = TCH.TN AND STU.SC = TCH.SC AND TCH.DEL = 0),
SUM(CASE WHEN ATT.AL IN ('3','4','5','6','8','A','D','E','F','H','I','K','M','N','O','Q','S','U','V','X','Z') AND ATT.DT > '2020-01-13' AND ATT.DT < '2020-01-17' THEN 1 ELSE 0 END) AS 'Total Absences'
FROM STU
JOIN ATT ON STU.SN = ATT.SN AND STU.SC = ATT.SC
WHERE STU.DEL = 0
AND STU.TG = ''
--AND ATT.AL IN ('3','4','5','6','8','A','D','E','F','H','I','K','M','N','O','Q','S','U','V','X','Z')
-- AND ATT.AL IN ('3','6','8','A','B','E','O','Q','S','U') -- Unexcused
-- AND ATT.AL IN ('4','5','D','F','H','I','K','M','N','V','X','Z') -- Excused
AND STU.SC = 10
AND STU.SN NOT IN (24764,24767,24757,24759,24760,24766,24761,24754,24762,24763)
GROUP BY STU.ID, STU.FN, STU.LN, STU.GR, STU.CU, STU.SC
ORDER BY STU.GR, STU.LN, STU.FN

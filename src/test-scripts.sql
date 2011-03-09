
-- relationship text
SELECT OriginName, EdgeTypeName, n.Name as EndpointName FROM 
    (SELECT a.Endpoint, t.Name AS EdgeTypeName, OriginName FROM 
        (SELECT e.Type, e.Endpoint, n.Name AS OriginName FROM 
         Edge AS e 
         INNER JOIN Node AS n 
         WHERE e.Origin = n.Id) AS a 
     INNER JOIN EdgeType as t 
     WHERE a.Type = t.Id) AS a 
INNER JOIN Node AS n 
WHERE n.Id = a.Endpoint;

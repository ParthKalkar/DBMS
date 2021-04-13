for counting non defeated

MATCH (y)<-[:BEATS*]-(root)
WHERE NOT (root)<-[:BEATS]-()
RETURN root

for counting who didn't win at least once.

match (n) 
where not (n)-->() 
return distinct n

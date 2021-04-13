MATCH (y)<-[:BEATS*]-(root)
WHERE NOT (root)<-[:BEATS]-()
RETURN root

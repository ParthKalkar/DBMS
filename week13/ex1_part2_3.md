 match (a:Fighter)-[:beats*2..]->(b:Fighter)
where a.name = "Khabib Nurmagomedov" return distinct b;

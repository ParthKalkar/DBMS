MATCH(p:Fighter) WHERE p.weight <= 155 AND (p:Fighter)-[:BEATS]-() RETURN p.name

MATCH(p:Fighter) WHERE p.weight > 155 AND p.weight <= 170 AND
(p:Fighter)-[:BEATS]-() RETURN DISTINCT  p.name

MATCH(p:Fighter) WHERE p.weight > 170 AND p.weight <= 185 AND (p:Fighter)-[:BEATS]-() RETURN DISTINCT  p.name

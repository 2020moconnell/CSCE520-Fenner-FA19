SELECT DISTINCT maker
   FROM Product
     WHERE type = 'Laptop' AND maker NOT IN (
         SELECT maker
         FROM Product
         WHERE type = 'PC');
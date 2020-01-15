select name, owner from pet where sex = 'f' and birth > 1990-1-1 order by name;

UPDATE pet SET name = 'Maggieo' WHERE name = 'Whistler';

UPDATE pet SET death = current_date WHERE name = 'Buffy';

SELECT * FROM pet;
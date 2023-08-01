USE adlister_db;

INSERT INTO users (id, username, email, password)
VALUES (1, 'a', 'a@a.com', '$2a$12$C5ca5O9E39DnpD2QdTMCBuMBYThk2Q8ki8AVsnpSb8QWjy3IhyYwS');

INSERT INTO ads (id, user_id, title, description)
VALUES (1, 1, 'playstation for sale', 'This is a slightly used playstation'),
       (2, 1, 'Super Nintendo', 'Get your game on with this old-school classic!'),
       (3, 1, 'Junior Java Developer Position', 'Minimum 7 years of experience required. You will be working in the scripting language for Java'),
       (4, 1, 'JavaScript Developer needed', 'Must have strong Java skills');
USE adlister_db;

INSERT INTO users (id, username, email, password)
VALUES (1,'a','a@a.com','$2a$12$C5ca5O9E39DnpD2QdTMCBuMBYThk2Q8ki8AVsnpSb8QWjy3IhyYwS'),
       (2,'j','j@j.com','$2a$12$6dRMt0QpnCJG.2jzLuLnLuTcucxOzLywAyNQ0JsTPc4UQD9MhhSkm'),
       (3,'d','d@d.com','$2a$12$y0lj4//g5wnIeNftRytwBOokox/2cOMpDzM7XvjRMLTOK38aARj4S');

INSERT INTO ads (id, user_id, title, description)
VALUES (1, 1, 'playstation for sale', 'This is a slightly used playstation - I am willing to trade for a limited edition Pokemon card'),
       (2, 1, 'Super Nintendo', 'Get your game on with this old-school classic!'),
       (3, 1, 'Junior Java Developer Position', 'Minimum 7 years of experience required. You will be working in the scripting language for Java'),
       (4, 1, 'JavaScript Developer needed', 'Must have strong Java skills'),
       (5, 2, 'P-Lot BBQ', 'Join us at the XYZ location on XYZ day for the best BBQ P-Lot party of your life!!!!!!'),
       (6, 2, 'CAR WASH FUNDRAISER', 'ladies and gents we are having a car wash fundraiser for my cat. She be chunky and needs that Jenny Craig!'),
       (7, 2, 'Cat for trade', 'My cat be thick AF. Needs a bath but will trade for a new pair of J''s'),
       (8, 3, 'NEED HALP', 'I am lazy and unwilling to get out to find a job. so if you know of work where I don''t have to physically get out of bed. Please reach out!'),
       (9, 3, 'Used toilet seat', 'used only 4 years!'),
       (10, 3, 'Dose anyone have a room for rent?', 'My parents are being weird. They said I cant live in their house anymore. Something to do with the farts.'),
       (11, 3, 'IT Wizard', 'I am kinda smert with the puter.'),
       (12, 3, 'Used White Box Van', 'I Legally have to relocate to a new town. And no longer have a need for my Van. Only serious mustaches can inquire!');

INSERT INTO cat (id, category)
VALUES (1, 'For Sale'),
       (2, 'For Trade'),
       (3, 'For Free'),
       (4, 'Job Post'),
       (5, 'Job Search'),
       (6, 'Services'),
       (7, 'Community Events'),
       (8, 'Housing');

INSERT INTO catAdd (id, ad_id, cat_id)
VALUES (1, 1, 1),
       (2, 1, 2),
       (3, 2, 1),
       (4, 3, 4),
       (5, 4, 4),
       (6, 5, 7),
       (7, 6, 7),
       (8, 7, 2),
       (9, 8, 5),
       (10, 9, 1),
       (11, 10, 8),
       (12, 11, 6),
       (13, 12, 3);

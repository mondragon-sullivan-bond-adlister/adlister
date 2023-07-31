USE adlister_db;

INSERT INTO users (id, username, email, password)
VALUES (2, 'bob', 'bob@bob.com', 'bob123'),
       (3, 'joe', 'joe@joe.com', 'joe123'),
       (4, 'phil', 'phil@phil.com', 'phil123'),
       (5, 'dav', 'dav@dav.com', 'dav123');

INSERT INTO ads (id, user_id, title, description)
VALUES (2, 1, 'ad1', 'this is an ad'),
       (3, 2, 'ad2', 'this is an ad'),
       (4, 3, 'ad3', 'this is an ad'),
       (5, 4, 'ad4', 'this is an ad');
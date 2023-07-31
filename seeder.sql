USE adlister_db;

INSERT INTO users (id, username, email, password)
VALUES
#     (1, 'bob', 'bob@bob.com', 'bob123'),
#        (2, 'joe', 'joe@joe.com', 'joe123'),
#        (3, 'phil', 'phil@phil.com', 'phil123'),
#        (4, 'dav', 'dav@dav.com', 'dav123'),
       (5, 'user', 'user@user.com', 'user123'),
       (6, 'jean', 'jean@jean.com', 'jean123'),
       (7, 'mike', 'mike@mike.com', 'mike123');

INSERT INTO ads (id, user_id, title, description)
VALUES (1, 1, 'ad1', 'this is an ad'),
       (2, 2, 'ad2', 'this is an ad'),
       (3, 3, 'ad3', 'this is an ad'),
       (4, 4, 'ad4', 'this is an ad');
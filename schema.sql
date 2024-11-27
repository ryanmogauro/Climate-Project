CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    school VARCHAR(255),
    passwordHash VARCHAR(255) NOT NULL
);


CREATE TABLE posts (
    postID BIGINT AUTO_INCREMENT PRIMARY KEY,
    userID INT NOT NULL,
    title VARCHAR(36),
    content VARCHAR(255),
    created_at DATETIME NOT NULL,
    FOREIGN KEY (userID) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE comments (
    commentID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT NOT NULL,
    content VARCHAR(255),
    createdAt DATETIME NOT NULL,
    FOREIGN KEY (userID) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE votes (
    voteID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT NOT NULL,
    commentID INT,
    postID INT,
    upvoteDirection INT NOT NULL,
    FOREIGN KEY (userID) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (commentID) REFERENCES comments(commentID) ON DELETE CASCADE,
    FOREIGN KEY (postID) REFERENCES posts(postID) ON DELETE CASCADE
);

CREATE TABLE tips (
    tipID INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(255)
);

CREATE TABLE leaderboard (
    rank INT PRIMARY KEY,
    tipID INT NOT NULL,
    FOREIGN KEY (tipID) REFERENCES tips(tipID) ON DELETE CASCADE
);

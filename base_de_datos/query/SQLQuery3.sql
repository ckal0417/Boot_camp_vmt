-- Creen una tabla Tags y la tabla intermedia PostTags. Un Post puede tener muchos Tags, un Tag puede estar en muchos Posts. Incluyan constraints correctos.
CREATE TABLE Tags (
    TagID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL
);

CREATE TABLE PostTags(
	PostID INT NOT NULL,
    TagID INT NOT NULL,
    PRIMARY KEY (PostID, TagID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (TagID) REFERENCES Tags(TagID)

);
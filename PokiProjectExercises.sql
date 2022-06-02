SELECT * FROM Grade;

SELECT * FROM Emotion;

SELECT Count(Id) AS PoemCount FROM Poem;

SELECT TOP 76 Name 
FROM Author 
ORDER BY Name;

SELECT TOP 76 Author.Name, Grade.Name AS GradeName
FROM Author
JOIN GRADE
ON Author.GradeId = Grade.Id
ORDER BY Author.Name;

SELECT TOP 76 Author.Name, Grade.Name AS GradeName, Gender.Name Gender
FROM Author
JOIN GRADE ON Author.GradeId = Grade.Id
JOIN Gender ON Author.GenderId = Gender.Id
ORDER BY Author.Name;

SELECT SUM(Poem.WordCount) WordCount FROM Poem;

SELECT Title, Poem.CharCount
FROM Poem
ORDER BY Poem.CharCount;

SELECT COUNT(Author.Id) ThirdGraders
FROM Author
JOIN Grade ON Author.GradeId = Grade.Id
WHERE Grade.Name = '3rd Grade' OR Grade.Name = '1st Grade' OR Grade.Name = '2nd Grade';

SELECT *
FROM Poem
JOIN Author ON Poem.AuthorId = Author.Id
JOIN Grade ON Author.GradeId = Grade.Id
WHERE Grade.Name = '4th Grade';

SELECT Grade.Name, Count(Grade.Id) Poems
FROM Poem
JOIN Author ON Poem.AuthorId = Author.Id
JOIN Grade ON Author.GradeId = Grade.Id
GROUP BY Grade.Name

SELECT Grade.Name Grade, Count(Author.Id) Authors
FROM Author
JOIN Grade ON Author.GradeId = Grade.Id
GROUP BY Grade.Name

SELECT TOP 1 Poem.Title, Poem.WordCount
FROM Poem
ORDER BY Poem.WordCount DESC;

SELECT Author.Name, Count(Poem.Id)
FROM Author
JOIN Poem ON Author.Id = Poem.AuthorId
GROUP BY Author.Id, Author.Name
ORDER BY Count(Poem.Id) DESC;

SELECT Count(PoemEmotion.PoemId) SadPoemsCount
FROM Emotion
JOIN PoemEmotion ON Emotion.Id = PoemEmotion.EmotionId
WHERE Emotion.Name = 'Sadness'

SELECT Count(Poem.Id) EmotionlessPoems
FROM Poem
LEFT JOIN PoemEmotion
ON Poem.Id = PoemEmotion.PoemId
WHERE PoemEmotion.PoemId IS NULL;

SELECT TOP 1 Emotion.Name, Count(PoemEmotion.PoemId) PoemCount
FROM PoemEmotion
JOIN Emotion ON Emotion.Id = PoemEmotion.EmotionId
GROUP BY Emotion.Name
ORDER BY Count(PoemEmotion.PoemId)

SELECT TOP 1 Grade.Name, Count(Poem.Id) JoyPoemCount
FROM PoemEmotion
JOIN Emotion ON Emotion.Id = PoemEmotion.EmotionId
JOIN Poem ON Poem.Id = PoemEmotion.PoemId
JOIN Author ON Author.Id = Poem.AuthorId
JOIN Grade ON Grade.Id = Author.GradeId
WHERE Emotion.Name = 'Joy'
GROUP BY Grade.Name
ORDER BY Count(Poem.Id) DESC

SELECT TOP 1 Gender.Name, Count(Poem.Id) FearPoemCount
FROM PoemEmotion
JOIN Emotion ON Emotion.Id = PoemEmotion.EmotionId
JOIN Poem ON Poem.Id = PoemEmotion.PoemId
JOIN Author ON Author.Id = Poem.AuthorId
JOIN Gender ON Gender.Id = Author.GenderId
WHERE Emotion.Name = 'Fear'
GROUP BY Gender.Name
ORDER BY Count(Poem.Id)

SELECT Count(Author.Id) NumberOfAlices
FROM Author
WHERE Author.Name = 'alice'

SELECT *
FROM Poem
WHERE Poem.TEXT LIKE '%horse%'

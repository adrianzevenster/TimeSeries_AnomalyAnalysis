SELECT
    COALESCE(training.date, testing.date) as EventDate,
    COALESCE(training.training_count, 0) as TrainingCount,
    COALESCE(testing.testing_count, 0) as TestingCount
FROM
    (SELECT DATE(EventTime) as date, COUNT(Class) as training_count
     FROM dervico.training_raw
     WHERE Class LIKE '%S%'
     GROUP BY DATE(EventTime)) as training
LEFT JOIN
    (SELECT DATE(EventTime) as date, COUNT(Class) as testing_count
     FROM dervico.testing_raw
     WHERE Class LIKE '%S%'
     GROUP BY DATE(EventTime)) as testing
ON training.date = testing.date

UNION

SELECT
    COALESCE(training.date, testing.date) as EventDate,
    COALESCE(training.training_count, 0) as TrainingCount,
    COALESCE(testing.testing_count, 0) as TestingCount
FROM
    (SELECT DATE(EventTime) as date, COUNT(Class) as training_count
     FROM dervico.training_raw
     WHERE Class LIKE '%S%'
     GROUP BY DATE(EventTime)) as training
RIGHT JOIN
    (SELECT DATE(EventTime) as date, COUNT(Class) as testing_count
     FROM dervico.testing_raw
     WHERE Class LIKE '%S%'
     GROUP BY DATE(EventTime)) as testing
ON training.date = testing.date;
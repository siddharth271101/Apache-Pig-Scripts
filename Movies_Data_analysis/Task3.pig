-- Task3
Find the list of years and number of movies released each year

group_movies = group movies by year;
movies_count = foreach B generate group, COUNT(movies.year);
dump movies_count;


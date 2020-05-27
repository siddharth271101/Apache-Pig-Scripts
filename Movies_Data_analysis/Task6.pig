-- Task6
-- Find the total number of movies in the dataset

group_movies = group movies all;
for_each_group = foreach group_movies generate COUNT(movies);
dump for_each_group;

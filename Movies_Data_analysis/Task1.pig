-- Task-1
-- find the number of movies released between 1950 and 1960

movies = load 'movies.txt' USING PigStorage(',') as (id:int,name:chararray,year:int,rating:double,duration:int);
filter_by_year = filter movies by year >= 1950 and year <= 1960;
group_by_all = group filter_by_year all;
for_each_count = foreach group_by_all generate COUNT(filter_by_year.id);
dump for_each_count;
for_each_group = foreach group_by_all generate $01, $02;
dump for_each_group;

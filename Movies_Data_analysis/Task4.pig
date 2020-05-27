-- Task4
-- Find the number of movies having rating more than 4.

filter_by_rating = filter movies by rating > 4;
group_by_all = group filter_by_rating all;
for_each_count = foreach group_by_all generate COUNT(filter_by_rating);
dump for_each_count;
for_each_group = foreach group_by_all generate $01;
dump for_each_group;

-- Task-2
-- Find the number of movies with duration more than 2 hours

filter_by_duration = filter movies by duration > 7200;
group_by_all = group filter_by_duration all;
for_each_group = foreach group_by_all generate COUNT(filter_by_duration);
dump for_each_group;

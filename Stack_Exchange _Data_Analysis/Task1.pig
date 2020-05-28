-- Task – 1 
-- Top 10 most commonly used tags in this data set

questions_data = LOAD  'answers.txt' USING PigStorage('_') AS (c1:chararray,c2:chararray,c3:chararray,c4:chararray,tags:chararray,c6:chararray,c7:chararray,c8:chararray,c9:chararray,c10:chararray,c11:chararray);
tags_data = FOREACH questions_data GENERATE tags;
tags_seperated = FOREACH tags_data GENERATE TOKENIZE(tags);
tags = FOREACH tags_seperated GENERATE FLATTEN($0) AS tag;
tags_group = GROUP tags BY tag;
tags_count = FOREACH tags_group GENERATE group, COUNT(tags) as cnt;
tags_sorted = ORDER tags_count BY cnt DESC;
top10_tags = LIMIT tags_sorted 10;
DUMP top10_tags;

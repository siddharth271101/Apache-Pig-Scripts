-- Task - 4
-- Tags of questions which got answered within 1 hour

questions_data = LOAD  'answers.csv' USING PigStorage('_') AS (qid:chararray,c2:chararray,c3:chararray,c4:chararray,tags:chararray,c6:chararray,c7:chararray,c8:chararray,c9:chararray,c10:chararray,at:chararray);
tags_data_qid_time = FOREACH questions_data GENERATE tags, qid as q, ToDate((long)at*1000) as time;
tags_seperated_with_hour = FOREACH tags_data_qid_time GENERATE TOKENIZE(tags), q as q, GetHour(time) as hour;
tags_flatten = FOREACH tags_seperated_with_hour GENERATE FLATTEN($0) AS tag, q as q, hour as hour;
tags_lessthanonehour = FILTER tags_flatten by hour <= 1;
tags_order = ORDER tags_lessthanonehour by tag;
DUMP tags_order;

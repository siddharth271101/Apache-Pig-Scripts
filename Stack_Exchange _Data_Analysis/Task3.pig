-- Task - 3
-- Number of questions which got answered within 1 hour

questions_data = LOAD  'answers.csv' USING PigStorage('_') AS (qid:chararray,c2:chararray,c3:chararray,c4:chararray,c5:chararray,c6:chararray,c7:chararray,c8:chararray,c9:chararray,c10:chararray,at:long);
qid_at = FOREACH questions_data GENERATE qid as q, ToDate((long)at*1000) as time;
qid_gethour = FOREACH qid_at GENERATE q as q, time as time, GetHour(time) as hour;
qid_hourless1 = FILTER qid_gethour by hour <= 1;
DUMP qid_hourless1;

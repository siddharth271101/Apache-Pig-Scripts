-- Task – 2 
-- Average time to answer questions

questions_data = LOAD  'answers.csv' USING PigStorage('_') AS (qid:chararray,c2:chararray,c3:chararray,c4:chararray,c5:chararray,c6:chararray,c7:chararray,c8:chararray,c9:chararray,c10:chararray,at:long);
group_qid = GROUP questions_data BY qid;
avg_qtime = FOREACH group_qid GENERATE group, questions_data.qid as qid, AVG(questions_data.at) as avg;
avg_qtime1 = FOREACH avg_qtime GENERATE qid, ToDate((long)avg*1000) as avg_ans_time;
DUMP avg_qtime1;

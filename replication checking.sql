--8295891


--USE DISTDB_PSQL03B
exec sp_replmonitorsubscriptionpendingcmds  
 @publisher ='PSQL03B\PSQL03B',
 @publisher_db = 'NextSTEPP_DI',
 @publication ='NextSTEPP_DI',
 @subscriber ='PSQL03A\PSQL03A',
 @subscriber_db ='NextSTEPP',
 @subscription_type ='0' --0 for push and 1 for pull 


  
----SELECT * FROM dbo.IHsubscriptions

----sp_helptext sp_replmonitorsubscriptionpendingcmds


USE DISTDB_PSQL03A

Go

EXEC sys.sp_posttracertoken @publication = 'TranProducts'

Go



--Token Tracking Tables

USE DISTDB_PSQL03B

Go

 

--publisher_commit

SELECT Top 20 * FROM MStracer_tokens 

Order by tracer_id desc

 

--subscriber_commit

SELECT Top 20 * FROM MStracer_history 

Order by parent_tracer_id desc


SELECT top 20 *

FROM dbo.MSdistribution_history

Order by start_time desc

-----------------------------------------------

SELECT publication_id, agent_id, 

       t.publisher_commit, t.distributor_commit, h.subscriber_commit

FROM MStracer_tokens t

JOIN MStracer_history h

ON t.tracer_id = h.parent_tracer_id 

ORDER BY t.publisher_commit DESC


------------------Historical Breakdown (in seconds)

SELECT publication_id 'PubID', agent_id 'AgentID',convert(smalldatetime,t.publisher_commit) 'PubCommit',

       convert(smalldatetime,t.distributor_commit) 'DistCommit',

       convert(smalldatetime,h.subscriber_commit) 'SubCommit',

       Datediff(s,t.publisher_commit,t.distributor_commit) as 'Dist(sec)', 

       Datediff(s,t.distributor_commit,h.subscriber_commit) as 'Sub(sec)'

FROM MStracer_tokens t

JOIN MStracer_history h

ON t.tracer_id = h.parent_tracer_id

ORDER BY t.publisher_commit DESC



------------------------By Agent_id

SELECT publication_id 'PubID', agent_id 'AgentID',convert(smalldatetime,t.publisher_commit) 'PubCommit',

       convert(smalldatetime,t.distributor_commit) 'DistCommit',

       convert(smalldatetime,h.subscriber_commit) 'SubCommit',

       Datediff(s,t.publisher_commit,t.distributor_commit) as 'Dist(sec)', 

       Datediff(s,t.distributor_commit,h.subscriber_commit) as 'Sub(sec)'

FROM MStracer_tokens t

JOIN MStracer_history h

ON t.tracer_id = h.parent_tracer_id

ORDER BY agent_id,t.publisher_commit DESC


------------------------Find worst performing subscribers.

SELECT 

convert(varchar(10),agent_id) as 'agent id',

max(Datediff(s,distributor_commit,subscriber_commit)) as 'MAXTime To Sub (sec)',

avg(Datediff(s,distributor_commit,subscriber_commit)) as 'AVG Time To Sub (sec)'

FROM MStracer_tokens t

JOIN MStracer_history h

ON t.tracer_id = h.parent_tracer_id

group by agent_id

order by 2 desc



---------------------Well, so who is Agent 3?

SELECT id, name, publisher_db, publication 

FROM MSdistribution_agents

-------------------------------------------------------
SELECT sjs.step_name, sjs.command from msdb.dbo.sysjobsteps sjs

join msdb.dbo.sysjobs sj

on sj.job_id = sjs.job_id

Where name in ('PSQL03B\PSQL03B-NextSTEPP_DI-NextSTEPP_DI-PSQLDST01B\PSQLDST01B-42','PSQL03B\PSQL03B-NextSTEPP_DI-NextSTEPP_DI-PSQL03A\PSQL03A-44','PSQL03B\PSQL03B-NextSTEPP_DI-NextSTEPP_DI-PSQLRPT01A\PSQLRPT01A-43','PSQL03B\PSQL03B-NextSTEPP_DI-NextSTEPP_DI-PSQLRPT01B\PSQLRPT01B-45')


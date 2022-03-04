--Eksik İndex Script
;WITH
XMLNAMESPACES
(DEFAULT N'http://schemas.microsoft.com/sqlserver/2004/07/showplan'
,N'http://schemas.microsoft.com/sqlserver/2004/07/showplan' AS ShowPlan)
SELECT TOP 50 ECP.[usecounts] AS [UsageCounts]
,ECP.[refcounts] AS [RefencedCounts]
,ECP.[objtype] AS [ObjectType]
,ECP.[cacheobjtype] AS [CacheObjectType]
,EST.[dbid] AS [DatabaseID]
,EST.[objectid] AS [ObjectID]
,EST.[text] AS [Statement]
,EQP.[query_plan] AS [QueryPlan]
FROM sys.dm_exec_cached_plans AS ECP
CROSS APPLY sys.dm_exec_sql_text(ECP.[plan_handle]) AS EST
CROSS APPLY sys.dm_exec_query_plan(ECP.[plan_handle]) AS EQP
WHERE ECP.[usecounts] > 1 -- Plan should be used more then one time (= no AdHoc queries)
AND EQP.[query_plan].exist(N'/ShowPlanXML/BatchSequence/Batch/Statements/StmtSimple/QueryPlan/MissingIndexes/MissingIndexGroup') <> 0ORDER BY ECP.[usecounts] DESC
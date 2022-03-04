--Anlık Çalışan Sorgular
select session_id,text,query_plan,status,wait_type,  * from sys.dm_exec_requests 
cross apply sys.dm_exec_sql_text(sql_handle)
cross apply sys.dm_exec_query_plan(plan_handle)
--AlwaysOn yapıda sunucuların primary replicada farklı, secondary'de farklı bir işlem yapması için aşağıda ki yöntem kullanılmalıdır.

If sys.fn_hadr_is_primary_replica ( 'SampleDB' ) = 1   
BEGIN  
--select @@servername
--Primary Replicada Yapılacak İş
END 
--Secondary Replicada Yapılacak İş

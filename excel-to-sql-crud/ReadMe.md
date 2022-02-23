Excelden Database’e veri aktarımı için birçok tool bulunuyor. Bu işlemi Query ile yapmakta mümkün. 
Aşağıda ki sorgular ile bu işlemleri yapabilirsiniz.

INSERT:
INSERT INTO TEST_TABLO (COLUMN1,COLUMN2,COLUMN3) SELECT COLUMN1,COLUMN2,COLUMN3
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0', 'Excel 12.0;Database=C:\test\test.xls;', 'SELECT COLUMN1,COLUMN2,COLUMN3 FROM [Sheet1$]')

UPDATE:
UPDATE SP SET SP.Description = T.Description FROM TEST_TABLO SP
INNER JOIN OPENROWSET('Microsoft.ACE.OLEDB.12.0', 'Excel 12.0;Database=C:\test\test.xls;', 'SELECT COLUMN1,COLUMN2,COLUMN3 FROM [Sheet1$]') T
ON SP.Id = T.Id

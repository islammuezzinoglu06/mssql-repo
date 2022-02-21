--Kullanıcıya view içerisinde değişiklik yapma ve görüntüleme yetkisi
GRANT ALTER,VIEW DEFINITION ON dbo.[v_TestView] TO [loginuser]

--Kullanıcıya tabloda sadece veri çekme yetkisi
GRANT SELECT ON dbo.[t_TestTablo] TO [loginuser]


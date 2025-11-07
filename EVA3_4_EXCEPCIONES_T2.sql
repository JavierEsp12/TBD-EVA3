delimiter $$
create procedure agregar_persona(in nomb varchar(50), in ap_pat varchar(50), in ap_mat varchar(50), in fcha_nac date)
begin
   declare calc_rfc varchar(10);
   set calc_rfc = crear_rfc(nomb, ap_pat, ap_mat, fcha_nac);
   insert into personas(rfc, nombre, ap_paterno, ap_materno, fecha_nac)
   values(calc_rfc, nomb, ap_pat, ap_mat, fcha_nac);
end$$
delimiter ; 
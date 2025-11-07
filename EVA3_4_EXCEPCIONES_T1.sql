delimiter $$ 
create function crear_rfc(nomb varchar(50), ap_pat varchar(50), ap_mat varchar(50), fcha_nac date)
returns varchar(10) deterministic
begin 
   declare crear_rfc varchar(10);
   declare l_pat varchar(2);
   declare l_mat varchar(1);
   declare l_nom varchar(1);
   declare rfcyear varchar(2);
   declare rfcmes varchar(2);
   declare rfcdia varchar(2);
   select substring(ap_pat,1,2) into l_pat;
   if ap_mat is null then 
      set l_mat = "X";
   elseif length(l_mat) = 0 then 
      set l_mat = "X";
   else 
      select substring(ap_mat,1,1) into l_mat;
   end if;
   select substring(nomb,1,1) into l_nom;
   set rfcyear = date_format(fcha_nac, "%y");
   set rfcmes = date_format(fcha_nac, "%m");
   set rfcdia = date_format(fcha_nac, "%d");
   return concat(l_pat, l_mat, l_nom, rfcyear, rfcmes, rfcdia);
end$$
delimiter ;
use furama_case_study;
#Customer
select c.*,ct.ct_name as customer_type_name  from customer c join customer_type ct on c.ct_id = ct.ct_id ;

select * from customer_type;

#Facility
select f.*,ft.ft_name as facility_type_name,rt.rt_name as rental_type_name from facility f join facility_type ft on f.ft_id = ft.ft_id join rental_type rt on f.rt_id = rt.rt_id where ft.ft_name='House';
select f.*,ft.ft_name as facility_type_name,rt.rt_name as rental_type_name from facility f join facility_type ft on f.ft_id = ft.ft_id join rental_type rt on f.rt_id = rt.rt_id where ft.ft_name='Room';
select f.*,ft.ft_name as facility_type_name,rt.rt_name as rental_type_name from facility f join facility_type ft on f.ft_id = ft.ft_id join rental_type rt on f.rt_id = rt.rt_id where ft.ft_name='Villa';

select f.*,ft.ft_name as facility_type_name,rt.rt_name as rental_type_name  from facility f join facility_type ft on f.ft_id = ft.ft_id join rental_type rt on f.rt_id = rt.rt_id;
#add villa
insert into facility(ct_id,c_name,c_birthday, c_gender,c_id_card,c_phone_number,c_email,c_address) values(?,?,?,?,?,?,?,?)

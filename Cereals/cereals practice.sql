create database cereals;
use cereals;
select * from cereals; 

# 1. Add index name fast on name 
create index idx_fast on cereals(name);
select max(length(name)) from cereals;
alter table cereals modify name varchar(40);
create index idx_fast on cereals (name); 


select * from cereals;
show tables;
show index from cereals;

# 2. Describe the schema of table 
describe cereals;


# 3. Create view name as see where users can not see type column [first run appropriate query then create view] 
select * from cereals;
create view see as (select name, mfr,calories,protein,fat,sodium,fiber,carbo,sugars,potass,vitamins,shelf,weight,cups,rating from cereals);
select * from see;



rename table see to saw;
select * from saw;

# 5. Count how many are cold cereals 
select * from cereals;
select type,count(*) as no_of_cold_cereals from cereals where type='c';



# 6. Count how many cereals are kept in shelf 3 
select shelf,count(*) as no_of_cereals_kept_in_shelf from cereals where shelf='3';



# 7. Arrange the table from high to low according to ratings 
select * from cereals order by rating desc;


# 8. Suggest some column/s which can be Primary key 
select distinct count(name) from cereals;   
select name from cereals where name is null;

# 9. Find average of calories of hot cereal and cold cereal in one query 
select * from cereals;
select type, round(avg(calories),0) as average_calories from cereals group by type;

# 10. Add new column as HL_Calories where more than average calories should be categorized as HIGH and less than average calories should be categorized as LOW 
select * from cereals;
select round(avg(calories),0) as average_calories from cereals group by type;
alter table cereals add column HL_calories varchar(20);
update cereals set HL_calories =case when calories>107 then "high" else 'low' end ;



# 11. List only those cereals whose name begins with B 
select * from cereals where name like 'b%';

# 12. List only those cereals whose name begins with F 
select * from cereals where name like 'f%';

# 13. List only those cereals whose name ends with s 
select * from cereals where name like '%s';


# 14. Select only those records which are HIGH in column HL_calories and mail to jeevan.raj@imarticus.com [save/name your file as <your first name_cereals_high>] 

select * from cereals where hl_calories ='high';


# 15. Find maximum of ratings
select round(max(rating),0) as max_of_rating from cereals;

# 16. Find average ratings of those were High and Low calories 
select * from cereals;
select hl_calories,round(avg(rating),0) from cereals group by hl_calories;

# 17. Craete two examples of Sub Queries of your choice and give explanation in the script itself with remarks by using # 
select * from cereals ;

# 18. Remove column fat 
select * from cereals data;
alter table cereals drop fat;
select * from cereals;

# 19. Count records for each manufacturer [mfr] 
select mfr, count(*) as no_of_counts_based_on_mfr from cereals group by mfr;

# 20. Select name, calories and ratings only
select name,calories,rating from cereals;


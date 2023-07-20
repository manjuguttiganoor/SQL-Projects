drop database insurance;
 create database insurance;
 use insurance;
 
 
 # 1. Count for each categories of ‘region
 select * from insurance;
 select region, count(*) as count from insurance group by region;
 
# 2. Find 50 records of highest ‘age’ and export data/table to desktop
select * from insurance order by age desc limit 50;

# 3. Add index name ‘quick’ on ‘id’
create index quick on insurance (id);
show index from insurance;

# 4. Describe the schema of table
describe insurance;

# 5. Create view name as ‘gender’ where users can not see ‘sex’ [Hint: first run appropriate query then create view]
select * from insurance;
create view gender as (select id, age,bmi,children,smoker,region,charges from insurance);
select * from gender;

# 6. Rename the view as ‘type’
rename  table gender to type;
select * from type;

# 7. Count how many are ‘northwest’ insurance holders
select region, count(*) as count  from insurance  where region='northwest';

# 8. Count how many insurance holders were ‘femail’
select gender, count(gender) from insurance where gender='female';

# 9. Create Primary key on a suitable column
select id from insurance group by id having count(id)>1;
alter table insurance modify id int primary key;
describe insurance;

# 10. Create a new column ‘ratio’ which is age multiply by bmi
alter table insurance add column ratio int;
update insurance set ratio=age*bmi;
select *from insurance;

# 11. Arrange the table from high to low according to charges
select * from insurance   order by charges desc; 


# 12. Find MAX of ‘charges’
select round(max(charges),0) as maximum_charges from insurance;

# 13. Find MIN of ‘charges’
select round(min(charges),0) as minimum_charges from insurance;


# 14. Find average of ‘charges’ of male and female
select * from insurance;
select gender, round(avg(charges),0) as charges_name from insurance group by gender;

# 15. Write a Query to rename column name sex to Gender
alter table insurance change sex gender varchar(20);
select * from insurance;

# 16. Add new column as HL_Charges where more than average charges should be categorized as HIGH and less than average charges should be categorized as LOW
alter table insurance add column hl_charges varchar(10);
select * from insurance;
select avg(charges) from insurance;
update insurance set hl_charges = case when charges<13270 then 'low' when charges>13270 then 'high' end;

# 17. Change location/position of ‘smoker’ and bring before ‘children’
alter table insurance modify smoker text after bmi;
select * from insurance; 

# 18. Show top 20 records
select * from insurance order by id asc limit 20;

# 19. Show bottom 20 records
select * from insurance order by id desc limit 20;

# 20. Randomly select 20% of records and export to desktop
select riund(0.2*count(*),0) from insurance;
select * from insurance order by rand() limit 268;

# 21. Remove column ‘ratio’
alter table insurance drop column ratio;
select * from insurance;

# 22. Craete one example of Sub Queries involving ‘bmi’ and ‘sex’ and give explanation in the script itself with remarks by using #
alter table insurance change gender sex varchar(20);
select sex,max(bmi) from insurance group by sex;
select sex,max(bmi) as second_max_Male_bmi from insurance where bmi<(select max(bmi) from insurance where sex ='male') and sex='male';

# 22. Craete one example of Sub Queries involving ‘bmi’ and ‘sex’ and give explanation in the script itself with remarks by using #
# Will get second highet bmi based on SEX =Male
create view female_HL_charges as (select * from insurance where HL_charges='high' and sex='female' and smoker='yes' and children = 0);
select * from female_HL_charges;

# 24. Update children column if there is 0 children then make it as Zero Children, if 1 then one_children, if 2 then two_children, if 3 then three_children, if 4 then four_children if 5 then five_children else print it as More_than_five_children.
describe insurance;
alter table insurance modify children varchar(20);
update insurance set children= case children when 0 then 'zero_children' when 1 then 'one_children' when 2 then 'three_children' when 3 then 'four_children' when 4 then 'four_children'  when 5 then 'five_children' else 'more_than_five_children' end; 
select * from insurance;

# 25. Mail the script to jeevan.raj@imarticus.com by EOD.


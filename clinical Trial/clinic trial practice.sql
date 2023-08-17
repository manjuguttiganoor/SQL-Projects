create database clinical_trial;
use clinical_trial;
select * from clinictrial;

# 1. Add index name fast on Name
alter table clinictrial modify name varchar(30) primary key;
create index medical on clinictrial(name);
show index from clinictrial;

# 2. Describe the schema of table
describe clinictrial;

# 3. Find average of Age
select * from clinictrial;
select  round(avg(age),0) as average_age from clinictrial;

# 4. Find minimum of Age
select * from clinictrial;
select min(age) as minimum_age from clinictrial;

# 5. Find maximum of Age
select * from clinictrial;
select max(age) as maximum_age from clinictrial;

# 6. Find average age of those were pregnant and not pregnant
select * from clinictrial;
select pregnant, round(avg(age),0) average_age from clinictrial group by pregnant;
 
# 7. Find average blood pressure of those had drug reaction and did not had drug reaction
select drug_reaction,round(avg(bp),0) as average_bp from clinictrial group by drug_reaction;

# 8. Add new column name as ‘Age_group’ and those having age between 16 & 21 should be categorized as Low, more than 21 and less than 35 should be categorized as Middle and above 35 should be categorized as High.
select age,case when age between 16 and 21 then 'low' when age between 21 and 35 then 'middle' when age >35 then 'high' end 'age_group' from clinictrial;
select * from clinictrial;
alter table clinictrial add column Age_group varchar(10) after Age;
select * from clinictrial;

# 9. Change ‘Age’ of Reetika to 32
select * from clinictrial;
update clinictrial set age='32' where name='reetika';
select * from clinictrial where name='reetika';

# 10. Change name of Reena as Shara’
select * from clinictrial;
update clinictrial set name='shara' where name='reena';
select* from clinictrial where name ='shara';

# 11. Remove Chlstrl column
select * from clinictrial;
alter table clinictrial drop chlstrl;
select * from clinictrial;

# 12. Select only Name, Age and BP
select * from clinictrial;
select name,age,bp from clinictrial;

# 13. Select ladies whose first name starts with ‘E’
select * from clinictrial;
select * from clinictrial as first_name where name like 'E%';

# 14. Select ladies whose Age_group were Low

# 15. Select ladies whose Age_group were High
select * from clinictrial where age_group='high';

# 16. Select ladies whose name starts with ‘A’ and those were pregnant
select  *  from clinictrial where name like 'a%';


# 17. Identify ladies whose BP was more than 120
select * from clinictrial where bp>120;

# 18. Identify ladies whose BP was between 100 and 120
select * from clinictrial where BP between 100 and 120;

# 19. Identify ladies who had low anxiety aged less than 30
select * from clinictrial where age<30;

# 20.Select ladies whose name ends with ‘i’
select* from clinictrial where name like '%i';

# 21. Select ladies whose name ends with ‘a’ 
select * from clinictrial where name like '%a';

# 22.Select ladies whose name starts with ‘K’ 
select * from clinictrial where name like 'k%';
# 23.Select ladies whose name have ‘a’ anywhere
select * from clinictrial where name like'%a%';

# 24. Order ladies in ascending way based on ‘BP’
select * from clinictrial  order by bp asc;

# 25. Order ladies in descending way based on ‘Age
select * from clinictrial order by age desc;
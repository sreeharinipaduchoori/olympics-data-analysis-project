SELECT * FROM morning_batch.atlete_events;
select*from athlete_events
where medal in('silver','bronze');

select*from athlete_events
where medal='silver';

select*from athlete_events
where age>=50;

select*from athlete_events
where team='india';

select*from athlete_events
where season='winter';

select*from athlete_events
where year between 1950 and 2020;

select count(*) from athlete_events
where sex='m';

select count(*)from athlete_events
where sport='football';

select*from athlete_events
where sport in('judo','basket ball');

select*from athlete_events
where medal='gold'and sex='f';

select count(*)from athlete_events
where city='london';

select count(*)from athlete_events
where city='barcolona';

select*from athlete_events
where year<=20;

select*from athlete_events
where year=1992;

#Display the first 3 records from the customer table whose first name starts with ‘b’
select*from athlete_events
where name like 'b%'
limit 3;

#Find all customers whose first name ends with "a"
select*from athlete_events
where name like '%a';

#Display the list of first 4 cities which start and end with ‘a’
select*from athlete_events
where name like '%a%'
limit 4;

#Find all customers whose first name have "NI" in any position
select*from athlete_events
where name like'%ni%';

#Find all customers whose first name have "r" in the third position
select*from athlete_events
where name like'__r';

#Find all customers whose first name starts with "d" and are at least 5 characters in length
select*from athlete_events
where name like 'd____%'
limit 5;

#Find names of customers whose first name starts with "L" and ends with "A"
select*from athlete_events
where name like'l%a';

#__>aggregate functions
#1.count,2.max,3.min,4.sum,5.avg
#string functions:

#max
select max(emp_id) from athlete_table;
#2/9/24
#groupby and having


#out the no of athletes in each team
select team,count(*)from athlete_events
group by team;

#feach the 5 team'which has lowest no of athletes
#how many athelets  won gold,silver,bronze

#how many athletes are in each season
select season,count(*)from athlete_events
group by season;

#1.How many olympics games have been held?
select count(*)from athlete_events;

#2.List down all Olympics games held so far
select all (games) from athlete_events;

#3.Mention the total no of nations who participated in each olympics game?
select team,count(*) from athlete_events
group by team;

#4.Which year saw the highest and lowest no of countries participating in olympics?
select year,count(*)from athlete_events
group by year
order by count(team)desc
limit 1;
select year,count(*)from athlete_events
group by year
order by count(team)
limit 1;

#5.Which nation has participated in all of the olympic games?
select noc,count(*)from athlete_events
group by noc
order by count(games)
limit 1;


#6.Identify the sport which was played in all summer olympics.
select games,count(team)from athlete_events
group by games
order by count(games)desc
limit 1;

#7.Which Sports were just played only once in the olympics?
select sport,count(distinct games) from athlete_events
group by sport
having count(distinct games)<=1;
#8.Fetch the total no of sports played in each olympic games.
select games,count(distinct sport)from athlete_events
group by games 
having count(distinct sport)>=1;
#9.fetch details of the oldest athletes to win a gold medal
select name,count(medal)from athlete_events
group by name.
order by count(medal);

#10.Find the Ratio of male and female athletes participated in all olympic games.
select sex,count(games)from athlete_events
group by sex
order by count(games);
#11.Fetch the top 5 athletes who have won the most gold medals.
select*from athlete_events
where medal='gold'
limit 5;

#12.Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).
select name,count(medal) from athlete_events
where medal in ('gold,silver,bronze')
group by name(medal)
limit 5;
#13.Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.
select noc,count(medal)from athlete_events
where medal
limit 5;

#14.List down total gold, silver and broze medals won by each country.
select noc,count('gold'),count('silver'),count('bronze')from athlete_events
where medal not in('na')
group by noc
order by count('gold'),count('silver'),count('bronze');
#15.List down total gold, silver and broze medals won by each country corresponding to each olympic games.
select noc,count('gold'),count('silver'),count('bronze')from athlete_events
where medal in('gold','silver','bronze')
group by noc
order by count('gold')desc,count('silver')desc,count('bronze');

#16Identify which country won the most gold, most silver and most bronze medals in each olympic games.
select athlete_events.noc,athlete_events.games,noc_regions(2).region,
              count('gold')as no_of_goldmedals,
              count('silver')as no_of_silvermedals,
              count('bronze')as no_of_bronzemedals
from athlete_events
left join noc_regions(2)on
athlete_events.noc=noc_regions.noc
where medal not in('NA')
group by athlete_events.noc,athlete_events.games,noc_regions(2).region
order by count('gold')desc,count('silver')desc,count('bronze')desc;athlete_events
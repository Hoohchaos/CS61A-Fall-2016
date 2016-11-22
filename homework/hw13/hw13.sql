create table parents as
  select "abraham" as parent, "barack" as child union
  select "abraham"          , "clinton"         union
  select "delano"           , "herbert"         union
  select "fillmore"         , "abraham"         union
  select "fillmore"         , "delano"          union
  select "fillmore"         , "grover"          union
  select "eisenhower"       , "fillmore";

create table dogs as
  select "abraham" as name, "long" as fur, 26 as height union
  select "barack"         , "short"      , 52           union
  select "clinton"        , "long"       , 47           union
  select "delano"         , "long"       , 46           union
  select "eisenhower"     , "short"      , 35           union
  select "fillmore"       , "curly"      , 32           union
  select "grover"         , "short"      , 28           union
  select "herbert"        , "curly"      , 31;

create table sizes as
  select "toy" as size, 24 as min, 28 as max union
  select "mini",        28,        35        union
  select "medium",      35,        45        union
  select "standard",    45,        60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
create table size_of_dogs as
  select a.name, b.size from dogs as a, sizes as b where a.height>b.min and a.height<=b.max;

-- All dogs with parents ordered by decreasing height of their parent
create table by_height as
  select child from parents,dogs where parent=name order by height desc;

-- Sentences about siblings that are the same size
create table sentences as
  with childs_size(parent, child, child_size) as (select a.parent, a.child, size from parents as a, size_of_dogs as b where a.child = b.name)
  select a.child || ' and ' || b.child || ' are ' || a.child_size || ' siblings' from childs_size as a, childs_size as b where a.parent = b.parent and a.child < b.child and a.child_size = b.child_size;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
create table stacks as
	with dogs_sum_heights(names, n, sum_height, last_height) as (select name, 1, height, height from dogs union select a.names || ", " || b.name, n+1, sum_height + b.height, b.height from dogs_sum_heights as a, dogs as b where a.last_height < b.height and n<4)
	select names, sum_height from dogs_sum_heights where sum_height >= 170 and n = 4 order by sum_height;
-- non_parents is an optional, but recommended question
-- All non-parent relations ordered by height difference
create table non_parents as
  select "REPLACE THIS LINE WITH YOUR SOLUTION";

create table ints as
    with i(n) as (
        select 1 union
        select n+1 from i limit 100
    )
    select n from i;

create table divisors as
    with divisors(num, divisor) as (
      select a.n, b.n from ints as a, ints as b where a.n % b.n = 0
    )
    select ints.n as num, count(divisors.divisor) as num_divisors from ints, divisors where divisors.num = ints.n group by ints.n;

create table primes as
    select num from divisors where num_divisors=2 and num<100;

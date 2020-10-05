-- ������� �2. ����� ����� ��������� ������������. �� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ����� �������������.

select from_user_id, count(body) as qty_msg, to_user_id from messages where to_user_id = 9 group by from_user_id order by qty_msg desc;

-- �����: ������ ����� ������������ �9 ������� ��������� ������������ �10.

-- ������� �3. ���������� ����� ���������� ������, ������� �������� 10 ����� ������� ������������� (�� ������� ������� like_posts, �.�. likes �� �����������).

select users.id, users.name, users.surname, year(now()) - year(users.birthday) as age, sum(likes_posts.likepage) as summarize from users
join likes_posts on users.id = likes_posts.user_id
group by likes_posts.user_id order by age asc limit 10;

-- ������� �4. ����������, ������ ��� ������ ������ ����� ��������� ������� "��������".

select users.gender, count(users.gender) as cnt from likes_posts join users on likes_posts.user_id = users.id group by users.gender;

-- ������� �5. ����� 10 �������������, ������� ��������� ���������� ���������� � ������������� ���������� ����.

select concat(users.name,' ', users.surname) as fullname, count(comments.user_id) as activity from comments join users on comments.user_id = users.id group by fullname order by activity asc limit 10;
...
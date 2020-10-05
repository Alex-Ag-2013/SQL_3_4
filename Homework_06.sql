-- задание №2. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

select from_user_id, count(body) as qty_msg, to_user_id from messages where to_user_id = 9 group by from_user_id order by qty_msg desc;

-- ответ: больше всего пользователю №9 прислал сообщений пользователь №10.

-- задание №3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей (на примере таблицы like_posts, т.к. likes не заполнилась).

select users.id, users.name, users.surname, year(now()) - year(users.birthday) as age, sum(likes_posts.likepage) as summarize from users
join likes_posts on users.id = likes_posts.user_id
group by likes_posts.user_id order by age asc limit 10;

-- задание №4. Определить, мужчин или женщин больше всего поставило отметок "Нравится".

select users.gender, count(users.gender) as cnt from likes_posts join users on likes_posts.user_id = users.id group by users.gender;

-- задание №5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

select concat(users.name,' ', users.surname) as fullname, count(comments.user_id) as activity from comments join users on comments.user_id = users.id group by fullname order by activity asc limit 10;
...
select DISTINCT a1.user_id from amazon_transactions a1
JOIN amazon_transactions a2 ON a1.user_id = a2.user_id
AND a1.id <> a2.id
AND DATEDIFF (a2.created_at, a1.created_at) BETWEEN 0 AND 7

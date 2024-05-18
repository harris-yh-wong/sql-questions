SELECT P1.product_id,
    (
        CASE
            WHEN P2.new_price IS NOT NULL THEN P2.new_price
            ELSE 10 -- default price = 10
        END
    ) AS price
FROM (
        SELECT DISTINCT product_id
        FROM Products
    ) P1
    LEFT JOIN (
        SELECT product_id,
            MAX(change_date) AS change_date
        FROM Products
        WHERE change_date <= "2019-08-16"
        GROUP BY product_id
    ) dates ON P1.product_id = dates.product_id
    LEFT JOIN Products P2 ON P1.product_id = P2.product_id
    AND dates.change_date = P2.change_date;
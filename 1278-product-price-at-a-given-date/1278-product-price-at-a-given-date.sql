# Write your MySQL query statement below
SELECT
    product_id,
    COALESCE(new_price, 10) AS price
FROM 
    (
        SELECT DISTINCT
            product_id
        FROM
            Products
    ) AS UniqueProducts
    LEFT JOIN
    (
        SELECT 
            product_id,
            new_price
        FROM
            Products
            JOIN
            (
                SELECT
                    product_id,
                    max(change_date) AS change_date
                FROM 
                    Products
                WHERE
                    change_date <= '2019-08-16'
                GROUP BY
                    product_id
            ) AS LastChangeDate
            USING(product_id, change_date)
    ) AS LastChangedPrice
    USING(product_id)
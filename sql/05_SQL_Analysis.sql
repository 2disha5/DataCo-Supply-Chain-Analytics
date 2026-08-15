select * from dataco_supply_chain;

SELECT
    SUM(sales) AS total_revenue,
    SUM(order_profit_per_order) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(order_item_quantity) AS total_quantity_sold,
    SUM(sales) / COUNT(DISTINCT order_id) AS average_order_value,
    (SUM(order_profit_per_order) / SUM(sales)) * 100 AS profit_margin
FROM dataco_supply_chain;

SELECT
    order_year,
    SUM(sales) AS revenue,
    COUNT(DISTINCT order_id) AS orders
FROM dataco_supply_chain
GROUP BY order_year
ORDER BY order_year;

SELECT
    market,
    SUM(sales) AS revenue,
    SUM(order_profit_per_order) AS profit,
    COUNT(DISTINCT order_id) AS orders,
    (SUM(order_profit_per_order) / SUM(sales)) * 100 AS profit_margin
FROM dataco_supply_chain
GROUP BY market
ORDER BY revenue DESC;


SELECT
    order_year,
    order_month,
    SUM(sales) AS revenue
FROM dataco_supply_chain
GROUP BY order_year, order_month
ORDER BY order_year, 
         CASE order_month
             WHEN 'January' THEN 1
             WHEN 'February' THEN 2
             WHEN 'March' THEN 3
             WHEN 'April' THEN 4
             WHEN 'May' THEN 5
             WHEN 'June' THEN 6
             WHEN 'July' THEN 7
             WHEN 'August' THEN 8
             WHEN 'September' THEN 9
             WHEN 'October' THEN 10
             WHEN 'November' THEN 11
             WHEN 'December' THEN 12
         END;

WITH monthly_revenue AS (
    SELECT
        order_year,
        order_month,
        SUM(sales) AS revenue
    FROM dataco_supply_chain
    GROUP BY order_year, order_month
)

SELECT
    order_year,
    order_month,
    revenue,
    LAG(revenue) OVER (
        ORDER BY
            order_year,
            CASE order_month
                WHEN 'January' THEN 1
                WHEN 'February' THEN 2
                WHEN 'March' THEN 3
                WHEN 'April' THEN 4
                WHEN 'May' THEN 5
                WHEN 'June' THEN 6
                WHEN 'July' THEN 7
                WHEN 'August' THEN 8
                WHEN 'September' THEN 9
                WHEN 'October' THEN 10
                WHEN 'November' THEN 11
                WHEN 'December' THEN 12
            END
    ) AS previous_month_revenue
FROM monthly_revenue
ORDER BY
    order_year,
    CASE order_month
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END;



WITH monthly_revenue AS (
    SELECT
        order_year,
        order_month,
        SUM(sales) AS revenue
    FROM dataco_supply_chain
    GROUP BY order_year, order_month
),

revenue_with_previous AS (
    SELECT
        order_year,
        order_month,
        revenue,
        LAG(revenue) OVER (
            ORDER BY
                order_year,
                CASE order_month
                    WHEN 'January' THEN 1
                    WHEN 'February' THEN 2
                    WHEN 'March' THEN 3
                    WHEN 'April' THEN 4
                    WHEN 'May' THEN 5
                    WHEN 'June' THEN 6
                    WHEN 'July' THEN 7
                    WHEN 'August' THEN 8
                    WHEN 'September' THEN 9
                    WHEN 'October' THEN 10
                    WHEN 'November' THEN 11
                    WHEN 'December' THEN 12
                END
        ) AS previous_month_revenue
    FROM monthly_revenue
)

SELECT
    order_year,
    order_month,
    revenue,
    previous_month_revenue,
    ROUND(
        ((revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0) * 100)::numeric,
        2
    ) AS mom_growth_pct
FROM revenue_with_previous
ORDER BY
    order_year,
    CASE order_month
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END;



WITH monthly_revenue AS (
    SELECT
        order_year,
        order_month,
        SUM(sales) AS revenue
    FROM dataco_supply_chain
    GROUP BY order_year, order_month
),

revenue_with_previous AS (
    SELECT
        order_year,
        order_month,
        revenue,
        LAG(revenue) OVER (
            ORDER BY
                order_year,
                CASE order_month
                    WHEN 'January' THEN 1
                    WHEN 'February' THEN 2
                    WHEN 'March' THEN 3
                    WHEN 'April' THEN 4
                    WHEN 'May' THEN 5
                    WHEN 'June' THEN 6
                    WHEN 'July' THEN 7
                    WHEN 'August' THEN 8
                    WHEN 'September' THEN 9
                    WHEN 'October' THEN 10
                    WHEN 'November' THEN 11
                    WHEN 'December' THEN 12
                END
        ) AS previous_month_revenue
    FROM monthly_revenue
)

SELECT
    order_year,
    order_month,
    revenue,
    previous_month_revenue,
    ROUND(
        ((revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0) * 100)::numeric,
        2
    ) AS mom_growth_pct
FROM revenue_with_previous
ORDER BY
    order_year,
    CASE order_month
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END;


--What percentage of the company's total revenue does each market contribute?
WITH market_revenue AS (
    SELECT
        market,
        SUM(sales) AS revenue
    FROM dataco_supply_chain
    GROUP BY market
)

SELECT
    market,
    revenue,
    ROUND(
        (revenue / SUM(revenue) OVER () * 100)::numeric,
        2
    ) AS revenue_contribution_pct
FROM market_revenue
ORDER BY revenue DESC;


--What are the top-performing products within each product category?
SELECT
    COUNT(DISTINCT product_name) AS unique_products,
    COUNT(DISTINCT category_name) AS unique_categories
FROM dataco_supply_chain;


WITH product_sales AS (
    SELECT
        category_name,
        product_name,
        SUM(sales) AS revenue,
        SUM(order_profit_per_order) AS profit,
        COUNT(DISTINCT order_id) AS orders
    FROM dataco_supply_chain
    GROUP BY category_name, product_name
),

ranked_products AS (
    SELECT
        category_name,
        product_name,
        revenue,
        profit,
        orders,
        RANK() OVER (
            PARTITION BY category_name
            ORDER BY revenue DESC
        ) AS product_rank
    FROM product_sales
)

SELECT
    category_name,
    product_name,
    revenue,
    profit,
    orders,
    product_rank
FROM ranked_products
WHERE product_rank <= 3
ORDER BY category_name, product_rank;



WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(sales) AS lifetime_revenue,
        COUNT(DISTINCT order_id) AS order_count
    FROM dataco_supply_chain
    GROUP BY customer_id
)

SELECT
    customer_id,
    lifetime_revenue,
    order_count
FROM customer_revenue
ORDER BY lifetime_revenue DESC
LIMIT 10;

WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(sales) AS lifetime_revenue,
        COUNT(DISTINCT order_id) AS order_count
    FROM dataco_supply_chain
    GROUP BY customer_id
),

ranked_customers AS (
    SELECT
        customer_id,
        lifetime_revenue,
        order_count,
        RANK() OVER (
            ORDER BY lifetime_revenue DESC
        ) AS revenue_rank,
        (lifetime_revenue / SUM(lifetime_revenue) OVER ()) * 100
            AS revenue_contribution_pct
    FROM customer_revenue
)

SELECT
    customer_id,
    lifetime_revenue,
    order_count,
    revenue_rank,
    ROUND(revenue_contribution_pct::numeric, 4) AS revenue_contribution_pct
FROM ranked_customers
ORDER BY revenue_rank
LIMIT 10;


--How frequently do customers purchase, and how are customers distributed by order frequency?
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM dataco_supply_chain
    GROUP BY customer_id
)

SELECT
    customer_id,
    order_count
FROM customer_orders
ORDER BY order_count DESC
LIMIT 10;

--customer purchase frequency
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM dataco_supply_chain
    GROUP BY customer_id
),

customer_frequency AS (
    SELECT
        customer_id,
        order_count,
        CASE
            WHEN order_count = 1 THEN 'One-time'
            WHEN order_count BETWEEN 2 AND 3 THEN 'Occasional'
            WHEN order_count BETWEEN 4 AND 6 THEN 'Repeat'
            ELSE 'Frequent'
        END AS customer_type
    FROM customer_orders
)

SELECT
    customer_type,
    COUNT(*) AS customers,
    ROUND(
        (COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ())::numeric,
        2
    ) AS customer_percentage
FROM customer_frequency
GROUP BY customer_type
ORDER BY
    CASE customer_type
        WHEN 'One-time' THEN 1
        WHEN 'Occasional' THEN 2
        WHEN 'Repeat' THEN 3
        WHEN 'Frequent' THEN 4
    END;

--Which customer-frequency groups actually generate the revenue?
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS order_count,
        SUM(sales) AS lifetime_revenue
    FROM dataco_supply_chain
    GROUP BY customer_id
),

customer_frequency AS (
    SELECT
        customer_id,
        order_count,
        lifetime_revenue,
        CASE
            WHEN order_count = 1 THEN 'One-time'
            WHEN order_count BETWEEN 2 AND 3 THEN 'Occasional'
            WHEN order_count BETWEEN 4 AND 6 THEN 'Repeat'
            ELSE 'Frequent'
        END AS customer_type
    FROM customer_orders
)

SELECT
    customer_type,
    COUNT(*) AS customers,
    SUM(lifetime_revenue) AS revenue,
    ROUND(
        (SUM(lifetime_revenue) /
        SUM(SUM(lifetime_revenue)) OVER () * 100)::numeric,
        2
    ) AS revenue_percentage
FROM customer_frequency
GROUP BY customer_type
ORDER BY revenue DESC;
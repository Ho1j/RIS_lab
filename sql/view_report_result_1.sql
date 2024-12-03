SELECT *
FROM monthly_reports
WHERE MONTH(order_date) = '$month' AND YEAR(order_date) = '$year'
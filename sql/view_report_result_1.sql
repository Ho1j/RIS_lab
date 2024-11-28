SELECT *
FROM report_1
WHERE MONTH(order_date) = '$month' AND YEAR(order_date) = '$year'
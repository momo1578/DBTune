select current_timestamp(6) into @query_start;
set @query_name='18.sql';
SELECT C_NAME, C_CUSTKEY, O_ORDERKEY, O_ORDERDATE, O_TOTALPRICE, SUM(L_QUANTITY) FROM CUSTOMER, ORDERS, LINEITEM WHERE O_ORDERKEY IN (SELECT L_ORDERKEY FROM LINEITEM GROUP BY L_ORDERKEY HAVING SUM(L_QUANTITY) > 314) AND C_CUSTKEY = O_CUSTKEY AND O_ORDERKEY = L_ORDERKEY GROUP BY C_NAME, C_CUSTKEY, O_ORDERKEY, O_ORDERDATE, O_TOTALPRICE ORDER BY O_TOTALPRICE DESC, O_ORDERDATE LIMIT 100;
set @query_time_ms= timestampdiff(microsecond, @query_start, current_timestamp(6))/1000;
SELECT @query_name, @query_time_ms;
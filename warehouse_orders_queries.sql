--- Limit selection ---


SELECT
	*
FROM
	`bombata-415714.warehouse.orders`
LIMIT 100

--- Joing datasets and creating allias ---


SELECT
	*
FROM
	`bombata-415714.warehouse.orders` AS ord
JOIN
	`bombata-415714.warehouse.warehouse` AS war
ON
	ord.order_id = war.warehouse_id


--- Selecting specific columns ---

SELECT
	ord.*,
	war.warehouse_alias,
	war.state
FROM
	`bombata-415714.warehouse.orders` AS ord
JOIN
	`bombata-415714.warehouse.warehouse` AS war
ON
	ord.order_id = war.warehouse_id


	--- Counting the number of states ---


SELECT
	COUNT(war.state) AS num_states
FROM
	`bombata-415714.warehouse.orders` AS ord
JOIN
	`bombata-415714.warehouse.warehouse` AS war
ON
	ord.order_id = war.warehouse_id


--- Counting number of states without dublicates and nulls ---
	

SELECT
	COUNT (DISTINCT war.state) AS num_states 
FROM
	`bombata-415714.warehouse.orders` AS ord
JOIN
	`bombata-415714.warehouse.warehouse` AS war
ON
	ord.order_id = war.warehouse_id


--- Number of states grouped by ---

SELECT
	war.state,
	COUNT (DISTINCT war.state) AS num_states 
FROM
	`bombata-415714.warehouse.orders` AS ord
JOIN
	`bombata-415714.warehouse.warehouse` AS war
ON
	ord.order_id = war.warehouse_id
GROUP BY	
	war.state

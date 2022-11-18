WITH ranked_drugs as (
  SELECT
    ROW_NUMBER() OVER (
      PARTITION BY manufacturer 
      ORDER BY units_sold DESC
    ) AS rownum,
    manufacturer,
    drug
  FROM
    pharmacy_sales
)

SELECT
  manufacturer,
  drug as top_drugs
FROM 
  ranked_drugs
WHERE
  rownum <= 2
ORDER BY
  manufacturer
;
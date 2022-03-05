Select format('{"%s "}',string_agg(f1.company, ' ","')) as valuestocks from (select distinct company from  (SELECT company, fiscal_year,
  LEAD(fiscal_year) OVER (PARTITION BY company ORDER BY fiscal_year) AS next_year,
  LEAD(fiscal_year,2) OVER (PARTITION BY company ORDER BY fiscal_year) AS nextnext_year
  FROM dividend) f where f.next_year - f.fiscal_year = 10001 and f.nextnext_year - f.next_year = 10001) f1;

-- select json_agg(f1.company) as valuestock from (select distinct company from (SELECT company, fiscal_year,
--   	LEAD(fiscal_year) OVER (PARTITION BY company ORDER BY fiscal_year) AS next_year,
--   	LEAD(fiscal_year,2) OVER (PARTITION BY company ORDER BY fiscal_year) AS nextnext_year
--   	FROM dividend) f where f.next_year - f.fiscal_year = 10001 and f.nextnext_year - f.next_year = 10001) f1;
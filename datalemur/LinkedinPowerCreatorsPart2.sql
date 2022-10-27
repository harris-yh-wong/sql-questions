SELECT 
  persons.profile_id AS profile_id
FROM
  personal_profiles AS persons
LEFT JOIN
  employee_company
  ON persons.profile_id = employee_company.personal_profile_id
LEFT JOIN
  company_pages as companies
  ON employee_company.company_id = companies.company_id
GROUP BY
  persons.profile_id 
HAVING
  MAX(persons.followers) > MAX(companies.followers)
ORDER BY 
  profile_id;
  
-- Note: if it's more than *any* company that the person works for, then line 14 would be:
-- MAX(persons.followers) > MIN(companies.followers)
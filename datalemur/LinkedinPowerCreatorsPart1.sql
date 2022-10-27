SELECT 
  profile_id
FROM
  personal_profiles
LEFT JOIN
  company_pages
  ON personal_profiles.employer_id = company_pages.company_id
WHERE
  personal_profiles.followers > company_pages.followers
ORDER BY
  personal_profiles.profile_id;

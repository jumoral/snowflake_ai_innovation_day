-- Steps to configure integration of workspace with GitHub
-- 1. Generate PAT classic code on GH: Your profile->Developer Settings->Personal Access Tokens->Tokens (classic)
-- 2. Select database as DEFAULT_DATABASE.DOCUMENT_AI
-- 3. Run Step 1 below replacing 'PAT_TOKEN' with the actual value of your PAT TOKEN
-- 4. Run Step 2
-- 5. On the top left of the Workspace menu select Create workspace from Git repository:
--   5.a Use repository https://github.com/jumoral/snowflake_ai_innovation_day
--   5.b Select MY_GIT_API_INTEGRATION as API INTEGRATION
--   5.c Select the location of your PAT TOKEN: DEFAULT_DATABASE.DOCUMENT_AI -> MY_GIT_SECRET

-- Step 1
CREATE OR REPLACE SECRET my_git_secret
  TYPE = password
  USERNAME = 'julen.moralejo@gmail.com'
  PASSWORD = 'PAT_TOKEN';
-- Setp 2
CREATE OR REPLACE API INTEGRATION my_git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/jumoral/snowflake_ai_innovation_day')
  ALLOWED_AUTHENTICATION_SECRETS = (my_git_secret)
  ENABLED = TRUE;
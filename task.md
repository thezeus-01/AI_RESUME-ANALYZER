# Project Tasks

- [x] **Project Replication**
    - [x] Create `final_resume_analyzer` folder
    - [x] Replicate necessary files from `resume_ra`
    - [x] Setup `database/` subfolder

- [x] **Database Enhancements**
    - [x] Move `resume_data.db` to `database/`
    - [x] Update code to use relative paths for DB
    - [x] Add `filename` and `file_content` (BLOB) columns for file storage
    - [x] Implement logic to save original file bytes on upload

- [x] **Admin Dashboard**
    - [x] Add "Download Original Resume" feature
    - [x] Ensure file download works from DB content

- [x] **Cloud/Free Tier Support**
    - [x] Add `psycopg2` dependency
    - [x] logic for `DATABASE_URL` support (PostgreSQL)
    - [x] Implement `DBCursorAdapter` for SQLite/Postgres compatibility

- [x] **Deployment Setup**
    - [x] `render.yaml` configuration (Prepared)
    - [x] Verify Dockerfile
    - [x] Create `supabase_schema.sql` for manual initialization
    - [x] Confirm DB setup in Supabase

- [ ] **Final Verification**
    - [ ] User confirms successful login on Render
    - [ ] User confirms resume upload works
    - [ ] User confirms admin can download resume

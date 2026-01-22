# Free Hosting & Database Setup Guide

To host this project for **FREE** on Render (or other platforms) while keeping your database persistent (so you don't lose resumes when the app restarts), follow these steps to use an external PostgreSQL database.

## 1. Get a Free PostgreSQL Database
You can get a free managed PostgreSQL database from providers like:
- **Neon** (neon.tech) - *Recommended, very easy setup*
- **Supabase** (supabase.com)
- **Render** (render.com) - *Free tier expires after 90 days, but easy to set up*

### Example with Neon / Supabase:
1. Sign up and create a new Project/Database.
2. Copy the **Connection String** (It looks like: `postgres://user:password@hostname:5432/dbname`).
3. **Important**: If utilizing Supabase, ensure you use the "Transaction Mode" connection string (port 6543) if available, or the standard Session Mode (port 5432).

## 2. Configure Render
1. Go to your Render Dashboard.
2. Select your Web Service.
3. Go to **Environment**.
4. Add a new Environment Variable:
   - **Key**: `DATABASE_URL`
   - **Value**: *(Paste your Connection String from Step 1)*

## 3. Deployment
- Push your changes to GitHub.
- Render will detect the change.
- The application code (`config/database.py`) automatically detects `DATABASE_URL`.
  - If present: It connects to your remote PostgreSQL database.
  - If absent: It falls back to the local `resume_data.db` (SQLite).

### Note on Database Persistence
With this setup, all resumes and data are stored in your external database (Neon/Supabase). Even if Render re-deploys or restarts your app, your data remains safe and accessible from any device.

### Admin Setup
After connecting the new database, the admin user won't exist yet.
You can run the reset script locally pointing to the remote DB if you set the env var, or just use the app's initialization logic (the app initializes tables on startup).
However, to create the initial admin user, you might need to:
1. Access the database via a SQL client (like DBeaver or the provider's dashboard).
2. Insert the admin user manually:
   ```sql
   INSERT INTO admin (email, password) VALUES ('admin@resume.ai', 'admin123');
   ```
   *Note: In a real production app, passwords should be hashed. This project currently stores them as plain text based on the initial extensive requirements.*

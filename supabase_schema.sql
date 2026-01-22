-- Run this script in your Supabase SQL Editor to create all necessary tables

-- 1. Create resume_data table
CREATE TABLE IF NOT EXISTS resume_data (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT NOT NULL,
    linkedin TEXT,
    github TEXT,
    portfolio TEXT,
    summary TEXT,
    target_role TEXT,
    target_category TEXT,
    education TEXT,
    experience TEXT,
    projects TEXT,
    skills TEXT,
    template TEXT,
    filename TEXT,
    file_content BYTEA,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create resume_skills table
CREATE TABLE IF NOT EXISTS resume_skills (
    id SERIAL PRIMARY KEY,
    resume_id INTEGER REFERENCES resume_data(id),
    skill_name TEXT NOT NULL,
    skill_category TEXT NOT NULL,
    proficiency_score REAL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create resume_analysis table
CREATE TABLE IF NOT EXISTS resume_analysis (
    id SERIAL PRIMARY KEY,
    resume_id INTEGER REFERENCES resume_data(id),
    ats_score REAL,
    keyword_match_score REAL,
    format_score REAL,
    section_score REAL,
    missing_skills TEXT,
    recommendations TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Create admin_logs table
CREATE TABLE IF NOT EXISTS admin_logs (
    id SERIAL PRIMARY KEY,
    admin_email TEXT NOT NULL,
    action TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Create admin table
CREATE TABLE IF NOT EXISTS admin (
    id SERIAL PRIMARY KEY,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. Create ai_analysis table
CREATE TABLE IF NOT EXISTS ai_analysis (
    id SERIAL PRIMARY KEY,
    resume_id INTEGER REFERENCES resume_data(id),
    model_used TEXT,
    resume_score INTEGER,
    job_role TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 7. Insert Default Admin User
INSERT INTO admin (email, password) VALUES ('admin@resume.ai', 'admin123')
ON CONFLICT (email) DO NOTHING;

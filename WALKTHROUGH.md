# Project Walkthrough: Final Resume Analyzer

## Overview
The `resume_ra` project has been successfully replicated to `final_resume_analyzer`. 
The following enhancements were made to meet the requirements:

1. **Database Structure**: 
   - A new `database/` subfolder was created.
   - The SQLite database `resume_data.db` is now located at `final_resume_analyzer/database/resume_data.db`.
   - All code references (config, utils, scripts) have been updated to point to this new location using relative paths.

2. **Resume File Storage**:
   - The `resume_data` table schema was updated to include `filename` and `file_content` (BLOB) columns.
   - When a user uploads a resume, the **original file bytes** are now saved to the database. This ensures that the resume can be retrieved later from any device, even if the application is hosted on Render with an ephemeral file system (as long as the database file itself is persisted, e.g., via a Render Disk).

3. **Admin Dashboard**:
   - The Admin Dashboard now includes a **Download Original Resume** section in the "Resume Submissions" area.
   - Admins can select a Resume ID and download the original uploaded file (PDF/DOCX).

4. **Tech Stack**:
   - The project continues to use **Streamlit (Python)** with custom **HTML/CSS** styling, preserving the original look and feel while adding requested functionality.

## Setup Instructions

### Prerequisites
- Python 3.9+
- pip

### Installation
1. Navigate to the project folder:
   ```bash
   cd final_resume_analyzer
   ```
2. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # Windows: venv\Scripts\activate
   ```
3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

### Database Initialization
If you are starting fresh or want to reset the admin user:
```bash
python utils/reset_db_script.py
```
*Default Admin Credentials:* `admin@resume.ai` / `admin123`

### Running the App
```bash
streamlit run app.py
```

### Hosting on Render
- Ensure you attach a **Disk** to your Render service and mount it to `/opt/render/project/src/final_resume_analyzer/database` if you want the database (and uploads) to persist across deployments.

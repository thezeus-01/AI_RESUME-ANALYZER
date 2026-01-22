# Bug Fix: Standard Analyzer File Persistence

## Problem
The "Standard Analyzer" tab extracts text from uploaded resumes but fails to capture and save the original file bytes (`file_content`) to the database. This results in "No file available" when admins try to download these resumes.

## Root Cause
In `app.py` (lines ~1380+), the `analyze_standard` button click handler processes the file for text extraction but skips the step of reading the raw bytes into a variable and adding it to the `resume_data` dictionary before calling `save_resume_data`. It *attempts* to read from `st.session_state.resume_data` (lines 1448-1451), but this session state is never populated in the Standard Analyzer flow (it is only populated in the separate `handle_resume_upload` function which is likely used by the AI Analyzer or a different flow).

## Proposed Changes

### 1. `app.py`
Modify the `analyze_standard` block to:
1.  Read the file bytes immediately upon button click (using `uploaded_file.getvalue()` or `.read()` with seek reset).
2.  Store these bytes in a variable (e.g., `file_bytes`).
3.  Inject this `file_bytes` and `filename` directly into the `resume_data` dictionary before saving.

#### [MODIFY] `app.py`
- Location: Inside `if analyze_standard:` block (~line 1380)
- Action: processing logic to capture file bytes.
- Update `resume_data` dictionary construction (~line 1448) to prioritize local `file_bytes` if available, falling back to session state.

## Verification Plan

### Manual Verification
1.  Redeploy the application.
2.  Open the "Standard Analyzer" tab.
3.  Upload a new PDF/DOCX.
4.  Click "Analyze My Resume".
5.  Check the Admin Dashboard.
6.  The new entry should allow downloading the file.

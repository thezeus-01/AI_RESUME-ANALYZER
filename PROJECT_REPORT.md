# SMART RESUME AI - Project Report
**Created by: Ashwath**

## 1. Project Overview
**Smart Resume AI** is an advanced, AI-powered application designed to revolutionize the recruitment and job preparation process. By leveraging Google's Gemini Pro AI model, the system analyzes resumés against job descriptions, provides detailed scoring (ATS Score), and offers actionable feedback to improve a candidate's chances of selection.

### Purpose
In the modern competitive job market, Applicant Tracking Systems (ATS) often filter out qualified candidates due to poor formatting or missing keywords. This project aims to:
- Democratize access to professional resume analysis.
- Provide instant, AI-driven feedback.
- Bridge the gap between job seekers and recruitment algorithms.

## 2. System Architecture
The application is built on a modular architecture separating the user interface, logic processing, and database management.

- **Frontend**: Streamlit (Python-based web framework) for a responsive and interactive UI.
- **Backend Logic**: Python scripts handling file parsing (PDF/DOCX), AI interaction, and data processing.
- **Database**: SQLite for storing resume data, analysis results, and admin logs.
- **AI Engine**: Google Gemini Pro via Generative AI API for content understanding and recommendation generation.

## 3. Technology Stack

### Frontend
- **Streamlit**: For building the web application interface.
- **HTML5/CSS3**: Custom styling for a modern, dark-themed aesthetic.
- **Plotly**: For interactive charts and visualizations.
- **Streamlit-Option-Menu**: For navigation.

### Backend
- **Python 3.x**: Core programming language.
- **Pandas**: Data manipulation and analysis.
- **PyPDF2 / PDFMiner**: Extracting text from PDF resumes.
- **Python-Docx**: Parsing DOCX files.

### AI & Machine Learning
- **Google Gemini Pro**: Large Language Model (LLM) for intelligent text analysis.
- **Prompt Engineering**: Custom prompts to guide the AI in evaluating resumes as an expert HR recruiter.

### Database
- **SQLite**: Lightweight, serverless relational database.
- **SQLAlchemy**: ORM (Object Relational Mapper) for database interactions.

## 4. Key Features
1.  **AI Resume Analysis**: detailed breakdown of strengths, weaknesses, and an overall match score.
2.  **Resume Builder**: Form-based tool to generate structured resume data.
3.  **Dashboard**: Visual analytics of resume performance and submission history.
4.  **Admin Portal**: Secure access for administrators to view and manage all submissions.
5.  **Job Search Integration**: Tools to help users find relevant job openings.

## 5. Implementation Steps

### Step 1: Environment Setup
- Configured Python virtual environment.
- Installed dependencies (`streamlit`, `google-generativeai`, `pandas`, `sqlalchemy`, etc.).

### Step 2: Database Design
- Designed schema for `Resume`, `Analysis`, and `Admin` tables.
- Implemented `utils/database.py` for CRUD operations.

### Step 3: Core Logic Development
- Created `ResumeAnalyzer` class to handle text extraction and scoring.
- Integrated Google Gemini API for semantic analysis.

### Step 4: UI Development
- Built a modular UI with `app.py` as the entry point.
- Styled with custom CSS for a premium user experience (Dark Mode).

### Step 5: Integration & Testing
- Connected UI forms to backend processing.
- Verified file uploads and AI response accuracy.
- Implemented Admin authentication and security.

## 6. Code Structure
- `app.py`: Main entry point and UI orchestration.
- `utils/`: Helper modules (database, file parsing).
- `config/`: Configuration settings (database paths, constants).
- `style/`: Custom CSS files.
- `assets/`: Images and static resources.

## 7. Conclusion
Smart Resume AI successfully demonstrates the application of Generative AI in the HR domain. It provides a practical solution for job seekers to optimize their profiles and allows recruiters to efficiently manage incoming applications.

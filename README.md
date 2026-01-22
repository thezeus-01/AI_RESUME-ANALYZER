# Smart Resume AI

**Developed by: Ashwath**

## Project Overview
Smart Resume AI is an intelligent, AI-powered document analysis system designed to help job seekers optimize their resumes for Applicant Tracking Systems (ATS). Using Google's Gemini Pro model, the application provides detailed feedback, scoring, and actionable recommendations to improve hiring chances.

## Key Features
-   **AI-Powered Analysis**: Instant feedback on resume content, formatting, and keyword matching.
-   **ATS Scoring**: specific scoring algorithms to mimic real-world recruitment systems.
-   **Resume Builder**: Guided tool to create professional, ATS-friendly resumes.
-   **Interactive Dashboard**: track improvements and submission history.
-   **Job Search**: Integrated tools to find relevant job openings.
-   **Admin Portal**: Management system for reviewing user submissions.

## Tech Stack
-   **Frontend**: Streamlit, HTML5, CSS3, Plotly
-   **Backend**: Python, Pandas, SQLAlchemy
-   **AI Model**: Google Gemini Pro (Generative AI)
-   **Database**: SQLite

## Setup Instructions

1.  **Clone the Repository**
    ```bash
    git clone <repository-url>
    cd RESUME_RA
    ```

2.  **Install Dependencies**
    ```bash
    pip install -r requirements.txt
    ```

3.  **Configure Environment**
    -   Create a `.env` file in the root directory.
    -   Add your Google API Key: `GOOGLE_API_KEY=your_key_here`

4.  **Run the Application**
    ```bash
    streamlit run app.py
    ```

## Credits
This project was conceptualized and developed by **Ashwath** as a comprehensive solution for resume optimization.

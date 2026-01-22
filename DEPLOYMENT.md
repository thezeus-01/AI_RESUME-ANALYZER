# Deployment Guide

This guide explains how to deploy **Smart Resume AI** to Render using Docker.

## Prerequisites
-   GitHub Account
-   [Render](https://render.com) Account
-   Google API Key (for Gemini Pro)

## Option 1: Deploy to Render (Easiest)

1.  **Push to GitHub**:
    -   Commit all your changes (including `Dockerfile` and `render.yaml`) and push to your GitHub repository.

2.  **Create New Web Service on Render**:
    -   Go to your Render Dashboard.
    -   Click **New +** -> **Web Service**.
    -   Connect your GitHub repository.

3.  **Configure Settings**:
    -   **Runtime**: Select **Docker**.
    -   **Region**: Choose a region close to you (e.g., Singapore, Frankfurt).
    -   **Instance Type**: **Free** (Note: The app is heavy; Free tier might be slow).
    -   **Environment Variables**:
        -   Add `GOOGLE_API_KEY`: Your actual Google API key.

4.  **Deploy**:
    -   Click **Create Web Service**.
    -   Render will build the Docker image (this takes 5-10 minutes).
    -   Once you see "Live", click the URL to access your app.

## Option 2: Run with Docker Locally

1.  **Build the Image**:
    ```bash
    docker build -t resume-ai .
    ```

2.  **Run the Container**:
    ```bash
    docker run -p 8501:8501 -e GOOGLE_API_KEY=your_key_here resume-ai
    ```

3.  **Access**:
    -   Open `http://localhost:8501` in your browser.

## Option 3: Deploy via Docker Hub (Recommended for Speed)
This method avoids "Out of Memory" or "Timeout" errors during Render's build process.

1.  **Login to Docker Hub**:
    ```bash
    docker login
    ```

2.  **Tag your Image**:
    Replace `<username>` with your actual Docker Hub username.
    ```bash
    docker tag resume-ai <username>/resume-ai:latest
    ```

3.  **Push to Docker Hub**:
    ```bash
    docker push <username>/resume-ai:latest
    ```

4.  **Deploy on Render**:
    -   Click **New +** -> **Web Service**.
    -   Select **"Deploy an existing image from a registry"**.
    -   Enter your image path: `docker.io/<username>/resume-ai:latest`
    -   Add your `GOOGLE_API_KEY` in Environment Variables.

## Troubleshooting
-   **Build Failures**: Check the logs on Render. Sometimes the free tier runs out of memory during build.
-   **Job Search Fails**: If Chrome crashes, it might be due to shared memory limits. Render usually handles this, but `webdriver_utils.py` is configured to disable shared memory usage (`--disable-dev-shm-usage`).

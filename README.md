# Bitasmbl-Influencer-Engagement-Analyzer-7a68d5-Nodar_Mebunia

## Description
Build a platform that analyzes social media influencer performance by aggregating engagement metrics such as likes, comments, follower growth, and post frequency. The system provides insights, comparisons, and visual summaries to help users evaluate influencer impact and trends.

## Tech Stack
- Objective-C
- Spring
- Chart.js

## Requirements
- Handle missing, inconsistent, or rate-limited API data
- Calculate engagement rates, trends, and performance indicators
- Fetch influencer data from social media APIs or datasets
- Display insights using charts, comparisons, and intuitive visuals
- Allow users to search, filter, and compare influencers

## Installation
Follow these steps to set up the project locally.

1. Clone the repository (use the provided repo owner username):

   git clone https://github.com/MrBitasmblTester2/Bitasmbl-Influencer-Engagement-Analyzer-7a68d5-Nodar_Mebunia.git

2. Prepare the Spring backend

   - From the repository root, locate the Spring module (the module containing pom.xml or build.gradle).
   - Build the backend with Maven (from the Spring module directory):

     mvn clean install

   - To run the backend during development:

     mvn spring-boot:run

   Note: If the project uses Gradle instead of Maven, run the equivalent Gradle commands (e.g., ./gradlew build and ./gradlew bootRun) from the Spring module directory.

3. Prepare Objective-C client (iOS/macOS)

   - Open the Xcode project or workspace included in the repository with Xcode to build and run the Objective-C client:

     open Path/To/Project.xcodeproj

   - To build from the command line (example):

     xcodebuild -project Path/To/Project.xcodeproj -scheme YourScheme -configuration Debug

   Replace Path/To/Project.xcodeproj and YourScheme with the actual paths and scheme names present in the repository.

4. Install Chart.js (frontend visualization)

   - Chart.js can be included via CDN or downloaded into the project's static assets. Example: download a production build into a static/js folder:

     mkdir -p public/js
     curl -L -o public/js/chart.min.js https://cdn.jsdelivr.net/npm/chart.js

   - Alternatively include the Chart.js CDN script tag in the HTML assets served by the backend or embedded in the Objective-C client’s web view.

5. Environment variables

   The Spring backend and integrations that fetch social media data commonly require API credentials and connection configuration. Set these in your shell or system environment before running the backend.

   Example environment variables (set only those that apply to your deployment):

   export SOCIAL_API_KEY="your_social_api_key"
   export SOCIAL_API_SECRET="your_social_api_secret"
   export SPRING_DATASOURCE_URL="jdbc:your_database_url"
   export SPRING_DATASOURCE_USERNAME="db_user"
   export SPRING_DATASOURCE_PASSWORD="db_password"

   Note: Replace values with the credentials for the social APIs or data sources you will use.

## Usage
These usage steps show how to start the backend and run the Objective-C client that consumes the backend and renders Chart.js visualizations.

1. Start the Spring backend

   - From the Spring module directory, run:

     mvn spring-boot:run

   - The backend will start and expose REST endpoints for searching, filtering, comparing influencers and returning computed metrics.

2. Prepare Chart.js assets

   - Ensure chart.min.js is available under the static assets served by the backend (e.g., public/js/chart.min.js) or that the Objective-C client loads Chart.js via CDN.

3. Run the Objective-C client

   - Open the Xcode project and run the app on a simulator or device. The Objective-C client should use NSURLSession (or equivalent) to call backend endpoints, display lists and comparisons, and render Chart.js visuals either by serving HTML from the backend or by loading local HTML into a WKWebView.

4. Search, filter, compare

   - Use the app's UI to search and filter influencers. When comparing influencers, the client will call the appropriate backend endpoints to fetch aggregated engagement metrics, trends, and time-series data for Chart.js visualizations.

## Implementation Steps
1. Initialize the Spring project (Maven or Gradle) and create a module to serve API endpoints for influencer data and computed metrics.
2. Define domain models in the backend for influencer profiles, posts, and aggregated metrics (likes, comments, followers, posts, timestamps).
3. Implement social data fetchers (clients) in Spring to retrieve influencer data from social media APIs or ingest datasets. Use Spring RestTemplate or WebClient for HTTP requests.
4. Implement robust API client logic to handle missing/inconsistent data, retries, backoff, and rate-limit responses (e.g., inspect HTTP 429 and apply exponential backoff and caching of results).
5. Create services that calculate engagement rates, follower growth, post frequency, trend indicators, and other performance metrics from raw data (per requirement).
6. Expose REST endpoints that return: influencer lists, influencer detail (including computed metrics), search/filter query results, and compare payloads for multiple influencers.
7. Serialize endpoints to return JSON payloads consumable by the Objective-C client and Chart.js (time-series arrays, labels, and metric values).
8. Add server-side pagination and filtering support for search endpoints to allow clients to request subsets of influencers.
9. Prepare static web assets (HTML/JS) that include Chart.js (chart.min.js) for rendering charts if serving a web preview from the backend.
10. Implement the Objective-C client: use NSURLSession to call backend APIs, parse JSON responses into native models, and provide UI for search, filter, and compare flows.
11. Integrate a WKWebView (or local HTML rendering strategy) in the Objective-C app to load an HTML snippet that initializes Chart.js with data passed from the native layer to render visual summaries, trend charts, and comparisons.
12. Implement local caching and error handling in the Objective-C client to gracefully handle intermittent backend failures or missing data.
13. Add logging and metrics in the backend for API call success, rate-limit occurrences, and data completeness to aid debugging and reliability improvements.
14. Write tests: unit tests for metric calculations, integration tests for API clients (mocking social API responses), and UI/integration tests for the Objective-C client.

## API Endpoints (Optional)
- GET /api/influencers
  - Returns a paginated list of influencers and basic aggregated metrics; accepts search and filter query parameters.

- GET /api/influencers/{id}
  - Returns detailed influencer data including time-series metrics required for charting and trend analysis.

- POST /api/compare
  - Accepts a list of influencer IDs and returns comparative metrics and time-series data for visualization and side-by-side analysis.

- GET /api/health
  - Basic health check endpoint for the backend service.
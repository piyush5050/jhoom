# Jhoom: Architecture & Implementation Plan

## Overview
Jhoom is a Loom alternative that allows users to record their screen, camera, and audio through a Chrome extension. The application focuses on simplicity, ease of use, and fast development.

## Architecture

### Core Components

#### 1. Chrome Extension
- Uses MediaRecorder API and Chrome's desktopCapture API
- Handles screen capture, webcam recording, and audio recording
- Performs basic compression in-browser
- Uploads recordings to the Rails backend

#### 2. Rails Backend
- Manages user authentication and authorization
- Stores video metadata in PostgreSQL
- Handles video storage via CloudFlare R2 (using Active Storage)
- Provides API endpoints for the Chrome extension
- Serves the web UI for video management and sharing

## Technology Stack

- **Frontend**: Ruby on Rails 7 with Stimulus JS and Tailwind CSS
- **Backend**: Ruby on Rails 7 API endpoints
- **Database**: PostgreSQL
- **Storage**: CloudFlare R2 (via Active Storage)
- **Extension**: Chrome Extension with JavaScript
- **Authentication**: Devise
- **Authorization**: Pundit (if needed)
- **Background Jobs**: Solid queue with Postgres (for handling uploads)

## Implementation Plan

### Phase 1: Rails Backend - Basic Setup
1. ✅ **User Authentication with Devise**
   - Setup Devise for user registration and login
   - Create basic user profiles
   - Implement session management
   - *Deliverable: Working login and registration system*

2. **CloudFlare R2 Integration**
   - Configure Active Storage with CloudFlare R2
   - Add environment variables for credentials
   - Test direct uploads with a simple form
   - *Deliverable: Ability to upload a sample video file to R2*

3. **Video Model and Management UI**
   - Create Video model with metadata (title, description, privacy, etc.)
   - Build dashboard UI for listing user's videos
   - Implement basic CRUD operations for videos
   - Add simple video player
   - *Deliverable: Basic video management dashboard*

4. **API Endpoints for Extension Integration**
   - Create API endpoints for extension authentication
   - Implement video upload API
   - Add metadata update endpoints
   - *Deliverable: API endpoints that can be tested with Postman*

### Phase 2: Chrome Extension Development
1. **Basic Extension Setup**
   - Create manifest.json
   - Setup popup UI
   - Implement extension authentication with Rails backend
   - *Deliverable: Chrome extension that connects to the Rails backend*

2. **Screen Recording Implementation**
   - Implement screen capture using desktopCapture API
   - Add recording controls (start, stop, pause)
   - Build basic UI for recording options
   - *Deliverable: Ability to record screen*

3. **Camera and Audio Integration**
   - Add webcam access and recording
   - Implement audio recording
   - Create UI for toggling camera/audio
   - *Deliverable: Complete recording functionality*

4. **Video Upload and Processing**
   - Implement video compression (if needed)
   - Create upload mechanism to Rails backend
   - Add progress indicators
   - *Deliverable: End-to-end recording and uploading*

### Phase 3: Core Features
1. **Sharing & Privacy**
   - Implement video sharing functionality
   - Add privacy controls (public, private, password-protected)
   - Create shareable links
   - *Deliverable: Ability to share videos with others*

2. **Video Player Enhancements**
   - Improve video player with playback controls
   - Add speed controls, fullscreen, etc.
   - Implement responsive design
   - *Deliverable: Enhanced video playback experience*

3. **Dashboard Improvements**
   - Add video thumbnails
   - Implement search and filtering
   - Create organizational folders/projects
   - *Deliverable: Improved video management*

### Phase 4: Polish and Launch
1. **UI/UX Refinement**
   - Polish all user interfaces
   - Ensure responsive design
   - Implement loading states and error handling
   - *Deliverable: Polished user experience*

2. **Performance Optimization**
   - Optimize video uploads
   - Improve page load times
   - Enhance API performance
   - *Deliverable: Fast and responsive application*

3. **Testing & Bug Fixes**
   - Perform end-to-end testing
   - Fix discovered issues
   - Test across different Chrome versions
   - *Deliverable: Stable application ready for launch*

## Development Approach
- Each phase should result in a working increment that can be tested locally
- Focus on simplicity and functionality over perfect implementation
- Use existing gems and libraries wherever possible to speed up development
- Commit code frequently with descriptive commit messages
- Prioritize user experience and ease of use

## Future Considerations (v2+)
- Video editing capabilities with FFMPEG
- Team collaboration features
- Analytics and insights
- Integration with other platforms (Slack, Microsoft Teams, etc.)
- Support for additional browsers

# FinalProject: Meditation Timer and Tracking App

## Overview

This app is designed to help users meditate by providing a customizable meditation timer and a tracking calendar to monitor consistency. Additionally, the app features a section for calming music and mental health tips

## Author

- **Name**: Alan Lu
- **ID**: 2378209
- **Email**: allu@chapman.edu
- **Course**: CPSC 357
- **Assignment**: Final Project

## Features

- **Meditation Timer**: A customizable timer with start, pause, and reset functionalities. The timer progress is visually represented using a circle.
- **Consistency Tracking**: A calendar view that shows the days on which the user has completed their meditation session.
- **Calming Music**: A section to play calming music from YouTube directly within the app.

## Usage

### Meditation Timer

1. Open the app and navigate to the "Timer" tab.
2. Start the timer by pressing the "Start" button.
3. Pause the timer by pressing the "Pause" button.
4. Reset the timer by pressing the "Reset" button.
5. Completed days will be marked on the calendar.

### Consistency Tracking

1. Navigate to the "Calendar" tab to view your meditation consistency.
2. Completed meditation days are marked with a blue dot.

### Calming Music

1. Navigate to the "Music" tab.
2. Press the play button to start the video.
3. Adjust the volume using the slider.

## Code Structure

### Main Components

- **ContentView**: The main view that holds the tab view for navigation.
- **MeditationTimerPage**: The view that contains the meditation timer.
- **ConsistencyTrackingPage**: The view that shows the calendar for tracking consistency.
- **MusicPage**: The view that contains the YouTube video player for calming music.
- **CalendarView**: A custom UIViewRepresentable to integrate FSCalendar into SwiftUI.
- **VideoView**: A custom UIViewRepresentable to integrate WKWebView for playing YouTube videos.

### Models

- **TimerModel**: Handles the logic for the meditation timer.
- **CompletedDaysModel**: A shared data model to track completed meditation days.

### Files

- **CalendarView.swift**
- **CompletedDaysModel.swift**
- **ConsistencyTrackingPage.swift**
- **ContentView.swift**
- **FinalProjectApp.swift**
- **GuidedMeditationPage.swift**
- **MusicPage.swift**
- **TimerModel.swift**
- **TopicDetailModel.swift**
- **VideoView.swift**

## Known Issues

- With WKWebView, you are unable to keep the video embedded, and it will force you to go fullscreen.
- Data does not store between opening and closing the app.
- The app requires the FSCalendar package/dependency. github.com/WenchaoD/FSCalendar

## References

- I got help with the Video View from this video: [YouTube Video](https://www.youtube.com/watch?v=CX-BdDHW0Ho)
- Used ChatGPT to generate mock data for the Tips section.
- Read documentation about FSCalendar.

## Dependencies

- **FSCalendar**: A custom calendar view component.
- **WKWebView**: Used to embed YouTube videos.

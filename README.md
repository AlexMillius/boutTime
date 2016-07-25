# BoutTime
Treehouse iOS Techdegree Project #3

For this project, you’ll be building an actual game, ‘Bout Time, from the ground up.

Specifically, the game involves users taking historical events and seeing if they can put them in the correct chronological order. A single round of play consists of ordering four random events and there are six rounds played in one full game. You will not only write the code and build the User Interface, but you’ll also decide what kind of events to quiz the user about. We hope you embrace that aspect and pick a topic you’ll enjoy - it’ll help you stay motivated and be more fun to show off when you’re done.

In terms of overall difficulty, this app is roughly the same as the Quiz app you worked on in Project 2, but of course this time, you’ll be starting from scratch. Don’t let that scare you. You have most, if not all of of the tools you need to get the job done. That said, don’t be surprised if you need to re-watch video or ask the community for help. Also, we aren’t requiring you to add any audio for the project, but if you’d like to, we’ve provided a few sounds for you to use.

# Project Requirements

Create a list of at least 25 “historical” events to be used as the content for the game. If you’d like the game to be playable many times, we suggest a list of at least 40 events, but that is not required.

Create types to model events as well as any other entities you think should be modeled using custom types.

Create functions to randomly populate the events for each round of play, making sure no event appears twice in the same round of play. (An event may be repeated during a game, just not in an individual round.)

Create logic to allow users to re-order events using the up and down buttons. (Note, the labels containing the events should not move, but rather be re-populated when events are moved up and down.

Create a function to assess whether or not events were ordered correctly. Points should be awarded for fully correct solutions only and then another round of play begins. You can choose whether the oldest events should be at the top or at the bottom, depending on your game's content and feel free to add a text label or icon to signal that to to users.

Create a countdown timer to give users 60sec to correctly order the events. When the timer expires, the events are checked for correct order.

If a user completes the ordering in less than 60secs, they should be able to shake the device in order to check order immediately.

Create logic such that after 6 rounds of play the game concludes and a total score is displayed.

Build all user interface as per the provided mockups. The app should display correctly on any iPhone 4.7in or larger. Be sure to integrate the App Icons provided.

Optional: Add a feature such that at conclusion of each round users can tap events and be presented with a WebView or SafariViewController displaying a url with information about the event. Users can close the webview and resume game play. A sample of this feature is shown in the project mockups.

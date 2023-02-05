# GenwinEvaluationTask
This task about hiring proccess at [Genwin.io](https://genwin.io/) as an iOS developer.
## Task Requirements:-
- create an app that fetches a movies list and displays it in the grid.
- every grid item will open the clicked movie details.
- You need to connect to this [API](https://yts.mx/api) and you will find everything you need (Movies – Details)
## What I use:-
- **Architecture Pattern: Model-View-ViewModel (MVVM)** | *Why?*
     - To separate business logic from View layer
     - Avoid to make viewController massive view controller
     - Make code testable
- **Alamofire pod** for handling networking.
- **Kingfisher pod** for downloading images and set empty placeholder
- **User Interface:** Using Xib/Nib Files
- **YouTube-Player-iOS-Helper pod** for fetching and playing video by using *videoId*
- **Native indicator by animate GIF file**
- **Native Image Viewer to present and zooming images**
     - you can try it by tapping on images at movieDetails screen
 - **Handling empty view**
     - if I don't hanve data in view, it will be hidden like cast and screenshots views in movie details.
 - **Extensions to reduce and avoid duplicate code**
     - like dequeue and register reusableCell
 - **Custom Colors for Views,fonts,backgrounds ...etc***

## Note:-
- **- I passed synopsis from movies List to movie details because movie details response didn’t include it**

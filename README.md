# MusicMe

Simple music player using flutter, Music from Itunes.

## Features

1. Will code search your favourite artist/song in iTunes!, play & enjoy!
2. Pause, prev, next & seek on duration of your song.
3. Search other song while still listening to the current song or just push button next or prev (vice verca) to play song from the list.
4. Error handling api, empty search and many more.

## Link Download build .apk

- [Gdrive](https://drive.google.com/drive/folders/1GDyKWi5HYKpWxIc0qzZpzV_lndV4Cxec?usp=sharing)

## Develop or build App requirements

- Graddle version gradle-6.7-all.zip
- installed Android studio and Flutter
- Flutter v3.3.0 on channel stable
- Dart verrsion v2.18.0
- Simulator or Android device minSdk 23 [marshmallow](https://androidsdkoffline.blogspot.com/p/android-sdk-60-api-23-marshmallow.html) you can just download it from your android studio.

## Supported Device

-Simulator or Android device minSdk 23 [marshmallow]
-Ios OS IPhone 9.0

## Instruction Deploy in your local environment

1. Clone from this repository by download zip or https or ssh (recommended using https or ssh)
   - Copy repository url
   - Open your fav code editor _(Recommended using Android Studio or Visual Studio Code)_
   - _(Android Studio)_ New -> Project from Version Control.. -> Paste the url, click OK
   - _(Visual Studio Code)_ create folder where do you want, open terminal and paste url clone then enter -> open root folder.
2. Run "flutter pub get" in the project directory or click the highlighted instruction in Android Studio or Visual Studio Code
3. Prepare the Android Virtual Device or real device _(Make sure its supported device)_
4. Run main.dart

## Project Code Infrastructure & Design Pattern

This App project directory consist of 4 directories (Preparation for preparation for the next possible complex feature & scallable code)

### Design pattern or state management used

- State Management [BLOC](https://bloclibrary.dev/#/)
- Design Patter [RepositoryPattern](https://blog.logrocket.com/implementing-repository-pattern-flutter/#:~:text=Flutter%20developers%20use%20various%20design,widgets%20into%20private%20methods%2Fclasses.)

### Folder Structure & Description

1. **presentations**: _Inside lib folder consists folder presentation which is folder for mainly structured view or presentation to users_
   - `router folder`: _folder for declare onGenerateRoute which more scalable route for wide complex project, define class screen in switch case and call it directly to its named route class_
     > `app_router.dart` : file class ongenerated route which is called in main.dart to initialize route page for first launching App route begin by '/' where it is splashscreen.
   - `screens folder`: _folder for main page statefull widget of each feature in app_
   - `widgets folder`: _consists widgets that build the main screen (homepage) and do it's function and its reusable_
2. **logic** : _Inside lib folder consists folder logic which is folder for handle complex logic for the main page of the feature_
   - `cubit`: _folder for bloc statemanagement and business logic where made_
   - `function`: _empty folder for now but very useful in the future to accommodate Class helper functions that help reduce spaghetti code functions on the main view screen page where project is getting more complex_
3. **constant** : _folder for files provide constants value file to the project example: api constant, colors, class abstract, device service value bluetooth , camera etc_
4. **repository** : _folder for interface api, api class function, and model interface_

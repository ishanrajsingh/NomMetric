# Contributing to NomMetric

Thank you for your interest in contributing to **NomMetric** as part of **OpenCode’25**.

This document outlines the complete process for setting up the project, claiming issues, and submitting pull requests to contribute to NomMetric.

Please read this carefully before starting your contribution. Yes, even if you’ve contributed to other projects before.

Also read [Participant Rule Book](Participant_Rulebook_Updated.pdf).

---

## Prerequisites

Before contributing, make sure you have the following(and a bit of patience for this long guide):

- Basic knowledge of **Git and GitHub**.
- Flutter and Android Studio/ XCode set up .
- Make sure you also have the Android SDK installed for emulating the app (refer to the README for exact versions).
- Registered for **OpenCode’25** and completed all required event registrations

---

**PRO TIP**: Follow the next sections carefully to ensure a smooth setup. Skipping steps may result in unexpected bugs, mild confusion, or talking to your screen.

## Setting Up the Project Locally

1. Fork the repository to your Github.

2. Clone your fork locally:
   ```bash
   git clone https://github.com/<your-username>/NomMetric.git
   cd NomMetric
   ```

3. Run the following command to fetch all required Flutter packages defined in `pubspec.yaml` :
    ```bash
    flutter pub get
    ```

4. Link the project to your own Firebase project

  This project uses **Firebase** as its backend server.  
  Each contributor must connect the app to their own **Firebase Project** in order to run the app locally.

  You can follow **either** of the methods below.

  ### Method 1: Using Firebase Console (Manual)
  1. Go to the [**Firebase Console**](https://console.firebase.google.com/).

  2. Sign in using your Google account.

  3. Click **Add project** and create a new Firebase project.
    - **Project name**: anything
    - **Google Analytics**: optional (either is fine)

  4. After the project is created, add an **Android app**:
    - Use the same package name as `applicationId` from `android/app/build.gradle`- **Do NOT change the applicationId in the codebase**

  5. Download the generated **`google-services.json`** file.

  6. Place the file inside as `android/app/google-servies.json`.

  7. Enable Firebase services:
    - Go to **Build → Firestore Database**
    - Click **Create database**
    - Select **Test mode** (recommended for development)


  ### Method 2: Using FlutterFire (Recommended)
  FlutterFire automates Firebase configuration and supports multiple platforms.

  #### Step 1: Install FlutterFire CLI (all OS)
  Run this command in your terminal:

    dart pub global activate flutterfire_cli

  If `flutterfire` command is not founf, make sure you add Dart's global binaries to your `PATH` by:
  - **Linux/MacOS**:
    ```bash
    export PATH="$PATH:$HOME/.pub-cache/bin"
    ```
  - **Windows**:
    ```bash
    setx PATH "%PATH%;%LOCALAPPDATA%\Pub\Cache\bin"
    ```

  #### Step 2:Configure Firebase
  From the root of the project folder run :
  ```bash
  flutterfire configure
  ```
  During the interactive setup:
  - Select the Firebase project you created
  - Choose the platforms you want to support  
    (Android is required, Web is recommended)
  - Accept the default options unless you know what you are changing

  After successful configuration, FlutterFire will automatically generate the:
  - `lib/firebase_options.dart` file.
  - Platform-specific Firebase configuration files

    These files are required for Firebase to work correctly across platforms.


5. Verify your setup with
    ``` bash
    flutter doctor
    ```
    This command checks your flutter and SDK installation, follow the next section to setup your emulator (Slightly different for different OS's, try to follow the comprehensive guide).

## Setting up an Emulator / Device for testing
NomMetric is a Flutter project and can be run on **Android emulators**, **physical devices**, or can be run on **web**. Choose the option that best fits your setup, avoid RAM-hungry devices unless you enjoy watching your laptop suffering.

### Android Emulator (Best Recommended Method):
Android emulators are supported on **Linux**, **macOS**, and **Windows**.
1. Open **Android Studio**.
2. Go to **Device Manager**.
3. Create a new **Virtual Device**:
    1. Choose a Pixel device(5 or newer, try choosing something that doesn't eat half your RAM).
    2. Select an Android system image with **API Level 35(Android 15).
4. Start the emulator.
5. Verify that flutter detects the emulator by
``` bash
flutter devices
```
You should see your virtual device listed.

### IOS Simulator (For the inferior OS):
This step is only applicable for **macOS users** who want to test the project on iOS.
1. Install **Xcode** from the app store.
2. Install IOS simulator tools :
```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

### Physical Android Device (Recommended if your laptop sounds like it’s about to take off)
You can also run the project on a real android phone.
1. Enable **Developer Options** and **USB Debugging** on your phone.(Yes, Android still hides this setting under developer options. No one knows why)
2. Connect the device via USB or use wireless pairing in **Android Studio**.
3. Verify the connection by listing the devices.

### Web Support(Optional)
Flutter web is also supported on all the OS. Great for quick testing and debugging, less great for judging performance.
1. Enable the support
```bash
flutter config --enable-web
```
You may have to change the `CHROME_EXECUTABLE` to use your own browser instead of chrome.

### Some notes:
1. Web support is intended for development and testing of web apps, it may need additional setup for multiple flutter packages to work properly
2. If the emulator takes time to boot, it’s not frozen(mostly) — it’s just thinking.
3. **Android emulation** or a **Physical device** is the recommended environment for OpenCode'25 contributors. 
4. If nothing works, re-run `flutter doctor`, restart your IDE, and then try again. This solves more problems than it should.

## Claiming Issues
All contributions to NomMetric are via **PR's** and must be linked to an existing issue. They should also follow the [Participant Rules](Participant_Rulebook_Updated.pdf).
### Types of issues
Issues opened in this repo are categorized into
1. Open for all(OFA):
 - No claiming required.
 - Multiple PR's will be allowed and merged.
2. Competitive issues:
 - Multiple contributors can work on this issue.
 - All valid PRs are reviewed.
 - The best one is merged.
3. First-come issues:
 - These must be claimed before starting the work.
 - Only one person who claimed will be allow to submit a PR.
 - There's usually a time limit to these.

If an issue requires claiming:
1. comment on the issue.
2. Wait for it to be assigned to you.
3. Start working only if it's been officially assigned to you.

## Need Help?

If you’re stuck, confused, or just want to double-check something, feel free to ask.

- You can comment on the relevant issue.
- You can also DM me directly on Discord:  
  👉 **[VirtualVard](https://discord.com/users/VirtualVard)**

No question is too small...

---

## Working on an Issue

Once your issue is assigned:

- Create a new branch from `main`.
- Make your changes while following:
  - The existing project structure
  - Coding conventions used in the codebase
  - Proper documentation and readable code
  - Firebase usage rules
  - Anything explicitly mentioned in the issue description
- Test your changes locally (yes, actually run the app).
- Make sure you also create a new entry at [contributors.md](contributors.md).

### Where to Add Your Code

Most of your work will be inside the `lib/` directory.  
Use the following as a general guideline:

- `lib/main.dart`  
  - App entry point  
  - App-level configuration, routing setup, and providers

- `lib/screens/`  
  - Full-page UI screens (e.g., HomeScreen, LoginScreen, ProfileScreen)
  - If your issue adds a new screen, it usually belongs here

- `lib/widgets/`  
  - Reusable UI components  
  - Buttons, cards, list items, dialogs, etc.

- `lib/services/`  
  - Firebase, Firestore, and backend-related logic  
  - Authentication, database reads/writes, APIs

- `lib/models/`  
  - Data models (e.g., User, Meal, Rating)
  - If you add new Firestore collections, define their models here

- `lib/provider/`  
  - State management logic using Riverpod
  - Providers, not UI

If you’re unsure where something belongs, **ask before writing a lot of code** — it saves everyone time.

---

## Submitting a Pull Request (PR)

When your work is complete:

- Push your branch to your fork.
- Open a Pull Request to the `main` branch of this repository.

Ensure your PR:
- Clearly references the issue number
- Has a concise but descriptive title
- Explains **what** you changed and **why**
- Mentions any assumptions or design decisions you made

**Example PR title:**
> Fixes #42 – Added meal rating persistence using Firestore

---

### Important PR Rules (Read Carefully)

- Do **not** include unrelated changes in the same PR.
- One PR should ideally solve **one issue**.
- Follow all rules mentioned in the  
  [**Participant Rule Book**](Participant_Rulebook_Updated.pdf).


---

### After Submitting Your PR

- Be patient — reviews take time.
- Address requested changes if any.
- Keep discussions respectful and constructive.

---

*If something feels unclear at any point, reach out — the goal is to help you succeed.*



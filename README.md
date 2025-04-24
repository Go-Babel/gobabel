> ❌ Not prod ready yet.

### ▶️ go_babel: The official package of GOBABEL
A package for translating your code base with only `one command`. The package will `extract` the `hard-coded` strings, recognize what strings are configurations strings and what of them are labels that will be displayed to the final user and should be translated. Then, all files are uploaded to gobabel servers and bal be visualized in your dashboard.

> ✨ The package will do 100% of the work, for practically any usecase.<p>If you have a "partial" translated app, with some strings with 

### 🗂️ *Summary*
- [How to start]
    - [Get api key](#1---get-api-key)
    - [Create the project](#2---create-the-project)
    - [Add app context per feature](#3---add-app-context-per-feature)
    - [Run the translate command](#4---run-the-translate-command)


# How to start
Bellow is all you need to get started. The package usage could not be more simple, so one quick 2m read is enought to understand everthing.     

## #1 - Get api key
Enter Go Babel site, create an account and the first thing you will see is your api key. It will be right in your face so you don't lose time, it's a really quick configuration

## #2 - Create the project
In the code base of the project you wan't to internationalize, run `--go_babel sync --api-key="YOUR_API_KEY"`<br>
That's all, go back to Go Babel dashboard, refresh the page, and you will see the project there.
> ⚠️ You will (probably) only run this command one time, when creating the project.<br>Then, you will mainly run only the command in step 4

## #3 - Add app context per feature
🤖🎨 Go Babel uses AI to translate the labels.<br>
This is great because we can pass context about the app so the translation can be most accurate as possible.<br>
Now, going back to the Go Babel site, go to "app context tab".<br>
Add a context text of the project before generating the translations.<p>
Also, one of the *coolest* thing about Go Babel is that you can add context by features.<br>You will see a hole overview of the folders in your project and you can add a context text per folder (assuming that you separate your features by folder, you will will be in fact adding a context per feature).<br>With this, all labels bellow that folder will have the default general app context *and* that other context of that specific folder. You can _"accumulate contexts"_ in the hierarchy of the folders. So, a string label can have multiple context's texts when beeing translated.

## #4 - Run the translate command
In the code base of the project you wan't to internationalize, run `--go_babel generate --api-key="YOUR_API_KEY"`<br>
Just that! You can see the loading progress in your terminal and in a short-time you will see all labels translated to all languages you configurated in your go babel dashboard.
> ⚠️ Notice:<br>The first time you generate the labels it will take a longer time<br>After the first time, the package will use git to track only modified files since last time you excecuted the script and will smartly only look for potential labels strings in them, the modified files. But in the first time, it will need to search in the hole code base.
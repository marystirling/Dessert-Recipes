# Fetch a Dessert

Created by Mary Stirling Brown for Fetch's iOS Coding Challenge

Fetch a Dessert is an app that can be used to retrieve dessert recipes from the following API: [TheMealDB](https://www.themealdb.com/api.php)


### MVVM code layout
1) Views
   - StartView: shows the home screen of the app
   - DessertsListView: navigatable scrolling screen to select a dessert from the alphabetically-ordered list
   - RecipeView: displays selected dessert's name, image, instructions, and ingredients
3) ViewModels
   - DessertsViewModel: holds the asynchronous networking to API for the list of all available desserts
   - RecipeViewModel: holds the asynchronous networking to API for an individual dessert's recipe information
5) Models
   - Dessert: Contains struct for properties for the dessert list
   - Recipe: contains struct for a dessert's recipe properties


### To Run App
- Make sure you have the latest version of xcode
- Clone this repo and open the project in xcode
- Start the simulation on a device of your choosing
- Explore the app and the many recipes provided!

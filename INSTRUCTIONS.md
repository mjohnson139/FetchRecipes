# Fetch - iOS Coding Challenge

Please write a native iOS app that allows users to browse recipes using the following API: [TheMealDB API](https://themealdb.com/api.php).

Your app should utilize these 2 endpoints:
- For fetching the list of meals in the Dessert category: [Dessert Category Endpoint](https://themealdb.com/api/json/v1/1/filter.php?c=Dessert)
- For fetching the meal details by its ID: [Meal Detail Endpoint](https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID)

## User Experience

- Display the list of meals in the Dessert category, sorted alphabetically.
- On selecting a meal, the user should be directed to a detail view displaying:
  - Meal name
  - Instructions
  - Ingredients/measurements

## Guidelines

- Filter out any null or empty values from the API responses before displaying them.
- While the primary focus is not on UI/UX design, the app should be user-friendly and adhere to basic design principles.
- Ensure the project compiles using the latest version of Xcode.

## FAQ

### How do I submit my exercise?

Submit your code by providing a git link to a public repository that contains your code in the "Submit Here" section.

### How will this exercise be evaluated?

An engineer will review your submission. The app must meet the expected results. Include any necessary documentation within the repository. Your solution should be polished, demonstrating your best effort.

### Can I provide a private repository?

Preferably, use a public repository. If necessary, coordinate with your recruiter to grant access to the reviewing engineer.

### How long do I have to complete the exercise?

Aim to complete the exercise within 1 week, but take more time if needed.

### Can I build the UI in UIKit or SwiftUI?

SwiftUI is preferred, but UIKit is acceptable, especially if you're willing to learn SwiftUI.
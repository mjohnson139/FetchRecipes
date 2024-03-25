import SwiftUI

@main
struct FetchRecipesApp: App {
  
  var body: some Scene {
    WindowGroup {
      RecipeListView(model: .mock(numberOfMeals: 100))
    }
  }
}


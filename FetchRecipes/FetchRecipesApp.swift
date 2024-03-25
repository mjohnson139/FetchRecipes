import SwiftUI

@main
struct FetchRecipesApp: App {
  
  var body: some Scene {
    WindowGroup {
      RecipeListView(model: RecipeListModel(recipes: RecipeList.mock(numberOfMeals: 100)))
    }
  }
}


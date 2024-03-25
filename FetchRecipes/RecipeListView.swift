import SwiftUI

class RecipeListModel: ObservableObject {
  @Published var recipes: RecipeList
  
  init(recipes: RecipeList) {
    self.recipes = recipes
  }
  
}

struct RecipeListView: View {
  @ObservedObject var model: RecipeListModel
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(model.recipes.meals) { item in
          Text(item.strMeal)
        }
      }
        .navigationTitle("Recipe List")
    }
  }
}

#Preview {
  RecipeListView(model: RecipeListModel(recipes: RecipeList.mock(numberOfMeals: 10)))
}

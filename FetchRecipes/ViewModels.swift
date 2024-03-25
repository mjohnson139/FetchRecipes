import Foundation
import SwiftUI

class RecipeListModel: ObservableObject {
  let listName: String
  @Published var recipes: [Meal]

  init(listName: String = "Recipe List", recipes: [Meal]) {
    self.listName = listName
    self.recipes = recipes
  }
}

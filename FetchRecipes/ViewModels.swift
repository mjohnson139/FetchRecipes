import Foundation
import SwiftUI

class RecipeListModel: ObservableObject {
  @Published var destination: Destination?
  let listName: String
  @Published var recipes: [Meal]
  
  enum Destination {
    case detail(Meal)
  }

  init(destination: Destination? = .none, listName: String = "Recipe List", recipes: [Meal]) {
    self.listName = listName
    self.recipes = recipes
  }
}

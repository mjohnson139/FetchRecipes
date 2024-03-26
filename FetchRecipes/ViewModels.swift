import Foundation
import SwiftUINavigation
import SwiftUI

class RecipeListModel: ObservableObject {
  @Published var destination: Destination?
  @Published var recipes: [Meal]
  let listName: String
  
  enum Destination {
    case detail(Meal)
  }

  init(destination: Destination? = nil, listName: String = "Recipe List", recipes: [Meal]) {
    self.listName = listName
    self.recipes = recipes
  }
  
  func mealTapped(meal: Meal) {
    self.destination = .detail(meal)
  }
}

import Foundation
import SwiftUI
import SwiftUINavigation
import Dependencies

final class RecipeListModel: ObservableObject {
  @Dependency(\.apiClient.getList) var getList
  
  @Published var destination: Destination?
  @Published var recipes: [Meal]?
  let listName: String

  enum Destination {
    case detail(Meal)
  }

  init(destination: Destination? = nil, listName: String = "Recipe List", recipes: [Meal]? = nil) {
    self.listName = listName
    self.recipes = recipes
  }

  @MainActor
  func loadData() async {
      //Call the client and get the meal list.
    self.recipes =  try! await getList()
  }
  
  func mealTapped(meal: Meal) {
    destination = .detail(meal)
  }
}

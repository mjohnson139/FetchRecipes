import Dependencies
import Foundation
import SwiftUI
import SwiftUINavigation

final class RecipeListModel: ObservableObject {
  @Dependency(\.apiClient.getList) var getList
  @Dependency(\.apiClient.getMealById) var getMealById

  @Published var destination: Destination?
  @Published var recipes: [Meal]?
  @Published var errorMessage: String?

  let listName: String

  enum Destination {
    case detail(Meal)
  }

  init(destination: Destination? = nil, listName: String = "Recipe List", recipes: [Meal]? = nil) {
    self.listName = listName
    self.recipes = recipes
  }

  @MainActor
  func mealTapped(meal: Meal) async {
    await loadMeal(id:meal.id)
  }
  
  @MainActor
  func loadList() async {
    do {
      recipes = try await getList()
    } catch {
      recipes = []
      errorMessage = error.localizedDescription
    }
  }

  @MainActor
  func loadMeal(id: String) async {
    do {
      if let meal = try await getMealById(id) {
        destination = .detail(meal)
      }
    } catch {
      errorMessage = error.localizedDescription
    }
  }


}

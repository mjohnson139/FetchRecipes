import Foundation

extension MealListModel {
  static func mock(numberOfMeals: Int) -> MealListModel {
    let meals = (1 ... numberOfMeals).map {
      Meal.createMock(id: "\($0)")
    }
    return MealListModel(listName: "Mock List", recipes: meals)
  }
}

extension Meal {
  static let mock = Self(
    id: "1111",
    strMeal: "Test Meal",
    strInstructions: "Mock Instructions",
    strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/uttuxy1511382180.jpg")!,
    ingredients: [
      .init(measurement: "1/2 Cup", ingredient: "Milk"),
      .init(measurement: "1", ingredient: "Egg"),
      .init(measurement: "2 1/2 Cups", ingredient: "Flour"),
      .init(measurement: "8 Tblsps", ingredient: "Butter"),
      .init(measurement: "1/2 Cup", ingredient: "Sugar"),
    ]
  )

  static func createMock(id: String) -> Self {
    Self(id: id, strMeal: "Meal \(id)", strInstructions: "Instructions for meal \(id)",
         strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/uttuxy1511382180.jpg")!,
         ingredients: [.init(measurement: "First Measurement for meal \(id)", ingredient: "First Ingredient for meal \(id)")])
  }
}

extension ApiClient {
  static let mock = Self.init {
    [.mock]
  } getMealById: { _ in
    .mock
  }

  static let mockFailing = Self.init {
    throw ApiError.invalidResponse
  } getMealById: { _ in
    throw ApiError.invalidResponse
  }
}

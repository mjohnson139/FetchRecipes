import Foundation

#if DEBUG

  extension RecipeList {
    static let mock = Self(meals: [.mock])
    
    static func mock(numberOfMeals: Int) -> Self {
        let meals = (1...numberOfMeals).map {
            Meal.createMock(id: "\($0)")
        }
        return Self(meals: meals)
    }
  }

  extension Meal {
    static let mock = Self(
      id: "1111",
      strMeal: "Test Meal",
      strInstructions: "Mock Instructions",
      ingredients: ["First Ingrediant": "test"]
    )
    static func createMock(id: String) -> Self {
      Self(id: id, strMeal: "Meal \(id)", strInstructions: "Instructions for meal \(id)", ingredients: ["First Ingredient for meal \(id)": "First Measurement for meal \(id)"])
    }
  }

#endif
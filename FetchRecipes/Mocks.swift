import Foundation

#if DEBUG

  extension RecipeListModel {
    static func mock(numberOfMeals: Int) -> RecipeListModel {
      let meals = (1 ... numberOfMeals).map {
        Meal.createMock(id: "\($0)")
      }
      return RecipeListModel(listName: "Mock List", recipes: meals)
    }
  }

  extension Meal {
    static let mock = Self(
      id: "1111",
      strMeal: "Test Meal",
      strInstructions: "Mock Instructions",
      strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/uttuxy1511382180.jpg")!,
      ingredients: [
        "Milk": "1/2 Cup",
        "Egg": "1",
        "Flour": "2 1/2 Cup",
        "Butter": "8 Tblsp",
        "Sugar": "1/2 Cup",
      ]
    )

    static func createMock(id: String) -> Self {
      Self(id: id, strMeal: "Meal \(id)", strInstructions: "Instructions for meal \(id)",
           strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/uttuxy1511382180.jpg")!,
           ingredients: ["First Ingredient for meal \(id)": "First Measurement for meal \(id)"])
    }
  }

#endif

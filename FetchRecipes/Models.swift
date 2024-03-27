import Foundation


struct Meals: Decodable {
  let meals: [Meal]
}

struct Meal: Equatable, Identifiable, Decodable {
  let id: String
  let strMeal: String
  let strInstructions: String?
  let strMealThumb: URL
  let ingredients: [String: String]?

  private enum CodingKeys: String, CodingKey {
    case id = "idMeal"
    case strMeal
    case strMealThumb
    case strInstructions
    case ingredients
  }
}

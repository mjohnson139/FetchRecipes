import Foundation

struct Meals: Decodable {
  let meals: [Meal]
}

struct Meal: Equatable, Identifiable, Sendable {
  let id: String
  let strMeal: String
  let strInstructions: String?
  let strMealThumb: URL
  let ingredients: [Ingredient]
}

extension Meal: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    strMeal = try container.decode(String.self, forKey: .strMeal)
    strInstructions = try container.decodeIfPresent(String.self, forKey: .strInstructions)
    strMealThumb = try container.decode(URL.self, forKey: .strMealThumb)

    ingredients = (1 ... 20).reduce(into: []) { result, i in
      let ingredientKey = CodingKeys(stringValue: "strIngredient\(i)")!
      let measureKey = CodingKeys(stringValue: "strMeasure\(i)")!

      if let ingredient = try? container.decodeIfPresent(String.self, forKey: ingredientKey),
         let measure = try? container.decodeIfPresent(String.self, forKey: measureKey),
         !ingredient.isEmpty, !measure.isEmpty
      {
        result.append(.init(measurement: measure, ingredient: ingredient))
      }
    }
  }

  private enum CodingKeys: String, CodingKey {
    case id = "idMeal"
    case strMeal
    case strMealThumb
    case strInstructions
    case strIngredient1, strMeasure1
    case strIngredient2, strMeasure2
    case strIngredient3, strMeasure3
    case strIngredient4, strMeasure4
    case strIngredient5, strMeasure5
    case strIngredient6, strMeasure6
    case strIngredient7, strMeasure7
    case strIngredient8, strMeasure8
    case strIngredient9, strMeasure9
    case strIngredient10, strMeasure10
    case strIngredient11, strMeasure11
    case strIngredient12, strMeasure12
    case strIngredient13, strMeasure13
    case strIngredient14, strMeasure14
    case strIngredient15, strMeasure15
    case strIngredient16, strMeasure16
    case strIngredient17, strMeasure17
    case strIngredient18, strMeasure18
    case strIngredient19, strMeasure19
    case strIngredient20, strMeasure20
  }
}

struct Ingredient: Equatable {
  let measurement: String
  let ingredient: String
}

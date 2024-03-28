// TestModels.swift

@testable import FetchRecipes
import Foundation
import XCTest

final class ModelsDecodingTests: XCTestCase {
  func testMealListDecoding() {
    // Sample JSON for testing
    let json = """
    {
      "meals": [
        {
          "strMeal": "Apam balik",
          "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
          "idMeal": "53049"
        },
        {
          "strMeal": "Apple & Blackberry Crumble",
          "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
          "idMeal": "52893"
        },
        {
          "strMeal": "Apple Frangipan Tart",
          "strMealThumb": "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
          "idMeal": "52768"
        }
      ]
    }
    """.data(using: .utf8)!

    // Attempt to decode the JSON into a Meal object
    let decoder = JSONDecoder()
    do {
      let meals = try decoder.decode(Meals.self, from: json)
      XCTAssertEqual(meals.meals.count, 3)
      if let meal = meals.meals.first {
        XCTAssertEqual(meal.id, "53049")
        XCTAssertEqual(meal.strMeal, "Apam balik")
        XCTAssertNil(meal.strInstructions)
        XCTAssertEqual(meal.ingredients.count, 0)
      } else {
        XCTFail("Decoding failed to create the meal")
      }

    } catch {
      XCTFail("Decoding failed: \(error)")
    }
  }

  func testMealDetailDecoding() {
    // Sample JSON for testing
    let json = """
    {
      "meals": [
        {
          "idMeal": "52853",
          "strMeal": "Chocolate Avocado Mousse",
          "strDrinkAlternate": null,
          "strCategory": "Dessert",
          "strArea": "British",
          "strInstructions": "1. Blend all the mousse ingredients together in your food processor until smooth.",
          "strMealThumb": "https://www.themealdb.com/images/media/meals/uttuxy1511382180.jpg",
          "strTags": null,
          "strYoutube": "https://www.youtube.com/watch?v=wuZffe60q4M",
          "strIngredient1": "Banana",
          "strIngredient2": "Cacao",
          "strIngredient3": "Avocado",
          "strIngredient4": "Honey",
          "strIngredient5": "Lemon Juice",
          "strIngredient6": "Vanilla",
          "strIngredient7": "Water",
          "strIngredient8": "Sea Salt",
          "strIngredient9": "",
          "strIngredient10": "",
          "strIngredient11": "",
          "strIngredient12": "",
          "strIngredient13": "",
          "strIngredient14": "",
          "strIngredient15": "",
          "strIngredient16": "",
          "strIngredient17": "",
          "strIngredient18": "",
          "strIngredient19": "",
          "strIngredient20": "",
          "strMeasure1": "1",
          "strMeasure2": "3 tbsp",
          "strMeasure3": "1",
          "strMeasure4": "2 tblsp ",
          "strMeasure5": "1 tsp ",
          "strMeasure6": "1 tsp ",
          "strMeasure7": "2 tbsp",
          "strMeasure8": "pinch",
          "strMeasure9": "",
          "strMeasure10": "",
          "strMeasure11": "",
          "strMeasure12": "",
          "strMeasure13": "",
          "strMeasure14": "",
          "strMeasure15": "",
          "strMeasure16": "",
          "strMeasure17": "",
          "strMeasure18": "",
          "strMeasure19": "",
          "strMeasure20": "",
          "strSource": "http://www.hemsleyandhemsley.com/recipe/chocolate-avocado-mousse/",
          "strImageSource": null,
          "strCreativeCommonsConfirmed": null,
          "dateModified": null
        }
      ]
    }
    """.data(using: .utf8)!

    // Attempt to decode the JSON into a Meal object
    let decoder = JSONDecoder()
    do {
      let meals = try decoder.decode(Meals.self, from: json)
      if let meal = meals.meals.first {
        XCTAssertEqual(meal.id, "52853")
        XCTAssertEqual(meal.strMeal, "Chocolate Avocado Mousse")
        XCTAssertEqual(meal.strInstructions, "1. Blend all the mousse ingredients together in your food processor until smooth.")
        XCTAssertEqual(meal.ingredients.count, 8)
        XCTAssertEqual(meal.ingredients.first?.ingredient, "Banana")
      } else {
        XCTFail("Decoding failed to create the meal")
      }

    } catch {
      XCTFail("Decoding failed: \(error)")
    }
  }
}

// TestModels.swift

import XCTest

final class ModelsDecodingTests: XCTestCase {
  
  
  func testMealSimpleDecoding() {
    // Sample JSON for testing
    let json = """
    {
       "idMeal": "53049",
       "strMeal": "Apam balik",
       "strInstructions": "Mix milk, oil and egg together.",
       "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
       "strIngredient1": "Milk",
       "strMeasure1": "200ml",
       "strIngredient2": "Oil",
       "strMeasure2": "60ml",
       "strIngredient3": "Eggs",
       "strMeasure3": "2",
       "strIngredient4": "Flour",
       "strMeasure4": "1600g",
       "strIngredient5": "Baking Powder",
       "strMeasure5": "3 tsp",
       "strIngredient6": "Salt",
       "strMeasure6": "1/2 tsp",
       "strIngredient7": "Unsalted Butter",
       "strMeasure7": "25g",
       "strIngredient8": "Sugar",
       "strMeasure8": "45g",
       "strIngredient9": "Peanut Butter",
       "strMeasure9": "3 tbs"
    }
    """.data(using: .utf8)!

    // Attempt to decode the JSON into a Meal object
    let decoder = JSONDecoder()
    do {
      let meal = try decoder.decode(Meal.self, from: json)
      XCTAssertEqual(meal.id, "53049")
      XCTAssertEqual(meal.strMeal, "Apam balik")
      XCTAssertEqual(meal.strInstructions.contains("Mix milk, oil and egg together"), true)
      XCTAssertEqual(meal.ingredients.count, 9) // Adjust based on the actual number of ingredients
      XCTAssertEqual(meal.ingredients["Milk"], "200ml")
      XCTAssertEqual(meal.ingredients["Oil"], "60ml")
      // Add more assertions for other ingredients and measurements
    } catch let decodingError as DecodingError {
      print("Decoding error", decodingError.localizedDescription)
      XCTFail("Decoding failed: \(decodingError)")
    } catch {
      XCTFail("Decoding failed: \(error)")
    }
  }
  func testMealFailingDecoding() {
    // Sample JSON for testing
    let json = """
    {
       "idMeal": "53049",
       "strMeal": "Apam balik",
       "strInstructions": "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.",
       "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
       "strIngredient1": "Milk",
       "strMeasure1": "200ml",
       "strIngredient2": "Oil",
       "strMeasure2": "60ml",
       "strIngredient3": "Eggs",
       "strMeasure3": "2",
       "strIngredient4": "Flour",
       "strMeasure4": "1600g",
       "strIngredient5": "Baking Powder",
       "strMeasure5": "3 tsp",
       "strIngredient6": "Salt",
       "strMeasure6": "1/2 tsp",
       "strIngredient7": "Unsalted Butter",
       "strMeasure7": "25g",
       "strIngredient8": "Sugar",
       "strMeasure8": "45g",
       "strIngredient9": "Peanut Butter",
       "strMeasure9": "3 tbs"
    }
    """.data(using: .utf8)!

    // Attempt to decode the JSON into a Meal object
    let decoder = JSONDecoder()
    do {
      let meal = try decoder.decode(Meal.self, from: json)
      XCTAssertEqual(meal.id, "53049")
      XCTAssertEqual(meal.strMeal, "Apam balik")
      XCTAssertEqual(meal.strInstructions.contains("Mix milk, oil and egg together"), true)
      XCTAssertEqual(meal.ingredients.count, 9) // Adjust based on the actual number of ingredients
      XCTAssertEqual(meal.ingredients["Milk"], "200ml")
      XCTAssertEqual(meal.ingredients["Oil"], "60ml")
      // Add more assertions for other ingredients and measurements
    } catch let decodingError as DecodingError {
      print("Decoding error", decodingError.localizedDescription)
      XCTFail("Decoding failed: \(decodingError)")
    } catch {
      XCTFail("Decoding failed: \(error)")
    }
  }
  

}

// TestModels.swift

import XCTest
@testable import FetchRecipes
import Foundation

final class ModelsDecodingTests: XCTestCase {
  
  func testReadList() async throws {
    let (data, response) = try await URLSession.shared.data(from: URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!)
    if let httpResponse = response as? HTTPURLResponse,
       httpResponse.statusCode == 200
    {
      let decoder = JSONDecoder()

      let dictionary = try decoder.decode(Meals.self, from: data)
      print("Dictionary", dictionary)
    }

  }
  
  func testReadItem() async throws {
    
    

    
    let (data, response) = try await URLSession.shared.data(from: URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=53049")!)
    if let httpResponse = response as? HTTPURLResponse,
       httpResponse.statusCode == 200
    {
      let decoder = JSONDecoder()
      let meals = try decoder.decode(Meals.self, from: data)
      print("meals", meals)

    }

  }
  

}

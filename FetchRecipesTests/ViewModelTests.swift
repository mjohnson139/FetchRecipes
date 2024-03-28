import Dependencies
@testable import FetchRecipes
import XCTest

final class ViewModelTests: XCTestCase {
  func testViewModelBasicStartupFlow() async throws {
    // Starting with no recipes
    let model = MealListModel(listName: "UnitTest", recipes: nil)

    await model.loadList()

    XCTAssertEqual(model.recipes, [Meal.mock], "We should get a mock meal with one element.")

    // Tap on a meal, and our destination should be set.
    if let firstMeal = model.recipes?.first {
      await model.mealTapped(meal: firstMeal)
      XCTAssertEqual(MealListModel.Destination.detail(firstMeal), model.destination)
    } else {
      XCTFail("Expecting to have at least one meal.")
    }
  }

  func testViewModelWithFailingApi() async throws {
    // Overriding to Failing apiClient.
    let model = withDependencies {
      $0.apiClient = .mockFailing
    } operation: {
      MealListModel(listName: "UnitTest", recipes: nil)
    }

    await model.loadList()

    XCTAssertEqual([], model.recipes)
    XCTAssertEqual(ApiError.invalidResponse.localizedDescription, model.errorMessage)
  }
}

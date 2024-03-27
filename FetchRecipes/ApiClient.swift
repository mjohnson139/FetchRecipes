import Dependencies
import Foundation

enum ApiError: LocalizedError {
  case dataLoadError
  
  /// A localized message describing what error occurred.
  var errorDescription: String {
    switch self {
    case .dataLoadError:
      return "Could not load the data."
    }
  }
}

struct ApiClient: Sendable {
  var getList: @Sendable () async throws -> [Meal]
  var getMealById: @Sendable (String) async throws -> Meal?
}

extension ApiClient {
  static let live = Self.init {
    let model = try await requestModel(url: URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!)
    return model.meals.sorted { $0.strMeal < $1.strMeal }

  } getMealById: { id in
    let model = try await requestModel(url: URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!)
    return model.meals.first
  }
  
  static func requestModel(url: URL) async throws -> Meals {
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200
    else {
      throw(ApiError.dataLoadError)
    }

    let decoder = JSONDecoder()
    print(String(data: data, encoding: .utf8) ?? "no data was found")
    let model = try decoder.decode(Meals.self, from: data)
    return model
  }
}

extension ApiClient: DependencyKey {
  static var liveValue: Self {
    .live
  }

  static let previewValue = Self.mock

  static let testValue = Self.mock
}

extension DependencyValues {
  var apiClient: ApiClient {
    get { self[ApiClient.self] }
    set { self[ApiClient.self] = newValue }
  }
}

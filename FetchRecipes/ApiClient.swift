import Dependencies
import Foundation

enum ApiError: LocalizedError {
  case dataLoadError

  var errorDescription: String {
    switch self {
    case .dataLoadError:
      "Could not load the data."
    }
  }
}

enum ApiEndpoints {
  static let getList = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
  static let getMealById: @Sendable (String) -> URL? = { URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\($0)") }
}

struct ApiClient {
  var getList: @Sendable () async throws -> [Meal]
  var getMealById: @Sendable (String) async throws -> Meal?
}

extension ApiClient {
  static let live = Self.init {
    let model = try await requestModel(url: ApiEndpoints.getList)
    return model.meals.sorted { $0.strMeal < $1.strMeal }

  } getMealById: { id in
    guard let url = ApiEndpoints.getMealById(id) else {
      throw ApiError.dataLoadError
    }

    let model = try await requestModel(url: url)
    return model.meals.first
  }

  static func requestModel(url: URL) async throws -> Meals {
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200
    else {
      throw ApiError.dataLoadError
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

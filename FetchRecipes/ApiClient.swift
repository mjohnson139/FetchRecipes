import Dependencies
import Foundation

enum ApiError: LocalizedError {
  case networkError(underlyingError: Error)
  case invalidResponse
  case decodingError
  case urlError

  var errorDescription: String? {
    switch self {
    case let .networkError(underlyingError):
      return "Network error: \(underlyingError.localizedDescription)"
    case .invalidResponse:
      return "Invalid response from the server."
    case .decodingError:
      return "Failed to decode the data."
    case .urlError:
      return "Invalid URL."
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
      throw ApiError.urlError
    }
    
    let model = try await requestModel(url: url)
    return model.meals.first
  }
  
  static func requestModel(url: URL) async throws -> Meals {
    do {
      let (data, response) = try await URLSession.shared.data(from: url)
      guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
        throw ApiError.invalidResponse
      }
      
      let decoder = JSONDecoder()
      do {
        let model = try decoder.decode(Meals.self, from: data)
        return model
      } catch {
        throw ApiError.decodingError
      }
    } catch {
      throw ApiError.networkError(underlyingError: error)
    }
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

import Dependencies
import Foundation
import XCTestDynamicOverlay

struct ApiClient: Sendable {
  var getList: @Sendable () async throws -> [Meal]
  var getMealById: @Sendable (String) async throws -> Meal
}

extension ApiClient {
  static let mock = Self.init {
    // Simulate network delay
    try await Task.sleep(nanoseconds: 2_000_000_000)
    return [.mock]
  } getMealById: { _ in
    // Simulate network delay
    try await Task.sleep(nanoseconds: 2_000_000_000)
    return .mock
  }
}

extension ApiClient {
  static let live = Self.init {
    // Return the list of desserts
    fatalError()
  } getMealById: { _ in
    // Get a specific meal based on the id
    fatalError()
  }
}

extension ApiClient: DependencyKey {
  static var liveValue: Self {
    .mock
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

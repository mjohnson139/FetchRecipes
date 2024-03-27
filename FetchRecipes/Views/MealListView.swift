import SwiftUI
import SwiftUINavigation

struct MealListView: View {
  @ObservedObject var model: MealListModel

  let columns = [
    GridItem(.adaptive(minimum: 150)),
  ]

  var body: some View {
    NavigationStack {
      // Check if the mealList is nil and show ProgressView if true
      if let recipes = model.recipes {
        // Existing code for ScrollView
        ScrollView {
          LazyVGrid(columns: columns, spacing: 20) {
            ForEach(recipes) { meal in
              Button(action: {
                Task {
                  await model.mealTapped(meal:meal)
                }
              }) {
                MealCardView(meal: meal)
              }
            }
          }
          .padding()
        }
        .navigationTitle(model.listName)
        .navigationDestination(
          unwrapping: $model.destination,
          case: /MealListModel.Destination.detail
        ) { $meal in
          NavigationStack {
            MealDetailView(meal: meal)
              .navigationTitle(meal.strMeal)
          }
        }
        .alert(
          title: { Text($0)},
          unwrapping: $model.errorMessage,
          actions: {_ in
            Button("Ok", role: .cancel) {
              self.model.errorMessage = nil
            }
          },
          message:  { Text($0) })
      } else {
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle())
          .navigationTitle(model.listName)
      }
    }
    .onAppear {
      // Call the API to load data if not already loaded
      Task {
        if model.recipes == nil {
          await model.loadList()
        }
      }
    }
  }
}

#Preview("Loading") {
  MealListView(model: .init(listName: "Loading List"))
}

#Preview("Portrait") {
  MealListView(model: .mock(numberOfMeals: 5))
}

#Preview("Landscape", traits: .landscapeLeft) {
  MealListView(model: .mock(numberOfMeals: 100))
}

#Preview("Error Message", traits: .portrait) {
  MealListView(model: .init(errorMessage: "This is a fake error message"))
}

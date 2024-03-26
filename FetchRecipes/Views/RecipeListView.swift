import SwiftUI
import SwiftUINavigation

struct RecipeListView: View {
  @ObservedObject var model: RecipeListModel

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
                model.mealTapped(meal: meal)
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
          case: /RecipeListModel.Destination.detail
        ) { $meal in
          NavigationStack {
            MealDetailView(meal: meal)
              .navigationTitle(meal.strMeal)
          }
        }
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
          await model.loadData()
        }
      }
    }
  }
}

#Preview("Loading") {
  RecipeListView(model: .init(listName: "Loading List"))
}

#Preview("Portrait") {
  RecipeListView(model: .mock(numberOfMeals: 5))
}

#Preview("Landscape", traits: .landscapeLeft) {
  RecipeListView(model: .mock(numberOfMeals: 100))
}

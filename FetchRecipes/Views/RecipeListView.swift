import SwiftUI
import SwiftUINavigation

struct RecipeListView: View {
  @ObservedObject var model: RecipeListModel

  let columns = [
    GridItem(.adaptive(minimum: 150)),
  ]

  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: columns, spacing: 20) {
          ForEach(model.recipes) { meal in
            Button(action: {
              model.mealTapped(meal: meal)
            }
            ) {
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
    }
  }
}




#Preview("Portrait") {
  RecipeListView(model: .mock(numberOfMeals: 5))
}

#Preview("Landscape", traits: .landscapeLeft) {
  RecipeListView(model: .mock(numberOfMeals: 100))
}

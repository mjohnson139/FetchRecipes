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
      .sheet(
        unwrapping: $model.destination,
        case: /RecipeListModel.Destination.detail
      ) { $meal in
        NavigationStack {
          Text(meal.strMeal)
            .navigationTitle(meal.strMeal)
        }
      }
    }
  }
}

struct MealCardView: View {
  let meal: Meal

  var body: some View {
    VStack(alignment: .center) {
      AsyncImage(url: meal.strMealThumb) { image in
        image.resizable()
      } placeholder: {
        Color.gray.opacity(0.1)
      }
      .frame(width: 150, height: 150)
      .cornerRadius(10)
      .overlay(RoundedRectangle(cornerRadius: 10)
        .stroke(Color.gray, lineWidth: 1))
      .shadow(radius: 5)

      Text(meal.strMeal)
        .frame(maxWidth: .infinity, alignment: .center)
        .lineLimit(1)
    }
  }
}

#Preview("Portrait") {
  RecipeListView(model: .mock(numberOfMeals: 5))
}

#Preview("Landscape", traits: .landscapeLeft) {
  RecipeListView(model: .mock(numberOfMeals: 100))
}

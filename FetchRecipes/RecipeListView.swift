import SwiftUI

class RecipeListModel: ObservableObject {
  let listName: String
  @Published var recipes: RecipeList

  init(listName: String = "Recipe List", recipes: RecipeList) {
    self.listName = listName
    self.recipes = recipes
  }
}

struct RecipeListView: View {
  @ObservedObject var model: RecipeListModel

  let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)

  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: columns, spacing: 20) {
          ForEach(model.recipes.meals) { meal in
            MealCardView(meal: meal)
          }
        }
        .padding()
      }
      .navigationTitle(model.listName)
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

#Preview {
  RecipeListView(model: RecipeListModel(listName: "Dessert List", recipes: RecipeList.mock(numberOfMeals: 10)))
}

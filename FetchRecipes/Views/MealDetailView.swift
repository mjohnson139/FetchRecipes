import SwiftUI

struct MealDetailView: View {
  let meal: Meal

  var body: some View {
    NavigationStack {
      List {
        Section {
          AsyncImage(url: meal.strMealThumb) { image in
            image
              .resizable()
              .aspectRatio(contentMode: .fill)
          } placeholder: {
            Color.gray.opacity(0.1)
          }
          .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 600)
          .clipped()
          .listRowInsets(EdgeInsets())
        }
        if !meal.ingredients.isEmpty {
          let ingredients = meal.ingredients
          Section("Ingredients") {
            ForEach(ingredients.indices, id: \.self) { index in
                let item = ingredients[index]
                HStack {
                    Text(item.measurement)
                        .multilineTextAlignment(.leading)
                    Text(item.ingredient)
                        .multilineTextAlignment(.leading)
                }
            }
          }
        }
        if let instructions = meal.strInstructions, !instructions.isEmpty {
          Section("Instructions") {
            Text(instructions)
              .multilineTextAlignment(.leading)
          }
        }
      }
      .listStyle(GroupedListStyle())
      .navigationTitle(meal.strMeal)
    }
  }
}

#Preview {
  MealDetailView(meal: .mock)
}

#Preview { // Missing Instructions
  MealDetailView(meal: Meal(id: "555", strMeal: "Missing Instructions", strInstructions: nil, strMealThumb: Meal.mock.strMealThumb, ingredients: Meal.mock.ingredients))
}

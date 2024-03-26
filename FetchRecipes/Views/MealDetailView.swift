import SwiftUI

struct MealDetailView: View {
  let meal: Meal

  var body: some View {
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
      Section("Ingredients") {
        ForEach(meal.ingredients.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
          HStack {
            Text(value)
            Text(key)
            Spacer()
          }
        }
      }

      Section("Instructions") {
        Text(meal.strInstructions)
          .multilineTextAlignment(.leading)
      }
    }
    .listStyle(GroupedListStyle())
  }
}

#Preview {
  MealDetailView(meal: .mock)
}

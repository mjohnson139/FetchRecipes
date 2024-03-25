import SwiftUI

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
  MealCardView(meal: .mock)
}

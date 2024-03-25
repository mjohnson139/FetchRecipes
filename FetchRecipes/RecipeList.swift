import SwiftUI

struct RecipeList: View {
  var body: some View {
    NavigationStack {
      List {}
        .navigationTitle("Recipe List")
    }
  }
}

#Preview {
  RecipeList()
}

import SwiftUI

struct RecipeListView: View {
  var body: some View {
    NavigationStack {
      List {}
        .navigationTitle("Recipe List")
    }
  }
}

#Preview {
  RecipeListView()
}

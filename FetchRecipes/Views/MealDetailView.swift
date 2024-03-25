//
//  MealDetailView.swift
//  FetchRecipes
//
//  Created by Matthew Johnson on 3/25/24.
//

import SwiftUI

struct MealDetailView: View {
  let meal: Meal
  
  var body: some View {
    List {
      Section {
        
      }
      Text(meal.strMeal)
    }
  }
}

#Preview {
  MealDetailView(meal: .mock)
}

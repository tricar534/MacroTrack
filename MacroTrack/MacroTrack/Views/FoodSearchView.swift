//
//  FoodSearchView.swift
//  MacroTrack
//
//  Created by Tristan carreon on 10/21/26.
//

import SwiftUI

struct FoodSearchView: View {

    @State var searchFood = ""
    
    // Temp sampel food info
    let foods = [
            Food(name: "Chicken Breast", calories: 165,
                 protein: 31, carbs: 0, fat: 3.6),

            Food(name: "White Rice", calories: 130,
                 protein: 2.7, carbs: 28.2, fat: 0.3),

            Food(name: "Banana", calories: 89,
                 protein: 1.1, carbs: 22.8, fat: 0.3)
        ]
    
    // Filter food based on search
    var filteredFoods: [Food] {
        if searchFood.isEmpty {
            return foods
        } else {
            return foods.filter { food in
                food.name.localizedStandardContains(searchFood)
            }
        }
    }

    var body: some View {

        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Title
                Text("Food Search")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity)
                
                // Search bar
                TextField("Search for food...", text: $searchFood)
                    .textFieldStyle(.roundedBorder)
                    .padding(12)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text("Search Results")
                    .font(.headline)
                Button("Test API") {
                    Task {
                        await FoodAPIService().testAPI()
                    }
                }
                Text("Sample nutrition per 100 g")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                ForEach(filteredFoods) { food in
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                           
                            // Food name
                            Text(food.name)
                                .font(.headline)
                            
                            Spacer()
                            
                            // calories
                            Text("\(food.calories) kcal")
                                .bold()
                        }
                        
                        Text("Protein: \(food.protein, specifier: "%.1f") g")
                        Text("Carbs: \(food.carbs, specifier: "%.1f") g")
                        Text("Fat: \(food.fat, specifier: "%.1f") g")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(15)
                }
                
                if filteredFoods.isEmpty {
                    Text("No matching foods found")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
    }
}

#Preview {
    FoodSearchView()
}

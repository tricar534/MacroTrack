//
//  FoodSearchView.swift
//  MacroTrack
//
//  Created by Tristan carreon on 10/21/26.
//

import SwiftUI

struct FoodSearchView: View {

    // Store users search
    @State private var searchFood = ""
    
    // Connect to foodsearch view model
    @StateObject private var viewModel = FoodSearchViewModel()
    
    @ObservedObject var foodLogViewModel: FoodLogViewModel
    @State private var selectedFood: USDAFood?
    
    
    
    // Track search performed
    @State private var hasSearched = false
    
    
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
                    .onSubmit {
                        performSearch()
                    }
                
                // Search button
                Button("Search") {
                    performSearch()
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .disabled(viewModel.isLoading)
                
                // Search results title
                Text("Search Results")
                    .font(.headline)
                
                Text("Nutrition information per 100 g")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                // Display loading
                if viewModel.isLoading {
                    ProgressView("Searching foods...")
                    
                    // Diplay API error
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                    
                    // Display returned foods
                } else if !viewModel.foods.isEmpty {

                    ForEach(viewModel.foods) { food in
                        Button {
                            selectedFood = food
                        } label: {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                HStack {
                                    
                                    // Food name
                                    Text(food.description)
                                        .font(.headline)
                                    
                                    Spacer()
                                    
                                    // calories
                                    if let calories = food.caloriesPer100g {
                                        
                                        Text("\(calories, specifier: "%.0f") cal")
                                            .bold()
                                    } else {
                                        Text("N/A cal")
                                    }
                                    
                                }
                                
                                // Protein
                                if let protein = food.proteinPer100g {
                                    Text("Protein: \(protein, specifier: "%.1f") g")
                                        .bold()
                                } else {
                                    Text("Protein: N/A")
                                }
                                
                                // Carbs
                                if let carbs = food.carbsPer100g {
                                    Text("Carbs: \(carbs, specifier: "%.1f") g")
                                        .bold()
                                } else {
                                    Text("Carbs: N/A")
                                }
                                
                                // Fat
                                if let fat = food.fatPer100g {
                                    Text("Fat: \(fat, specifier: "%.1f") g")
                                        .bold()
                                } else {
                                    Text("Fat: N/A")
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(15)
                        }
                        .buttonStyle(.plain)
                    }
                    
                } else if hasSearched {
                    Text("No matching foods found")
                        .foregroundColor(.secondary)
                } else {
                    Text("Search for a food to see nutrition information")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .sheet(item: $selectedFood) { food in
            FoodDetailSheet(
                food: food,
                foodLogViewModel: foodLogViewModel
            )
        }
        
    }
    
    // Search food using view model
    func performSearch() {
        hasSearched = true
        
        Task {
            await viewModel.searchFoods(query: searchFood)
        }
    }
}

#Preview {
    FoodSearchView(
        foodLogViewModel: FoodLogViewModel()
    )
}

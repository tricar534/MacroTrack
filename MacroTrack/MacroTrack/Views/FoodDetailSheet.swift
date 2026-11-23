//
//  FoodDetailSheet.swift
//  MacroTrack
//
//  Created by Tristan carreon on 11/22/26.
//
import SwiftUI

struct FoodDetailSheet: View {

    // Food selected from USDA
    let food: USDAFood

    // Shared Food Log ViewModel
    @ObservedObject var foodLogViewModel: FoodLogViewModel

    // Used to close the sheet
    @Environment(\.dismiss) private var dismiss

    // User input
    @State private var servingSize = "1"
    @State private var selectedMeal = "Breakfast"

    // Convert input into a number
        var servings: Double? {
            guard let value = Double(servingSize),
                  value > 0,
                  value.isFinite else {
                return nil
            }
            
            return value
        }
            
    // Check whether USDA provides a gram-based serving
    var hasServingSize: Bool {
        guard let size = food.servingSize,
              let unit = food.servingSizeUnit else {
            return false
        }

        return size > 0 &&
               size.isFinite &&
               unit.lowercased() == "g"
    }

    // Determine grams in one serving or reference portion
    var gramsPerServing: Double {
        if hasServingSize {
            return food.servingSize ?? 100
        }

        return 100
    }
    
    // Calculate total grams from the quantity selected
    var totalGrams: Double? {
        guard let servings = servings else {
            return nil
        }

        let result = servings * gramsPerServing

        if result.isFinite {
            return result
        }

        return nil
    }

    // Check whether the food can be added
    var canAddFood: Bool {
        return totalGrams != nil &&
               food.caloriesPer100g != nil &&
               food.proteinPer100g != nil &&
               food.carbsPer100g != nil &&
               food.fatPer100g != nil
    }

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 20) {

                Text("Add Food")
                    .font(.largeTitle)
                    .bold()

                // Display selected food
                Text(food.description)
                    .font(.title3)
                    .bold()

                // Display serving size from USDA
                if hasServingSize {
                    Text("1 serving = \(gramsPerServing, specifier: "%.1f") g")
                } else {
                    Text("1 reference portion = 100 g")
                }

                // Enter number of servings
                Text(hasServingSize ? "Number of Servings" : "Number of 100 g Portions")
                    .font(.headline)

                TextField("Enter quantity", text: $servingSize)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)

                // Choose a meal
                Picker("Meal", selection: $selectedMeal) {
                    Text("Breakfast").tag("Breakfast")
                    Text("Lunch").tag("Lunch")
                    Text("Dinner").tag("Dinner")
                    Text("Snacks").tag("Snacks")
                }
                .pickerStyle(.menu)

                Divider()
                
                Text("Nutrition values provided by USDA")
                    .font(.caption)
                    .foregroundColor(.secondary)

                Divider()

                Text("Calculated Nutrition")
                    .font(.headline)

                // Display calculated values for the chosen portion
                if let grams = totalGrams,
                   let calories = food.caloriesPer100g,
                   let protein = food.proteinPer100g,
                   let carbs = food.carbsPer100g,
                   let fat = food.fatPer100g {

                    Text("Total Weight: \(grams, specifier: "%.1f") g")
                    Text("Calories: \(calories * grams / 100, specifier: "%.0f") cal")

                    Text("Protein: \(protein * grams / 100, specifier: "%.1f") g")

                    Text("Carbs: \(carbs * grams / 100, specifier: "%.1f") g")

                    Text("Fat: \(fat * grams / 100, specifier: "%.1f") g")

                } else {
                    Text("Enter a valid quantity. Nutrition information must be available.")
                        .foregroundColor(.secondary)
                }

                // Save food to Food Log
                Button("Add Food") {
                    addFood()
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .disabled(!canAddFood)
            }
            .padding()
        }
        
    }

    // Create and add a logged food entry
    func addFood() {

        guard let grams = totalGrams,
              let calories = food.caloriesPer100g,
              let protein = food.proteinPer100g,
              let carbs = food.carbsPer100g,
              let fat = food.fatPer100g else {
            return
        }

        let newEntry = FoodEntry(
            fdcId: food.fdcId,
            name: food.description,
            grams: grams,
            meal: selectedMeal,
            caloriesPer100g: calories,
            proteinPer100g: protein,
            carbsPer100g: carbs,
            fatPer100g: fat
        )

        foodLogViewModel.addFood(newEntry)

        dismiss()
    }
}

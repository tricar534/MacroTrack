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
    @State private var foodName = ""
    @State private var gramsText = "100"
    @State private var selectedMeal = "Breakfast"

    // Editable nutrition values per 100 grams
    @State private var caloriesText = ""
    @State private var proteinText = ""
    @State private var carbsText = ""
    @State private var fatText = ""

    // Validate the entered quantity
    var grams: Double? {
        guard let value = Double(gramsText),
              value > 0,
              value.isFinite else {
            return nil
        }

        return value
    }

    // Validate nutritional values
    func validNutrition(_ text: String) -> Double? {
        guard let value = Double(text),
              value >= 0,
              value.isFinite else {
            return nil
        }

        return value
    }

    // Check that all required values are entered
    var canAddFood: Bool {
        return grams != nil &&
            !foodName.isEmpty &&
            validNutrition(caloriesText) != nil &&
            validNutrition(proteinText) != nil &&
            validNutrition(carbsText) != nil &&
            validNutrition(fatText) != nil
    }

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 20) {

                Text("Add Food")
                    .font(.largeTitle)
                    .bold()

                Text("Food Name")
                    .font(.headline)

                TextField("Food name", text: $foodName)
                    .textFieldStyle(.roundedBorder)

                Text("Quantity (grams)")
                    .font(.headline)

                TextField("Enter grams", text: $gramsText)
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

                Text("Nutrition per 100 g")
                    .font(.headline)

                Text("You can adjust these values.")
                    .font(.caption)
                    .foregroundColor(.secondary)

                TextField("Calories per 100 g", text: $caloriesText)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)

                TextField("Protein (g)", text: $proteinText)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)

                TextField("Carbs (g)", text: $carbsText)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)

                TextField("Fat (g)", text: $fatText)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)

                Divider()

                Text("Calculated Nutrition")
                    .font(.headline)

                // Display calculated values for the chosen portion
                if let grams = grams,
                   let calories = validNutrition(caloriesText),
                   let protein = validNutrition(proteinText),
                   let carbs = validNutrition(carbsText),
                   let fat = validNutrition(fatText) {

                    Text("Calories: \(calories * grams / 100, specifier: "%.0f") cal")

                    Text("Protein: \(protein * grams / 100, specifier: "%.1f") g")

                    Text("Carbs: \(carbs * grams / 100, specifier: "%.1f") g")

                    Text("Fat: \(fat * grams / 100, specifier: "%.1f") g")

                } else {
                    Text("Enter valid nutrition values and grams.")
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
        .onAppear {
            loadFoodInformation()
        }
    }

    // Load the original USDA information
    func loadFoodInformation() {

        foodName = food.description

        if let calories = food.caloriesPer100g {
            caloriesText = String(calories)
        }

        if let protein = food.proteinPer100g {
            proteinText = String(protein)
        }

        if let carbs = food.carbsPer100g {
            carbsText = String(carbs)
        }

        if let fat = food.fatPer100g {
            fatText = String(fat)
        }
    }

    // Create and add a logged food entry
    func addFood() {

        guard let grams = grams,
              let calories = validNutrition(caloriesText),
              let protein = validNutrition(proteinText),
              let carbs = validNutrition(carbsText),
              let fat = validNutrition(fatText),
              !foodName.isEmpty else {
            return
        }

        let newEntry = FoodEntry(
            fdcId: food.fdcId,
            name: foodName,
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

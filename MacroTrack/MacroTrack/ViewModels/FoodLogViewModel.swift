//
//  FoodLogViewModel.swift
//  MacroTrack
//
//  Created by Tristan carreon on 11/12/26.
//
import Foundation
import Combine

// Manages logged foods and nutritional totals
@MainActor
class FoodLogViewModel: ObservableObject {

    // Store all logged foods
    @Published var foodEntries: [FoodEntry] = []

    // Add food to the log
    func addFood(_ food: FoodEntry) {
        foodEntries.append(food)
    }

    // Delete a specific food
    func deleteFood(_ id: UUID) {
        foodEntries.removeAll { entry in
            entry.id == id
        }
    }

    // Update food
    func updateFood(_ updatedFood: FoodEntry) {

        for index in foodEntries.indices {
            if foodEntries[index].id == updatedFood.id {
                foodEntries[index] = updatedFood
                break
            }
        }
    }

    // Retrieve foods from a specific meal
    func foodsForMeal(_ meal: String) -> [FoodEntry] {

        return foodEntries.filter { entry in
            entry.meal == meal
        }
    }

    // Calculate calories for a specific meal
    func caloriesForMeal(_ meal: String) -> Double {

        var total = 0.0

        for entry in foodEntries {
            if entry.meal == meal {
                total += entry.calories
            }
        }

        return total
    }

    // Calculate total daily calories
    var totalCalories: Double {

        var total = 0.0

        for entry in foodEntries {
            total += entry.calories
        }

        return total
    }

    // Calculate total daily protein
    var totalProtein: Double {

        var total = 0.0

        for entry in foodEntries {
            total += entry.protein
        }

        return total
    }

    // Calculate total daily carbohydrates
    var totalCarbs: Double {

        var total = 0.0

        for entry in foodEntries {
            total += entry.carbs
        }

        return total
    }

    // Calculate total daily fat
    var totalFat: Double {

        var total = 0.0

        for entry in foodEntries {
            total += entry.fat
        }

        return total
    }
}

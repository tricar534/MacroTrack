//
//  FoodEntry.swift
//  MacroTrack
//
//  Created by Tristan carreon on 11/12/26.
//
import Foundation

// Represents a food added to the Food Log
struct FoodEntry: Identifiable, Codable {

    // Unique ID for each logged entry
    var id = UUID()

    // USDA food ID
    let fdcId: Int

    // Food information
    var name: String
    var grams: Double
    var meal: String

    // Original nutritional values per 100 grams
    var caloriesPer100g: Double
    var proteinPer100g: Double
    var carbsPer100g: Double
    var fatPer100g: Double

    // Calculate calories based on quantity
    var calories: Double {
        return caloriesPer100g * grams / 100
    }

    // Calculate protein
    var protein: Double {
        return proteinPer100g * grams / 100
    }

    // Calculate carbohydrates
    var carbs: Double {
        return carbsPer100g * grams / 100
    }

    // Calculate fat
    var fat: Double {
        return fatPer100g * grams / 100
    }
}

//
//  USDAFood.swift
//  MacroTrack
//
//  Created by Tristan carreon on 11/12/26.
//
import Foundation

// Represents the main JSON response from USDA
struct USDAFoodResponse: Codable {
    let foods: [USDAFood]
}

// Represents one food returned by USDA
struct USDAFood: Identifiable, Codable {
    let fdcId: Int
    let description: String
    let foodNutrients: [USDANutrient]?
    
    // USDA serving information
    let servingSize: Double?
    let servingSizeUnit: String?
    let householdServingFullText: String?

    // Unique ID required for displaying foods in a SwiftUI List
    var id: Int {
        return fdcId
    }

    // Find a nutrient by its USDA ID
    func nutrientValue(_ nutrientId: Int) -> Double? {
        for nutrient in foodNutrients ?? [] {
            if nutrient.nutrientId == nutrientId {
                return nutrient.value
            }
        }

        return nil
    }

    // Nutrition values are generally reported per 100 grams
    var caloriesPer100g: Double? {
        return nutrientValue(1008)
            ?? nutrientValue(2047)
            ?? nutrientValue(2048)
    }

    var proteinPer100g: Double? {
        return nutrientValue(1003)
    }

    var carbsPer100g: Double? {
        return nutrientValue(1005)
    }

    var fatPer100g: Double? {
        return nutrientValue(1004)
    }
}

// Represents one nutritional value
struct USDANutrient: Codable {
    let nutrientId: Int
    let value: Double?
}

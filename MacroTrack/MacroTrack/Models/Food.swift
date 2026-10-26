//
//  Food.swift
//  MacroTrack
//
//  Created by Tristan carreon on 10/26/26.
//
import Foundation

// Struct to store food information
struct Food: Identifiable {
    
    // Unique id for each food
    let id = UUID()
    
    // Food name
    var name: String
    
    // Calories in food
    var calories: Int
}

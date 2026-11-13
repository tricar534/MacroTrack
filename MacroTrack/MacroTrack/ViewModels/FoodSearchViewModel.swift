//
//  FoodSearchViewModel.swift
//  MacroTrack
//
//  Created by Tristan carreon on 11/12/26.
//
import Foundation
import Combine

// View model layer
// Manage food search Result and application state
@MainActor
class FoodSearchViewModel: ObservableObject {
    
    // Store foods retrieved from USDA
    @Published var foods: [USDAFood] = []
    
    // Track if api request loading
    @Published var isLoading: Bool = false
    
    // Store error msg
    @Published var errorMessage: String? = nil
    
    // Access USDA API service
    private let service = FoodAPIService.shared
    
    // Search USDA food
    func searchFoods(query: String) async {
       
        // Remove extra spaces from the search term
        let trimmedQuery = query.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        // Make sure the search is not empty
        guard !trimmedQuery.isEmpty else {
            foods = []
            errorMessage = nil
            return
        }
        
        // Start loading and clear errors
        isLoading = true
        errorMessage = nil
        
        do {
            
            // Call API service
            let fetchedFoods = try await service.searchFoods(
                query: trimmedQuery
            )
            self.foods = fetchedFoods
        } catch {
            
            // Handle API errors
            self.foods = []
            self.errorMessage = "Failed to search foods: \(error.localizedDescription)"
        }
        // Stop loading
        isLoading = false
    }
}

//
//  FoodAPIService.swift
//  MacroTrack
//
//  Created by Tristan carreon on 11/5/26.
//

import Foundation

// Handles API requests to USDA FoodData Central
class FoodAPIService {

    static let shared = FoodAPIService()

    // USDA API base URL
    private let baseURL = "https://api.nal.usda.gov/fdc/v1"

    // Retrieve API key from Xcode configuration
    private var apiKey: String {
        Bundle.main.object(forInfoDictionaryKey: "USDA_API_KEY") as? String ?? ""
    }

    private init() {}

    // Search USDA foods using a search term
    func searchFoods(query: String) async throws -> [USDAFood] {

        // Make sure API key is configured
        guard !apiKey.isEmpty && !apiKey.contains("$(") else {
            print("USDA API key is missing")
            throw URLError(.userAuthenticationRequired)
        }

        // Create the USDA search URL
        var components = URLComponents(
            string: "\(baseURL)/foods/search"
        )!

        // Add search parameters
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "pageSize", value: "15")
        ]

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        // Create an HTTP GET request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        // Request data from USDA
        let (data, response) = try await URLSession.shared.data(
            for: request
        )

        // Check if request was successful
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        // Convert JSON into USDAFood objects
        let usdaResponse = try JSONDecoder().decode(
            USDAFoodResponse.self,
            from: data
        )

        // Print testing information
        print("Method: GET")
        print("HTTP Status:", httpResponse.statusCode)
        print("Foods Found:", usdaResponse.foods.count)

        // Return array of foods
        return usdaResponse.foods
    }
}

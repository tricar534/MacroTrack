//
//  FoodAPIService.swift
//  MacroTrack
//
//  Created by Tristan carreon on 11/5/26.
//

import Foundation

// Handles API requests to Open Food Facts
struct FoodAPIService {

    // Function to test our API connection
    // async allows the function to perform asynchronous tasks
    func testAPI() async {

        // URL of the Open Food Facts API endpoint
        // This endpoint retrieves a product using its barcode
        let url = URL(
            string: "https://world.openfoodfacts.net/api/v3.6/product/3274080005003.json"
        )!

        // Create an HTTP request using our URL
        var request = URLRequest(url: url)
        
        // Set the request method to GET to retrieve information
        request.httpMethod = "GET"

        // Identify our app to the API server
        // Contact email needed
        request.setValue(
            "MacroTrack/0.1 (tcarreon2@csu.fullerton.edu)",
            forHTTPHeaderField: "User-Agent"
        )

        // Public login credentials required for the test server
        request.setValue(
            "Basic b2ZmOm9mZg==",
            forHTTPHeaderField: "Authorization"
        )

        // Attempt to send the API request
        do {
            
            // Send the request and wait for the server's response
            // data contains the information returned by the API
            // response contains information about the HTTP response
            let (data, response) = try await URLSession.shared.data(for: request)

            // Get the HTTP status code (200 means success)
            let status = (response as? HTTPURLResponse)?.statusCode ?? 0

            // Display request information in Xcode's console
            print("Method: GET")
            print("Endpoint: \(url)")
            print("HTTP Status: \(status)")
            
            // Convert the response data into readable text
            // Display only the first 2000 characters
            print(String(decoding: data, as: UTF8.self).prefix(2000))

        } catch {
            // Display an error if the request fails
            print("API Error: \(error)")
        }
    }
}

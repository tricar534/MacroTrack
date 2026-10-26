//
//  FoodLogView.swift
//  MacroTrack
//
//  Created by Tristan carreon on 10/21/26.
//

import SwiftUI

struct FoodLogView: View {
    
    // Food
    let breakfastFoods = [
        "Boiled eggs",
        "Banana"
    ]
    //let lunchFoods = []
    //let dinnerFoods = []
    //let snacksFoods = []
    
    
    var body: some View {
        
        // Navigation
        NavigationStack {
            
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [
                        Color(red: 0.78, green: 0.90, blue: 0.87),
                        Color(red: 0.96, green: 0.98, blue: 0.97)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                
                // Food log list
                List {

                    // Daily summary
                    HStack {
                        Text("Today")
                            .bold()
                        Spacer()
                        Text("0 calories logged")
                            .font(.subheadline)
                    }
                    .listRowBackground(Color.clear)

                    // Breakfast section
                    Section {
                        
                        // Create row for each food
                        ForEach(breakfastFoods, id: \.self){ food in HStack {
                                Text(food)
                                Spacer()
                            }
                        }
                        
                    } header: {
                        Label("Breakfast", systemImage: "sunrise")
                    }
                    
                    // Lunch Section
                    Section {
                        Text("No foods logged")
                            .foregroundStyle(.secondary)
                    } header: {
                        Label("Lunch", systemImage: "sun.max")
                    }
                    
                    // Dinner Section
                    Section {
                        Text("No foods logged")
                            .foregroundStyle(.secondary)
                    } header: {
                        Label("Dinner", systemImage: "moon")
                    }
                    
                    // Snack Section
                    Section {
                        Text("No foods logged")
                            .foregroundStyle(.secondary)
                    } header: {
                        Label("Snacks", systemImage: "popcorn")
                    }
                    

                } // End list
                .scrollContentBackground(.hidden)
                
            } // End zstack
        .navigationTitle("Food Log")
        }
    }
}

#Preview {
    FoodLogView()
}

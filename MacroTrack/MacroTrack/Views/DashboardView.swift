//
//  DashboardView.swift
//  MacroTrack
//
//  Created by Tristan carreon on 10/21/26.
//

import SwiftUI

struct DashboardView: View {
   
    // Detect light or dark mode ** IMPLEMENT LATER **
    @Environment(\.colorScheme) var colorScheme
    
    // Daily Calorie Info
    @State private var caloriesEaten = 1500.0
    @State private var calorieGoal = 2000.0
    
    var body: some View {
        
        // Allow navigation and display title
        NavigationStack{
                
            // Gradient background
            ZStack {
                // Backgound gradient
                LinearGradient(
                    colors: colorScheme == .dark
                    ? [
                        Color(red: 0.06, green: 0.09, blue: 0.16),
                        Color(red: 0.15, green: 0.21, blue: 0.31)
                    ]
                    : [
                        Color(red: 0.78, green: 0.90, blue: 0.87),
                        Color(red: 0.96, green: 0.98, blue: 0.97)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                
                // Allow dashboard to scroll
                ScrollView {
                    
                    // Vertical content
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Dashboard Heading
                        Text("Today's Nutrition")
                            .font(.title2)
                            .bold()
                    
                        // Macros info
                        
                        // Daily calories card
                        VStack ( alignment: .leading, spacing: 15){
                            Text("Daily Calories")
                                .font(.headline)
                            
                            // Calories consumed
                            Text("\(Int(caloriesEaten)) / \(Int(calorieGoal)) cal")
                                .font(.title)
                                .bold()
                            
                            // Tracking bar for calories
                            ProgressView( value: caloriesEaten, total: calorieGoal )
                                .tint(caloriesEaten > calorieGoal ? .red : .green)
                            
                            // Remaining calories
                            if caloriesEaten > calorieGoal {
                                Text("\(Int(caloriesEaten - calorieGoal)) calories over goal")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                                
                                
                            } else {
                                Text("\(Int(calorieGoal - caloriesEaten)) calories remaining")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                
                            }
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.white)
                        .cornerRadius(15)
                        
                        
                        // Macros cards
                        HStack (spacing: 12) {
                            
                            // Protein
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Protein")
                                    .font(.subheadline)
                                
                                Text("0 g")
                                    .font(.title2)
                                    .bold()
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.white)
                            .cornerRadius(15)
                            
                            
                            // Carbs
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Carbs")
                                    .font(.subheadline)
                                
                                Text("0 g")
                                    .font(.title2)
                                    .bold()
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.white)
                            .cornerRadius(15)
                            
                            
                            
                            // Fat
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Fat")
                                    .font(.subheadline)
                                
                                Text("0 g")
                                    .font(.title2)
                                    .bold()
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.white)
                            .cornerRadius(15)
                            
                        }
                        
                    }
                    // Add space around content
                    .padding()
                    .foregroundStyle(.primary)
                    
                    // Title nav bar
                    .navigationTitle("MacroTrack")
                    }
            }
        }
    }
}

#Preview {
    DashboardView()
}

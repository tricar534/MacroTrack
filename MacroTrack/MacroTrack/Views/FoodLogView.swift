//
//  FoodLogView.swift
//  MacroTrack
//
//  Created by Tristan carreon on 10/21/26.
//

import SwiftUI

struct FoodLogView: View {
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
                    Section("Breakfast") {
                        Text("No foods logged")
                            .foregroundStyle(.secondary)
                    }
                    
                    // Lunch Section
                    
                    // Dinner Section
                    
                    // Snack Section

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

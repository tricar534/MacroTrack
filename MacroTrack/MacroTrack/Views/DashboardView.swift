//
//  DashboardView.swift
//  MacroTrack
//
//  Created by Tristan carreon on 10/21/26.
//

import SwiftUI

struct DashboardView: View {
   
    @Environment(\.colorScheme) var colorScheme
    
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
                
                // Vertical content
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Dashboard Heading
                    Text("Today's Nutrition")
                        .font(.title2)
                        .bold()
                    
                    // Macros info
                    Text("Calories: 0 / 2000")
                    Text("Protein: 0 g")
                    Text("Carbs: 0 g")
                    Text("Fat: 0 g")
                    
                    // Push content toward top
                    Spacer()
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

#Preview {
    DashboardView()
}

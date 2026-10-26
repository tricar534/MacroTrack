//
//  DashboardView.swift
//  MacroTrack
//
//  Created by Tristan carreon on 10/21/26.
//

import SwiftUI

struct DashboardView: View {
   
    // Detect light or dark mode
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
                        VStack{
                            Text("Daily Calories")
                                .font(.headline)
                            
                            Text("0 / 2000 cal")
                                .font(.title)
                                .bold()
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background()
                        .cornerRadius(15)
                        
                        
                        // Macros cards
                        HStack (spacing: 12) {
                            
                            // Protein
                            VStack{
                                Text("Protein")
                                    .font(.subheadline)
                                
                                Text("0 g")
                                    .font(.title2)
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background()
                            .cornerRadius(15)
                            
                            
                            // Carbs
                            VStack {
                                Text("Carbs")
                                    .font(.subheadline)
                                
                                Text("0 g")
                                    .font(.title2)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background()
                            .cornerRadius(15)
                            
                            
                            
                            // Fat
                            VStack {
                                Text("Fat")
                                    .font(.subheadline)
                                
                                Text("0 g")
                                    .font(.title2)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background()
                            .cornerRadius(15)
                            
                        }
                        
                        
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
}

#Preview {
    DashboardView()
}

//
//  DashboardView.swift
//  MacroTrack
//
//  Created by Tristan carreon on 10/21/26.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        // Allow navigation and display title
        NavigationStack{
            
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
            
            // Title nav bar
            .navigationTitle("MacroTrack")
        }
    }
}

#Preview {
    DashboardView()
}

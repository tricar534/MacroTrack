//
//  ProgressView.swift
//  MacroTrack
//
//  Created by Tristan carreon on 10/21/26.
//

import SwiftUI

struct ProgressScreen: View {
    
    @State var selectedPeriod = "Week"
    
    let periods = ["Week", "Month"]
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Pogress Tracker")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity)
                
                // Time period picker
                Picker("Time Period", selection: $selectedPeriod) {
                    ForEach(periods, id: \.self) { period in
                        Text(period)
                    }
                }
                .pickerStyle(.segmented)
                
                // Progress overview
                Text("Progress Overview")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                HStack(spacing: 15) {
                    VStack(spacing: 5) {
                        Text("Weight Change")
                            .font(.subheadline)
                        
                        Text("-- lbs")
                            .font(.title2)
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                    
                    VStack(spacing: 5) {
                        Text("Avg. Calories")
                            .font(.subheadline)
                            
                        Text("-- kcal")
                            .font(.title2)
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                }
                
                // Weight chart placeholder
                Text("Weight Progress")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.green.opacity(0.1))
                    .frame(height: 190)
                    .overlay{
                        VStack(spacing: 8) {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .font(.largeTitle)

                            Text("Chart coming soon")
                                .foregroundColor(.secondary)
                        }
                    }
                
                // Calorie chart placeholder
                Text("Calorie History")
                    .font(.headline)
                    .frame(maxWidth: .infinity)

                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.1))
                    .frame(height: 190)
                    .overlay {
                        VStack(spacing: 8) {
                            Image(systemName: "chart.bar.xaxis")
                                .font(.largeTitle)

                            Text("Chart coming soon")
                                .foregroundColor(.secondary)
                        }
                    }
            }
            .padding()
        }
    }
}

#Preview {
    ProgressScreen()
}

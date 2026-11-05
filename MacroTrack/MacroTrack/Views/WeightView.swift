//
//  WeightView.swift
//  MacroTrack
//
//  Created by Tristan carreon on 10/21/26.
//

import SwiftUI

struct WeightView: View {
    
    @State var currentWeight: Double = 222.2
    @State var weightInput: String = ""
    
    let goalWeight = 200.0
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                
                Text("Weight Tracker")
                    .font(.largeTitle)
                    .bold()
                
                HStack (spacing: 15) {

                    // Current Weight
                    VStack{
                        Text("Current weight")
                            .font(.subheadline)
                        
                        Text("\(currentWeight, specifier: "%.1f") lbs")
                            .font(.title2)
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Goal Weight
                    VStack{
                        
                        Text("Goal weight")
                            .font(.subheadline)
                        
                        Text("\(goalWeight, specifier: "%.1f") lbs")
                            .font(.title2)
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                }
                
                // Weight input
                VStack{
                    
                    Text("Log weight")
                        .font(.headline)
                    
                    TextField("Enter Weight", text: $weightInput)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                    
                    Button("Save weight") {
                        if let newWeight = Double(weightInput),
                            newWeight > 0 {
                            currentWeight = newWeight
                            weightInput = ""
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(12)
                
                // Weight history
                Text("Weight History")
                    .font(.headline)
                
                //Chart placeholder
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.1))
                    .frame(height: 200)
                    .overlay{
                        VStack {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .font(.largeTitle)
                            
                            Text("Chart comming soon")
                                .foregroundStyle(.secondary)
                        }
                    }

            }
            .padding()
        }
        
    }
}

#Preview {
    WeightView()
}

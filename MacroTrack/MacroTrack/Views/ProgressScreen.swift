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
                
                // Period picker
                Picker("Time Period", selection: $selectedPeriod) {
                    ForEach(periods, id: \.self) { period in
                        Text(period)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

#Preview {
    ProgressScreen()
}

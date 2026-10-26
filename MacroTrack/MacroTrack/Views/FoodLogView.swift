//
//  FoodLogView.swift
//  MacroTrack
//
//  Created by Tristan carreon on 10/21/26.
//

import SwiftUI
struct FoodLogView: View {
    
    // Arrays of food
    let breakfastFoods = [
        Food(name: "Boiled eggs", calories: 140),
        Food(name: "Banana", calories: 100)
    ]
    let lunchFoods: [Food] = [Food(name: "Pizza", calories: 300)]
    let dinnerFoods: [Food] = [Food(name: "Sushi", calories: 600)]
    let snacksFoods: [Food] = [Food(name: "Apple", calories: 80)]
    
    
    // FUNCTIONS
    
    // Calculate total calories for a meal
    func mealTotal(foods: [Food]) -> Int {
        var total = 0

        for food in foods {
            total += food.calories
        }

        return total
    }
    
    // Calculate total calories for the day
    func dailyTotal() -> Int {
        let allFoods = breakfastFoods + lunchFoods + dinnerFoods + snacksFoods

        return mealTotal(foods: allFoods)
    }
    
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
                        
                        Text("\(dailyTotal()) calories logged")
                            .font(.subheadline)
                    }
                    .listRowBackground(Color.clear)

                    // Breakfast section
                    Section {
                        if breakfastFoods.isEmpty {
                            Text("No foods logged")
                                .foregroundStyle(.secondary)
                        } else {
                            // Create row for each food
                            ForEach(breakfastFoods) { food in HStack {
                                Text("\(food.name)")
                                Spacer()
                                Text("\(food.calories) cal")
                            }}
                        }
                        
                    } header: {
                        HStack {
                                Label("Breakfast", systemImage: "sunrise")

                                Spacer()

                                // Breakfast calorie subtotal
                                Text("\(mealTotal(foods: breakfastFoods)) cal")
                                    .font(.subheadline)
                        }
                    }
                    
                    // Lunch Section
                    Section {
                        if lunchFoods.isEmpty {
                            Text("No foods logged")
                                .foregroundStyle(.secondary)
                        } else {
                            // Create row for each food
                            ForEach(lunchFoods) { food in HStack {
                                Text("\(food.name)")
                                Spacer()
                                Text("\(food.calories) cal")
                            }}
                        }
                    } header: {
                        HStack {
                                Label("Lunch", systemImage: "sun.max")

                                Spacer()

                                // Breakfast calorie subtotal
                                Text("\(mealTotal(foods: lunchFoods)) cal")
                                    .font(.subheadline)
                        }
                    }
                    
                    // Dinner Section
                    Section {
                        if dinnerFoods.isEmpty {
                            Text("No foods logged")
                                .foregroundStyle(.secondary)
                        } else {
                            // Create row for each food
                            ForEach(dinnerFoods) { food in HStack {
                                Text("\(food.name)")
                                Spacer()
                                Text("\(food.calories) cal")
                            }}
                        }
                    } header: {
                        HStack {
                                Label("Dinner", systemImage: "moon")

                                Spacer()

                                // Breakfast calorie subtotal
                                Text("\(mealTotal(foods: dinnerFoods)) cal")
                                    .font(.subheadline)
                        }
                    }
                    
                    // Snack Section
                    Section {
                        if snacksFoods.isEmpty {
                            Text("No foods logged")
                                .foregroundStyle(.secondary)
                        } else {
                            // Create row for each food
                            ForEach(snacksFoods) { food in HStack {
                                Text("\(food.name)")
                                Spacer()
                                Text("\(food.calories) cal")
                            }}
                        }
                    } header: {
                        HStack {
                                Label("Snack", systemImage: "popcorn")

                                Spacer()

                                // Breakfast calorie subtotal
                                Text("\(mealTotal(foods: snacksFoods)) cal")
                                    .font(.subheadline)
                        }
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

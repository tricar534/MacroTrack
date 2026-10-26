import SwiftUI
import Playgrounds

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
            FoodSearchView()
                .tabItem{
                    Label("Search", systemImage: "magnifyingglass")
                }
            FoodLogView()
                .tabItem {
                    Label("Food Log", systemImage: "list.bullet")
                }
            WeightView()
                .tabItem {
                    Label("Weight", systemImage: "scalemass")
                }

            ProgressScreen()
                .tabItem {
                    Label("Progress", systemImage: "chart.bar")
                }
        }
    }
}

#Preview {
    ContentView()
}



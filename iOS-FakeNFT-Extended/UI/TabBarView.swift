import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            TestCatalogView()
                .tabItem {
                    Label(
                        NSLocalizedString("Tab.catalog", comment: ""),
                        systemImage: "square.stack.3d.up.fill"
                    )
                }
                .backgroundStyle(.background)
            
            NavigationStack {
                StatisticsView()
            }
            .tabItem {
                Image(systemName: "flag.2.crossed.fill")
                Text("Статистика")
            }
            .tag(1)
        }
    }
}

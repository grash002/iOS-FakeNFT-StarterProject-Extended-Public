import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Label(
                        NSLocalizedString("Tab.profile", comment: ""),
                        systemImage: "person.crop.circle.fill"
                    )
                }
            CatalogView()
                .tabItem {
                    Label(
                        NSLocalizedString("Tab.catalog", comment: ""),
                        systemImage: "rectangle.stack.fill"
                    )
                }
            CartView()
                .tabItem {
                    Label {
                        Text(NSLocalizedString("Tab.cart", comment: ""))
                    } icon: {
                        Image(.basket)
                    }
                }
            
            NavigationStack {
                StatisticsView()
            }
            .tabItem {
                Label(
                    NSLocalizedString("Tab.statistic", comment: ""),
                    systemImage: "flag.2.crossed.fill"
                )
            }
        }
    }
}

#Preview {
    TabBarView()
}

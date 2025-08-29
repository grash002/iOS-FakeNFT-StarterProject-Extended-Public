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
            StatisticView()
                .tabItem {
                    Label(
                        NSLocalizedString("Tab.statistic", comment: ""),
                        systemImage: "flag.2.crossed.fill"
                    )
                }
        }
        .onAppear {
            let appearance = UITabBar.appearance()
            appearance.unselectedItemTintColor = .black
            appearance.backgroundColor = .white
            appearance.shadowImage = UIImage()
            appearance.backgroundImage = UIImage()
            appearance.isTranslucent = false
        }
        .backgroundStyle(.background)
    }
}

#Preview {
    TabBarView()
}

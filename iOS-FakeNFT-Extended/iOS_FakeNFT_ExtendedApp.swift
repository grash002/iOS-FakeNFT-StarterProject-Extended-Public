import SwiftUI

@main
struct iOS_FakeNFT_ExtendedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(ServicesAssembly(networkClient: DefaultNetworkClient(), nftStorage: NftStorageImpl()))
                .onAppear {
                    let appearance = UINavigationBarAppearance()
                    appearance.configureWithTransparentBackground()
                    appearance.backgroundColor = UIColor.clear
                    appearance.shadowColor = UIColor.clear
                    
                    appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
                    appearance.backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
                    
                    let backImage = UIImage(systemName: "chevron.left")?.withTintColor(.black, renderingMode: .alwaysOriginal)
                    appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
                    
                    UINavigationBar.appearance().standardAppearance = appearance
                    UINavigationBar.appearance().scrollEdgeAppearance = appearance
                    UINavigationBar.appearance().compactAppearance = appearance
                }
        }
    }
}

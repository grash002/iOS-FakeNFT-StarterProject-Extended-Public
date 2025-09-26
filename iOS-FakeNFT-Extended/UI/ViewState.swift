import SwiftUI
import ProgressHUD

enum ViewState {
    case loading
    case success
    case failed
    case `default`
}

struct ViewStateModifier: ViewModifier {
    @Binding var state: ViewState

    func body(content: Content) -> some View {
        content
            .onChange(of: state) { oldValue, newValue in
                switch newValue {
                case .loading:
                    ProgressHUD.animate()
                case .success:
                    ProgressHUD.succeed()
                case .failed:
                    ProgressHUD.failed()
                case .default:
                    ProgressHUD.dismiss()
                }
            }
    }
}

extension View {
    func viewState(_ state: Binding<ViewState>) -> some View {
        self.modifier(ViewStateModifier(state: state))
    }
}

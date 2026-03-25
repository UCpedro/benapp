import SwiftUI

@main
struct BenBenefitsApp: App {
    @StateObject private var homeViewModel = HomeViewModel(
        repository: MockBenefitsRepository(),
        selectionStore: UserDefaultsSelectionStore()
    )

    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: homeViewModel)
                .preferredColorScheme(.light)
        }
    }
}

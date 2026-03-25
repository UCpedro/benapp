import SwiftUI

struct CardSelectionView: View {
    @ObservedObject var viewModel: HomeViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Selecciona tus bancos y tarjetas")
                        .font(.title3.weight(.bold))
                    Text("Tu selección se guarda localmente para que siempre tengas tus beneficios listos.")
                        .font(.footnote)
                        .foregroundStyle(AppTheme.secondaryText)

                    ForEach(viewModel.banks) { bank in
                        BankSelectionCard(
                            bank: bank,
                            cards: viewModel.cards(for: bank.id),
                            selectedCardIDs: viewModel.selectedCardIDs,
                            onToggle: viewModel.toggleCardSelection(cardID:)
                        )
                    }
                }
                .padding()
            }
            .background(AppTheme.background.ignoresSafeArea())
            .navigationTitle("Bancos y tarjetas")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Listo") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    CardSelectionView(
        viewModel: HomeViewModel(
            repository: MockBenefitsRepository(),
            selectionStore: UserDefaultsSelectionStore(defaults: .standard)
        )
    )
}

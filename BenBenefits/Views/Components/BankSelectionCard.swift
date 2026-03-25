import SwiftUI

struct BankSelectionCard: View {
    let bank: Bank
    let cards: [BankCard]
    let selectedCardIDs: Set<String>
    let onToggle: (String) -> Void

    private var hasSelection: Bool {
        cards.contains { selectedCardIDs.contains($0.id) }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Circle()
                    .fill(Color(hex: bank.accentColorHex))
                    .frame(width: 10, height: 10)
                Text(bank.name)
                    .font(.headline)
                Spacer()
                if hasSelection {
                    Text("Activo")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(Color.green)
                }
            }

            ForEach(cards) { card in
                Button {
                    onToggle(card.id)
                } label: {
                    HStack {
                        VStack(alignment: .leading, spacing: 3) {
                            Text(card.name)
                                .font(.subheadline.weight(.medium))
                                .foregroundStyle(AppTheme.primaryText)
                            Text(card.type.rawValue)
                                .font(.caption)
                                .foregroundStyle(AppTheme.secondaryText)
                        }
                        Spacer()
                        Image(systemName: selectedCardIDs.contains(card.id) ? "checkmark.circle.fill" : "circle")
                            .font(.title3)
                            .foregroundStyle(selectedCardIDs.contains(card.id) ? AppTheme.accent : Color.gray.opacity(0.5))
                    }
                    .padding(12)
                    .background(Color(hex: "#F8FAFC"))
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
                .buttonStyle(.plain)
            }
        }
        .padding(14)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color.black.opacity(0.06), lineWidth: 1)
        )
    }
}

#Preview {
    let repo = MockBenefitsRepository()
    BankSelectionCard(
        bank: repo.fetchBanks()[0],
        cards: repo.fetchCards().filter { $0.bankID == "santander" },
        selectedCardIDs: ["debito_santander"],
        onToggle: { _ in }
    )
    .padding()
    .background(AppTheme.background)
}

import SwiftUI

struct BenefitCardView: View {
    let benefit: Benefit
    let bank: Bank?
    let card: BankCard?

    private var validDaysText: String {
        benefit.diasValidos.map(\.shortName).joined(separator: " · ")
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(benefit.comercio)
                        .font(.title3.weight(.bold))
                        .foregroundStyle(AppTheme.primaryText)
                    Text(benefit.titulo)
                        .font(.subheadline)
                        .foregroundStyle(AppTheme.secondaryText)
                }

                Spacer()

                Text("HOY")
                    .font(.caption2.weight(.bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 9)
                    .padding(.vertical, 6)
                    .background(Color.green)
                    .clipShape(Capsule())
            }

            HStack(spacing: 10) {
                badge(text: bank?.name ?? "Banco")
                badge(text: card?.name ?? "Tarjeta")
                badge(text: benefit.tipoBeneficio.rawValue)
            }

            VStack(alignment: .leading, spacing: 6) {
                infoLine(title: "Beneficio", value: benefit.descuento)
                infoLine(title: "Días válidos", value: validDaysText)
                if let tope = benefit.tope {
                    infoLine(title: "Tope", value: tope)
                }
                infoLine(title: "Condiciones", value: benefit.condiciones)
            }

            HStack(spacing: 8) {
                if benefit.disponibleOnline {
                    channelPill("Online")
                }
                if benefit.disponiblePresencial {
                    channelPill("Presencial")
                }
            }
        }
        .padding(16)
        .background(AppTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black.opacity(0.05), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 8)
    }

    private func infoLine(title: String, value: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("\(title):")
                .font(.footnote.weight(.semibold))
                .foregroundStyle(AppTheme.secondaryText)
            Text(value)
                .font(.footnote)
                .foregroundStyle(AppTheme.primaryText)
        }
    }

    private func badge(text: String) -> some View {
        Text(text)
            .font(.caption.weight(.semibold))
            .foregroundStyle(AppTheme.primaryText)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Color(hex: "#EEF2FF"))
            .clipShape(Capsule())
    }

    private func channelPill(_ title: String) -> some View {
        Text(title)
            .font(.caption2.weight(.semibold))
            .foregroundStyle(Color(hex: "#0F766E"))
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            .background(Color(hex: "#CCFBF1"))
            .clipShape(Capsule())
    }
}

#Preview {
    BenefitCardView(
        benefit: MockBenefitsRepository().fetchBenefits().first!,
        bank: MockBenefitsRepository().fetchBanks().first,
        card: MockBenefitsRepository().fetchCards().first
    )
    .padding()
    .background(AppTheme.background)
}

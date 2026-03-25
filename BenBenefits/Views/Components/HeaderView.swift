import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AppTheme.heroGradient
                .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                .frame(height: 180)

            VStack(alignment: .leading, spacing: 8) {
                Text("Beneficios inteligentes")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.white.opacity(0.9))

                Text("¿Dónde vas a comprar hoy?")
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.white)

                Text("Encuentra descuentos, cashback y cuotas para tus tarjetas.")
                    .font(.footnote)
                    .foregroundStyle(.white.opacity(0.88))
            }
            .padding(20)
        }
        .shadow(color: .black.opacity(0.15), radius: 16, x: 0, y: 10)
    }
}

#Preview {
    HeaderView()
        .padding()
        .background(AppTheme.background)
}

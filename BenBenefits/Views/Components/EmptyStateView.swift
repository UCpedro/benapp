import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 14) {
            Image(systemName: "magnifyingglass.circle")
                .font(.system(size: 46))
                .foregroundStyle(AppTheme.accent)

            Text("No hay beneficios disponibles hoy")
                .font(.headline)
                .foregroundStyle(AppTheme.primaryText)

            Text("Prueba con otro comercio, ajusta tus filtros o selecciona más tarjetas.")
                .font(.footnote)
                .foregroundStyle(AppTheme.secondaryText)
                .multilineTextAlignment(.center)
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [6]))
                .foregroundStyle(Color.black.opacity(0.15))
        )
    }
}

#Preview {
    EmptyStateView()
        .padding()
        .background(AppTheme.background)
}

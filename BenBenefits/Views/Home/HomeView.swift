import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HeaderView()

                    SearchBar(text: $viewModel.filter.searchText)

                    Button {
                        viewModel.isCardSelectorPresented = true
                    } label: {
                        HStack {
                            Image(systemName: "creditcard.and.123")
                            Text("Tarjetas seleccionadas: \(viewModel.selectedCardsCount)")
                                .fontWeight(.semibold)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption.weight(.bold))
                        }
                        .foregroundStyle(AppTheme.primaryText)
                        .padding(14)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    }
                    .buttonStyle(.plain)

                    filterSection

                    Text("Disponibles hoy")
                        .font(.title3.weight(.bold))
                        .padding(.top, 4)

                    if viewModel.availableToday.isEmpty {
                        EmptyStateView()
                    } else {
                        LazyVStack(spacing: 14) {
                            ForEach(viewModel.availableToday) { benefit in
                                BenefitCardView(
                                    benefit: benefit,
                                    bank: viewModel.bank(for: benefit.bankID),
                                    card: viewModel.card(for: benefit.cardID)
                                )
                            }
                        }
                    }
                }
                .padding()
            }
            .background(AppTheme.background.ignoresSafeArea())
            .navigationBarHidden(true)
            .sheet(isPresented: $viewModel.isCardSelectorPresented) {
                CardSelectionView(viewModel: viewModel)
            }
        }
    }

    private var filterSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Filtros")
                .font(.headline)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(BenefitType.allCases) { type in
                        FilterChip(
                            title: type.rawValue,
                            isSelected: viewModel.filter.selectedBenefitTypes.contains(type)
                        ) {
                            viewModel.toggleBenefitType(type)
                        }
                    }
                }
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(BenefitCategory.allCases) { category in
                        FilterChip(
                            title: category.rawValue,
                            isSelected: viewModel.filter.selectedCategories.contains(category)
                        ) {
                            viewModel.toggleCategory(category)
                        }
                    }
                }
            }

            HStack(spacing: 8) {
                ForEach(CardType.allCases) { cardType in
                    FilterChip(
                        title: cardType.rawValue,
                        isSelected: viewModel.filter.selectedCardTypes.contains(cardType)
                    ) {
                        viewModel.toggleCardType(cardType)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            repository: MockBenefitsRepository(),
            selectionStore: UserDefaultsSelectionStore(defaults: .standard)
        )
    )
}

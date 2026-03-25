import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var filter = BenefitFilter()
    @Published var selectedCardIDs: Set<String>
    @Published var isCardSelectorPresented = false

    private let repository: BenefitsRepository
    private let selectionStore: SelectionStore

    let banks: [Bank]
    let cards: [BankCard]
    let benefits: [Benefit]

    init(repository: BenefitsRepository, selectionStore: SelectionStore) {
        self.repository = repository
        self.selectionStore = selectionStore
        self.banks = repository.fetchBanks()
        self.cards = repository.fetchCards()
        self.benefits = repository.fetchBenefits()
        self.selectedCardIDs = selectionStore.loadSelectedCardIDs()
    }

    var availableToday: [Benefit] {
        BenefitFilterHelper.filter(
            benefits: benefits,
            selectedCardIDs: selectedCardIDs,
            filter: filter
        )
    }

    var selectedCardsCount: Int {
        selectedCardIDs.count
    }

    func cards(for bankID: String) -> [BankCard] {
        cards.filter { $0.bankID == bankID }
    }

    func toggleCardSelection(cardID: String) {
        if selectedCardIDs.contains(cardID) {
            selectedCardIDs.remove(cardID)
        } else {
            selectedCardIDs.insert(cardID)
        }
        persistSelection()
    }

    func isCardSelected(_ cardID: String) -> Bool {
        selectedCardIDs.contains(cardID)
    }

    func bank(for id: String) -> Bank? {
        banks.first { $0.id == id }
    }

    func card(for id: String) -> BankCard? {
        cards.first { $0.id == id }
    }

    func toggleCategory(_ category: BenefitCategory) {
        if filter.selectedCategories.contains(category) {
            filter.selectedCategories.remove(category)
        } else {
            filter.selectedCategories.insert(category)
        }
    }

    func toggleBenefitType(_ type: BenefitType) {
        if filter.selectedBenefitTypes.contains(type) {
            filter.selectedBenefitTypes.remove(type)
        } else {
            filter.selectedBenefitTypes.insert(type)
        }
    }

    func toggleCardType(_ type: CardType) {
        if filter.selectedCardTypes.contains(type) {
            filter.selectedCardTypes.remove(type)
        } else {
            filter.selectedCardTypes.insert(type)
        }
    }

    private func persistSelection() {
        selectionStore.saveSelectedCardIDs(selectedCardIDs)
    }
}

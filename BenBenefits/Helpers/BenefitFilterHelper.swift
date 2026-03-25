import Foundation

struct BenefitFilter {
    var searchText: String = ""
    var selectedCategories: Set<BenefitCategory> = []
    var selectedBenefitTypes: Set<BenefitType> = []
    var selectedCardTypes: Set<CardType> = []
}

enum BenefitFilterHelper {
    static func isAvailableToday(_ benefit: Benefit, now: Date = Date(), calendar: Calendar = .current) -> Bool {
        let weekdayNumber = calendar.component(.weekday, from: now)
        guard let weekday = Weekday(rawValue: weekdayNumber) else { return false }
        return benefit.diasValidos.contains(weekday)
    }

    static func filter(
        benefits: [Benefit],
        selectedCardIDs: Set<String>,
        filter: BenefitFilter,
        now: Date = Date(),
        calendar: Calendar = .current
    ) -> [Benefit] {
        benefits.filter { benefit in
            guard selectedCardIDs.contains(benefit.cardID) else { return false }
            guard isAvailableToday(benefit, now: now, calendar: calendar) else { return false }

            if !filter.searchText.isEmpty {
                let text = filter.searchText.folding(options: .diacriticInsensitive, locale: .current)
                let comercio = benefit.comercio.folding(options: .diacriticInsensitive, locale: .current)
                guard comercio.localizedCaseInsensitiveContains(text) else { return false }
            }

            if !filter.selectedCategories.isEmpty,
               !filter.selectedCategories.contains(benefit.categoria) {
                return false
            }

            if !filter.selectedBenefitTypes.isEmpty,
               !filter.selectedBenefitTypes.contains(benefit.tipoBeneficio) {
                return false
            }

            if !filter.selectedCardTypes.isEmpty,
               !filter.selectedCardTypes.contains(benefit.tipoTarjeta) {
                return false
            }

            return true
        }
        .sorted { lhs, rhs in
            lhs.comercio < rhs.comercio
        }
    }
}

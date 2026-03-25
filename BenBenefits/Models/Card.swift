import Foundation

enum CardType: String, CaseIterable, Codable, Identifiable {
    case credit = "Crédito"
    case debit = "Débito"

    var id: String { rawValue }
}

struct BankCard: Identifiable, Hashable, Codable {
    let id: String
    let bankID: String
    let name: String
    let type: CardType
}

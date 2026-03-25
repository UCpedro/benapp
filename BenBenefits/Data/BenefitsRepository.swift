import Foundation

protocol BenefitsRepository {
    func fetchBanks() -> [Bank]
    func fetchCards() -> [BankCard]
    func fetchBenefits() -> [Benefit]
}

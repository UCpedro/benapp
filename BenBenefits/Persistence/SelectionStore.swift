import Foundation

protocol SelectionStore {
    func loadSelectedCardIDs() -> Set<String>
    func saveSelectedCardIDs(_ ids: Set<String>)
}

final class UserDefaultsSelectionStore: SelectionStore {
    private let key = "selected_card_ids"
    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    func loadSelectedCardIDs() -> Set<String> {
        let values = defaults.stringArray(forKey: key) ?? []
        return Set(values)
    }

    func saveSelectedCardIDs(_ ids: Set<String>) {
        defaults.set(Array(ids), forKey: key)
    }
}

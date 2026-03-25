import Foundation

enum BenefitCategory: String, CaseIterable, Codable, Identifiable {
    case food = "Comida"
    case supermarket = "Supermercado"
    case fuel = "Bencina"
    case travel = "Viajes"
    case pharmacy = "Farmacia"
    case delivery = "Delivery"

    var id: String { rawValue }
}

enum BenefitType: String, CaseIterable, Codable, Identifiable {
    case discount = "Descuento"
    case cashback = "Cashback"
    case installments = "Cuotas"

    var id: String { rawValue }
}

enum Weekday: Int, CaseIterable, Codable {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7

    var shortName: String {
        switch self {
        case .monday: return "Lun"
        case .tuesday: return "Mar"
        case .wednesday: return "Mié"
        case .thursday: return "Jue"
        case .friday: return "Vie"
        case .saturday: return "Sáb"
        case .sunday: return "Dom"
        }
    }
}

struct Benefit: Identifiable, Hashable, Codable {
    let id: String
    let comercio: String
    let bankID: String
    let cardID: String
    let tipoTarjeta: CardType
    let categoria: BenefitCategory
    let tipoBeneficio: BenefitType
    let titulo: String
    let descripcion: String
    let descuento: String
    let diasValidos: [Weekday]
    let tope: String?
    let condiciones: String
    let disponibleOnline: Bool
    let disponiblePresencial: Bool
}

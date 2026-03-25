import Foundation

struct MockBenefitsRepository: BenefitsRepository {
    func fetchBanks() -> [Bank] {
        [
            Bank(id: "santander", name: "Santander", accentColorHex: "#E30613"),
            Bank(id: "mach", name: "MACH", accentColorHex: "#4F46E5"),
            Bank(id: "tenpo", name: "Tenpo", accentColorHex: "#0EA5E9"),
            Bank(id: "bchile", name: "Banco de Chile", accentColorHex: "#1D4ED8")
        ]
    }

    func fetchCards() -> [BankCard] {
        [
            BankCard(id: "debito_santander", bankID: "santander", name: "Débito Santander", type: .debit),
            BankCard(id: "credito_santander_life", bankID: "santander", name: "Crédito Santander Life", type: .credit),
            BankCard(id: "credito_santander_gold", bankID: "santander", name: "Crédito Santander Gold", type: .credit),
            BankCard(id: "debito_mach", bankID: "mach", name: "Débito MACH", type: .debit),
            BankCard(id: "credito_mach", bankID: "mach", name: "Crédito MACH", type: .credit),
            BankCard(id: "debito_tenpo", bankID: "tenpo", name: "Débito Tenpo", type: .debit),
            BankCard(id: "credito_tenpo", bankID: "tenpo", name: "Crédito Tenpo", type: .credit),
            BankCard(id: "cuenta_fan", bankID: "bchile", name: "Cuenta FAN", type: .debit),
            BankCard(id: "credito_bchile", bankID: "bchile", name: "Crédito Banco de Chile", type: .credit)
        ]
    }

    func fetchBenefits() -> [Benefit] {
        [
            Benefit(id: "bf_001", comercio: "Jumbo", bankID: "santander", cardID: "debito_santander", tipoTarjeta: .debit, categoria: .supermarket, tipoBeneficio: .discount, titulo: "Ahorra en Jumbo", descripcion: "Descuento en compras presenciales en Jumbo.", descuento: "20%", diasValidos: [.monday, .wednesday], tope: "$12.000", condiciones: "Pago directo con tarjeta débito Santander.", disponibleOnline: false, disponiblePresencial: true),
            Benefit(id: "bf_002", comercio: "Copec", bankID: "mach", cardID: "credito_mach", tipoTarjeta: .credit, categoria: .fuel, tipoBeneficio: .cashback, titulo: "Cashback combustible", descripcion: "Recibe cashback por carga de combustible.", descuento: "15%", diasValidos: [.friday, .saturday], tope: "$10.000", condiciones: "Mínimo $20.000 por transacción.", disponibleOnline: false, disponiblePresencial: true),
            Benefit(id: "bf_003", comercio: "Starbucks", bankID: "tenpo", cardID: "credito_tenpo", tipoTarjeta: .credit, categoria: .food, tipoBeneficio: .discount, titulo: "Coffee Lovers", descripcion: "Descuento en bebidas y pastelería.", descuento: "30%", diasValidos: [.tuesday, .thursday], tope: "$8.000", condiciones: "Válido una vez por día.", disponibleOnline: true, disponiblePresencial: true),
            Benefit(id: "bf_004", comercio: "McDonald's", bankID: "mach", cardID: "debito_mach", tipoTarjeta: .debit, categoria: .food, tipoBeneficio: .discount, titulo: "Combo Promo", descripcion: "Descuento en combos seleccionados.", descuento: "25%", diasValidos: [.monday, .friday], tope: nil, condiciones: "No acumulable con otras promociones.", disponibleOnline: true, disponiblePresencial: true),
            Benefit(id: "bf_005", comercio: "Salcobrand", bankID: "bchile", cardID: "cuenta_fan", tipoTarjeta: .debit, categoria: .pharmacy, tipoBeneficio: .discount, titulo: "Salud FAN", descripcion: "Descuento en medicamentos y cuidado personal.", descuento: "20%", diasValidos: [.wednesday, .sunday], tope: "$6.000", condiciones: "Excluye productos en oferta.", disponibleOnline: true, disponiblePresencial: true),
            Benefit(id: "bf_006", comercio: "PedidosYa", bankID: "santander", cardID: "credito_santander_life", tipoTarjeta: .credit, categoria: .delivery, tipoBeneficio: .cashback, titulo: "Delivery Life", descripcion: "Cashback en pedidos de comida.", descuento: "25%", diasValidos: [.thursday, .friday], tope: "$9.000", condiciones: "Solo en app de PedidosYa.", disponibleOnline: true, disponiblePresencial: false),
            Benefit(id: "bf_007", comercio: "JetSMART", bankID: "santander", cardID: "credito_santander_gold", tipoTarjeta: .credit, categoria: .travel, tipoBeneficio: .installments, titulo: "Viaja en cuotas", descripcion: "Pasajes nacionales en cuotas sin interés.", descuento: "6 cuotas sin interés", diasValidos: [.monday, .tuesday, .wednesday, .thursday, .friday], tope: nil, condiciones: "Tarifa Smart y Smart Plus.", disponibleOnline: true, disponiblePresencial: false),
            Benefit(id: "bf_008", comercio: "Uber Eats", bankID: "tenpo", cardID: "debito_tenpo", tipoTarjeta: .debit, categoria: .delivery, tipoBeneficio: .discount, titulo: "Tenpo Eats", descripcion: "Descuento en restaurantes adheridos.", descuento: "35%", diasValidos: [.saturday, .sunday], tope: "$7.000", condiciones: "Tope por usuario al día.", disponibleOnline: true, disponiblePresencial: false),
            Benefit(id: "bf_009", comercio: "Jumbo", bankID: "bchile", cardID: "credito_bchile", tipoTarjeta: .credit, categoria: .supermarket, tipoBeneficio: .cashback, titulo: "Súper Cashback", descripcion: "Devolución por compras en supermercado.", descuento: "10%", diasValidos: [.friday], tope: "$15.000", condiciones: "Compra mínima de $30.000.", disponibleOnline: true, disponiblePresencial: true),
            Benefit(id: "bf_010", comercio: "Copec", bankID: "tenpo", cardID: "credito_tenpo", tipoTarjeta: .credit, categoria: .fuel, tipoBeneficio: .discount, titulo: "Ruta Tenpo", descripcion: "Descuento directo en estaciones Copec.", descuento: "$120 por litro", diasValidos: [.monday, .tuesday], tope: "$5.000", condiciones: "Válido en estaciones seleccionadas.", disponibleOnline: false, disponiblePresencial: true)
        ]
    }
}

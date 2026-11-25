import Foundation

func getMedicineIconImageText(dosageType: String) -> String {
    if dosageType == "Capsule" {
        return "capsule_1"
    }
    if dosageType == "Injection" {
        return "injection_1"
    }
    if dosageType == "Suspension" || dosageType == "Oral Solution" {
        return "syrup_1"
    }
    if dosageType.lowercased().contains("drop") {
        return "drop_1"
    }
    if dosageType.lowercased().contains("inhal") {
        return "inhaler_1"
    }
    return "tablet_1"
}

import Foundation

struct Medicine: Codable, Identifiable {
    let id: String
    let brandName: String
    let genericName: String
    let dosageType: String
    let strength: String
    let pharmaceutical: String
    let unitPrice: Double

    enum CodingKeys: String, CodingKey {
        case id
        case brandName = "brand_name"
        case genericName = "generic_name"
        case dosageType = "dosage_type"
        case strength
        case pharmaceutical
        case unitPrice = "unit_price"
    }
}

struct Pagination: Codable {
    let page: Int
    let limit: Int
    let total: Int
    let totalPages: Int
    let hasNextPage: Bool
    let hasPreviousPage: Bool

    enum CodingKeys: String, CodingKey {
        case page, limit, total
        case totalPages = "total_pages"
        case hasNextPage = "has_next_page"
        case hasPreviousPage = "has_previous_page"
    }
}

enum PotentialErrors: Error {
    case networkError
    case invalidURL
}

enum ServerURL: String {
    case base = "https://drug-database-api.onrender.com/api"
}

enum APIResponse {
    case success(MedicineResponse?)
    case error(PotentialErrors)
}

struct MedicineResponse: Codable {
    let data: [Medicine]
    let pagination: Pagination
}


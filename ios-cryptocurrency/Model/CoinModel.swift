import Foundation

struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "currentPrice"
        case marketCap = "marketCap"
        case marketCapRank = "marketCapRank"
        case fullyDilutedValuation = "fullyDilutedValuation"
        case totalVolume = "totalVolume"
        case high24H = "high24h"
        case low24H = "low24h"
        case priceChange24H = "priceChange24h"
        case marketCapChange24H = "marketCapChange24h"
        case priceChangePercentage24H = "priceChangePercentage24h"
        case marketCapChangePercentage24H = "marketCapChangePercentage24h"
        case circulatingSupply = "circulatingSupply"
        case totalSupply = "totalSupply"
        case maxSupply = "maxSupply"
        case ath = "ath"
        case athChangePercentage = "athChangePercentage"
        case athDate = "athDate"
        case atl = "atl"
        case atlChangePercentage = "atlChangePercentage"
        case atlDate = "atlDate"
        case lastUpdated = "lastUpdated"
        case currentHoldings = "currentHoldings"
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
    
}

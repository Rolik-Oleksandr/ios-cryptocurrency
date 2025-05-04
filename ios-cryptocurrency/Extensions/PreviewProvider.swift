import SwiftUI

extension View {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let startVM = StartViewModel()
        
        let coin = CoinModel(
            currentHoldings: 1.5, id: "bitcoin",
            symbol: "btc",
            name: "Bitcoin",
            image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
            currentPrice: 61408,
            marketCap: 1141731099010,
            marketCapRank: 1,
            fullyDilutedValuation: 1285385611303,
            totalVolume: 67190952980,
            high24H: 61712,
            low24H: 56220,
            priceChange24H: 3952.64,
            priceChangePercentage24H: 6.87944,
            marketCapChange24H: 72110681879,
            marketCapChangePercentage24H: 6.74171,
            circulatingSupply: 18653043,
            totalSupply: 21000000,
            maxSupply: 21000000,
            ath: 61712,
            athChangePercentage: -0.97589,
            athDate: "2021-03-13T20:49:26.606Z",
            atl: 67.81,
            atlChangePercentage: 90020.24075,
            atlDate: "2013-07-06T00:00:00.000Z",
            lastUpdated: "2021-03-13T23:18:10.268Z"
        )
}


import SwiftUI
import Combine

class StartViewModel: ObservableObject {
    
    @Published var statistic: [StatisticModel] = []
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let coinDataService = CoinDataService()
    private var marketDataService = MarketDataService()
    private var cansellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5) , scheduler: DispatchQueue.main)
            .map { (text, startingCoins) -> [CoinModel] in
                
                guard !text.isEmpty else {
                    return startingCoins
                }
                let lowerCasedText = text.lowercased()
                
                return startingCoins.filter { (coin) -> Bool in
                    return coin.name.lowercased().contains(lowerCasedText) ||
                    coin.symbol.lowercased().contains(lowerCasedText) ||
                    coin.id.lowercased().contains(lowerCasedText)
                }
            }
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cansellables )
        
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedStatistics) in
                self?.statistic = returnedStatistics
            }
            .store(in: &cansellables)
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticModel] {
        var statistics: [StatisticModel] = []
        guard let data = marketDataModel else {
            return statistics
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange:
                                        data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
        
        statistics.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return statistics
    }
}

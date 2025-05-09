import SwiftUI
import Combine

class StartViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cansellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .combineLatest(dataService.$allCoins)
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
    }
}

import SwiftUI

struct CoinImageView: View {
    @StateObject private var viewModel: CoinImageViewModel
    
    init(coin: CoinModel) {
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if viewModel.isLoadding {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.accent)
            }
        }
    }
}

#Preview(traits: PreviewTrait.sizeThatFitsLayout) {
    CoinImageView(coin: CoinImageView.dev.coin)
}

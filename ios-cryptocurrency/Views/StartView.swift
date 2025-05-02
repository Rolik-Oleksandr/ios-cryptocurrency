import SwiftUI

struct StartView : View {
    
    @EnvironmentObject private var vm: StartViewModel
    @State private var showPortfolio: Bool  = false
    
    var body : some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                startViewHeader
                
                List {
                    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingColumn: false)
                }
                .listStyle(PlainListStyle())
                
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationView {      
        StartView()
            .navigationBarHidden(true)
    }
    .environmentObject(StartView.dev.startVM) //expected error
}

extension StartView {
    
    private var startViewHeader: some View {
        HStack {  
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}

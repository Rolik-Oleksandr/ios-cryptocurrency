import SwiftUI

struct StatisticView: View {
    
    let statistic: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(statistic.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(statistic.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees:
                                            (statistic.percentageChange ?? 0) >= 0 ? 0: 180))
                Text(statistic.percentageChange?.asPercentageString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor(
                (statistic.percentageChange ?? 0) >= 0 ? .green : .red)
            .opacity(statistic.percentageChange == nil ? 0 : 1)
        }
    }
}

#Preview {
    StatisticView(statistic: DeveloperPreview.instance.statistic)
}

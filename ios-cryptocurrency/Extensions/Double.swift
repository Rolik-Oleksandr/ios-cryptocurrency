import Foundation

extension Double {
    
    ///Convert a Double into a currency with 2-6 decimal places
    ///```
    ///1234.56 -> $1,234.56
    ///12.3456 -> $12.3456
    ///0.123456 -> $0.123456
    ///```
    
    private var currencyFormatter: NumberFormatter {
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .currency
        formater.locale = .current
        formater.currencyCode = "USD"
        formater.currencySymbol = "$"
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 6
        return formater
    }
    
    ///Convert a Double into a currency as a String with 2-6 decimal places
    ///```
    ///1234.56 -> "$1,234.56"
    ///12.3456 -> "$12.3456"
    ///0.123456 -> "$0.123456"
    ///`
    
    func asCurrencyWith6Decimals()-> String {
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "$0.00"
    }
    
    ///Convert a Double into a currency as a String with 2-6 decimal places
    ///```
    ///12.3456 -> "1.23"
    ///`
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    ///Convert a Double into a currency as a String with 2-6 decimal places
    ///```
    ///12.3456 -> "1.23%"
    ///`
    
    func asPercentageString() -> String {
        return asNumberString() + "%"
    }
    
}

import Foundation
import SwiftData

@Model
final class Country {
    var countries: [String]
    
    init(countries: [String]) {
        self.countries = countries
    }
}

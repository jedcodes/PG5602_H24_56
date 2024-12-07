import Foundation
import Observation

@Observable
class HeadlineStore {
    
    let apiCategories:[String] = ["business", "entertainment", "general", "science", "sports", "health", "technology"]
    let apiCountries:[String] = ["ae", "ar", "at", "au", "be", "bg", "br", "ca", "ch", "cn", "co", "cu", "cz", "de", "eg", "fr", "gb", "gr", "hk", "hu", "id", "ie", "il", "in", "it", "jp", "kr", "lt", "lv", "ma", "mx", "my", "ng", "nl", "no", "nz", "ph", "pl", "pt", "ro", "rs", "ru", "sa", "se", "sg", "si", "sk", "th", "tr", "tw", "ua", "us", "ve", "za"]
    
    var headlineArticles:[NewsArticle] = [NewsArticle]()
    var repository = HeadlineRepository()
    var headlineText:[String] = [String]()
    
    func fetchedHeadlines() async {
        do {
            let fetchedHeadlines = try await repository.fetchHeadlines()
            self.headlineArticles = fetchedHeadlines
        } catch {
            print("Error fetching headline articles: \(error.localizedDescription)")
        }
    }

}

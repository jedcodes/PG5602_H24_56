

import SwiftUI

struct SettingScreenView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Bindable var model: APIParameterStore
    @State private var selectedCategory: String = "general" // Default selection
    @State private var selectedCountry: String = "us"       // Default selection

    var body: some View {
        ZStack {
            Color(Theme.PrimaryBG)
                .ignoresSafeArea()
            
            NavigationStack {
                VStack {
                    List {
                        Section(header: Text("API Key")) {
                            Text("a4a89329e9b5499d9be4907c2eda4d78")
                        }
                        Section(header: Text("News Categories")) {
                            Picker("Categories", selection: $selectedCategory) {
                                ForEach(model.apiCategories, id: \.self) { category in
                                    Text(category.capitalized).tag(category)
                                }
                            }
                            .pickerStyle(MenuPickerStyle()) // Optional for a dropdown style
                        }
                        
                        Section(header: Text("Countries")) {
                            Picker("Countries", selection: $selectedCountry) {
                                ForEach(model.apiCountries, id: \.self) { country in
                                    Text(country.uppercased()).tag(country)
                                }
                            }
                            .pickerStyle(MenuPickerStyle()) // Optional for a dropdown style
                        }
                    }
                }
                .navigationTitle("Setting")
                .toolbar {
                    Button {
                        print("Add action")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
 
}

#Preview {
    SettingScreenView(model: APIParameterStore())
}

//
//  ContentView.swift
//  MasterGuideSwiftUI
//
//  Created by Marco Alonso on 03/10/24.
//

import SwiftUI

struct ContentView: View {
    typealias CustomViews = [(AnyView, String, String)]
    
    @State private var searchterm: String = ""
    
    var options: CustomViews = [
        (AnyView(PopUpModal()), "PopUpModal", "Custom Modal Transition PopUp")
        ]
    
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                SearchBar(searchTerm: $searchterm)
                    .listRowInsets(EdgeInsets(top: .zero, leading: .zero, bottom: .zero, trailing: .zero))
                List {
                    ForEach(filteredOptions(), id: \.1) { current in
                        NavigationLink(destination: current.0) {
                            VStack(alignment: .leading) {
                                Text(current.1)
                                    .font(.headline)
                                Text(current.2)
                                    .font(.subheadline)
                            }
                        }
                    }// ForEach
                }//List
                .listStyle(.plain)
            }//ScrollViewReader
            .navigationTitle("MasterGuideSwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
           
    func filteredOptions() -> CustomViews {
        options.filter { (_, name, description) in
            guard !searchterm.isEmpty else { return true }
            return (name + description)
                .lowercased()
                .contains(searchterm.lowercased())
        }
        .sorted(by: { $0.1 < $1.1 })
    }
                       
}

struct SearchBar: View {
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Buscar", text: $searchTerm)
                .disableAutocorrection(true)
            
            if !searchTerm.isEmpty {
                Button(action: {
                    searchTerm = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Navigation
//
//  Created by Karan Singh on 01/03/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path : $path){ // Main Stack -> Holder
            List{
                NavigationLink("Go to Detail A", value: "Show A")
                NavigationLink("Go to B", value: "Show B")
                NavigationLink("Go to number 1", value: 1) // Link between two Views
            }.navigationDestination(for: String.self){ textValue in
                DetailView(text: textValue, path: $path)
            }.navigationDestination(for: Int.self){ intValue in // Destination of the View -> In closure
                DetailView(text: "Detail with \(intValue)", path: $path)
                
            }.navigationTitle("Home") // -> Title of the View
        }
        
    }
    
    func pathAppend(){
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

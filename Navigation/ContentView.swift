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
    
    // Manipulate View's Data Locally
    @State private var path = NavigationPath()
    // Resonating from ObservableObject
    @StateObject var navigator = NavigationStateManager()

    var body: some View {
        NavigationStack(path : $path){ // Main Stack -> Holder
            List{
                NavigationLink("Go to Detail A", value: "Show A") // Link between two Views
                NavigationLink("Go to Detail B", value: "Show B") // Link between two Views
                NavigationLink("Go to number 1", value: 1)        // Link between two Views
            }//.frame(minWidth:20, maxWidth:.infinity, alignment: .center)
            //.toolbarBackground(.green, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
            .navigationDestination(for: String.self){ textValue in // Destination of the View -> In closure, different type
                DetailView(text: "Detail with "+textValue, path: $path)
            }.navigationDestination(for: Int.self){ intValue in    // Destination of the View -> In closure, different type
                DetailView(text: "Detail with \(intValue)", path: $path)
            }
            
            // List is covering majority of screen
            /*NavigationLink("I am riding solo here"){
                DetailView(text:"What",path: $path)
            }.tint(.green)
            
            Divider().padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))*/
            .navigationTitle("Home") // -> Title of the View
        }
        
    }
    
    func pathAppend(){
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

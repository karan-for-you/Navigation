//
//  DetailView.swift
//  Navigation
//
//  Created by Karan Singh on 01/03/24.
//

import SwiftUI

struct DetailView: View {
    let text : String
    @Binding var path: NavigationPath
    
    
    var backButtonPlacement: ToolbarItemPlacement {
            #if os(iOS)
            ToolbarItemPlacement.navigationBarLeading
            #else
            ToolbarItemPlacement.navigation
            #endif
        }
    
    var body: some View {
        VStack {
            Text("Detail view showing")
            Text(text)
            
            Divider()
            
            /*NavigationLink("Link to 3",value: 3)
            NavigationLink("Link to C",value: "C")
            
            Button{
                path = NavigationPath() // Set path to Home 
            }label: {
                Text("Return to Home") // View to trigger
            }.buttonStyle(.borderedProminent)
                .tint(.green)
                .foregroundColor(.white)*/
        }
        .navigationTitle(text)
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: backButtonPlacement){
                Button{
                    path.removeLast() // Remove last view
                }label: {
                    Image(systemName: "chevron.left").tint(.green)
                }
            }
            ToolbarItem(placement: ToolbarItemPlacement.primaryAction){
                Button{
                    
                }label: {
                    Image(systemName: "calendar").tint(.green)
                }
            }
        }
    }
}

/*#Preview {
    DetailView(text: "",path: $path)
}*/

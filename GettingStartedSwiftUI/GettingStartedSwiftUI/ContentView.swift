//
//  ContentView.swift
//  GettingStartedSwiftUI
//
//  Created by Mayank Negi on 23/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Screen(title: "Home",
                   text: "First Screen",
                   imageName: "house")
        }
    }
}

struct Screen: View {
    
    let title: String
    let text: String
    let imageName: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200,
                       height: 200,
                       alignment: .center)
                .padding()
            
            Text(text)
                .font(.system(size: 30.0,
                              weight: .light,
                              design: .default))
                .padding()
            
            NavigationLink {
                Screen(title: "Notifications",
                       text: "Second Screen",
                       imageName: "bell")
            } label: {
                ContinueButton(color: .pink)
            }
            
        }
        .navigationTitle(title)
    }
}

struct ContinueButton: View {
    
    let color: Color
    
    var body: some View {
        Text("Continue")
            .frame(width: 200,
                   height: 50,
                   alignment: .center)
            .background(color)
            .foregroundColor(Color.white)
            .cornerRadius(8.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  AsyncImageApp
//
//  Created by Mayank Negi on 03/03/23.
//

import SwiftUI

struct ContentView: View {
    
    let imageURL = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        
        // MARK: - Scale
//        AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        // MARK: - Placeholder
        /*
         AsyncImage(url: URL(string: imageURL)) { image in
             image
                 .imageModifier()
         } placeholder: {
             Image(systemName: "photo.circle.fill")
                 .iconModifier()
         }
         .padding(40)
         */
         
        
        // MARK: - phase
        /*
         AsyncImage(url: URL(string: imageURL)) { phase in
             // SUCCESS: Image is successfully loaded.
             // FAILURE: Image is failed to load with an error.
             // EMPTY: No image is loaded.
             if let image = phase.image {
                 image.imageModifier()
             } else if phase.error != nil {
                 Image(systemName: "ant.circle.fill").iconModifier()
             } else {
                 Image(systemName: "photo.circle.fill").iconModifier()
             }
         }
         .padding(40)
         */
        
        // MARK: - Animation
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image
                    .imageModifier()
//                    .transition(.move(edge: .bottom))
//                    .transition(.slide)
                    .transition(.scale)
            case .failure:
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                fatalError("Unexpected error occured.")
            }
        }
        .padding(40)

    }
}

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

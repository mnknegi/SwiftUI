//
//  OnboardingView.swift
//  Restart
//
//  Created by Mayank Negi on 04/03/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                
                // MARK: - HEADER
                Spacer()
                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60.0, weight: .heavy))
                        .foregroundColor(.white)
                    
                    Text("""
                        It's not how much we give but how much love we put into giving.
                        """)
                    .font(.title3)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                }
                
                // MARK: - CENTRE
                ZStack {
                    Circle()
                        .stroke(.white.opacity(0.2), lineWidth: 40.0)
                        .frame(width: 260.0, height: 260, alignment: .center)
                    Circle()
                        .stroke(.white.opacity(0.2), lineWidth: 80.0)
                        .frame(width: 260.0, height: 260.0, alignment: .center)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
                
                // MARK: - FOOTER
                ZStack {
                    // PARTS OF THE CUSTOM BUTTON
                    
                    // 1. BACKGROUND (STATIC)
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. CALL-TO-ACTION (STATIC)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20.0)
                    
                    // 3. CAAPSULE (DYNAMIC WIDTH)
                    
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80.0)
                            
                        Spacer()
                    }
                    
                    // 4. CIRCLE (DRAGGABLE)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8.0)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24.0, weight: .bold))
                        }
                        .foregroundColor(.white)
                    .frame(width: 80.0, height: 80.0, alignment: .center)
                        
                    .onTapGesture {
                        isOnboardingViewActive = false
                    }
                        
                        Spacer()
                    }
                }
                .frame(height: 80.0, alignment: .center)
                .padding()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

//
//  ContentView.swift
//  ECommerceApp
//
//  Created by Abhishek Dogra on 14/07/24.
//

import SwiftUI
import Lottie

struct LoginView: View {
    @State var phoneNumber: String = ""
    @State var isKeyboardShown: Bool = false
    @FocusState private var isTextFieldFocused: Bool
    @State var keyboardHeight: CGFloat = 0.0
    let images = ["l1", "l2", "l3", "l4"]
    
    var body: some View {
        ZStack {
            Color.black
            GeometryReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: .zero) {
                        ForEach(images, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .frame(width: proxy.size.width)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                
                HStack {
                    Rectangle()
                        .fill(.ultraThinMaterial.opacity(0.8))
                        .frame(width: proxy.size.width / 2.75)
                    Spacer()
                }
                
            }
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Skip")
                            .font(.system(size: 14))
                            .padding(.vertical, 4)
                            .padding(.horizontal)
                            .foregroundColor(.white)
                    }
                    .background(Color.black)
                    .cornerRadius(25)
                    .shadow(color: .white, radius: 3)
                    .padding(.vertical)
                    .padding([.horizontal, .vertical], 10)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("TRENDWAVE")
                        .font(.largeTitle)
                        .foregroundStyle(Color.white)
                        .bold()
                    
                    Text("Ride the wave of the latest trends with our curated collection of stylish and innovative products.")
                        .font(.footnote)
                        .foregroundStyle(Color.white)
                }
                
                VStack {
                    HStack {
                        Text("+91")
                            .bold()
                        
                        TextField("",
                                  text: $phoneNumber,
                                  prompt: Text("Phone number")
                            .foregroundColor(.gray)
                        )
                        .keyboardType(.numberPad)
                        .focused($isTextFieldFocused)
                        .bold()
                    }
                    .padding()
                    .foregroundStyle(Color.black)
                    .background {
                        Capsule(style: .circular)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Login or Register")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.system(size: 18))
                            .padding()
                            .foregroundColor(.white)
                        
                    }
                    .background(Color.black)
                    .cornerRadius(25)
                    .shadow(color: .white, radius: 0)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.black)
                            .opacity(0.5)
                    }
                }
                .padding(.bottom, keyboardHeight)
            }
            .padding([.horizontal, .vertical])
            .padding(.vertical, 30)
            .padding(.horizontal, 10)
        }
        .onTapGesture {
            isTextFieldFocused = false
        }
        .ignoresSafeArea()
        .task {
            for await value in KeyboardHandler.shared.listenForKeyboardNotifications() {
                withAnimation {                
                    keyboardHeight = value
                }
            }
            
        }
    }
}

#Preview {
    LoginView()
}

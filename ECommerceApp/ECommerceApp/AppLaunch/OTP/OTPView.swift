//
//  OTPViewController.swift
//  ECommerceApp
//
//  Created by Abhishek Dogra on 17/07/24.
//

import SwiftUI

class OTPViewModel: ObservableObject {
    let phoneNumber: String = "+91 84868 02418"
    @Published var otp: String = ""
}

struct OTPView: View {
    @Binding var navPath: NavigationPath
    @StateObject private var viewModel = OTPViewModel()
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: .p20) {
                Text("Verification Code")
                    .font(.title)
                Text("We have sent verification code to \n")
                +
                Text(viewModel.phoneNumber)
                    .bold()
                
                OtpView(activeIndicatorColor: .white,
                        inactiveIndicatorColor: .gray,
                        length: 4) { otp in
                    
                }
                Spacer()
            }
            .padding(.top)
        }
        .preferredColorScheme(.dark)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    navPath.removeLast()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(Color.white)
                }
            }
        }
    }
}

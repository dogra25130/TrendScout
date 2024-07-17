//
//  LoginViewModel.swift
//  ECommerceApp
//
//  Created by Abhishek Dogra on 17/07/24.
//

import Combine
import Foundation

class LoginViewModel: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var isPhoneValid = false
    
    let backgroundImages = ["l1", "l2", "l3", "l4"]
    let maxPhoneNumberLimit = 10
    
    private var publishers = Set<AnyCancellable>()
    
    init() {
        isPhoneNumberValid
              .receive(on: RunLoop.main)
              .assign(to: \.isPhoneValid, on: self)
              .store(in: &publishers)
        
        
    }
}

extension LoginViewModel {
    private var isPhoneNumberValid: AnyPublisher<Bool, Never> {
        $phoneNumber
            .map { phone in
                return phone.count == 10
            }
            .eraseToAnyPublisher()
    }
}

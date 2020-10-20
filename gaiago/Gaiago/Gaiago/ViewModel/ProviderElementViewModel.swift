//
//  ProviderElementViewModel.swift
//  Gaiago
//
//  Created by Vincenzo Broscritto on 10/10/2020.
//

import UIKit

internal struct ProviderElementViewModel {
    
    let provider: Provider
    
    internal init(provider: Provider) {
        self.provider = provider
    }
    
    internal func getName() -> String {
        return provider.fullname ?? ""
    }
    
    internal func getImage() -> String {
        return provider.avatar ?? ""
    }
}

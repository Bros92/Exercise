//
//  ProviderViewModel.swift
//  Gaiago
//
//  Created by Vincenzo Broscritto on 09/10/2020.
//

import Combine
import SwiftUI

internal class ProviderViewModel: ObservableObject, RequestDelegate {
    
    /// Provider list
    @Published internal var providers: [Provider] = []
    /// Stored subscriptions
    private var subscriptions = Set<AnyCancellable>()
    
    deinit {
        cancel()
    }
    
    /// Cancel subscriptions.
    /// It must call in deinit
    private func cancel() {
        for subscription in subscriptions {
            subscription.cancel()
        }
    }
    
    /// Get provider list
    internal func getProvidersList() {
        request(method: .get, url: Endpoints.getAddreas.rawValue, encodingType: .appJson, jsonBody: false)
            .decode(type: [Provider].self, decoder: JSONDecoder())
            .sink { value in
                switch value {
                
                case .finished:
                    break
                case .failure(_):
                    break
                }
            } receiveValue: { [weak self] providers in
                self?.providers = providers
            }
            .store(in: &subscriptions)
    }
    
    internal func isProviderListEmpty() -> Bool {
        return self.providers.isEmpty
    }
}



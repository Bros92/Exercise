//
//  ProviderDetialsViewModel.swift
//  Gaiago
//
//  Created by Vincenzo Broscritto on 09/10/2020.
//

import Combine
import SwiftUI

internal class ProviderDetailsViewModel: ObservableObject, RequestDelegate {
    
    /// Provider details
    @Published private var provider: Provider?
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
    
    /// Get provider details
    /// - Parameter id: provider id
    internal func getProvider(with id: String) {
        request(method: .get, url: Endpoints.getFilm.rawValue, body: ["id": id as Any], encodingType: .urlEncoded, jsonBody: false)
            .decode(type: [Provider].self, decoder: JSONDecoder())
            .sink { value in
                switch value {
                
                case .finished, .failure(_):
                    break
                }
            } receiveValue: { [weak self] provider in
                self?.provider = provider.first
                self?.providerName = provider.first?.fullname
                self?.providerCompany = provider.first?.company
                self?.providerEmail = provider.first?.email
                self?.providerDate = provider.first?.createdAt?.description
                self?.providerPhone = provider.first?.phone
                if let avatarImage = provider.first?.avatar?.imageFromServerURL(urlString: provider.first?.avatar ?? "", defaultImage: nil) {
                    self?.providerImage = avatarImage
                }
            }
            .store(in: &subscriptions)
    }
    
    @Published var providerPhone: String?
    @Published var providerDate: String?
    @Published var providerCompany: String?
    @Published var providerEmail: String?
    @Published var providerName: String?
    @Published var providerImage: UIImage?
}



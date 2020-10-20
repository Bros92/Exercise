//
//  ProviderListView.swift
//  Gaiago
//
//  Created by Vincenzo Broscritto on 09/10/2020.
//

import SwiftUI

internal struct ProviderListView: View {
    @ObservedObject var viewModel: ProviderViewModel
    
    init(viewModel: ProviderViewModel) {
        self.viewModel = viewModel
    }
    
    internal var body: some View {
        NavigationView {
            List(viewModel.providers.indices, id: \.self) { index in
                NavigationLink(
                    destination: ProviderDetailsView(viewModel: ProviderDetailsViewModel(), id: viewModel.providers[index].id ?? "0"),
                    label: {
                        loadContent(index: index)
                    })
            }
            .onAppear(perform: {
                if viewModel.isProviderListEmpty() {
                    viewModel.getProvidersList()
                }
            })
            .navigationBarTitle(Text("Gaiago Providers"))
            .listStyle(GroupedListStyle())
        }
    }
}

#if DEBUG
internal struct ProviderListView_Previews: PreviewProvider {
    static internal var previews: some View {
        ProviderListView(viewModel: ProviderViewModel())
    }
}
#endif

private extension ProviderListView {
    
    func loadContent(index: Int) -> some View {
        if !viewModel.providers.isEmpty {
            let provider = viewModel.providers[index]
            let providerElementViewModel = ProviderElementViewModel(provider: provider)
            return AnyView(ProviderListElementView(viewModel: providerElementViewModel))
        } else {
            return AnyView(loadingView())
        }
    }
    
    func loadingView() -> some View {
        Text("Loading Providers")
            .foregroundColor(.gray)
    }
}

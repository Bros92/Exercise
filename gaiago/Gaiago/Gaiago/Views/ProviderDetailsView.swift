//
//  ProviderDetailsView.swift
//  Gaiago
//
//  Created by Vincenzo Broscritto on 10/10/2020.
//

import SwiftUI

internal struct ProviderDetailsView: View {
    
    @ObservedObject internal var viewModel: ProviderDetailsViewModel
    internal var id: String
    
    @State private var filmDescrition: String?
    
    init(viewModel: ProviderDetailsViewModel, id: String) {
        self.viewModel = viewModel
        self.id = id
        self.filmDescrition = viewModel.providerPhone
    }
    internal var body: some View {
        ScrollView {
            Spacer()
            VStack(alignment: .center, spacing: 20, content: {
                Image(uiImage: viewModel.providerImage ?? UIImage())
                Spacer()
                Text(viewModel.providerPhone ?? "")
                    .padding(.leading, 15.0)
                    .padding(.trailing, 15.0)
                Spacer()
                HStack {
                    Text("phone:")
                        .fontWeight(.medium)
                        .padding(.leading, 15.0)
                    Spacer()
                    Text(viewModel.providerPhone ?? "")
                        .padding(.trailing, 15.0)
                }
                HStack {
                    Text("email:")
                        .fontWeight(.medium)
                        .padding(.leading, 15.0)
                    Spacer()
                    Text(viewModel.providerEmail ?? "")
                        .padding(.trailing, 15.0)
                }
                HStack {
                    Text("release date:")
                        .fontWeight(.medium)
                        .padding(15.0)
                    Spacer()
                    Text(viewModel.providerDate ?? "")
                        .padding(.trailing, 15.0)
                }
                HStack {
                    Text("company")
                        .fontWeight(.medium)
                        .padding(.leading, 15)
                    Spacer()
                    Text(viewModel.providerCompany ?? "")
                        .padding(.trailing, 15)
                }
                .padding(.bottom, 15)
            })
            .onAppear(perform: {
                viewModel.getProvider(with: id)
            })
            .navigationBarTitle(Text(viewModel.providerName  ?? ""))
        }
    }
}

#if DEBUG
internal struct ProviderDetials_Previews: PreviewProvider {
    static internal var previews: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20, content: {
                Spacer()
                Image("GhibliLogo")
                Spacer()
                Text("Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullamco laboriosam, nisi ut aliquid ex ea commodi consequatur. Duis aute irure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .padding(.leading, 15.0)
                    .padding(.trailing, 15.0)
                Spacer()
                HStack {
                    Text("director:")
                        .fontWeight(.medium)
                        .padding(.leading, 15.0)
                    Spacer()
                    Text("direcotr name")
                        .padding(.trailing, 15.0)
                }
                HStack {
                    Text("producer:")
                        .fontWeight(.medium)
                        .padding(.leading, 15.0)
                    Spacer()
                    Text("producer name")
                        .padding(.trailing, 15.0)
                }
                HStack {
                    Text("release date:")
                        .fontWeight(.medium)
                        .padding(15.0)
                    Spacer()
                    Text("01/01/2020")
                        .padding(.trailing, 15.0)
                }
                HStack {
                    Text("score")
                        .fontWeight(.medium)
                        .padding(.leading, 15)
                    Spacer()
                    Text("99")
                        .padding(.trailing, 15)
                }
            })
        }
    }
}
#endif

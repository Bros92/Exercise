//
//  ProviderListElementView.swift
//  Gaiago
//
//  Created by Vincenzo Broscritto on 10/10/2020.
//

import SwiftUI

internal struct ProviderListElementView: View {
    
    internal let viewModel: ProviderElementViewModel
    
    internal init(viewModel: ProviderElementViewModel) {
        self.viewModel = viewModel
    }
    internal var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            Text(viewModel.getName())
                .fontWeight(.semibold)
                .padding(.top, 15.0)
            Text(viewModel.getImage())
                .padding(.bottom, 15.0)
                .padding(.trailing, 5.0)
        })
    }
}
#if DEBUG
struct ProviderListElementView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 20, content: {
            Text("Title")
                .fontWeight(.semibold)
                .padding(.top, 15.0)
            Text("Description")
            
        })
    }
}
#endif

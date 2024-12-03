//
//  ShowMoreButton.swift
//  FitnessApp
//
//  Created by Sandeep on 09/11/24.
//

import SwiftUI

struct ShowMoreButtonLabel: View {
    var body: some View {
        Button {
            print("Show more")
        } label: {
            Text("Show more")
                .padding(10)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
        }
    }
}

#Preview {
    ShowMoreButtonLabel()
}

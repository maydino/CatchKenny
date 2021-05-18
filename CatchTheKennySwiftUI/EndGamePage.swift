//
//  EndGamePage.swift
//  CatchTheKennySwiftUI
//
//  Created by Mutlu Aydın on 5/14/21.
//

import SwiftUI

struct EndGamePage: View {
    var textEndGame = ""
    var body: some View {
        Text(textEndGame)
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct EndGamePage_Previews: PreviewProvider {
    static var previews: some View {
        EndGamePage()
    }
}

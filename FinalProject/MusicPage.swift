//
//  MusicPage.swift
//  FinalProject
//
//  Created by Alan Lu on 5/17/24.
//

import SwiftUI

struct MusicPage: View { // this page plays music
    var body: some View {
        VStack {
            // title
            Text("Calming Music")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            //video player, plays a 24 hr live stream of calming music
            VideoView(videoID: "4oStw0r33so")
                .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.7)
                .cornerRadius(12)
                .padding(.horizontal, 24)
        }
    }
}

struct MusicPage_Previews: PreviewProvider {
    static var previews: some View {
        MusicPage()
    }
}

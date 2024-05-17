//
//  VideoView.swift
//  FinalProject
//
//  Created by Alan Lu on 5/17/24.
//

import SwiftUI
import WebKit

struct VideoView : UIViewRepresentable {
    
    let videoID: String
    
    //creates UI
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    //goes to youtube, and accepts url to play
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

//
//  TopicDetailView.swift
//  FinalProject
//
//  Created by Alan Lu on 5/17/24.
//
import SwiftUI

struct TopicDetailView: View {
    let topic: MeditationTopic
    
    var body: some View {
        //formates data into a detailed description
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Centered Topic Title
                VStack {
                    // Centered Topic Title
                    Text(topic.title)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                }
                .frame(maxWidth: .infinity)
                
                // Separator
                Divider()
                    .padding(.bottom, 10)
                
                // Topic Detailed Content
                Text(topic.detailedContent)
                    .font(.body)
                    .foregroundColor(.primary)
                    .lineSpacing(5) // Add line spacing for better readability
                    .padding(.bottom, 20)
            }
            .padding()
        }
        .navigationTitle(topic.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TopicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //sample data
        TopicDetailView(topic: MeditationTopic(
            title: "Stress Relief",
            description: "Learn to manage and reduce stress.",
            detailedContent: """
                Stress is a common experience in modern life, but there are effective techniques to manage and reduce it. Meditation can help by promoting relaxation and mindfulness.
            
            This section provides guided meditations designed to help you recognize stress triggers, manage your response to stress, and cultivate a sense of inner calm.
            
            Techniques include deep breathing exercises, progressive muscle relaxation, and visualization.
            """,
            iconName: "exclamationmark.circle"))
    }
}

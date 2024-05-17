//
//  GuidedMeditationPage.swift
//  FinalProject
//
//  Created by Alan Lu on 5/17/24.
//

import SwiftUI

struct MeditationTopic: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let detailedContent: String
    let iconName: String
}


import SwiftUI

struct GuidedMeditationPage: View {
    
    //stores topics for meditation
    //each topic consist of title, description, content, and a icon
    let topics: [MeditationTopic] = [
        MeditationTopic(title: "Stress Relief",
                        description: "Learn to manage and reduce stress.",
                        detailedContent: """
                            Stress is a common experience in modern life, but there are effective techniques to manage and reduce it. Meditation can help by promoting relaxation and mindfulness.
                        
                            This section provides guided meditations designed to help you recognize stress triggers, manage your response to stress, and cultivate a sense of inner calm.
                        
                            Techniques include deep breathing exercises, progressive muscle relaxation, and visualization.
                        """,
                        iconName: "exclamationmark.circle"),
        MeditationTopic(title: "Sleep Better",
                        description: "Improve your sleep quality.",
                        detailedContent: """
                            Good sleep is essential for physical and mental health. Meditation can help improve sleep quality by calming the mind and reducing anxiety.
                        
                            This section offers guided meditations specifically tailored to help you fall asleep faster and enjoy deeper, more restful sleep.
                        
                            Techniques include body scan meditations, calming bedtime stories, and gentle music designed to lull you into a peaceful slumber.
                        """,
                        iconName: "moon.zzz"),
        MeditationTopic(title: "Focus and Concentration",
                        description: "Enhance your focus and concentration.",
                        detailedContent: """
                            Maintaining focus and concentration can be challenging, especially with the constant distractions of modern life.
                        
                            Meditation can help improve your ability to concentrate by training your mind to stay present and attentive.
                        
                            This section includes guided meditations that enhance cognitive function, increase attention span, and boost productivity.
                        
                            Techniques include single-pointed focus meditation, mindful breathing, and visualization exercises.
                        """,
                        iconName: "brain.head.profile"),
        MeditationTopic(title: "Anxiety Reduction",
                        description: "Manage and reduce anxiety.",
                        detailedContent: """
                            Anxiety can be overwhelming and debilitating, but meditation offers tools to manage and reduce it.
                        
                            By focusing on the present moment and cultivating a sense of calm, you can reduce anxiety symptoms and improve overall well-being.
                        
                            This section provides guided meditations to help you understand and manage anxiety, develop coping strategies, and find peace in the present moment.
                        
                            Techniques include mindfulness meditation, grounding exercises, and breath awareness.
                        """,
                        iconName: "waveform.path.ecg"),
        MeditationTopic(title: "Self-Compassion",
                        description: "Develop a kinder, more compassionate relationship with yourself.",
                        detailedContent: """
                            Self-compassion is about treating yourself with the same kindness and understanding that you would offer to a friend.
                        
                            It can improve emotional resilience and overall well-being. This section includes guided meditations to help you cultivate self-compassion.
                        
                            Let go of self-criticism, and develop a more supportive inner dialogue. Techniques include loving-kindness meditation, affirmations, and self-reflection exercises.
                        """,
                        iconName: "heart"),
        MeditationTopic(title: "Emotional Balance",
                        description: "Achieve emotional balance and stability.",
                        detailedContent: """
                            Emotional balance involves recognizing and managing your emotions in a healthy way. Meditation can help by increasing emotional awareness and resilience.
                        
                            This section offers guided meditations designed to help you process emotions, find inner stability, and cultivate a balanced emotional state.
                        
                            Techniques include emotion-focused meditation, mindful awareness practices, and self-soothing exercises.
                        """,
                        iconName: "smiley"),
        MeditationTopic(title: "Mindful Eating",
                        description: "Develop a mindful approach to eating.",
                        detailedContent: """
                        
                            Mindful eating involves paying full attention to the experience of eating and drinking. It can help improve digestion, reduce overeating, and enhance the enjoyment of food.
                        
                            This section includes guided meditations to help you cultivate a mindful eating practice, recognize hunger and fullness cues, and develop a healthier relationship with food.
                        
                            Techniques include mindful tasting exercises, body awareness practices, and gratitude for food.
                        """,
                        iconName: "fork.knife"),
        MeditationTopic(title: "Body Awareness",
                        description: "Increase awareness of your body and its sensations.",
                        detailedContent: """
                            Body awareness involves paying attention to the physical sensations in your body. It can help improve physical health, reduce tension, and enhance overall well-being.
                        
                            This section offers guided meditations to help you develop greater body awareness, release physical tension, and connect with your body in a positive way.
                        
                            Techniques include body scan meditation, mindful movement, and breath awareness practices.
                        """,
                        iconName: "figure.walk"),
        MeditationTopic(title: "Gratitude",
                        description: "Cultivate a sense of gratitude and appreciation.",
                        detailedContent: """
                        
                            Practicing gratitude can improve mood, increase resilience, and enhance overall happiness.
                        
                            This section includes guided meditations to help you develop a gratitude practice, appreciate the positive aspects of your life, and foster a sense of contentment.
                        
                            Techniques include gratitude journaling, mindful appreciation exercises, and loving-kindness meditation.
                        """,
                        iconName: "sun.max"),
        MeditationTopic(title: "Creativity Boost",
                        description: "Enhance your creativity and innovation.",
                        detailedContent: """
                            Creativity involves thinking outside the box and coming up with new ideas. Meditation can help by clearing mental blocks and fostering an open, imaginative mindset.
                        
                            This section offers guided meditations designed to boost creativity, inspire new ideas, and enhance problem-solving skills.
                        
                            Techniques include visualization exercises, mindful daydreaming, and creative flow practices.
                        """,
                        iconName: "paintbrush"),
    ]

    
    var body: some View {
        // stores it into a nevigation view, and allows you to see it expanded
        NavigationView {
            List(topics) { topic in
                NavigationLink(destination: TopicDetailView(topic: topic)) {
                    // displays each topic in a very readable view
                    HStack {
                        Image(systemName: topic.iconName)
                            .foregroundColor(.blue) // Customize the icon color if needed
                            .frame(width: 30, height: 30)
                        
                        VStack(alignment: .leading) {
                            Text(topic.title)
                                .font(.headline)
                            Text(topic.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Guided Meditation Tips")
        }
    }
}

struct GuidedMeditationPage_Previews: PreviewProvider {
    static var previews: some View {
        GuidedMeditationPage()
    }
}


#Preview {
    GuidedMeditationPage()
}

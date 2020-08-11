//
//  Resources.swift
//  mindfull
//
//  Created by Alp Demirtas on 8/11/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import Foundation

class Resources {
    var audioList: [Goal] = []
    var environmentList: [Goal] = []
    var writtenList: [Goal] = []
    var assessmentList: [Goal] = []
    
    var goal1: Goal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    var goal2: Goal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    var goal3: Goal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    var goal4: Goal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    var goal5: Goal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    var goal6: Goal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    var goal7: Goal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    var goal8: Goal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    var goal9: Goal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    var goal10: Goal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    
    init(){
        
    }
    
    func getAudioTrack () -> [Goal] {
        audioList.removeAll()
        goal1 = Goal(title: "Your First Meditation", description: "Meditate for One Minute", xpPoints: 10, status: 0)
        goal1.addAudio(link: "meditation1")
        audioList.insert(goal1, at: 0)
        
        goal2 = Goal(title: "Your Second Meditation", description: "Meditate for Three Minutes", xpPoints: 30, status: 0)
        goal2.addAudio(link: "meditation2")
        audioList.insert(goal2, at: 1)
        
        goal3 = Goal(title: "Your Third Meditation", description: "Meditate for Five Minutes", xpPoints: 50, status: 0)
        goal3.addAudio(link: "meditation3")
        audioList.insert(goal3, at: 2)
        
        goal4 = Goal(title: "Your Fourth Meditation", description: "Meditate for Seven Minutes", xpPoints: 70, status: 0)
        goal4.addAudio(link: "meditation4")
        audioList.insert(goal4, at: 3)
        
        goal5 = Goal(title: "Your Fifth Meditation", description: "Meditate for Ten Minutes", xpPoints: 100, status: 0)
        goal5.addAudio(link: "meditation5")
        audioList.insert(goal5, at: 4)
        return audioList
    }
    
    func getAssessmentList () -> [Goal] {
        assessmentList.removeAll()
        goal1 = Goal(title: "Mindful Eating", description: "Try Mindful Eating for 3 minutes", xpPoints: 10, status: 0)
        goal1.addAudio(link: "meditation6")
        assessmentList.insert(goal1, at: 0)
        
        goal2 = Goal(title: "Body Scan Meditation", description: "Complete  the 9 minute body scan", xpPoints: 30, status: 0)
        goal2.addAudio(link: "meditation7")
        assessmentList.insert(goal2, at: 1)
        
        goal3 = Goal(title: "Hopeful Meditation", description: "Meditate on the intention of Hope for 9 Minutes", xpPoints: 50, status: 0)
        goal3.addAudio(link: "meditation8")
        assessmentList.insert(goal3, at: 2)
        
        goal4 = Goal(title: "Intention Meditation", description: "Meditate on your Intentions for 9 Minutes", xpPoints: 70, status: 0)
        goal4.addAudio(link: "meditation9")
        assessmentList.insert(goal4, at: 3)
        
        goal5 = Goal(title: "Peaceful Meditation", description: "Meditate on the intention of Peace for 15 Minutes", xpPoints: 100, status: 0)
        goal5.addAudio(link: "meditation10")
        assessmentList.insert(goal5, at: 4)
        return assessmentList
    }
    
    func getWrittenList () -> [Goal]{
        writtenList.removeAll()
        goal1 = Goal(title: "Grateful Journaling", description: "Write Down Five Things you are Grateful For", xpPoints: 10, status: 0)
        goal1.addPromptTitle(title: "Write Down Five Things you are Grateful For")
        writtenList.insert(goal1, at: 0)
        
        goal2 = Goal(title: "Reflection Journaling", description: "Write about one experience where you felt passionate today", xpPoints: 30, status: 0)
        goal2.addPromptTitle(title: "Write about one experience where you felt passionate today")
        writtenList.insert(goal2, at: 1)
        
        goal3 = Goal(title: "Mindful Journaling", description: "Write Down Five Emotions you are currently experiencing", xpPoints: 50, status: 0)
        goal3.addPromptTitle(title: "Write Down Five Emotions you are currently experiencing")
        writtenList.insert(goal3, at: 2)
        
        goal4 = Goal(title: "Memory Journaling ", description: "Write about a memory where you felt bliss", xpPoints: 70, status: 0)
        goal4.addPromptTitle(title: "Write About a Memory where You Felt Bliss")
        writtenList.insert(goal4, at: 3)
        
        goal5 = Goal(title: "Intention Setting", description: "Write Down Five Character Traits that You would want to have", xpPoints: 100, status: 0)
        goal5.addPromptTitle(title: "Write Down Five Character Traits that You Would Want to have")
        writtenList.insert(goal5, at: 4)
        return writtenList
    }
    
    func getEnvironmentList () -> [Goal] {
        return environmentList
    }
    
    
}

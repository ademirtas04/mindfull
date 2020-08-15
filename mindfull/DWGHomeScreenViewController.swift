//
//  DWGHomeScreenViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/3/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class DWGHomeScreenViewController: UIViewController {
    
    //Starting - Only first ever time this is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (dailyGoals.count == 0) {
            initGoals()
        }
    }
    
    //Starting - Everytime this view is loaded
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getData()
        
        if (checkDay()) {
            chooseDailyGoals()
        }
        if (checkWeek()) {
            chooseWeeklyGoals()
        }
        setUpScreen()
    }
    
    //Instance Variables
    var dailyGoals: [Goal] = []
    var currentDailyGoals: [Goal] = []
    
    var weeklyGoals: [Goal] = []
    var currentWeeklyGoals: [Goal] = []
    
    var selectedGoal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    
    //This variable is to show which goal view will be switched to, with 0 for daily start, 1 for daily ongoing, 2 for daily finished, 3 for weekly start, 4 for weekly ongoing and 5 for weekly finished and set to 10 as default
    var indexOfMove = 10
    
    //This variable specifies which goal was passed to goal view, with 0 for daily goal 1, 1 for daily goal 2, 2 for daily goal 3, 3 for weekly goal 1, 4 for weekly goal 2 and 5 for weekly goal 5 and set to 10 as default
    var indexOfGoal = 10
        
    @IBOutlet weak var DG1Title: UILabel!
    @IBOutlet weak var DG2Title: UILabel!
    @IBOutlet weak var DG3Title: UILabel!
    
    @IBOutlet weak var DG1xp: UILabel!
    @IBOutlet weak var DG2xp: UILabel!
    @IBOutlet weak var DG3xp: UILabel!
    
    @IBOutlet weak var WG1Title: UILabel!
    @IBOutlet weak var WG2Title: UILabel!
    @IBOutlet weak var WG3Title: UILabel!
    
    @IBOutlet weak var WG1xp: UILabel!
    @IBOutlet weak var WG2xp: UILabel!
    @IBOutlet weak var WG3xp: UILabel!
    
    @IBOutlet weak var DG1Button: UIButton!
    @IBOutlet weak var DG2Button: UIButton!
    @IBOutlet weak var DG3Button: UIButton!
    
    @IBOutlet weak var WG1Button: UIButton!
    @IBOutlet weak var WG2Button: UIButton!
    @IBOutlet weak var WG3Button: UIButton!
    
    @IBOutlet weak var DGTimeLeft: UILabel!
    @IBOutlet weak var WGTimeLeft: UILabel!
    
    let calendar = Calendar.current
    
    var previousDayDate = Date()
    
    
    //Initializing the goals
    func initGoals() {
        //Daily Goals
        //The meditation goals
        let DGMGoal1 = Goal(title: "Mindful Breathing", description: "Find a comfortable and quiet space to sit down for five minute. Tune out any distractions around you and take long deep breaths. This exercise will help you relax and reduce stress.", xpPoints: 10, status: 0)
        DGMGoal1.changeTypeOfGoal(newTypeOfGoal: 1)
        DGMGoal1.addAudio(link: "meditation2")
        let DGMGoal2 = Goal(title: "Mindful Reflection", description: "Find a comfortable and quiet space where you can sit down for five minutes without any distractions. Close your eyes, relax, take deep breaths and reflect on what has made you happy today.", xpPoints: 10, status: 0)
        DGMGoal2.changeTypeOfGoal(newTypeOfGoal: 1)
        DGMGoal2.addAudio(link: "meditation3")
        let DGMGoal3 = Goal(title: "Body Scans", description: "Find a comfortable and quiet place where you can relax for ten minutes. Slowly, work your way through your body and analyze how each part feels as you take long deep breaths.", xpPoints: 15, status: 0)
        DGMGoal3.changeTypeOfGoal(newTypeOfGoal: 1)
        DGMGoal3.addAudio(link: "meditation7")
        let DGMGoal4 = Goal(title: "Hopeful Meditation", description: "Find a place where you can block out any distractions and meditate there for 10 minutes. Reflect on what you have done and think about the future by blocking out all the negatives and focusing on the positives.", xpPoints: 14, status: 0)
        DGMGoal4.changeTypeOfGoal(newTypeOfGoal: 1)
        DGMGoal4.addAudio(link: "meditation8")
        let DGMGoal5 = Goal(title: "Listening to Calming Music", description: "Locate a comfortable spot where you can sit and relax. Close your eyes, breathe deeply and listen to some calming music in order to reduce stress.", xpPoints: 8, status: 0)
        DGMGoal5.changeTypeOfGoal(newTypeOfGoal: 1)
        DGMGoal5.addAudio(link: "waves")
        let DGMGoal6 = Goal(title: "Ten Minutes of Silence", description: "Sit in a quiet and peaceful place. Close your eyes, inhale and exhale deeply in silence for ten minutes. During this time let your mind relax and think about all the good things in your life.", xpPoints: 15, status: 0)
        DGMGoal6.changeTypeOfGoal(newTypeOfGoal: 11)
        dailyGoals.append(contentsOf: [DGMGoal1, DGMGoal2, DGMGoal3, DGMGoal4, DGMGoal5, DGMGoal6])
        
        //The written goals
        let DGOGoal1 = Goal(title: "What Are You Grateful For?", description: "In your mindfull journal, write about five things in your life that you are grateful for.", xpPoints: 10, status: 0)
        DGOGoal1.changeTypeOfGoal(newTypeOfGoal: 2)
        DGOGoal1.addPrompts(prompts: ["Write about five things in your life that you are grateful for."])
        let DGOGoal2 = Goal(title: "A Fond Memory", description: "In your mindfull journal, write about a fond memory that you have had and reflect on how it made you feel.", xpPoints: 10, status: 0)
        DGOGoal2.changeTypeOfGoal(newTypeOfGoal: 2)
        DGOGoal2.addPrompts(prompts: ["Write about a fond memory you have had and how it made you feel."])
        let DGOGoal3 = Goal(title: "What Did You Do Today?", description: "In your mindfull journal, spend some time writing down a brief recap of what you did today.", xpPoints: 10, status: 0)
        DGOGoal3.changeTypeOfGoal(newTypeOfGoal: 2)
        DGOGoal3.addPrompts(prompts: ["Write about what you did today."])
        let DGOGoal4 = Goal(title: "How Did You Help?", description: "In your mindfull journal, write about five different times where you helped someone else today.", xpPoints: 10, status: 0)
        DGOGoal4.changeTypeOfGoal(newTypeOfGoal: 2)
        DGOGoal4.addPrompts(prompts: ["Write about five things you did today to help someone else."])
        let DGOGoal5 = Goal(title: "Creative Writing", description: "In your mindfull journal, let your mind wander and write about whatever you think. This can be anything from what you did today to a magical fantasy you just thought of.", xpPoints: 15, status: 0)
        DGOGoal5.changeTypeOfGoal(newTypeOfGoal: 2)
        DGOGoal5.addPrompts(prompts: ["Think creatively and write whatever comes to your mind."])
        let DGOGoal6 = Goal(title: "The Future", description: "In your mindfull journal, write about what you hope to accomplish tomorrow.", xpPoints: 12, status: 0)
        DGOGoal6.changeTypeOfGoal(newTypeOfGoal: 2)
        DGOGoal6.addPrompts(prompts: ["Write about what you hope to accomplish tomorrow."])
        dailyGoals.append(contentsOf: [DGOGoal1, DGOGoal2, DGOGoal3, DGOGoal4, DGOGoal5, DGOGoal6])
        
        //The productivity goals
        let DGPGoal1 = Goal(title: "Eight Hours of Sleep", description: "Tonight, get at least eight hours of sleep so that when you wake up tomorrow you will be energized and ready to do whatever you have planned.", xpPoints: 8, status: 0)
        DGPGoal1.changeTypeOfGoal(newTypeOfGoal: 3)
        let DGPGoal2 = Goal(title: "Create a Schedule", description: "Create a schedule for today that outlines all of the things you need to and want to do today. After creating this schedule, do your best to follow it so that you can have an extremely productive day.", xpPoints: 12, status: 0)
        DGPGoal2.changeTypeOfGoal(newTypeOfGoal: 3)
        let DGPGoal3 = Goal(title: "Cleaning", description: "Set aside a portion of your day dedicated to cleaning your room, house or office. This simple activity will help you be more productive today and efficient in the future.", xpPoints: 15, status: 0)
        DGPGoal3.changeTypeOfGoal(newTypeOfGoal: 3)
        let DGPGoal4 = Goal(title: "Create a Personalized Goal", description: "Navigate to the Personalized Goals section of this app and create a personalized goal that is tailored to your own needs.", xpPoints: 5, status: 0)
        DGPGoal4.changeTypeOfGoal(newTypeOfGoal: 3)
        let DGPGoal5 = Goal(title: "Complete Your Work", description: "Set a goal for yourself to complete all of your work, whether that be homework or work from your job, before a certain time, such as dinner or when you go to sleep.", xpPoints: 15, status: 0)
        DGPGoal5.changeTypeOfGoal(newTypeOfGoal: 3)
        let DGPGoal6 = Goal(title: "Eliminate Distractions", description: "When you are working or doing your homework, strive towards eliminating distractions by turning off your phone and telling those around you to not bother you.", xpPoints: 10, status: 0)
        DGPGoal6.changeTypeOfGoal(newTypeOfGoal: 3)
        dailyGoals.append(contentsOf: [DGPGoal1, DGPGoal2, DGPGoal3, DGPGoal4, DGPGoal5, DGPGoal6])
        
        //The enviormental interaction goals
        let DGEIGoal1 = Goal(title: "30 Minute Walk", description: "Go outside and walk around your neighborhood for half an hour. While walking take note of what you see, touch, hear and smell, as well as thinking about how the walk makes you feel. After the walk, write about what you observed in a journal entry.", xpPoints: 20, status: 0)
        DGEIGoal1.changeTypeOfGoal(newTypeOfGoal: 4)
        DGEIGoal1.addPrompts(prompts: ["Go on a 30 minute walk and write about what you saw, touched, heard, smelled and how the walk made you feel."])
        let DGEIGoal2 = Goal(title: "30 Minute Bike Ride", description: "Go for a 30 minute bike ride. While biking take note of what you see, touch, hear and smell as well as how the bike ride makes you feel. After the bike ride, write down your observations in a journal entry.", xpPoints: 25, status: 0)
        DGEIGoal2.changeTypeOfGoal(newTypeOfGoal: 4)
        DGEIGoal2.addPrompts(prompts: ["Go on a 30 minute bike ride and write about what you saw, touched, heard, smelled and how the bike ride made you feel."])
        let DGEIGoal3 = Goal(title: "Examine a Tree", description: "Go outside and look at a tree. Closely examine the tree and write in a journal entry about what you saw, touched, heard and smelled from the tree, as well as how the experience made you feel.", xpPoints: 15, status: 0)
        DGEIGoal3.changeTypeOfGoal(newTypeOfGoal: 4)
        DGEIGoal3.addPrompts(prompts: ["Examine a tree and write about what you saw, touched, heard, smelled and how the experience made you feel."])
        let DGEIGoal4 = Goal(title: "Mindful Cooking", description: "Go into your kitchen and cook yourself something to eat. During the cooking process notice what you see, touch, hear and smell, as well as how cooking makes you feel. Afterwards, write about the experience in a journal entry.", xpPoints: 20, status: 0)
        DGEIGoal4.changeTypeOfGoal(newTypeOfGoal: 4)
        DGEIGoal4.addPrompts(prompts: ["Cook yourself a meal and write about what you saw, touched, heard, smelled and how the experience made you feel."])
        let DGEIGoal5 = Goal(title: "15 Minute Jog", description: "Go outside and jog around your neighborhood for 15 minutes. While jogging take note of what you see, touch, hear and smell, as well as thinking about how the jog makes you feel. After the jog, write about what you observed in a journal entry.", xpPoints: 15, status: 0)
        DGEIGoal5.changeTypeOfGoal(newTypeOfGoal: 4)
        DGEIGoal5.addPrompts(prompts: ["Go on a 15 minute jog and write about what you saw, touched, heard, smelled and how the jog made you feel."])
        let DGEIGoal6 = Goal(title: "30 Minutes Outdoors", description: "Go outside and find a nice spot to lay down for 30 minutes. Take note of what you see, touch, hear and smell, as well as thinking about how the experience makes you feel. Afterwards, write about it in a journal entry.", xpPoints: 20, status: 0)
        DGEIGoal6.changeTypeOfGoal(newTypeOfGoal: 4)
        DGEIGoal6.addPrompts(prompts: ["Relax outdoors for 30 minutes and write about what you saw, touched, heard, smelled and how it made you feel."])
        dailyGoals.append(contentsOf: [DGEIGoal1, DGEIGoal2, DGEIGoal3, DGEIGoal4, DGEIGoal5, DGEIGoal6])
        
        //The self-assesment goals
        let DGSGoal1 = Goal(title: "Daily Reflection", description: "In the mindfull journal, take a few minutes to write down a brief reflection of what you have done, accomplished or learned today.", xpPoints: 10, status: 0)
        DGSGoal1.changeTypeOfGoal(newTypeOfGoal: 5)
        DGSGoal1.addPrompts(prompts: ["Write about what you have done today."])
        let DGSGoal2 = Goal(title: "Daily Goal Setting", description: "n the mindfull journal, take a few minutes to write down a few personal goals that you hope to accomplish today.", xpPoints: 12, status: 0)
        DGSGoal2.changeTypeOfGoal(newTypeOfGoal: 5)
        DGSGoal2.addPrompts(prompts: ["Write about what you hope to accomplish today."])
        let DGSGoal3 = Goal(title: "Body Scan", description: "Sit down and scan your body. Take note how each part of your body feels. Then, in the mindfull journal, write about how the different parts of your body feel as well as your overall mood.", xpPoints: 15, status: 0)
        DGSGoal3.changeTypeOfGoal(newTypeOfGoal: 5)
        DGSGoal3.addPrompts(prompts: ["Scan your body and right about how each part of your body feels, as well as your overall mood."])
        let DGSGoal4 = Goal(title: "Mindful Eating", description: "When you sit down for your next meal, take your time and slowly eat your food and analyze how it tastes and how your body adjusts to it. Afterwards, journal on the experience in your mindfull journal.", xpPoints: 20, status: 0)
        DGSGoal4.changeTypeOfGoal(newTypeOfGoal: 5)
        DGSGoal4.addPrompts(prompts: ["For your next meal, eat slowly and mindfully and write about your eating experience."])
        let DGSGoal5 = Goal(title: "Your Emotions", description: "At the end of the day, write in your mindfull journal about the emotions and feelings you had today, and where those feelings came from.", xpPoints: 10, status: 0)
        DGSGoal5.changeTypeOfGoal(newTypeOfGoal: 5)
        DGSGoal5.addPrompts(prompts: ["Write about the emotions and feelings you experienced today as well as where those feelings came from."])
        let DGSGoal6 = Goal(title: "Daily Rest Reflection", description: "Take some time and write in your mindfull journal about whether or not you got enough sleep today. If you didn’t get enough sleep, think of how you can get more sleep in the future.", xpPoints: 10, status: 0)
        DGSGoal6.changeTypeOfGoal(newTypeOfGoal: 5)
        DGSGoal6.addPrompts(prompts: ["Write about whether or not you got enough sleep today. If you didn’t get enough sleep, also write about how can you get more sleep in the future."])
        dailyGoals.append(contentsOf: [DGSGoal1, DGSGoal2, DGSGoal3, DGSGoal4, DGSGoal5, DGSGoal6])
        
        //Weekly Goals
        //The meditation goals
        let WGMGoal1 = Goal(title: "Mindful Breathing", description: "On three different days, find a comfortable and quiet space to sit down for five minute. Tune out any distractions around you and take long deep breaths. This exercise will help you relax and reduce stress.", xpPoints: 25, status: 0)
        WGMGoal1.changeTypeOfGoal(newTypeOfGoal: 1)
        WGMGoal1.addAudio(link: "meditation2")
        let WGMGoal2 = Goal(title: "Body Scans", description: "On three different days, find a comfortable and quiet space where you can sit down for five minutes. Close your eyes, relax, take deep breaths and reflect on what has made you happy this week.", xpPoints: 25, status: 0)
        WGMGoal2.changeTypeOfGoal(newTypeOfGoal: 1)
        WGMGoal2.addAudio(link: "meditation3")
        let WGMGoal3 = Goal(title: "Calming Music", description: "On four separate days, locate a comfortable spot where you can sit and relax. Close your eyes, breathe deeply and listen to some calming music, allowing you to relax and reduce stress.", xpPoints: 20, status: 0)
        WGMGoal3.changeTypeOfGoal(newTypeOfGoal: 1)
        WGMGoal3.addAudio(link: "waves")
        weeklyGoals.append(contentsOf: [WGMGoal1, WGMGoal2, WGMGoal3])
        
        //The wrriten goals
        let WGOGoal1 = Goal(title: "What Did You Do This Week?", description: "In your mindfull journal, spend some time writing down a brief recap of what you have done this week.", xpPoints: 20, status: 0)
        WGOGoal1.changeTypeOfGoal(newTypeOfGoal: 2)
        WGOGoal1.addPrompts(prompts: ["Write about what you have done this week."])
        let WGOGoal2 = Goal(title: "Next Week", description: "In your mindfull journal, write about what you hope to accomplish the following week.", xpPoints: 18, status: 0)
        WGOGoal2.changeTypeOfGoal(newTypeOfGoal: 2)
        WGOGoal2.addPrompts(prompts: ["Write about what you hope to accomplish next week."])
        let WGOGoal3 = Goal(title: "Creative Writing", description: "In your mindfull journal, let your mind wander and write about whatever you think of. This can be anything from what you did this week to a magical fantasy you just thought of.", xpPoints: 15, status: 0)
        WGOGoal3.changeTypeOfGoal(newTypeOfGoal: 2)
        WGOGoal3.addPrompts(prompts: ["Think creatively and write whatever comes to your mind."])
        weeklyGoals.append(contentsOf: [WGOGoal1, WGOGoal2, WGOGoal3])
        
        //The productivity goals
        let WGPGoal1 = Goal(title: "Eight Hours of Sleep", description: "For every night this week, try your best to get at least eight hours of sleep so that when you wake up the next day you will be energized and ready to do whatever you have planned.", xpPoints: 40, status: 0)
        WGPGoal1.changeTypeOfGoal(newTypeOfGoal: 3)
        let WGPGoal2 = Goal(title: "Weekly Plan", description: "Create a weekly plan for yourself that outlines all of the things you need to and want to get done this week. After creating this schedule, do your best to follow it so that you can have an extremely productive week.", xpPoints: 25, status: 0)
        WGPGoal2.changeTypeOfGoal(newTypeOfGoal: 3)
        let WGPGoal3 = Goal(title: "Create a Personalized Goal", description: "Navigate to the Personalized Goals section of this app and create a personalized goal that spans a couple of days.", xpPoints: 10, status: 0)
        WGPGoal3.changeTypeOfGoal(newTypeOfGoal: 3)
        weeklyGoals.append(contentsOf: [WGPGoal1, WGPGoal2, WGPGoal3])
        
        //The enviormental interaction goals
        let WGEIGoal1 = Goal(title: "Three Days of Walks", description: "On three different days go for a walk around your neighborhood for half an hour. While walking take note of what you see, touch, hear and smell, as well as thinking about how the walk makes you feel. After the walk, write about what you observed in a journal entry.", xpPoints: 50, status: 0)
        WGEIGoal1.changeTypeOfGoal(newTypeOfGoal: 4)
        DGEIGoal1.addPrompts(prompts: ["Go on three 30 minute walks and write about what you saw, touched, heard, smelled and how the walks made you feel."])
        let WGEIGoal2 = Goal(title: "Three Days of Biking", description: "On three different days go for a half an hour bike ride. While biking take note of what you see, touch, hear and smell as well as how the bike ride makes you feel. After the bike ride, write about what you observed in a journal entry.", xpPoints: 60, status: 0)
        WGEIGoal2.changeTypeOfGoal(newTypeOfGoal: 4)
        WGEIGoal2.addPrompts(prompts: ["Go on three 30 minute bike rides and write about what you saw, touched, heard, smelled and how the bike rides made you feel."])
        let WGEIGoal3 = Goal(title: "Go for a Picnic", description: "When you have lots of time, go outside for at least two hours and have a picnic. During the picnic take note of what you see, touch, hear and smell as well as how you feel. Afterwards, record your observations in a journal entry.", xpPoints: 50, status: 0)
        WGEIGoal3.changeTypeOfGoal(newTypeOfGoal: 4)
        WGEIGoal3.addPrompts(prompts: ["Go for a picnic and write about what you saw, touched, heard, smelled and how the picnic made you feel."])
        weeklyGoals.append(contentsOf: [WGEIGoal1, WGEIGoal2, WGEIGoal3])
        
        //The self-assesment goals
        let WGSGoal1 = Goal(title: "Weekly Reflection", description: "In the mindfull journal, take a few minutes to write down a brief reflection of what you have done, accomplished or learned in the past week.", xpPoints: 25, status: 0)
        WGSGoal1.changeTypeOfGoal(newTypeOfGoal: 5)
        WGSGoal1.addPrompts(prompts: ["Write about what you have done this week."])
        let WGSGoal2 = Goal(title: "Weekly Goal Setting", description: "In the mindfull journal, take a few minutes to write down a few personal goals that you hope to accomplish this week.", xpPoints: 30, status: 0)
        WGSGoal2.changeTypeOfGoal(newTypeOfGoal: 5)
        WGSGoal2.addPrompts(prompts: ["Write about what you hope to accomplish this week."])
        let WGSGoal3 = Goal(title: "Weekly Rest Reflection", description: "Take some time and write in your mindfull journal about whether or not you got enough sleep this week. If you didn’t get enough sleep, think of ways that you can get more sleep in the future.", xpPoints: 20, status: 0)
        WGSGoal3.changeTypeOfGoal(newTypeOfGoal: 5)
        WGSGoal3.addPrompts(prompts: ["Write about whether or not you got enough sleep this week. If you didn’t get enough sleep, also write about how you can get more sleep in the future."])
        weeklyGoals.append(contentsOf: [WGSGoal1, WGSGoal2, WGSGoal3])
        
        chooseDailyGoals()
        chooseWeeklyGoals()
    }
    
    //Choosing the daily goals
    func chooseDailyGoals() {
        currentDailyGoals.removeAll()
        
        //We get a random integer from 1-30 then subtract 1 since arrays start at 0, meaning that the last element (goal 30) has an index of 29
        let random1 = Int.random(in: 1..<31) - 1
        let random2 = Int.random(in: 1..<31) - 1
        let random3 = Int.random(in: 1..<31) - 1
        
        let dailyGoal1 = dailyGoals[random1]
        let dailyGoal2 = dailyGoals[random2]
        let dailyGoal3 = dailyGoals[random3]
        
        dailyGoal1.changeStatus(newStatus: 1)
        dailyGoal2.changeStatus(newStatus: 1)
        dailyGoal3.changeStatus(newStatus: 1)

        currentDailyGoals.append(dailyGoal1)
        currentDailyGoals.append(dailyGoal2)
        currentDailyGoals.append(dailyGoal3)
    }
    
    //Choosing the weekly goals
    func chooseWeeklyGoals() {
        currentWeeklyGoals.removeAll()
        
        //We get a random integer from 1-15 then subtract 1 since arrays start at 0, meaning that the last element (goal 15) has an index of 14
        let random1 = Int.random(in: 1..<16) - 1
        let random2 = Int.random(in: 1..<16) - 1
        let random3 = Int.random(in: 1..<16) - 1
        
        let weeklyGoal1 = weeklyGoals[random1]
        let weeklyGoal2 = weeklyGoals[random2]
        let weeklyGoal3 = weeklyGoals[random3]
        
        
        weeklyGoal1.changeStatus(newStatus: 1)
        weeklyGoal2.changeStatus(newStatus: 1)
        weeklyGoal3.changeStatus(newStatus: 1)
        
        currentWeeklyGoals.append(weeklyGoal1)
        currentWeeklyGoals.append(weeklyGoal2)
        currentWeeklyGoals.append(weeklyGoal3)
    }
    
    //Setup the buttons and labels
    func setUpScreen() {
        DG1Title.text = currentDailyGoals[0].getTitle()
        DG1xp.text = "+\(String(currentDailyGoals[0].getxpPoints()))xp"
        if (currentDailyGoals[0].getStatus() == 1) {
            DG1Title.textColor = UIColor.white
            DG1xp.textColor = UIColor.white
            DG1Button.backgroundColor = UIColor.darkGray
        }
        else if (currentDailyGoals[0].getStatus() == 2) {
            DG1Button.backgroundColor = UIColor.yellow
        }
        else if (currentDailyGoals[0].getStatus() == 3) {
            DG1Button.backgroundColor = UIColor.red
        }
        else if (currentDailyGoals[0].getStatus() == 4) {
            DG1Button.backgroundColor = UIColor.green
        }
        
        DG2Title.text = currentDailyGoals[1].getTitle()
        DG2xp.text = "+\(String(currentDailyGoals[1].getxpPoints()))xp"
        if (currentDailyGoals[1].getStatus() == 1) {
            DG2Title.textColor = UIColor.white
            DG2xp.textColor = UIColor.white
            DG2Button.backgroundColor = UIColor.darkGray
        }
        else if (currentDailyGoals[1].getStatus() == 2) {
            DG2Button.backgroundColor = UIColor.yellow
        }
        else if (currentDailyGoals[1].getStatus() == 3) {
            DG2Button.backgroundColor = UIColor.red
        }
        else if (currentDailyGoals[1].getStatus() == 4) {
            DG2Button.backgroundColor = UIColor.green
        }
        
        DG3Title.text = currentDailyGoals[2].getTitle()
        DG3xp.text = "+\(String(currentDailyGoals[2].getxpPoints()))xp"
        if (currentDailyGoals[2].getStatus() == 1) {
            DG3Title.textColor = UIColor.white
            DG3xp.textColor = UIColor.white
            DG3Button.backgroundColor = UIColor.darkGray
        }
        else if (currentDailyGoals[2].getStatus() == 2) {
            DG3Button.backgroundColor = UIColor.yellow
        }
        else if (currentDailyGoals[2].getStatus() == 3) {
            DG3Button.backgroundColor = UIColor.red
        }
        else if (currentDailyGoals[2].getStatus() == 4) {
            DG3Button.backgroundColor = UIColor.green
        }
        
        WG1Title.text = currentWeeklyGoals[0].getTitle()
        WG1xp.text = "+\(String(currentWeeklyGoals[0].getxpPoints()))xp"
        if (currentWeeklyGoals[0].getStatus() == 1) {
            WG1Title.textColor = UIColor.white
            WG1xp.textColor = UIColor.white
            WG1Button.backgroundColor = UIColor.darkGray
        }
        else if (currentWeeklyGoals[0].getStatus() == 2) {
            WG1Button.backgroundColor = UIColor.yellow
        }
        else if (currentWeeklyGoals[0].getStatus() == 3) {
            WG1Button.backgroundColor = UIColor.red
        }
        else if (currentWeeklyGoals[0].getStatus() == 4) {
            WG1Button.backgroundColor = UIColor.green
        }
        
        WG2Title.text = currentWeeklyGoals[1].getTitle()
        WG2xp.text = "+\(String(currentWeeklyGoals[1].getxpPoints()))xp"
        if (currentWeeklyGoals[1].getStatus() == 1) {
            WG2Title.textColor = UIColor.white
            WG2xp.textColor = UIColor.white
            WG2Button.backgroundColor = UIColor.darkGray
        }
        else if (currentWeeklyGoals[1].getStatus() == 2) {
            WG2Button.backgroundColor = UIColor.yellow
        }
        else if (currentWeeklyGoals[1].getStatus() == 3) {
            WG2Button.backgroundColor = UIColor.red
        }
        else if (currentWeeklyGoals[1].getStatus() == 4) {
            WG2Button.backgroundColor = UIColor.green
        }
        
        WG3Title.text = currentWeeklyGoals[2].getTitle()
        WG3xp.text = "+\(String(currentWeeklyGoals[2].getxpPoints()))xp"
        if (currentWeeklyGoals[2].getStatus() == 1) {
            WG3Title.textColor = UIColor.white
            WG3xp.textColor = UIColor.white
            WG3Button.backgroundColor = UIColor.darkGray
        }
        else if (currentWeeklyGoals[2].getStatus() == 2) {
            WG3Button.backgroundColor = UIColor.yellow
        }
        else if (currentWeeklyGoals[2].getStatus() == 3) {
            WG3Button.backgroundColor = UIColor.red
        }
        else if (currentWeeklyGoals[2].getStatus() == 4) {
            WG3Button.backgroundColor = UIColor.green
        }
        
        let rightNow = Date()
        let nowDay = calendar.dateComponents([.weekday], from: rightNow).weekday!
        let nowHour = calendar.dateComponents([.hour], from: rightNow).hour!
        let nowMinute = calendar.dateComponents([.minute], from: rightNow).minute!
        
        let daysLeft = 7 - nowDay
        var hoursLeft = 24 - nowHour - 1
        var minutesLeft = 60 - nowMinute
        if minutesLeft == 60 {
            hoursLeft = hoursLeft + 1
            minutesLeft = 0
        }
        
        DGTimeLeft.text = "Daily Goals Change in \(hoursLeft) Hours \(minutesLeft) Minutes"
        WGTimeLeft.text = "Weekly Goals Change in \(daysLeft) Days \(hoursLeft) Hours \(minutesLeft) minutes"
    }
    
    //Determine whether or not a day has past and if new daily goals are needed
    func checkDay() -> Bool {
        let rightNow = Date()
        let rightNowWeekDay = calendar.dateComponents([.weekday], from: rightNow)
        let previousWeekDay = calendar.dateComponents([.weekday], from: previousDayDate)
        if (rightNowWeekDay != previousWeekDay) {
            previousDayDate = rightNow
            return true
        }
        else {
            let rightNowWeek = calendar.dateComponents([.weekOfYear], from: rightNow)
            let previousWeek = calendar.dateComponents([.weekOfYear], from: previousDayDate)
            if (rightNowWeek != previousWeek)  {
                previousDayDate = rightNow
                return true
            }
        }
        previousDayDate = rightNow
        return false
    }

    //Determine whether or not a week has past and if new weekly goals are needed
    func checkWeek() -> Bool {
        let rightNow = Date()
        let rightNowWeek = calendar.dateComponents([.weekOfYear], from: rightNow)
        let previousWeek = calendar.dateComponents([.weekOfYear], from: previousDayDate)
        if (rightNowWeek != previousWeek) {
            previousDayDate = rightNow
            return true
        }
        previousDayDate = rightNow
        return false
    }
    
    //Back to My Goals Home Scree
    @IBAction func toMyGoals(_ sender: Any) {
        indexOfGoal = 10
        indexOfMove = 10
        self.performSegue(withIdentifier: "toMyGoals", sender: self)
    }
    
    //Switching to Goal View (Daily)
    @IBAction func toGoalViewDG1(_ sender: Any) {
        indexOfGoal = 0
        selectedGoal = currentDailyGoals[0]
        let index = currentDailyGoals[0].getStatus()
        
        if (index == 1) {
            indexOfMove = 0
            self.performSegue(withIdentifier: "toDailyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            indexOfMove = 1
            self.performSegue(withIdentifier: "toDailyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            indexOfMove = 2
            self.performSegue(withIdentifier: "toDailyGoalViewFinish", sender: self)
        }
    }
    
    @IBAction func toGoalViewDG2(_ sender: Any) {
        indexOfGoal = 1
        selectedGoal = currentDailyGoals[1]
        let index = currentDailyGoals[1].getStatus()
        
        if (index == 1) {
            indexOfMove = 0
            self.performSegue(withIdentifier: "toDailyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            indexOfMove = 1
            self.performSegue(withIdentifier: "toDailyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            indexOfMove = 2
            self.performSegue(withIdentifier: "toDailyGoalViewFinish", sender: self)
        }
    }
    
    @IBAction func toGoalViewDG3(_ sender: Any) {
        indexOfGoal = 2
        selectedGoal = currentDailyGoals[2]
        let index = currentDailyGoals[2].getStatus()
        
        if (index == 1) {
            indexOfMove = 0
            self.performSegue(withIdentifier: "toDailyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            indexOfMove = 1
            self.performSegue(withIdentifier: "toDailyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            indexOfMove = 2
            self.performSegue(withIdentifier: "toDailyGoalViewFinish", sender: self)
        }
    }
    
    //Switching to Goal View (Weekly)
    @IBAction func toGoalViewWG1(_ sender: Any) {
        indexOfGoal = 3
        selectedGoal = currentWeeklyGoals[0]
        let index = currentWeeklyGoals[0].getStatus()
        
        if (index == 1) {
            indexOfMove = 3
            self.performSegue(withIdentifier: "toWeeklyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            indexOfMove = 4
            self.performSegue(withIdentifier: "toWeeklyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            indexOfMove = 5
            self.performSegue(withIdentifier: "toWeeklyGoalViewFinish", sender: self)
        }
    }
    
    @IBAction func toGoalViewWG2(_ sender: Any) {
        indexOfGoal = 4
        selectedGoal = currentWeeklyGoals[1]
        let index = currentWeeklyGoals[1].getStatus()
        
        if (index == 1) {
            indexOfMove = 3
            self.performSegue(withIdentifier: "toWeeklyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            indexOfMove = 4
            self.performSegue(withIdentifier: "toWeeklyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            indexOfMove = 5
            self.performSegue(withIdentifier: "toWeeklyGoalViewFinish", sender: self)
        }
    }
    
    @IBAction func toGoalViewWG3(_ sender: Any) {
        indexOfGoal = 5
        selectedGoal = currentWeeklyGoals[2]
        let index = currentWeeklyGoals[2].getStatus()
        
        if (index == 1) {
            indexOfMove = 3
            self.performSegue(withIdentifier: "toWeeklyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            indexOfMove = 4
            self.performSegue(withIdentifier: "toWeeklyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            indexOfMove = 5
            self.performSegue(withIdentifier: "toWeeklyGoalViewFinish", sender: self)
        }
    }
    
    //To pass the goal
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if indexOfMove == 0 {
            let vc = segue.destination as! DailyGoalViewStartViewController
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
        }
        else if indexOfMove == 1 {
            let vc = segue.destination as! DailyGoalViewOngoingViewController
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
        }
        else if indexOfMove == 2 {
            let vc = segue.destination as! DailyGoalViewFinishViewController
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
        }
        else if indexOfMove == 3 {
            let vc = segue.destination as! WeeklyGoalViewStartViewController
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
        }
        else if indexOfMove == 4 {
            let vc = segue.destination as! WeeklyGoalViewOngoingViewController
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
        }
        else if indexOfMove == 5 {
            let vc = segue.destination as! WeeklyGoalViewFinishViewController
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
        }
        saveData()
    }
    
    //Save data
    func saveData() {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(dailyGoals)
            let json = String(data: jsonData, encoding: .utf8) ?? "{}"
            UserDefaults.standard.set(json, forKey: "dailyGoals")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error")
        }
        
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(currentDailyGoals)
            let json = String(data: jsonData, encoding: .utf8) ?? "{}"
            UserDefaults.standard.set(json, forKey: "currentDailyGoals")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error")
        }
        
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(weeklyGoals)
            let json = String(data: jsonData, encoding: .utf8) ?? "{}"
            UserDefaults.standard.set(json, forKey: "weeklyGoals")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error")
        }
        
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(currentWeeklyGoals)
            let json = String(data: jsonData, encoding: .utf8) ?? "{}"
            UserDefaults.standard.set(json, forKey: "currentWeeklyGoals")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error")
        }
        
        UserDefaults.standard.set(previousDayDate, forKey: "previousDayDate")
    }
    
    //Getting the data
    func getData() {
        do {
            if (UserDefaults.standard.object(forKey: "dailyGoals") == nil) {
                
            }
            else {
                let json = UserDefaults.standard.string(forKey: "dailyGoals") ?? "{}"
                let jsonDecoder = JSONDecoder()
                guard let jsonData = json.data(using: .utf8) else {
                    return
                }
                let theDailyGoals: [Goal] = try jsonDecoder.decode([Goal].self, from: jsonData)
                dailyGoals = theDailyGoals
            }
        } catch {
            print("Error")
        }
        
        do {
            if (UserDefaults.standard.object(forKey: "currentDailyGoals") == nil) {
                return
            }
            else {
                let json = UserDefaults.standard.string(forKey: "currentDailyGoals") ?? "{}"
                let jsonDecoder = JSONDecoder()
                guard let jsonData = json.data(using: .utf8) else {
                    return
                }
                let theCurrentDailyGoals: [Goal] = try jsonDecoder.decode([Goal].self, from: jsonData)
                currentDailyGoals = theCurrentDailyGoals
            }
        } catch {
            print("Error")
        }
        
        do {
            if (UserDefaults.standard.object(forKey: "weeklyGoals") == nil) {
                
            }
            else {
                let json = UserDefaults.standard.string(forKey: "weeklyGoals") ?? "{}"
                let jsonDecoder = JSONDecoder()
                guard let jsonData = json.data(using: .utf8) else {
                    return
                }
                let theWeeklyGoals: [Goal] = try jsonDecoder.decode([Goal].self, from: jsonData)
                weeklyGoals = theWeeklyGoals
            }
        } catch {
            print("Error")
        }
        
        do {
            if (UserDefaults.standard.object(forKey: "currentWeeklyGoals") == nil) {
                
            }
            else {
                let json = UserDefaults.standard.string(forKey: "currentWeeklyGoals") ?? "{}"
                let jsonDecoder = JSONDecoder()
                guard let jsonData = json.data(using: .utf8) else {
                    return
                }
                let theCurrentWeeklyGoals: [Goal] = try jsonDecoder.decode([Goal].self, from: jsonData)
                currentWeeklyGoals = theCurrentWeeklyGoals
            }
        } catch {
            print("Error")
        }
        
        if let previousDay = UserDefaults.standard.object(forKey: "previousDayDate") as? Date {
            previousDayDate = previousDay
        }
    }
}

//Goal class
class Goal: Codable {
    
    var title = ""
    
    var description = ""
    
    var xpPoints = 0
    
    //Variable status is a way of representing the status of a certain goal, with 0 meaning the goal isn't chosen, 1 meaning it is one of the chosen goals, 2 meaning it is a ongoing chosen goal, 3 meaning it is a discarded chosen goal and 4 meaning it is a finished chosen goal.
    var status = 0
    
    var endTime = Date()
    
    var startTime = Date()
    
    var finishedTime = Date()
    
    
    //This variable specifies what type of goal (classification) a certain goal is. 1 for Auditory/Meditation, 2 for Written, 3 for Productivity, 4 for Enviornmental Interaction and 5 for Self Assesment, with 0 as default. If 1 is added to the end of a number, that means that it is of the type in the tens place but has no additional resources
    var typeOfGoal = 0
    
    var audioLink = ""
    var titles: String = ""
    var prompts: [String] = []
    
    
    init(title: String, description: String, xpPoints: Int, status: Int) {
        self.title = title
        self.description = description
        self.xpPoints = xpPoints
        self.status = status
    }
    
    func addAudio(link: String){
        self.audioLink = link
    }
    
    func addPromptTitle(title: String){
        self.titles = title
    }
    
    func addPrompts(prompts: [String]){
        self.prompts = prompts
    }
    
    func getPrompts() -> [String] {
        return self.prompts
    }
    
    func getAudio() -> String {
        return self.audioLink
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getDescription() -> String {
        return description
    }
    
    func getxpPoints() -> Int {
        return xpPoints
    }
    
    func getStatus() -> Int {
        return status
    }
    
    func getTypeOfGoal() -> Int {
        return typeOfGoal
    }
    
    func changeTitle(newTitle: String) {
        self.title = newTitle
    }
    
    func changeDescription(newDescription: String) {
        self.description = newDescription
    }
    
    func changeXPPoints(newXPPoints: Int) {
        self.xpPoints = newXPPoints
    }
    
    func changeStatus(newStatus: Int) {
        self.status = newStatus
    }
    
    func changeTypeOfGoal(newTypeOfGoal: Int) {
        self.typeOfGoal = newTypeOfGoal
    }
}

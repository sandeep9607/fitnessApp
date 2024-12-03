//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Sandeep on 11/11/24.
//

import SwiftUI	

class HomeViewModel: ObservableObject {
    
    let healthManager = HealthManager.shared
    
    @Published var calories: Int = 0
    @Published var exercise: Int = 0
    @Published var stand: Int = 0
    @Published var activities = [Activity]()
    @Published var workouts = [
        Workout(id: 0, title: "Running", tintColor: .green, image: "figure.run", duration: "5 min", date: "Aug 1", calories: "341 kcal"),
        Workout(id: 1, title: "Straingh Training", tintColor: .red, image: "figure.run", duration: "30 min", date: "Aug 10", calories: "341 kcal"),
        Workout(id: 2, title: "Walk", tintColor: .blue, image: "figure.walk", duration: "15 min", date: "Aug 11", calories: "341 kcal"),
        Workout(id: 3, title: "Running1", tintColor: .purple, image: "figure.run", duration: "5 min", date: "Aug 12", calories: "341 kcal")
    ]
    
    var mockActivites = [
        Activity(title: "Today steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "9,812"),
        Activity(title: "Running", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .red, amount: "9,812"),
        Activity(title: "Straingth", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .blue, amount: "812"),
        Activity(title: "Walk", subtitle: "Goal 12,000", image: "figure.run", tintColor: .purple, amount: "14,812"),
    ]
    
    var mockWorkout = [
        Workout(id: 0, title: "Running", tintColor: .green, image: "figure.run", duration: "5 min", date: "Aug 1", calories: "341 kcal"),
        Workout(id: 1, title: "Straingh Training", tintColor: .red, image: "figure.run", duration: "30 min", date: "Aug 10", calories: "341 kcal"),
        Workout(id: 2, title: "Walk", tintColor: .blue, image: "figure.walk", duration: "15 min", date: "Aug 11", calories: "341 kcal"),
        Workout(id: 3, title: "Running", tintColor: .purple, image: "figure.run", duration: "5 min", date: "Aug 12", calories: "341 kcal")
    ]
    
    init() {
        Task {
            do{
                try await healthManager.requestHealthKitAccess()
                //fetchTodayCalories()
                //fetchTodaySteps()
                fetchTodayExcerciseTime()
                fetchTodayStandHours()
                fetchCurrentWeekActivity()
                fetchRecentWorkouts()
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchTodayCalories(){
        healthManager.fetchTodayCaloryBurn { result in
            switch result {
            case .success(let calories):
                DispatchQueue.main.async {
                    self.calories = Int(calories)
                    let activity = Activity(title: "Calories Burned", subtitle: "today", image: "flame", tintColor: .red, amount: calories.formattedNumberString())
                    self.activities.append(activity)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchTodayExcerciseTime(){
        healthManager.fetchExcerciseTime { result in
            
            switch result {
            case .success(let exercise):
                DispatchQueue.main.async {
                    self.exercise = Int(exercise)
                }
            case .failure:
                print("Failure...")
            }
        }
    }
    
    func fetchTodayStandHours(){
        healthManager.fetchTodayStandTime { result in
            switch result {
            case .success(let hours):
                DispatchQueue.main.async {
                    self.stand = hours
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    //MARK: Fitness activity
    func fetchTodaySteps(){
        healthManager.fetchTodaysSteps { result in
            switch result {
                
            case .success(let activity):
                DispatchQueue.main.async {
                    self.activities.append(activity)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchCurrentWeekActivity(){
        healthManager.fetchCurrentWeekWorkoutStats { result in
            switch result {
            case .success(let activities):
                DispatchQueue.main.async {
                    self.activities.append(contentsOf: activities)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchRecentWorkouts(){
        healthManager.fetchWorkoutForMonth(month: Date()) { result in
            switch result{
            case .success( let workouts):
                print(workouts.count)
                DispatchQueue.main.async {
                    self.workouts.append(contentsOf: workouts) //Array(workouts.prefix(4))
                }
                break
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

//
//  HealthManager.swift
//  FitnessApp
//
//  Created by Sandeep on 11/11/24.
//

import Foundation
import HealthKit

extension Date{
    static var startOfDate: Date{
        let calender = Calendar.current
        return calender.startOfDay(for: Date())
    }
    
    static var startOfWeek: Date{
        let calender = Calendar.current
        var component = calender.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        component.weekday = 2
        return calender.date(from: component) ?? Date()
    }
    
    func fetchStartAndEndDate() -> (Date, Date){
        let calender = Calendar.current
        let startDateComponent = calender.dateComponents([.year, .month], from: calender.startOfDay(for: self))
        let startDate = calender.date(from: startDateComponent) ?? self
        
        let endDate = calender.date(byAdding: DateComponents(month: 1, day: -1), to: startDate) ?? self
        return (startDate, endDate)
    }
    
    func fetchWorkoutDate()-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter.string(from: self)
    }
}

extension Double{
    func formattedNumberString() -> String{
        let formatted = NumberFormatter()
        formatted.numberStyle = .decimal
        formatted.minimumFractionDigits = 0
        return formatted.string(from: NSNumber(value: self)) ?? "0"
    }
}

class HealthManager {
    
    static let shared = HealthManager()
    let healthStore = HKHealthStore()
    
    private init() {
        Task {
            do{
                try await requestHealthKitAccess()
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func requestHealthKitAccess() async throws{
        let calories = HKQuantityType(.activeEnergyBurned)
        let exercise = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        let steps = HKQuantityType(.stepCount)
        let workout = HKSampleType.workoutType()
        let healthTypes: Set = [calories, exercise, stand, steps, workout ]
        
        try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
    }
    
    func fetchTodayCaloryBurn(completion: @escaping(Result<Double, Error>) -> Void){
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDate, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, results, error in
            
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(NSError()))
                return
            }
            
            let caloryCount = quantity.doubleValue(for: .kilocalorie())
            completion(.success(caloryCount))
        }
        self.healthStore.execute(query)
    }
    
    func fetchExcerciseTime(completion: @escaping(Result<Double, Error>) -> Void){
        let excercise = HKQuantityType(.appleExerciseTime)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDate, end: Date())
        let query = HKStatisticsQuery(quantityType: excercise, quantitySamplePredicate: predicate) { _, results, error in
            
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(NSError()))
                return
            }
            
            let excerciseTime = quantity.doubleValue(for: .minute())
            completion(.success(excerciseTime))
        }
        self.healthStore.execute(query)
    }
    
    func fetchTodayStandTime(completion: @escaping(Result<Int, Error>) -> Void){
        let stand = HKCategoryType(.appleStandHour)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDate, end: Date())
        let query = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, results, error in
            guard let samples = results as? [HKCategorySample], error == nil else {
                completion(.failure(NSError()))
                return
            }
            let standCount = samples.filter({ $0.value == 0 }).count
            completion(.success(standCount))
        }
        self.healthStore.execute(query)
    }
    
    //MARK: Fitness Activity
    func fetchTodaysSteps(completion: @escaping(Result<Activity , Error>)-> Void){
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDate, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, results, error in
            
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(NSError()))
                return
            }
            
            let steps = quantity.doubleValue(for: .count())
            let activity = Activity(title: "Today Steps", subtitle: "Goal: 800", image: "figure.walk", tintColor: .green, amount: steps.formattedNumberString())
            completion(.success(activity))
        }
        self.healthStore.execute(query)
    }
    
    func fetchCurrentWeekWorkoutStats(completion: @escaping(Result<[Activity] , Error>)-> Void) {
        let workout = HKSampleType.workoutType()
        let predicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
        let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { [self] _, results, error in
            guard let workouts = results as? [HKWorkout], error == nil else {
                completion(.failure(URLError.badURL as! Error))
                return
            }
            
            var runningCount: Int = 0
            var strengthCount: Int = 0
            var soccerCount: Int = 0
            var basketballCount: Int = 0
            var stairesCount: Int = 0
            var kickBoxingCount: Int = 0
            
            for workout in workouts{
                let duration = Int(workout.duration)/60
                if workout.workoutActivityType == .running{
                    runningCount += duration
                } else if workout.workoutActivityType == .traditionalStrengthTraining{
                    strengthCount += duration
                }else if workout.workoutActivityType == .soccer{
                    soccerCount += duration
                }else if workout.workoutActivityType == .basketball{
                    basketballCount += duration
                }else if workout.workoutActivityType == .stairClimbing{
                    stairesCount += duration
                }else if workout.workoutActivityType == .kickboxing{
                    kickBoxingCount += duration
                }
            }
            completion(.success(generateActivtiesFromDuration(running: runningCount, strength: strengthCount, basketball: basketballCount, soccer: soccerCount, stairs: stairesCount, kickbox: kickBoxingCount)))
        }
        self.healthStore.execute(query)
    }
    
    func generateActivtiesFromDuration(running: Int, strength:Int, basketball: Int, soccer: Int, stairs: Int, kickbox: Int) -> [Activity] {
        return [
            Activity(title: "Running", subtitle: "Goal: 800", image: "figure.walk", tintColor: .green, amount: "\(running)"),
            Activity(title: "Strength", subtitle: "Goal: 800", image: "figure.walk", tintColor: .green, amount: "\(strength)"),
            Activity(title: "Soccer", subtitle: "Goal: 800", image: "figure.walk", tintColor: .green, amount: "\(soccer)"),
            Activity(title: "Basketball", subtitle: "Goal: 800", image: "figure.walk", tintColor: .green, amount: "\(basketball)"),
            Activity(title: "Stair climb", subtitle: "Goal: 800", image: "figure.run", tintColor: .green, amount: "\(stairs)"),
            Activity(title: "Kick boxing", subtitle: "Goal: 800", image: "figure.run", tintColor: .green, amount: "\(kickbox)"),
        ]
    }
    
    func fetchWorkoutForMonth(month: Date, completion: @escaping(Result<[Workout], Error>)-> Void) {
        let workout = HKSampleType.workoutType()
        let (startDate, endDate) = month.fetchStartAndEndDate()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)
        
        let  sortDiscriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDiscriptor]) { _, results, error in
            
            guard let workouts = results as? [HKWorkout], error == nil else {
                completion(.failure(URLError(.badURL)))
                return
            }

            let workoutsArray = workouts.map({  Workout( id: nil, title: $0.workoutActivityType.name, tintColor: $0.workoutActivityType.color, image: $0.workoutActivityType.image, duration: "\(Int($0.duration)/60)", date: $0.startDate.fetchWorkoutDate(), calories: $0.totalEnergyBurned?.doubleValue(for: .kilocalorie()).formattedNumberString() ?? "-") })
            
            completion(.success(workoutsArray))
        }
        healthStore.execute(query)
    }
}

//
//  ChartsViewModel.swift
//  FitnessApp
//
//  Created by Sandeep on 03/12/24.
//

import SwiftUI

class ChartsViewModel: ObservableObject {
    @Published var mockMonthData = [DailyStepModel]()
    @Published var mockThreeMonthData = [DailyStepModel]()
    
    init() {
        let mockMonthData = self.mockDataForDays(days: 30)
        let mockThreeMonthData = self.mockDataForDays(days: 90)
        DispatchQueue.main.async{
            self.mockMonthData = mockMonthData
            self.mockThreeMonthData = mockThreeMonthData
        }
    }
    
    func mockDataForDays(days: Int) -> [DailyStepModel]{
        var mockData = [DailyStepModel]()
        for day in 0..<days{
            let currentDate = Calendar.current.date(byAdding: .day, value: -day, to: Date()) ?? Date()
            let randomStepCount = Int.random(in: 5000...15000) // Generating a random step count
            let dailyStepData = DailyStepModel(date: currentDate, count: Double(randomStepCount))
            mockData.append(dailyStepData)
        }
        return mockData
    }
    
    var mockChartData = [
        DailyStepModel(date: Date(), count: 12312),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), count: 9775),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), count: 9775),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), count: 9775),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), count: 9775),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), count: 9775),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -6, to: Date()) ?? Date(), count: 9775),
    ]
    

}

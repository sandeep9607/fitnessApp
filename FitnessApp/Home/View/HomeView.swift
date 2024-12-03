//
//  HomeView.swift
//  FitnessApp
//
//  Created by Sandeep on 07/11/24.
//

import SwiftUI

struct HomeView: View {
    //@Environment(\.appThemeColor) var themeColor // Access the environment value
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("Welcome")
                        //.foregroundColor(themeColor) // Apply the color
                        .font(.largeTitle)
                        .padding()
                    
                    HStack {
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Calories")
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(.red)
                                
                                Text("\(viewModel.calories)")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Active")
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(.green)
                                
                                Text("\(viewModel.exercise)")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Stand")
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(.blue)
                                
                                Text("\(viewModel.stand)")
                                    .bold()
                            }
                        }
                        
                        Spacer()
                        
                        ZStack {
                            ProgressCircleView(progress: $viewModel.calories, goal: 600, color: .red)
                            
                            ProgressCircleView(progress: $viewModel.exercise, goal: 48, color: .green)
                                .padding(.all, 20)
                            
                            ProgressCircleView(progress: $viewModel.stand, goal: 12, color: .blue)
                                .padding(.all, 40)
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding()

                    FitnessActivity
                    WorkoutActivity
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView{
    var FitnessActivity: some View{
        VStack {
            HStack {
                Text("Fitness Activity")
                    .font(.title2)
                
                Spacer()
                
                NavigationLink {
                    EmptyView()
                } label: {
                    ShowMoreButtonLabel()
                }
            }
            .padding(.horizontal)
            
            if !viewModel.activities.isEmpty{
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                    ForEach(viewModel.activities, id: \.title){ activity in
                        ActivityCard(activity: activity)
                    }
                }
            }
        }
    }
    
    var WorkoutActivity: some View{
        VStack {
            //Recent Workout
            HStack {
                Text("Recent Workouts")
                    .font(.title2)
                
                Spacer()
                
                NavigationLink {
                    EmptyView()
                } label: {
                    ShowMoreButtonLabel()
                }
            }
            .padding()
            
            LazyVStack{
                ForEach(viewModel.workouts, id: \.title){ workout in
                    WorkoutCard(workout: workout)
                }
            }
        }
    }
}

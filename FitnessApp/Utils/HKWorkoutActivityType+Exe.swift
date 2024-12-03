//
//  HKWorkoutActivityType+Exe.swift
//  FitnessApp
//
//  Created by Sandeep on 22/11/24.
//

import Foundation
import HealthKit
import SwiftUI

extension HKWorkoutActivityType {

    var name: String {
        switch self {
        case .americanFootball:             return "American Football"
        case .archery:                      return "Archery"
        case .australianFootball:           return "Australian Football"
        case .badminton:                    return "Badminton"
        case .baseball:                     return "Baseball"
        case .basketball:                   return "Basketball"
        case .bowling:                      return "Bowling"
        case .boxing:                       return "Boxing"
        case .climbing:                     return "Climbing"
        case .crossTraining:                return "Cross Training"
        case .curling:                      return "Curling"
        case .cycling:                      return "Cycling"
        case .dance:                        return "Dance"
        case .danceInspiredTraining:        return "Dance Inspired Training"
        case .elliptical:                   return "Elliptical"
        case .equestrianSports:             return "Equestrian Sports"
        case .fencing:                      return "Fencing"
        case .fishing:                      return "Fishing"
        case .functionalStrengthTraining:   return "Functional Strength Training"
        case .golf:                         return "Golf"
        case .gymnastics:                   return "Gymnastics"
        case .handball:                     return "Handball"
        case .hiking:                       return "Hiking"
        case .hockey:                       return "Hockey"
        case .hunting:                      return "Hunting"
        case .lacrosse:                     return "Lacrosse"
        case .martialArts:                  return "Martial Arts"
        case .mindAndBody:                  return "Mind and Body"
        case .mixedMetabolicCardioTraining: return "Mixed Metabolic Cardio Training"
        case .paddleSports:                 return "Paddle Sports"
        case .play:                         return "Play"
        case .preparationAndRecovery:       return "Preparation and Recovery"
        case .racquetball:                  return "Racquetball"
        case .rowing:                       return "Rowing"
        case .rugby:                        return "Rugby"
        case .running:                      return "Running"
        case .sailing:                      return "Sailing"
        case .skatingSports:                return "Skating Sports"
        case .snowSports:                   return "Snow Sports"
        case .soccer:                       return "Soccer"
        case .softball:                     return "Softball"
        case .squash:                       return "Squash"
        case .stairClimbing:                return "Stair Climbing"
        case .surfingSports:                return "Surfing Sports"
        case .swimming:                     return "Swimming"
        case .tableTennis:                  return "Table Tennis"
        case .tennis:                       return "Tennis"
        case .trackAndField:                return "Track and Field"
        case .traditionalStrengthTraining:  return "Traditional Strength Training"
        case .volleyball:                   return "Volleyball"
        case .walking:                      return "Walking"
        case .waterFitness:                 return "Water Fitness"
        case .waterPolo:                    return "Water Polo"
        case .waterSports:                  return "Water Sports"
        case .wrestling:                    return "Wrestling"
        case .yoga:                         return "Yoga"

        // iOS 10
        case .barre:                        return "Barre"
        case .coreTraining:                 return "Core Training"
        case .crossCountrySkiing:           return "Cross Country Skiing"
        case .downhillSkiing:               return "Downhill Skiing"
        case .flexibility:                  return "Flexibility"
        case .highIntensityIntervalTraining:    return "High Intensity Interval Training"
        case .jumpRope:                     return "Jump Rope"
        case .kickboxing:                   return "Kickboxing"
        case .pilates:                      return "Pilates"
        case .snowboarding:                 return "Snowboarding"
        case .stairs:                       return "Stairs"
        case .stepTraining:                 return "Step Training"
        case .wheelchairWalkPace:           return "Wheelchair Walk Pace"
        case .wheelchairRunPace:            return "Wheelchair Run Pace"

        // iOS 11
        case .taiChi:                       return "Tai Chi"
        case .mixedCardio:                  return "Mixed Cardio"
        case .handCycling:                  return "Hand Cycling"

        // iOS 13
        case .discSports:                   return "Disc Sports"
        case .fitnessGaming:                return "Fitness Gaming"

        // Catch-all
        default:                            return "Other"
        }
    }
    
    var image: String {
            switch self {
            case .americanFootball:             return "sportscourt"
            case .archery:                      return "target"
            case .australianFootball:           return "sportscourt"
            case .badminton:                    return "sportscourt"
            case .baseball:                     return "sportscourt"
            case .basketball:                   return "basketball"
            case .bowling:                      return "figure.bowling"
            case .boxing:                       return "boxing.glove"
            case .climbing:                     return "figure.climbing"
            case .crossTraining:                return "figure.cross.training"
            case .curling:                      return "curling.stone"
            case .cycling:                      return "bicycle"
            case .dance:                        return "music.note"
            case .danceInspiredTraining:        return "music.note"
            case .elliptical:                   return "figure.elliptical"
            case .equestrianSports:             return "figure.horseback.riding"
            case .fencing:                      return "figure.fencing"
            case .fishing:                      return "fish"
            case .functionalStrengthTraining:   return "dumbbell"
            case .golf:                         return "figure.golfing"
            case .gymnastics:                   return "figure.gymnastics"
            case .handball:                     return "sportscourt"
            case .hiking:                       return "figure.hiking"
            case .hockey:                       return "hockey.puck"
            case .hunting:                      return "scope"
            case .lacrosse:                     return "sportscourt"
            case .martialArts:                  return "figure.martial.arts"
            case .mindAndBody:                  return "figure.mind.and.body"
            case .mixedMetabolicCardioTraining: return "figure.cross.training"
            case .paddleSports:                 return "sportscourt"
            case .play:                         return "figure.play"
            case .preparationAndRecovery:       return "figure.stretch"
            case .racquetball:                  return "sportscourt"
            case .rowing:                       return "figure.rowing"
            case .rugby:                        return "sportscourt"
            case .running:                      return "figure.running"
            case .sailing:                      return "sailboat"
            case .skatingSports:                return "figure.skating"
            case .snowSports:                   return "snowflake"
            case .soccer:                       return "soccerball"
            case .softball:                     return "sportscourt"
            case .squash:                       return "sportscourt"
            case .stairClimbing:                return "figure.stair.stepper"
            case .surfingSports:                return "figure.surfing"
            case .swimming:                     return "figure.swimming"
            case .tableTennis:                  return "tabletennis"
            case .tennis:                       return "tennis.racket"
            case .trackAndField:                return "figure.track.and.field"
            case .traditionalStrengthTraining:  return "dumbbell"
            case .volleyball:                   return "sportscourt"
            case .walking:                      return "figure.walk"
            case .waterFitness:                 return "figure.swimming"
            case .waterPolo:                    return "sportscourt"
            case .waterSports:                  return "figure.wave.surfing"
            case .wrestling:                    return "figure.wrestling"
            case .yoga:                         return "figure.mind.and.body"
            case .barre:                        return "figure.stretch"
            case .coreTraining:                 return "figure.strengthtraining.traditional"
            case .crossCountrySkiing:           return "figure.skiing.crosscountry"
            case .downhillSkiing:               return "figure.skiing.downhill"
            case .flexibility:                  return "figure.stretch"
            case .highIntensityIntervalTraining:return "figure.strengthtraining.traditional"
            case .jumpRope:                     return "figure.jump.rope"
            case .kickboxing:                   return "boxing.glove"
            case .pilates:                      return "figure.stretch"
            case .snowboarding:                 return "figure.snowboarding"
            case .stairs:                       return "figure.stair.stepper"
            case .stepTraining:                 return "figure.stair.stepper"
            case .wheelchairWalkPace:           return "figure.walking.wheelchair"
            case .wheelchairRunPace:            return "figure.running.wheelchair"
            case .taiChi:                       return "figure.mind.and.body"
            case .mixedCardio:                  return "figure.mind.and.body"
            case .handCycling:                  return "hand.raised.fill"
            case .discSports:                   return "sportscourt"
            case .fitnessGaming:                return "gamecontroller"
            default:                            return "questionmark.circle"
            }
        }
    
    var color: Color {
            switch self {
            case .americanFootball:             return .red
            case .archery:                      return .green
            case .australianFootball:           return .orange
            case .badminton:                    return .blue
            case .baseball:                     return .yellow
            case .basketball:                   return .purple
            case .bowling:                      return .brown
            case .boxing:                       return .red
            case .climbing:                     return .pink
            case .crossTraining:                return .teal
            case .curling:                      return .gray
            case .cycling:                      return .blue
            case .dance:                        return .purple
            case .danceInspiredTraining:        return .purple
            case .elliptical:                   return .orange
            case .equestrianSports:             return .green
            case .fencing:                      return .blue
            case .fishing:                      return .teal
            case .functionalStrengthTraining:   return .gray
            case .golf:                         return .green
            case .gymnastics:                   return .pink
            case .handball:                     return .red
            case .hiking:                       return .brown
            case .hockey:                       return .blue
            case .hunting:                      return .gray
            case .lacrosse:                     return .orange
            case .martialArts:                  return .red
            case .mindAndBody:                  return .purple
            case .mixedMetabolicCardioTraining: return .teal
            case .paddleSports:                 return .blue
            case .play:                         return .yellow
            case .preparationAndRecovery:       return .gray
            case .racquetball:                  return .blue
            case .rowing:                       return .teal
            case .rugby:                        return .orange
            case .running:                      return .red
            case .sailing:                      return .blue
            case .skatingSports:                return .gray
            case .snowSports:                   return .teal
            case .soccer:                       return .green
            case .softball:                     return .yellow
            case .squash:                       return .orange
            case .stairClimbing:                return .gray
            case .surfingSports:                return .blue
            case .swimming:                     return .teal
            case .tableTennis:                  return .yellow
            case .tennis:                       return .green
            case .trackAndField:                return .orange
            case .traditionalStrengthTraining:  return .gray
            case .volleyball:                   return .yellow
            case .walking:                      return .green
            case .waterFitness:                 return .teal
            case .waterPolo:                    return .blue
            case .waterSports:                  return .blue
            case .wrestling:                    return .red
            case .yoga:                         return .purple
            case .barre:                        return .pink
            case .coreTraining:                 return .gray
            case .crossCountrySkiing:           return .teal
            case .downhillSkiing:               return .blue
            case .flexibility:                  return .purple
            case .highIntensityIntervalTraining:return .red
            case .jumpRope:                     return .orange
            case .kickboxing:                   return .red
            case .pilates:                      return .purple
            case .snowboarding:                 return .teal
            case .stairs:                       return .gray
            case .stepTraining:                 return .yellow
            case .wheelchairWalkPace:           return .green
            case .wheelchairRunPace:            return .red
            case .taiChi:                       return .purple
            case .mixedCardio:                  return .teal
            case .handCycling:                  return .blue
            case .discSports:                   return .orange
            case .fitnessGaming:                return .purple
            default:                            return .gray
            }
        }
    
}

//
//  Extension.swift
//  FitnessApp
//
//  Created by Sandeep on 18/11/24.
//

import SwiftUI

// Define the Environment Key
struct AppThemeColor: EnvironmentKey {

    static let defaultValue: Color = .blue  // Default color
    
}

// Extension to access the environment value

extension EnvironmentValues {

    var appThemeColor: Color {

        get { self[AppThemeColor.self] }

        set { self[AppThemeColor.self] = newValue }

    }
}

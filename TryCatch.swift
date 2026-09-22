import Foundation /// Import Foundation framework for mathematical operations and input handling

/// Custom error types for sphere calculation.
enum SphereError: Error { /// Error type for sphere calculation
    case invalidInput /// Error for invalid input (non-numeric values)
    case negativeOrZeroRadius(String) /// Error for negative or zero radius with a message
}

/**
 * Calculates sphere volume with input handling.
 *
 * - Author: Sarah Ouamou
 * - Version: 1.0
 * - Since: 2026-09-21
 */
func calculateSphereVolume() {
    // ask the user to enter the radius of da sphere
    print("Enter the radius of a sphere: ", terminator: "")
    
    // Read line from standard input
    guard let input = readLine() else { /// Guard statement to handle nil input (no input)
        print("Error: Could not read input.") /// Print error message for nil input
        return
    }
    
    do {
        // Attempt to parse input string to a Double (handles InputMismatchException)
        guard let sphereRadius = Double(input) else { /// Guard statement to handle invalid input (non-numeric values)
            throw SphereError.invalidInput /// Throw custom error for invalid input
        }
        
        // Check if input is negative or zero
        if sphereRadius <= 0 { 
            throw SphereError.negativeOrZeroRadius("Error: Radius cannot be negative or 0.")
        }
        
        // Calculate sphere volume 
        let sphereVolume = (4.0 / 3.0) * Double.pi * pow(sphereRadius, 3)
        
        // Print the result
        print("The volume is: \(sphereVolume)")
        
    } catch SphereError.invalidInput { /// Catch block for invalid input error
        print("Error: Please enter a valid number.") /// Print error message for invalid input
    } catch SphereError.negativeOrZeroRadius(let message) { /// Catch block for negative or zero radius error
        print(message) /// Print the custom error message for negative or zero radius
    } catch {
        print("An unexpected error occurred: \(error).") /// Catch block for any other unexpected errors
    }
}

// Execute the function
calculateSphereVolume() /// Call the function to calculate sphere volume with input handling

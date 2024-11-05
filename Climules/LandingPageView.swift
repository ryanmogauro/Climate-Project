import SwiftUI

struct LandingPageView: View {
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.green.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Logo and Title Section
                VStack(spacing: 8) {
                    Image("Climule") // Make sure the image is correctly named in Assets
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .shadow(radius: 10)
                        .padding(.top, 80)
                    
                    Text("Climules")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text("The Climate Community")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.8))
                }
                
                // Mission Statement with Simpler Text
                Text("Join a community of change-makers.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.white.opacity(0.15))
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                // Sign In and Create Account Buttons
                VStack(spacing: 15) {
                    Button(action: {
                        // Sign-in action
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 40)
                    
                    Button(action: {
                        // Create account action
                    }) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 40)
                }
                
                Spacer()
                
                // Footer Text
                Text("Connect. Act. Inspire.")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.bottom, 40)
            }
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}

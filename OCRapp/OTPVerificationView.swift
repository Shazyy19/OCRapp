import SwiftUI

struct OTPVerificationView: View {
    @Binding var otpCode: String  // Accept the binding for otpCode from SignUpView
    @State private var verificationSuccessful = false // To track OTP verification status

    var body: some View {
        VStack {
            Text("Enter OTP")
                .font(.headline)
                .foregroundColor(AppColors.primaryRed)
            
            TextField("OTP", text: $otpCode)
                .padding()
                .background(Color.red.opacity(0.1))
                .cornerRadius(10)
                .keyboardType(.numberPad)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 1))

            Button("Verify") {
                // Simulate OTP verification
                if otpCode == "123456" { // The hardcoded OTP for testing
                    verificationSuccessful = true
                } else {
                    // Show an error message if OTP is incorrect
                    // You can use an alert or a toast message here
                }
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.red)
            .cornerRadius(10)
        }
        .padding()
        .background(Color.white)
        .onChange(of: verificationSuccessful) { _ in
            // Navigate to the Login Screen if verification is successful
            if verificationSuccessful {
                // Replace this with your navigation logic to LoginView
            }
        }
    }
}

struct OTPVerificationView_Previews: PreviewProvider {
    @State static var otpCode = ""  // Preview with sample otpCode

    static var previews: some View {
        OTPVerificationView(otpCode: $otpCode)
    }
}

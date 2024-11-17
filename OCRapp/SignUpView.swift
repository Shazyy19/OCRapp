import SwiftUI

struct SignUpView: View {
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var isPhoneSignUp: Bool = true
    @State private var showOTP: Bool = false
    @State private var otpCode: String = ""
    @State private var navigateToLogin = false  // State to manage navigation to LoginView

    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Spacer()

                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.red)

                if isPhoneSignUp {
                    TextField("Phone Number", text: $phoneNumber)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                        .keyboardType(.phonePad)
                } else {
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }

                Button(action: {
                    showOTP = true
                }) {
                    Text("Send OTP")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 50)
                        .background(Color.red)
                        .cornerRadius(25)
                }
                .sheet(isPresented: $showOTP) {
                    OTPVerificationView(otpCode: $otpCode) // Pass the OTP binding here
                }
                
                Button(action: {
                    isPhoneSignUp.toggle()
                }) {
                    Text(isPhoneSignUp ? "Use Email Instead" : "Use Phone Instead")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }

                NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
                    EmptyView() // Hidden NavigationLink for programmatic navigation
                }

                Spacer()
            }
            .onChange(of: otpCode) { newValue in
                if newValue == "123456" { // Check against the hardcoded OTP
                    navigateToLogin = true // Navigate to LoginView
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

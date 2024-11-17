import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var showAlert: Bool = false

    var body: some View {
        if isLoggedIn {
            ContentView()  // Navigate to ContentView after login
        } else {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Image("QNA_logo") // Replace with your logo image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.bottom, 40)
                    
                    Text("Log In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.primaryRed)
                    
                    TextField("Enter Number / Email", text: $username)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    HStack {
                        if showPassword {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }
                        Button(action: {
                            showPassword.toggle()
                        }) {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.red)
                        }
                    }
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
                    
                    Button(action: {
                        if !username.isEmpty && !password.isEmpty {
                            // Simulate login process
                            if username == "user" && password == "password" {
                                isLoggedIn = true
                            } else {
                                showAlert = true
                            }
                        }
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 50)
                            .background(AppColors.primaryRed)
                            .cornerRadius(25)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            // Handle Forgot Password action
                        }) {
                            Text("Forgot Password?")
                                .font(.subheadline)
                                .foregroundColor(AppColors.primaryRed)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: SignUpView()) {
                            Text("Sign Up")
                                .font(.subheadline)
                                .foregroundColor(AppColors.primaryRed)
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 30)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Failed"), message: Text("Invalid username or password. Please try again."), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

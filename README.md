# Online Exam App 📝🎓

The **Online Exam** allows users to register, log in, and take timed exams across different categories. The app ensures a smooth and organized exam experience, complete with scoring, profile management, and secure authentication.

## Features ✨

### Authentication  

- **User Registration**: Create an account using email and password.  
- **Login**: Access your account with secure login credentials.  
- **Remember Me**: Automatically logs in the last authenticated user on app restart.  
- **Forgot Password**: Recover access via password reset functionality.

### Exam Flow  

- **Category Selection**: Choose from multiple exam categories.  
- **Exam List**: View available exams in the selected category.  
- **Timed Exams**: Start any exam with a countdown timer and a clear UI for answering questions.  
- **Submit & View Score**: Submit your answers and instantly view your exam score.

### Profile View  

- **Edit Profile**: Update your personal details like name, email, and password.  
- **Logout**: Securely log out of your account anytime.

## Technologies Used 🛠️

- **Flutter**: Cross-platform UI toolkit for a responsive mobile experience.  
- **RESTful APIs**: Efficient and scalable server communication.  
- **Retrofit**: Type-safe HTTP client for API calls.  
- **Bloc / Cubit**: Robust state management for handling UI logic and state.  
- **MVI Pattern**: Ensures clear separation of responsibilities and better testability.  
- **Clean Architecture**: Promotes a scalable, maintainable, and testable codebase.  
- **Repository Pattern**: Abstracted data layer for clean separation of concerns.  
- **Dependency Injection**: Facilitates modularity and testability using service locators or DI frameworks.

## 📂 Project Structure

```bash
lib/
├── api/
│   └── client/          # Retrofit API client
│   └── models/          # Data models
│   └── responses/       # API responses
│   └── data_source_impl/ # API implementations
├── data/
│   └── data_source/     # Local/remote data sources
│   └── repositories/    # Repository implementations
├── domain/
│   └── entities/        # Domain entities
│   └── repositories/    # Repository contracts
│   └── usecases/        # Use cases with tests
├── presentation/
│   └── views/           # UI screens/widgets
│   └── view_models/     # Bloc/Cubit files

```

## 🛠️ Setup Instructions

- **1. Clone the repository**: git clone https://github.com/AhmedTarek-f/exam-app
- **2. Navigate into the project directory**: cd exam-app
- **3. Install dependencies**: flutter pub get
- **4. Run the app**: flutter run

## Screenshots 📸

*Coming Soon...*

## Download 📥

*Coming Soon...*

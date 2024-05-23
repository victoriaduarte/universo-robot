# universo-robot
 
Automated tests for web and mobile (Android) application using Robot Framework and Appium.

## 📚 Course
[Universo Robot Framework - Udemy](https://www.udemy.com/course/universo-robot-framework/)

## ✅ What I learned
- Automated Web testing using Browser Library
- Automated API testing using Requests Library
- Automated Mobile testing using Appium
- Manual API testing using Insomnia
- Test Setup and Test Teardown
- Page objects pattern
- Component testing
- Custom Python libs
- Manipulating JSON objects
- SQL scripts
- PostgreSQL database and pgAdmin 4 with Docker
- Cross-browser testing
- Enviroment variables with python-dotenv


## 🌐 Application
Smartbit is a fictitious gym application where the client starts their registration on the web application and visit the nearest branch to finish the membership process. On the native mobile app (Android) they can manage their account, register their body measurements, check their BMI (IMC) and cancel their gym membership.

The gym administrator uses the web application to complete the client registration, manage the clients and their memberships.


*Mobile application*
<br><img src="app-screenshots/mobile-login.png" width=150px> <img src="app-screenshots/mobile-myaccount.png" width=150px> <img src="app-screenshots/mobile-mybody.png" width=150px>

*Web application*
<br><img src="app-screenshots/web-signup.png" width=320px> <img src="app-screenshots/web-signupform.png" width=320px> <img src="app-screenshots/web-loginadmin.png" width=320px>
<img src="app-screenshots/web-clients.png" width=320px> <img src="app-screenshots/web-enrolls.png" width=320px> <img src="app-screenshots/web-newenroll.png" width=320px>

## 🧪 Test cases
<details>
<summary><strong>Client login</strong></summary>

| Test Case | Status | Application |
|---|---|---|
|Login with cpf and ip       | ✅ | Mobile |
|Login with unregistered cpf | ✅ | Mobile |   
|Login with invalid cpf      | ✅ | Mobile |

</details>

<details>
<summary><strong>Client measurements</strong></summary>

| Test Case | Status | Application |
|---|---|---|
|Register my measures                 | ✅ | Mobile |
|Should not register empty measures   | ✅ | Mobile |   
|Should not register invalid measures | ✅ | Mobile |   

</details>

<details>
<summary><strong>Admin login</strong></summary>

| Test Case | Status | Application |
|---|---|---|
|Login as gym admin                         | ✅ | Web | 
|Login as gym admin with invalid password   | ✅ | Web |  
|Login as gym admin with unregistered email | ✅ | Web |
|Login with invalid credentials             | ✅ | Web |

</details>

<details>
<summary><strong>Client signup</strong></summary>

| Test Case | Status | Application |
|---|---|---|
|Start the user registration       | ✅ | Web |  
|Name field should be required     | ✅ | Web |
|Email field should be required    | ✅ | Web | 
|Document field should be required | ✅ | Web |
|Duplicate email                   | ✅ | Web |  
|Duplicate cpf                     | ✅ | Web |   
|Signup with invalid data          | ✅ | Web |   

</details>

<details>
<summary><strong>Memberships</strong></summary>

| Test Case | Status | Application |
|---|---|---|
|Enroll an user                         | ✅ | Web |
|Should not create duplicate membership | ✅ | Web |   
|Should not create invalid membership   | 🚧 | Web |   
|Search not found                       | ✅ | Web |   
|Search membership by name              | ✅ | Web |
|Delete membership by name              | ✅ | Web |

</details>

<details>
<summary><strong>Clients</strong></summary>

| Test Case | Status | Application |
|---|---|---|
|Search not found              | 🚧 | Web |   
|Search client by name         | 🚧 | Web |
|Delete client by name         | 🚧 | Web |
|Edit client with valid data   | 🚧 | Web |
|Edit client with invalid data | 🚧 | Web |

</details>

## 💻 Technologies and Tools used
- **Python**: Programming language used to create custom libraries
- **Robot Framework**: Test automation framework
- **Robot Framework dependencies**: `python -m pip install -r requirements.txt`
- **Appium**: Automation mobile testing tool
- **Android Studio**: Run the Android Virtual Device (AVD) emulator 
- **Appium Inspector**: GUI for inspecting and interacting with the mobile app elements  
- **Insomnia**: Manual API testing

## Report

*Web test report*
<br><img src="app-screenshots/test-report-web.png" width=320px>

*Mobile test report*
<br><img src="app-screenshots/test-report-mobile.png" width=320px>
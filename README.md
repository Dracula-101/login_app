# LogBase

This is a Flutter based app which logins and registers a user using the Firebase Authentication
It has clean UI design and uses the OTP to verify with atmost security.

![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=yellow)

# Home Page

Home Page shows two buttons related to Login and Register

<p align="center">
  <img src="screenshots\Home.jpeg" height="422" width="200" title="Home Page">
</p>

# Login Page

The Login Page has two fields of username and password. If the user submits the data, the credentials are verified by the Firebase console and a error message is printed if anything goes wrong.

<p align="center">
  <img src="screenshots\Login.jpeg" height="422" width="200" title="Login Page">
</p>

>This page allows user to jump to the Register page very quickly. Also Firebase denies all user login for sometime if the user puts to many incorrect passwords.


# Register Page

The Register Page shows a many different fields containing different information to be filled in with. If some of the fields are left to be empty, before submitting, it will show a error symbol right next to the incomplete field indicating that it is required. There is also a password confirmation section where in one field password is shown and other is not shown in order to maintain password accuracy.

Also Firebase wont allow users to create short passwords and unidentified email addresses.

<p align="center">
  <img src="screenshots\Register.jpeg" height="422" width="200" title="Register Page">
</p>

# OTP Page

The OTP Page shows the otp sending text and also gives a confirmation if the otp is recieved by the person or not. For now the OTP number only works for the IN(+91) numbers

<p align="center">
  <img src="screenshots\OTP_Sending.jpeg" height="422" width="200" title="OTP Sending Page">
  <img src="screenshots\OTP_Sent.jpeg" height="422" width="200" title="OTP Sent Page">
</p>


# Signout Page

The Signout page basically lets you sign out or logout from the account after the registeration or OTP confirmation. If the user is already signed a long back ago and revisited the app, it would show that same user is logged/signed in, and will remind to sign/log out from the account.

<p align="center">
  <img src="screenshots\Signout.jpeg" height="422" width="200" title="OTP Sending Page">
</p>


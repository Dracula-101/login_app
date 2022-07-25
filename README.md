# LogBase

This is a Flutter based app which logins and registers a user using the Firebase Authentication
It has clean UI design and uses the OTP to verify with atmost security.

![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=yellow)
<br>
<center style="text-align:center"><h1>Home Page</h6></center>

<div style="display:flex;align-items:center;justify-content:space-around">
  <span style="min-width:211px">
    <img style="border-radius:2%;"src="screenshots\Home.jpeg" height="422" width="200" title="Home Page">
  </span>
  <p>Home Page shows two buttons related to Login and Register</p>
</div>



<center style=" text-align-last: right;padding-right:0.5rem"><h1>Login Page</h6></center>



<div style="display:flex;align-items:center;justify-content:space-evenly">
  <center style="margin-right:25px;text-align: justify;">The Login Page has two fields of username and password. If the user submits the data, the credentials are verified by the Firebase console and a error message is printed if anything goes wrong.</center>

  <span style="min-width:211px">
    <img src="screenshots\Login.jpeg" height="422" width="200" title="Login Page">
  </span>
</div>




# Register Page

<div style="display:flex;align-items:center;">
  <span style="min-width:211px">
    <img src="screenshots\Register.jpeg" height="422" width="200" title="Register Page">
  </span>
  <p> The Register Page shows a many different fields containing different information to be filled in with. If some of the fields are left to be empty, before submitting, it will show a error symbol right next to the incomplete field indicating that it is required. There is also a password confirmation section where in one field password is shown and other is not shown in order to maintain password accuracy.
  Also Firebase wont allow users to create short passwords and unidentified email addresses.</p>
</div>



<center style=" text-align-last: right;padding-right:0.5rem"><h1>OTP Page</h6></center>

<div style="align-items:center">
The OTP Page shows the otp sending text and also gives a confirmation if the otp is recieved by the person or not. For now the OTP number only works for the IN(+91) numbers

<div align="center" style="padding-top:15px;justify-content: space-between; ">
  <img src="screenshots\OTP_Sending.jpeg" height="422" width="200" title="OTP Sending Page">
  <img src="screenshots\OTP_Sent.jpeg" height="422" width="200" title="OTP Sent Page">
</div>
</div>

<div style="height:20px"></div>

# Signout Page

<div style="display:flex;align-items:center;justify-content:space-evenly">
  <center style="margin-right:25px;text-align: justify;">The Signout page basically lets you sign out or logout from the account after the registeration or OTP confirmation. If the user is already signed a long back ago and revisited the app, it would show that same user is logged/signed in, and will remind to sign/log out from the account.</center>

  <span style="min-width:211px">
    <img src="screenshots\Signout.jpeg" height="422" width="200" title="OTP Sending Page">
  </span>
</div>





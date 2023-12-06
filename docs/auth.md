# [⬅️](/README.md) Auth Feature

## Resource

`repository.dart` - contains two methods named `postAuthFields` and `getNewAccessToken`.

- `postAuthFields` - method for the main login with the server using login and password.
- `getNewAccessToken` - method for quick login with a refresh token.

## Screens

- Folder `pincode` - contains screens for changing, entering, and creating a pincode.
- Folder `server` - contains screens for adding and editing the server.
- `login_screen.dart` - main login screen.
- `model_login_screen.dart` - model for the login screen, where initialization and disposing of fields are done.

## Components

- `bottom_sheet.dart` - the bottom sheet that opens when the user clicks on the server selection textfield.
- `offer_enter_pincode.dart` - the offer to enter through quick login.
- `offer_create_pincode.dart` - the offer to create quick login.

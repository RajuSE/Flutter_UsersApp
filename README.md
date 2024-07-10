# hdfc_test

A new Flutter project.

## Features
1. UI changes for Dark mode ON & OFF
2. Widget testing home to details screen UI
3. Unit testing api call
4. Flutter Provider for state management

## How to run
#Normal Flow
1. Open app, It will open home_screen.dart
2. It will make api call
3. It will show list of users
4. Tap any list item
5. Edit name , email or phone. Make sure it is not empty.
6. Click save button. Since I couldn't find save api, I have assumed success response.
7. It will show User updated successfully toast
8. Press back to exit details screen or edit details further
9. If exited details_screen.dart, you should see updated details on HomeScreen automatically.


#Error/Retry User list Api Fail Flow
1. Open user_service.dart put any url at line 16/17 where comment mentioned as:"EDIT MOCK WRONG URLS"
2. It will make api call and api will fail as wrong endpoint provided.
3. It will show retry button
4. Tap on retry to retry




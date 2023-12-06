# [⬅️](/README.md) Home feature

## Resource
`notification_repository.dart` - contains **NotificationsRepository** and **NotificationScreenRepository**.

1. `NotificationsRepository` - a repository containing methods for working with the BLoC.
   - `getHListEvent` - returns a list of notifications for the main screen.
   - `fetchMainList` - used to return a `Future<NotificationMainModel>`, then checks the equality of the lists.

2. `NotificationScreenRepository` - a repository that contains methods for the notification screen.
   - `getUnreadCount` - method to get the count of unread notifications.

## Screens
1. Folder `home_screen` - contains the home screen file:
   - `home_screen.dart` - the home screen.

2. Folder `notifications` - contains screens for notifications:
   - `notifications_screen.dart` - the main notification screen.
   - `model_notification_screen.dart` - model for the notification screen, includes fields for initialization and disposal.

## Components
- `home_components.dart` - contains all components for the home screen.
- `notification_screens_components.dart` - contains all components for the notifications screen.
- `timeline_paint.dart` - contains Custom Paint (timeline) for the attendance body.

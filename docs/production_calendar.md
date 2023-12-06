# [⬅️](/README.md) Production calendar feature

## Resource
`calendar_repository.dart` - contains **CalendarRepository**.

1. `CalendarRepository` - a repository containing methods for working with the BLoC.
   - `getProductionEvents` - returns events for selected day.
   - `getMarkersHolidays` - returns markers and holidays for selected month.
   - `deleteTodoEvent` and `createTodoEvent` - method for delete and create event.

## Screens
1. `todo_screen.dart` - screen with production calendar and events.
2. `model_todo.dart` - model for `todo_screen`, includes fields for initialization and disposal.
3. Folder `subscreens` - contains screens: for create event and for viewing the selected event.

## Components
- `another_creater_card.dart` - card for event, where author is another one.
- `default_card.dart` - card for event, where author is current user.

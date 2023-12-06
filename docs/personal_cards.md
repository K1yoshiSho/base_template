# [⬅️](/README.md) Personal card feature

## Resource
`personal_card_repository.dart` - contains **PersonalCardRepository**.

1. `PersonalCardRepository` - a repository containing methods for working with the BLoC.
   - `getCabinetInfo` - returns information about the cabinet.
   - `getEducationInfo` - returns information about education.
   - `getPersonalInfo` - returns information about the user.
   - `getLanguageSkillInfo` - returns information about language skills.
   - `getMilitaryInfo` - returns information about the military.
   - `getLaborActivitiesInfo` - returns information about labor activities.

2. `PersonalCardScreenRepository`
   - `getNationalityScreen` - returns nationality text.
   - `getEducation` - returns education text.
   - `getMilitaryInfoScreen` - returns military text.
   - `getLanguageSkills` - returns language text.
   - `getQualifications` - returns qualification catalogue.
   - `getEducationDegrees` - returns education degree catalogue.
   - `getEducationLevel` - returns education level catalogue.
   - `getNationality` - returns nationality catalogue.
   - `getMilitaryInfo` - returns military info catalogue.

## Screens
1. `personal_card_screen.dart` - screen for personal card.
2. `model_my_documents.dart` - model for `personal_card_screen`, includes fields for initialization and disposal.
3. Folder `tabs` - contains tabs for **personal_card_screen**: labor and personal.

## Components
`personal_card_component.dart` - contains all components for the personal card screen.

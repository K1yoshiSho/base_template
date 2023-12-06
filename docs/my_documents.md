# [⬅️](/README.md) My documents feature

## Resource
`my_documents_repository.dart` - contains **MyDocumentsRepository**.

1. `MyDocumentsRepository` - a repository containing methods for working with the BLoC.
   - `getPersonalDocuments` - returns a list of electronic documents.
   - `fetchMainList` - used to return a `Future<PersonalDocumentModel>`, then checks the equality of the lists.

## Screens
1. `my_documents_screen.dart` - screen with all categories.
2. `model_my_documents.dart` - model for `my_documents_screen`, includes fields for initialization and disposal.
3. Folder `my_documents_type` - contains screens for notifications:
   - `personal_documents_screen.dart` - a screen with all the documents for the selected category.
   - `model_personal_documents.dart` - model for `personal_documents_screen`, includes fields for initialization and disposal.

## Components
- `my_documents_components.dart` - contains all components for the my documents screen.
- `type_documents_components.dart` - contains all components for the personal documents screen.

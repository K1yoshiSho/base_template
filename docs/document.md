# [⬅️](/README.md) Document feature

## Resource
`repository.dart` - contains **DocumentsDataRepository**, **DocumentScreenRepository**, and **ButtonStyleTags**.

`_IsolateFunction` - a class containing methods for the `compute` function.

1. `DocumentsDataRepository` - a repository containing methods for working with the BLoC.
   - `getDocument` - gets information about a document.
   - `downloadDocument` - downloads document attachments.
   - `signDocument` - signs a document.

2. `DocumentScreenRepository` - a repository containing methods for actions like initialize, revoke, delete, reject, etc.

3. `ButtonStyleTags` - an enum to get necessary parameters for the style of the action buttons on the document.

`actions.dart` - contains a repository named **DocumentActions** that includes old methods for documents.

## Screens
- Folder `tab_screens` - contains files for tab screens:
  - `attachment_body.dart` - attachments screen.
  - `points_body.dart` - points screen.
  - `preview_body.dart` - first screen with preview of the main attachment.
  - Folder `requisite_body` - contains all screens for requisites.

- Folder `action_screens` - contains screens for the action button.

- `document_screen.dart` - main document screen.
- `model_document_screen.dart` - model for the document screen, includes fields for initialization and disposal.

## Components
- Folder `attachment` - contains all components and screens for the attachment tab screen, including download screen, select documents for download screen, and viewer for the document screen.

- `action_panel.dart` - action panel in the main document screen to navigate through the tabs.
- `document_action_button.dart` - primary button for actions in the action panel.
- `document_elevated_button.dart` - buttons to navigate through the tabs.

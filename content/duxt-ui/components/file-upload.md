---
title: File Upload
description: A drag-and-drop file upload component with file type and size validation.
layout: ui-layout
order: 34
---

# File Upload

The `DFileUpload` component provides a drag-and-drop file upload area with support for file type restrictions, size limits, and multiple file selection.

## Basic Usage

```dart
DFileUpload(
  label: 'Upload files',
  onChange: (files) {
    for (final file in files) {
      print('${file.name}: ${file.formattedSize}');
    }
  },
)
```

## Sizes

```dart
DFileUpload(size: DFileUploadSize.sm, ...)
DFileUpload(size: DFileUploadSize.md, ...)  // Default
DFileUpload(size: DFileUploadSize.lg, ...)
```

## Colors

```dart
DFileUpload(color: DColor.primary, ...)
DFileUpload(color: DColor.secondary, ...)
DFileUpload(color: DColor.success, ...)
DFileUpload(color: DColor.info, ...)
```

## Accept Specific File Types

```dart
// Images only
DFileUpload(
  label: 'Upload image',
  accept: 'image/*',
  onChange: (files) => {},
)

// Specific image formats
DFileUpload(
  label: 'Upload image',
  accept: '.jpg,.jpeg,.png,.gif',
  onChange: (files) => {},
)

// Documents
DFileUpload(
  label: 'Upload document',
  accept: '.pdf,.doc,.docx',
  onChange: (files) => {},
)

// Multiple types
DFileUpload(
  label: 'Upload media',
  accept: 'image/*,video/*',
  onChange: (files) => {},
)
```

## Multiple Files

```dart
DFileUpload(
  label: 'Upload files',
  multiple: true,
  onChange: (files) => {},
)
```

## Max File Size

```dart
DFileUpload(
  label: 'Upload file',
  maxSize: 5 * 1024 * 1024,  // 5 MB in bytes
  onChange: (files) => {},
)
```

## Max Number of Files

```dart
DFileUpload(
  label: 'Upload files',
  multiple: true,
  maxFiles: 5,
  onChange: (files) => {},
)
```

## Custom Text

```dart
DFileUpload(
  label: 'Upload profile picture',
  dropzoneText: 'Drag your photo here or ',
  browseText: 'click to browse',
  onChange: (files) => {},
)
```

## Custom Icon

```dart
DFileUpload(
  label: 'Upload files',
  icon: DIcon(name: 'image', size: 40),
  onChange: (files) => {},
)
```

## With Hint

```dart
DFileUpload(
  label: 'Upload resume',
  accept: '.pdf,.doc,.docx',
  maxSize: 10 * 1024 * 1024,
  hint: 'PDF or Word documents up to 10MB',
  onChange: (files) => {},
)
```

## With Error

```dart
DFileUpload(
  label: 'Upload file',
  error: 'File size exceeds the maximum limit',
  onChange: (files) => {},
)
```

## Required

```dart
DFileUpload(
  label: 'Upload document',
  required: true,
  onChange: (files) => {},
)
```

## Disabled

```dart
DFileUpload(
  label: 'Upload disabled',
  disabled: true,
)
```

## Profile Picture Upload Example

```dart
class ProfilePictureUpload extends StatefulComponent {
  @override
  State createState() => _ProfilePictureUploadState();
}

class _ProfilePictureUploadState extends State<ProfilePictureUpload> {
  DUploadedFile? uploadedFile;
  String? error;

  void handleUpload(List<DUploadedFile> files) {
    if (files.isEmpty) return;

    final file = files.first;

    // Validate file type
    if (!file.type.startsWith('image/')) {
      setState(() => error = 'Please upload an image file');
      return;
    }

    // Validate file size (max 2MB)
    if (file.size > 2 * 1024 * 1024) {
      setState(() => error = 'Image must be less than 2MB');
      return;
    }

    setState(() {
      uploadedFile = file;
      error = null;
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DFileUpload(
      label: 'Profile picture',
      accept: 'image/*',
      maxSize: 2 * 1024 * 1024,
      error: error,
      hint: 'JPG, PNG or GIF. Max 2MB.',
      dropzoneText: 'Drop your photo here or ',
      browseText: 'browse',
      onChange: handleUpload,
    );

    if (uploadedFile != null) {
      yield div(classes: 'mt-4', [
        DAlert(
          color: DColor.success,
          variant: DAlertVariant.soft,
          title: 'File uploaded',
          description: '${uploadedFile!.name} (${uploadedFile!.formattedSize})',
        ),
      ]);
    }
  }
}
```

## Document Upload Form Example

```dart
DCard(
  header: [h3([text('Submit Application')])],
  body: [
    div(classes: 'space-y-4', [
      DInput(label: 'Full Name', required: true),
      DInput(label: 'Email', type: InputType.email, required: true),

      DFileUpload(
        label: 'Resume',
        name: 'resume',
        accept: '.pdf,.doc,.docx',
        maxSize: 5 * 1024 * 1024,
        required: true,
        hint: 'PDF or Word document, max 5MB',
        onChange: (files) => {},
      ),

      DFileUpload(
        label: 'Supporting documents',
        name: 'documents',
        accept: '.pdf,.doc,.docx,.jpg,.png',
        multiple: true,
        maxFiles: 5,
        maxSize: 10 * 1024 * 1024,
        hint: 'Up to 5 files, max 10MB each',
        onChange: (files) => {},
      ),
    ]),
  ],
  footer: [
    DButton(label: 'Submit Application', block: true),
  ],
)
```

## DUploadedFile Object

The `onChange` callback receives a list of `DUploadedFile` objects with the following properties:

```dart
class DUploadedFile {
  final String name;       // File name
  final int size;          // Size in bytes
  final String type;       // MIME type

  String get formattedSize; // Human-readable size (e.g., "1.5 MB")
}
```

## Dark Mode Support

`DFileUpload` automatically adapts to dark mode:
- Dropzone backgrounds adjust for proper contrast
- Border colors are optimized for dark backgrounds
- File list items have appropriate styling
- Drag-over state is visible in both modes

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Upload field label |
| `name` | `String?` | `null` | Form input name |
| `accept` | `String?` | `null` | Accepted file types |
| `multiple` | `bool` | `false` | Allow multiple files |
| `disabled` | `bool` | `false` | Disable upload |
| `required` | `bool` | `false` | Mark as required |
| `size` | `DFileUploadSize` | `md` | Dropzone size |
| `color` | `DColor` | `primary` | Accent color |
| `hint` | `String?` | `null` | Hint text |
| `error` | `String?` | `null` | Error message |
| `maxSize` | `int?` | `null` | Max file size in bytes |
| `maxFiles` | `int?` | `null` | Max number of files |
| `icon` | `Component?` | `null` | Custom icon |
| `dropzoneText` | `String?` | `null` | Custom dropzone text |
| `browseText` | `String?` | `null` | Custom browse link text |
| `onChange` | `ValueChanged<List<DUploadedFile>>?` | `null` | Upload callback |

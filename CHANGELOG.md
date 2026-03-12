# Change log

## 9.2.1

* Actualize all script files to current stable version

## 9.2.0

### Fixes

* Fixed vulnerability allowing access to system files using native functions
  ([DocumentBuilder#147](https://github.com/ONLYOFFICE/DocumentBuilder/issues/147))

[Full list of changes on the ONLYOFFICE documentation](https://api.onlyoffice.com/docs/office-api/more-information/changelog/#version-92)

## 9.1.0

### No public release

## 9.0.4

[Full list of changes on the ONLYOFFICE documentation](https://api.onlyoffice.com/docs/office-api/more-information/changelog/#version-90)

## 8.3.3

### Fixes

* Fixed `save file error` when running the script on Windows x86
* Fixed reading of license file in some cases

## 8.3.2

### New features

* Providing Python libraries instead of installation packages

### Fixes

* Fixed `NSInvalidArgumentException` error when running the script on macOS
* Fixed `cannot open shared object file` error when running the script on Linux

[Full list of changes on the ONLYOFFICE documentation](https://api.onlyoffice.com/docs/office-api/more-information/changelog/#version-83)

## 8.3.1

### No public release

## 8.3.0

### No public release

## 8.2.0

### New features

#### Security

* Fixed the vulnerability allows using a C++ method if you assign a JavaScript
  object as a property of another object
* Fixed the issue with running a JavaScript method that has been assigned from
  another object

#### Docbuilder

* Major optimizations and speed up calculations (Linux)
* Implemented the method of tracking the cursor position in the document
  and moving to the element
* Implemented the `IsBool()` method for `CDocBuilderValue` in PythonWrapper
* Allow the use of Argument[""] as a parameter for `builder.OpenFile()` and
  `builderJS.OpenFile()`

#### Document editor

* Changing the logic of the Range object: now each new Run object
  in the range adds one unit to the Range instead of calculating
  by the number of characters
* Added the methods for updating objects containing links/hyperlinks
  in the document

#### Spreadsheet editor

* The custom function is now available after reloading the editor page

### Fixes

* Fixed non-informative error when sending a request to the DocumentServer
  with a script in the body
* Fixed the crashing when calling the `ApiRange` `method.Delete`
* Fixed the updating the table of contents when calling `UpdateAllTOC`

[Full list of changes on the ONLYOFFICE documentation](https://api.onlyoffice.com/docs/office-api/more-information/changelog/#version-82)

## 8.1.0

### Security

* Fixed the ability to read data from memory when executing scripts via documentbuilder

### Document editor

* `ApiDateForm` class
* Methods for setting text properties
* Methods for moving a cursor
* RGB color methods
* Added the `nWidth`and `nHeight` parameters to the ApiPictureForm/SetImage method of Text document API.

### Spreadsheet editor

* Expanding the list of Worksheet functions
* Protected range methods
* Reference style methods
* Methods for pasting / cutting ranges
* Custom function

[Full list of changes on the ONLYOFFICE documentation](https://api.onlyoffice.com/docs/office-api/more-information/changelog/#version-81)

## 8.0.0

### Security

* Fixed the ability to add third-party images to a document when executing a script through Document Builder.
* Fixed Heap Buffer Overflow in the "WriteString" method in the "core/DesktopEditor/fontengine/MemoryStream.h" file.
* Fixed the **CZipEmbed::open** and **CZipEmbed::addFile** methods which allow writing data to a file for an arbitrary directory.

### Document editor

* Added the sUserId parameter for methods that add objects to the document.
* Added methods for determining page width and height.
* Added a method for setting Drawing directly through an object of the **ApiDocument** class: **AddDrawingToPage**
* Added methods for easy installation of forms into a document. **SetFormsData**, **GetFormsData**.
* The **ApiBullet** class has been removed. Working with numbered lists is performed through objects of the **ApiNumbering** class.

### Spreadsheet editor

* Added a class and methods for working with the Freeze Panes feature. **ApiFreezePanes**
* Added a class for working with characters in objects containing text. **ApiCharacters**.
* The classes representing interaction with comments and responses to comments have been improved. **ApiComment**, **ApiCommentReply**.

## 7.5.0

### Methods of combo box / dropdown list content control

* Added the **ApiBlockLvlSdt/GetDropdownList** method to Text document API.
* Added the **ApiContentControlList** class to Text document API.
* Added the **ApiContentControlList/Add** method to Text document API.
* etc.

### Watermark methods

* Added the **ApiDocument/GetWatermarkSettings** method to Text document API.
* Added the **ApiDocument/RemoveWatermark method** to Text document API.
* Added the **ApiDocument/SetWatermarkSettings** method to Text document API.
* etc.

### Global

* Added the **SearchData** object to Global type definitions.
* Added the **ReplaceData** object to Global type definitions.

### Slide methods

* Added the ApiSlide/GetVisible method to Presentation API.
* Added the ApiSlide/SetVisible method to Presentation API.

[Full list of changes on the ONLYOFFICE documentation](https://api.onlyoffice.com/docs/office-api/more-information/changelog/#version-75)

## 7.4.0

### Slide methods

* Accessing a cell by index **oWorksheet.GetCells(0, 0);** has been deprecated. `Bug #59741`

* A lot of new methods for different objects.
* More details in the documentation [here](https://api.onlyoffice.com/docs/office-api/more-information/changelog/#version-74)

## 7.3.3

* A lot of new methods for different objects.
  More details in the documentation [here](https://api.onlyoffice.com/docs/office-api/more-information/changelog/#version-73)
* Fix the application vulnerability CVE-2023-30186 with memory exhaustion
  during work with `NativeEngine` function (Bug #60433)

## 7.2.0

### New Features

* Dozens of new methods for different objects.
  More detailed list at [here](https://api.onlyoffice.com/docs/office-api/more-information/changelog/#version-72)

## 7.1.1

### Fixes

* Fix generating PDF with `Api.CreateImage` call with url (Bug #48473)

## 7.1.0

### New Features

* `arm64` linux versions of DocumentBuilder
* Methods to work with Forms

### Changes

* Actualize all script files to current stable version

## 7.0.0

### Changes

* Actualize all script files to current stable version

## 6.4.1

### Changes

* Actualize all script files to current stable version

### Fixes

* Fix removing temp for running non-existing script file (Bug #52097)
* Fix error while using `Range#select()` method (Bug #52684)([DocumentBuilder#65](https://github.com/ONLYOFFICE/DocumentBuilder/issues/65))

## 6.4.0

### Changes

* Actualize all script files to current stable version

## 6.2.0

### Changes

* Actualize all script files to current stable version

## 6.0.0

### Changes

* Actualize all script files to current stable version

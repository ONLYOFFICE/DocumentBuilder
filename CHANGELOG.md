# Change log

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

[Full list of changes on the ONLYOFFICE documentation](https://api.onlyoffice.com/docbuilder/changelog#75)

## 7.4.0

### Slide methods

* Accessing a cell by index **oWorksheet.GetCells(0, 0);** has been deprecated. `Bug #59741`

* A lot of new methods for different objects.
* More details in the documentation [here](https://api.onlyoffice.com/docbuilder/changelog#74)

## 7.3.3

* A lot of new methods for different objects.
  More details in the documentation [here](https://api.onlyoffice.com/docbuilder/changelog#73)
* Fix the application vulnerability CVE-2023-30186 with memory exhaustion
  during work with `NativeEngine` function (Bug #60433)

## 7.2.0

### New Features

* Dozens of new methods for different objects.
  More detailed list at [here](https://api.onlyoffice.com/docbuilder/changelog)

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

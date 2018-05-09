[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

# ooScapeTranslate - Object pascal scape translate
Objects to define a catalog with special scape letters and his representation, used to replace this special letters in any text

### Documentation
If not exists folder "code-documentation" then run the batch "build_doc". The main entry is ./doc/index.html

### Example
```pascal
var
  Text: String;
begin
  ScapeList := TScapeTranslateList.New;
  ScapeList.Add(TScapeTranslate.New(#13, '\r'));
  ScapeList.Add(TScapeTranslate.New(#10, '\n'));
  Text := ScapeList.Apply('Line1' + sLineBreak + 'Line2');
  // Text = 'Line1\r\nLine2'
end;
```
### Demo
See demo folder.

## Built With
* [Delphi&reg;](https://www.embarcadero.com/products/rad-studio) - Embarcadero&trade; commercial IDE
* [Lazarus](https://www.lazarus-ide.org/) - The Lazarus project

## Contribute
This are an open-source project, and they need your help to go on growing and improving.
You can even fork the project on GitHub, maintain your own version and send us pull requests periodically to merge your work.

## Authors
* **Alejandro Polti** (Vencejo Software team lead) - *Initial work*
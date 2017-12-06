{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooScapeTranslate;

interface

uses
  SysUtils;

type
  IScapeTranslate = interface
    ['{D29E1E58-11D9-470F-B621-0932E9524E87}']
    function Translate(const Text: String): String;
  end;

  TScapeTranslate = class sealed(TInterfacedObject, IScapeTranslate)
  strict private
    _Representation: String;
    _SpecialChar: Char;
  public
    function Translate(const Text: String): String;
    constructor Create(const SpecialChar: Char; const Representation: String);
    class function New(const SpecialChar: Char; const Representation: String): IScapeTranslate;
  end;

implementation

function TScapeTranslate.Translate(const Text: String): String;
var
  CurrentChar: Char;
begin
  Result := EmptyStr;
  for CurrentChar in Text do
  begin
    if CompareText(CurrentChar, _SpecialChar) = 0 then
      Result := Result + _Representation
    else
      Result := Result + CurrentChar;
  end;
end;

constructor TScapeTranslate.Create(const SpecialChar: Char; const Representation: String);
begin
  _Representation := Representation;
  _SpecialChar := SpecialChar;
end;

class function TScapeTranslate.New(const SpecialChar: Char; const Representation: String): IScapeTranslate;
begin
  Result := TScapeTranslate.Create(SpecialChar, Representation);
end;

end.

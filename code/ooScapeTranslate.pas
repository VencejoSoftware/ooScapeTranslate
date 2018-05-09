{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Scape translation
  @created(09/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooScapeTranslate;

interface

uses
  SysUtils;

type
{$REGION 'documentation'}
{
  @abstract(Scape translation interface)
  Replaces scape letters with his specific representation
  @member(ScapeLetter Special letter)
  @member(Representation Replacement for scape letter)
  @member(
    Translate Replace scape letters
    @param(Text Text to translate)
    @return(Text with scape replaced)
  )
}
{$ENDREGION}
  IScapeTranslate = interface
    ['{D29E1E58-11D9-470F-B621-0932E9524E87}']
    function Translate(const Text: String): String;
    function ScapeLetter: Char;
    function Representation: String;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IScapeTranslate))
  @member(Translate @seealso(IScapeTranslate.Translate))
  @member(ScapeLetter @seealso(IScapeTranslate.ScapeLetter))
  @member(Representation @seealso(IScapeTranslate.Representation))
  @member(
    IsScapeLetter Checks if the argument letter is a scape letter
    @param(Letter Letter to verify)
    @return(@true if the letter is a scape letter)
  )
  @member(
    Create Object constructor
    @param(ScapeLetter Scape letter to replace)
    @param(Representation Scape representation)
  )
  @member(
    New Create a new @classname as interface
    @param(ScapeLetter Scape letter to replace)
    @param(Representation Scape representation)
  )
}
{$ENDREGION}

  TScapeTranslate = class sealed(TInterfacedObject, IScapeTranslate)
  strict private
    _Representation: String;
    _ScapeLetter: Char;
  private
    function IsScapeLetter(const Letter: Char): Boolean;
  public
    function Translate(const Text: String): String;
    function ScapeLetter: Char;
    function Representation: String;
    constructor Create(const ScapeLetter: Char; const Representation: String);
    class function New(const ScapeLetter: Char; const Representation: String): IScapeTranslate;
  end;

implementation

function TScapeTranslate.ScapeLetter: Char;
begin
  Result := _ScapeLetter;
end;

function TScapeTranslate.Representation: String;
begin
  Result := _Representation;
end;

function TScapeTranslate.IsScapeLetter(const Letter: Char): Boolean;
begin
  Result := CompareText(Letter, ScapeLetter) = 0;
end;

function TScapeTranslate.Translate(const Text: String): String;
var
  Letter: Char;
begin
  Result := EmptyStr;
  for Letter in Text do
    if IsScapeLetter(Letter) then
      Result := Result + Representation
    else
      Result := Result + Letter;
end;

constructor TScapeTranslate.Create(const ScapeLetter: Char; const Representation: String);
begin
  _Representation := Representation;
  _ScapeLetter := ScapeLetter;
end;

class function TScapeTranslate.New(const ScapeLetter: Char; const Representation: String): IScapeTranslate;
begin
  Result := TScapeTranslate.Create(ScapeLetter, Representation);
end;

end.

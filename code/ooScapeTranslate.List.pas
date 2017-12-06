{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooScapeTranslate.List;

interface

uses
  SysUtils,
  Generics.Collections,
  ooScapeTranslate;

type
  IScapeTranslateList = interface
    ['{A7083A22-DEF8-4287-B474-B54A3C34215A}']
    function Apply(const Text: string): String;
    function Add(const Item: IScapeTranslate): Integer;
  end;

  TScapeTranslateList = class sealed(TInterfacedObject, IScapeTranslateList)
  strict private
  type
    _TScapeList = TList<IScapeTranslate>;
  strict private
    _List: _TScapeList;
  public
    function Apply(const Text: string): String;
    function Add(const Item: IScapeTranslate): Integer;

    constructor Create; virtual;
    destructor Destroy; override;

    class function New: IScapeTranslateList;
  end;

implementation

function TScapeTranslateList.Add(const Item: IScapeTranslate): Integer;
begin
  Result := _List.Add(Item);
end;

function TScapeTranslateList.Apply(const Text: string): String;
var
  ScapeTranslate: IScapeTranslate;
begin
  Result := Text;
  for ScapeTranslate in _List do
    Result := ScapeTranslate.Translate(Result);
end;

constructor TScapeTranslateList.Create;
begin
  _List := _TScapeList.Create;
end;

destructor TScapeTranslateList.Destroy;
begin
  _List.Free;
  inherited;
end;

class function TScapeTranslateList.New: IScapeTranslateList;
begin
  Result := TScapeTranslateList.Create;
end;

end.

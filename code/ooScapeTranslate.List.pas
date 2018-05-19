{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  List of scape translation
  @created(09/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooScapeTranslate.List;

interface

uses
  SysUtils,
  ooList, ooIterableList,
  ooScapeTranslate;

type
{$REGION 'documentation'}
{
  @abstract(List of scape translation interface)
  Defines a list of scape translations to use in texts replacement
  @member(
    Apply Apply all translation defined
    @param(Text Text to translate)
    @return(Text with all translation runned)
  )
  @member(
    Add Add a new scape translation object to the list
    @param(Item Text @link(IScapeTranslate Scape translation object))
    @return(Number with the item index)
  )
}
{$ENDREGION}
  IScapeTranslateList = interface
    ['{A7083A22-DEF8-4287-B474-B54A3C34215A}']
    function Apply(const Text: string): String;
    function Add(const Item: IScapeTranslate): TIntegerIndex;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IScapeTranslateList))
  @member(Apply @seealso(IScapeTranslateList.Apply))
  @member(Add @seealso(IScapeTranslateList.Add))
  @member(
    Create Object constructor
  )
  @member(
    New Create a new @classname as interface
  )
}
{$ENDREGION}

  TScapeTranslateList = class sealed(TInterfacedObject, IScapeTranslateList)
  strict private
    _List: IIterableList<IScapeTranslate>;
  public
    function Apply(const Text: string): String;
    function Add(const Item: IScapeTranslate): TIntegerIndex;
    constructor Create;
    class function New: IScapeTranslateList;
  end;

implementation

function TScapeTranslateList.Add(const Item: IScapeTranslate): TIntegerIndex;
begin
  Result := _List.Add(Item);
end;

function TScapeTranslateList.Apply(const Text: string): String;
var
  Item: IScapeTranslate;
begin
  Result := Text;
  for Item in _List do
    Result := Item.Translate(Result);
end;

constructor TScapeTranslateList.Create;
begin
  _List := TIterableList<IScapeTranslate>.New;
end;

class function TScapeTranslateList.New: IScapeTranslateList;
begin
  Result := TScapeTranslateList.Create;
end;

end.

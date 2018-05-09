{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooScapeTranslate.List_test;

interface

uses
  SysUtils, DateUtils,
  ooScapeTranslate, ooScapeTranslate.List,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TScapeTranslateListTest = class sealed(TTestCase)
  published
    procedure TestApply;
  end;

implementation

function NewCRLFTranslateList: IScapeTranslateList;
begin
  Result := TScapeTranslateList.New;
  Result.Add(TScapeTranslate.New(#13, '\r'));
  Result.Add(TScapeTranslate.New(#10, '\n'));
end;

procedure TScapeTranslateListTest.TestApply;
begin
  CheckEquals(NewCRLFTranslateList.Apply('Line1' + sLineBreak + 'Line2'), 'Line1\r\nLine2');
end;

initialization

RegisterTest(TScapeTranslateListTest {$IFNDEF FPC}.Suite {$ENDIF});

end.

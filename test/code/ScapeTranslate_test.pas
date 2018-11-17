{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ScapeTranslate_test;

interface

uses
  SysUtils, DateUtils,
  ScapeTranslate,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TScapeTranslateTest = class sealed(TTestCase)
  published
    procedure TestCharacter;
  end;

implementation

procedure TScapeTranslateTest.TestCharacter;
var
  ScapeTranslate: IScapeTranslate;
begin
  ScapeTranslate := TScapeTranslate.New('ñ', 'n');
  CheckEquals(ScapeTranslate.Translate('This is a eñe test. Second ñ'), 'This is a ene test. Second n');
end;

initialization

RegisterTest(TScapeTranslateTest {$IFNDEF FPC}.Suite {$ENDIF});

end.

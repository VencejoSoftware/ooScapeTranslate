unit MainForm;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,
  ooScapeTranslate, ooScapeTranslate.List;

type
  TMainForm = class(TForm)
    edText: TMemo;
    btnAdd: TButton;
    edScape: TEdit;
    edRepresentation: TEdit;
    lblItem: TLabel;
    btnApply: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    ScapeList: IScapeTranslateList;
  end;

var
  NewMainForm: TMainForm;

implementation

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}

procedure TMainForm.btnAddClick(Sender: TObject);
begin
  ScapeList.Add(TScapeTranslate.New(edScape.Text[1], edRepresentation.Text));
end;

procedure TMainForm.btnApplyClick(Sender: TObject);
begin
  edText.Lines.Text := ScapeList.Apply(edText.Lines.Text);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  edText.Text := 'Line1' + sLineBreak + 'Line2';
  ScapeList := TScapeTranslateList.New;
  ScapeList.Add(TScapeTranslate.New(#13, '\r'));
  ScapeList.Add(TScapeTranslate.New(#10, '\n'));
end;

end.

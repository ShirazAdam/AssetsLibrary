unit MainUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSAcc, FireDAC.Phys.MSAccDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TAccessForm = class(TForm)
    SearchButton: TButton;
    SearchTermEdit: TEdit;
    SearchLabel: TLabel;
    SearchResultListBox: TListBox;
    ExitButton: TButton;
    FireDacConnection: TFDConnection;
    FireDacQuery: TFDQuery;
    procedure ExitButtonClick(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccessForm: TAccessForm;

implementation

{$R *.fmx}

procedure TAccessForm.ExitButtonClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure TAccessForm.SearchButtonClick(Sender: TObject);
begin
  firedacquery.SQL.Text := 'SELECT * FROM Box WHERE notes like %:searchterm%';
  firedacquery.ParamByName('searchterm').AsString := searchtermedit.Text;
  firedacquery.Open();
  firedacquery.ExecSQL;
  firedacquery.SQL.Clear;
  firedacquery.Close;
end;

end.

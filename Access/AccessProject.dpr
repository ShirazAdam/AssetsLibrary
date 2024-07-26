program AccessProject;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainUnit in 'MainUnit.pas' {AccessForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAccessForm, AccessForm);
  Application.Run;
end.

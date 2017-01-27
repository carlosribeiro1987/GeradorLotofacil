unit untSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, Buttons;

type
  TfrmSobre = class(TForm)
    gbxSobre: TGroupBox;
    lblSobre: TLabel;
    lblLinkGpl: TLabel;
    BitBtn1: TBitBtn;
    procedure gbxSobreClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}



procedure TfrmSobre.BitBtn1Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmSobre.gbxSobreClick(Sender: TObject);
begin
     ShellExecute(Handle,'open','https://www.gnu.org/licenses/gpl-3.0.txt',nil,nil,SW_SHOW);
end;

end.

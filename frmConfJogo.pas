unit frmConfJogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmConferirJogo = class(TForm)
    GroupBox3: TGroupBox;
    lblUltimoSorteio_01: TLabel;
    lblUltimoSorteio_06: TLabel;
    lblUltimoSorteio_02: TLabel;
    lblUltimoSorteio_03: TLabel;
    lblUltimoSorteio_04: TLabel;
    lblUltimoSorteio_05: TLabel;
    lblUltimoSorteio_14: TLabel;
    lblUltimoSorteio_09: TLabel;
    lblUltimoSorteio_11: TLabel;
    lblUltimoSorteio_07: TLabel;
    lblUltimoSorteio_12: TLabel;
    lblUltimoSorteio_10: TLabel;
    lblUltimoSorteio_15: TLabel;
    lblUltimoSorteio_08: TLabel;
    lblUltimoSorteio_13: TLabel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    pnlJogo1: TPanel;
    lblJogo1_01: TLabel;
    lblJogo1_02: TLabel;
    lblJogo1_03: TLabel;
    lblJogo1_05: TLabel;
    lblJogo1_04: TLabel;
    lblJogo1_15: TLabel;
    lblJogo1_07: TLabel;
    lblJogo1_14: TLabel;
    lblJogo1_06: TLabel;
    lblJogo1_10: TLabel;
    lblJogo1_09: TLabel;
    lblJogo1_08: TLabel;
    lblJogo1_12: TLabel;
    lblJogo1_11: TLabel;
    lblJogo1_13: TLabel;
    pnlJogo2: TPanel;
    lblJogo2_01: TLabel;
    lblJogo2_02: TLabel;
    lblJogo2_03: TLabel;
    lblJogo2_05: TLabel;
    lblJogo2_04: TLabel;
    lblJogo2_15: TLabel;
    lblJogo2_07: TLabel;
    lblJogo2_14: TLabel;
    lblJogo2_06: TLabel;
    lblJogo2_10: TLabel;
    lblJogo2_09: TLabel;
    lblJogo2_08: TLabel;
    lblJogo2_12: TLabel;
    lblJogo2_11: TLabel;
    lblJogo2_13: TLabel;
    pnlJogo3: TPanel;
    lblJogo3_01: TLabel;
    lblJogo3_02: TLabel;
    lblJogo3_03: TLabel;
    lblJogo3_05: TLabel;
    lblJogo3_04: TLabel;
    lblJogo3_15: TLabel;
    lblJogo3_07: TLabel;
    lblJogo3_14: TLabel;
    lblJogo3_06: TLabel;
    lblJogo3_10: TLabel;
    lblJogo3_09: TLabel;
    lblJogo3_08: TLabel;
    lblJogo3_12: TLabel;
    lblJogo3_11: TLabel;
    lblJogo3_13: TLabel;
    pnlJogo4: TPanel;
    lblJogo4_01: TLabel;
    lblJogo4_02: TLabel;
    lblJogo4_03: TLabel;
    lblJogo4_05: TLabel;
    lblJogo4_04: TLabel;
    lblJogo4_15: TLabel;
    lblJogo4_07: TLabel;
    lblJogo4_14: TLabel;
    lblJogo4_06: TLabel;
    lblJogo4_10: TLabel;
    lblJogo4_09: TLabel;
    lblJogo4_08: TLabel;
    lblJogo4_12: TLabel;
    lblJogo4_11: TLabel;
    lblJogo4_13: TLabel;
    lblAcertosJg01: TLabel;
    lblAcertosJg02: TLabel;
    lblAcertosJg03: TLabel;
    lblAcertosJg04: TLabel;
    lbxJogo1: TListBox;
    lbxJogo2: TListBox;
    lbxJogo4: TListBox;
    lbxJogo3: TListBox;
    btnFechar: TBitBtn;
    lbxResultado: TListBox;
    procedure btnFecharClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConferirJogo: TfrmConferirJogo;

implementation

{$R *.dfm}

procedure TfrmConferirJogo.btnFecharClick(Sender: TObject);
begin
     Close;
end;

end.

unit frmJgsGerados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Printers, WinSpool;

type
  TfrmJogosGerados = class(TForm)
    GroupBox3: TGroupBox;
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
    btnSalvarJogos: TBitBtn;
    memJogos: TMemo;
    savSalvarJogos: TSaveDialog;
    BitBtn1: TBitBtn;
    btnImprimir: TBitBtn;
    procedure btnSalvarJogosClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure SalvarJogos;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJogosGerados: TfrmJogosGerados;

implementation

uses frmJanelaPrincipal, untImprimeVolante;

{$R *.dfm}

procedure TfrmJogosGerados.BitBtn1Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmJogosGerados.btnImprimirClick(Sender: TObject);
begin
     frmImprimirVolante.Show;
end;

procedure TfrmJogosGerados.btnSalvarJogosClick(Sender: TObject);
begin
     SalvarJogos;
     savSalvarJogos.FileName := FormatDateTime('dd-MM-yyyy', Date)+' ['+FormatDateTime('hh.mm.ss', Time)+']';
     if savSalvarJogos.Execute then
     begin
          memJogos.Lines.SaveToFile(savSalvarJogos.FileName);
     end;
end;

procedure TfrmJogosGerados.SalvarJogos;
var
   i: Integer;
begin
     memJogos.Lines.Clear;

     memJogos.Lines.Text := memJogos.Lines.Text + 'Jogo 01: ';
     for i := 1 to 14 do
     begin
          memJogos.Lines.Text := memJogos.Lines.Text + frmJanPrincipal.Jogo1[i]+'|';
     end;
     memJogos.Lines.Text := memJogos.Lines.Text + frmJanPrincipal.Jogo1[15];
     memJogos.Lines.Text := memJogos.Lines.Text + #13;

     memJogos.Lines.Text := memJogos.Lines.Text + 'Jogo 02: ';
     for i := 1 to 14 do
     begin
          memJogos.Lines.Text := memJogos.Lines.Text + frmJanPrincipal.Jogo2[i]+'|';
     end;
     memJogos.Lines.Text := memJogos.Lines.Text + frmJanPrincipal.Jogo2[15];
     memJogos.Lines.Text := memJogos.Lines.Text + #13;

     memJogos.Lines.Text := memJogos.Lines.Text + 'Jogo 03: ';
     for i := 1 to 14 do
     begin
          memJogos.Lines.Text := memJogos.Lines.Text + frmJanPrincipal.Jogo3[i]+'|';
     end;
     memJogos.Lines.Text := memJogos.Lines.Text + frmJanPrincipal.Jogo3[15];
     memJogos.Lines.Text := memJogos.Lines.Text + #13;

     memJogos.Lines.Text := memJogos.Lines.Text + 'Jogo 04: ';
     for i := 1 to 14 do
     begin
          memJogos.Lines.Text := memJogos.Lines.Text + frmJanPrincipal.Jogo4[i]+'|';
     end;
     memJogos.Lines.Text := memJogos.Lines.Text + frmJanPrincipal.Jogo4[15];
     memJogos.Lines.Text := memJogos.Lines.Text + #13;
end;

end.

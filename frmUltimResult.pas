unit frmUltimResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, pngimage, ExtCtrls;

type
  TfrmUltimoResultado = class(TForm)
    GroupBox1: TGroupBox;
    btnLimpar: TBitBtn;
    btnOK: TBitBtn;
    btnResultado01: TBitBtn;
    btnResultado16: TBitBtn;
    btnResultado08: TBitBtn;
    btnResultado17: TBitBtn;
    btnResultado18: TBitBtn;
    btnResultado13: TBitBtn;
    btnResultado12: TBitBtn;
    btnResultado11: TBitBtn;
    btnResultado07: TBitBtn;
    btnResultado06: TBitBtn;
    btnResultado02: TBitBtn;
    btnResultado03: TBitBtn;
    btnResultado05: TBitBtn;
    btnResultado09: TBitBtn;
    btnResultado04: TBitBtn;
    btnResultado25: TBitBtn;
    btnResultado24: TBitBtn;
    btnResultado23: TBitBtn;
    btnResultado20: TBitBtn;
    btnResultado19: TBitBtn;
    btnResultado14: TBitBtn;
    btnResultado22: TBitBtn;
    btnResultado21: TBitBtn;
    btnResultado15: TBitBtn;
    btnResultado10: TBitBtn;
    Panel1: TPanel;
    Image1: TImage;

    procedure FormCreate(Sender: TObject);

    procedure btnLimparClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnResultado01Click(Sender: TObject);
    procedure btnResultado02Click(Sender: TObject);
    procedure btnResultado03Click(Sender: TObject);
    procedure btnResultado04Click(Sender: TObject);
    procedure btnResultado06Click(Sender: TObject);
    procedure btnResultado07Click(Sender: TObject);
    procedure btnResultado09Click(Sender: TObject);
    procedure btnResultado08Click(Sender: TObject);
    procedure btnResultado10Click(Sender: TObject);
    procedure btnResultado11Click(Sender: TObject);
    procedure btnResultado12Click(Sender: TObject);

    procedure btnResultado14Click(Sender: TObject);
    procedure btnResultado13Click(Sender: TObject);
    procedure btnResultado15Click(Sender: TObject);
    procedure btnResultado17Click(Sender: TObject);
    procedure btnResultado18Click(Sender: TObject);
    procedure btnResultado19Click(Sender: TObject);
    procedure btnResultado20Click(Sender: TObject);
    procedure btnResultado21Click(Sender: TObject);
    procedure btnResultado22Click(Sender: TObject);
    procedure btnResultado23Click(Sender: TObject);
    procedure btnResultado24Click(Sender: TObject);
    procedure btnResultado25Click(Sender: TObject);
    procedure btnResultado05Click(Sender: TObject);
    procedure btnResultado16Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUltimoResultado: TfrmUltimoResultado;
  PosicResult: Integer;
  UltimResult: array[1..15] of String;
  Aux: String;


implementation

uses frmJanelaPrincipal, frmConfJogo, untImprimeVolante;

{$R *.dfm}

procedure TfrmUltimoResultado.BitBtn1Click(Sender: TObject);
begin
     frmImprimirVolante.Show;
end;

procedure TfrmUltimoResultado.btnLimparClick(Sender: TObject);
var
  i: Integer;
begin
     btnOK.Enabled := False;
     for i := 1 to 15 do
     begin
          
           frmJanPrincipal.UltimoResultado[i] := '';           
     end; 
     if btnResultado01.Enabled = False then
        btnResultado01.Enabled := True;
     if btnResultado02.Enabled = False then
        btnResultado02.Enabled := True;
     if btnResultado03.Enabled = False then
        btnResultado03.Enabled := True; 
     if btnResultado04.Enabled = False then
        btnResultado04.Enabled := True;
     if btnResultado05.Enabled = False then
        btnResultado05.Enabled := True;
     if btnResultado06.Enabled = False then
        btnResultado06.Enabled := True;
     if btnResultado07.Enabled = False then
        btnResultado07.Enabled := True;
     if btnResultado08.Enabled = False then
        btnResultado08.Enabled := True;
     if btnResultado09.Enabled = False then
        btnResultado09.Enabled := True;
     if btnResultado10.Enabled = False then
        btnResultado10.Enabled := True;
     if btnResultado11.Enabled = False then
        btnResultado11.Enabled := True;
     if btnResultado12.Enabled = False then
        btnResultado12.Enabled := True;
     if btnResultado13.Enabled = False then
        btnResultado13.Enabled := True;
     if btnResultado14.Enabled = False then
        btnResultado14.Enabled := True; 
     if btnResultado15.Enabled = False then
        btnResultado15.Enabled := True;
     if btnResultado16.Enabled = False then
        btnResultado16.Enabled := True;
     if btnResultado17.Enabled = False then
        btnResultado17.Enabled := True;
     if btnResultado18.Enabled = False then
        btnResultado18.Enabled := True;
     if btnResultado19.Enabled = False then
        btnResultado19.Enabled := True;
     if btnResultado20.Enabled = False then
        btnResultado20.Enabled := True;
     if btnResultado21.Enabled = False then
        btnResultado21.Enabled := True;
     if btnResultado22.Enabled = False then
        btnResultado22.Enabled := True;
     if btnResultado23.Enabled = False then
        btnResultado23.Enabled := True;
     if btnResultado24.Enabled = False then
        btnResultado24.Enabled := True;
     if btnResultado25.Enabled = False then
        btnResultado25.Enabled := True;

     PosicResult := 1;
     
end;

procedure TfrmUltimoResultado.btnOKClick(Sender: TObject);
var
  i, j: Integer;
begin

     if frmJanPrincipal.UltimoResultado[15] = '' then
     begin
          MessageDlg('Resultado não armazenado!'+#13+'Marque os 15 números para continuar!', mtInformation, [mbOK], 0);
     end
     else
     begin

          for i := 1 to 15 do
          begin
               for j := (i + 1) to 15 do
               begin
                    if (StrToInt(frmJanPrincipal.UltimoResultado[i]) > StrToInt(frmJanPrincipal.UltimoResultado[j])) then
                    begin
                         Aux := frmJanPrincipal.UltimoResultado[i];
                         frmJanPrincipal.UltimoResultado[i] := frmJanPrincipal.UltimoResultado[j];
                         frmJanPrincipal.UltimoResultado[j] := Aux;
                    end;
               end;
          end;
          frmJanPrincipal.lblUltimoSorteio_01.Caption := frmJanPrincipal.UltimoResultado[1];
          frmJanPrincipal.lblUltimoSorteio_02.Caption := frmJanPrincipal.UltimoResultado[2];
          frmJanPrincipal.lblUltimoSorteio_03.Caption := frmJanPrincipal.UltimoResultado[3];
          frmJanPrincipal.lblUltimoSorteio_04.Caption := frmJanPrincipal.UltimoResultado[4];
          frmJanPrincipal.lblUltimoSorteio_05.Caption := frmJanPrincipal.UltimoResultado[5];
          frmJanPrincipal.lblUltimoSorteio_06.Caption := frmJanPrincipal.UltimoResultado[6];
          frmJanPrincipal.lblUltimoSorteio_07.Caption := frmJanPrincipal.UltimoResultado[7];
          frmJanPrincipal.lblUltimoSorteio_08.Caption := frmJanPrincipal.UltimoResultado[8];
          frmJanPrincipal.lblUltimoSorteio_09.Caption := frmJanPrincipal.UltimoResultado[9];
          frmJanPrincipal.lblUltimoSorteio_10.Caption := frmJanPrincipal.UltimoResultado[10];
          frmJanPrincipal.lblUltimoSorteio_11.Caption := frmJanPrincipal.UltimoResultado[11];
          frmJanPrincipal.lblUltimoSorteio_12.Caption := frmJanPrincipal.UltimoResultado[12];
          frmJanPrincipal.lblUltimoSorteio_13.Caption := frmJanPrincipal.UltimoResultado[13];
          frmJanPrincipal.lblUltimoSorteio_14.Caption := frmJanPrincipal.UltimoResultado[14];
          frmJanPrincipal.lblUltimoSorteio_15.Caption := frmJanPrincipal.UltimoResultado[15];

          frmConferirJogo.lblUltimoSorteio_01.Caption := frmJanPrincipal.UltimoResultado[1];
          frmConferirJogo.lblUltimoSorteio_02.Caption := frmJanPrincipal.UltimoResultado[2];
          frmConferirJogo.lblUltimoSorteio_03.Caption := frmJanPrincipal.UltimoResultado[3];
          frmConferirJogo.lblUltimoSorteio_04.Caption := frmJanPrincipal.UltimoResultado[4];
          frmConferirJogo.lblUltimoSorteio_05.Caption := frmJanPrincipal.UltimoResultado[5];
          frmConferirJogo.lblUltimoSorteio_06.Caption := frmJanPrincipal.UltimoResultado[6];
          frmConferirJogo.lblUltimoSorteio_07.Caption := frmJanPrincipal.UltimoResultado[7];
          frmConferirJogo.lblUltimoSorteio_08.Caption := frmJanPrincipal.UltimoResultado[8];
          frmConferirJogo.lblUltimoSorteio_09.Caption := frmJanPrincipal.UltimoResultado[9];
          frmConferirJogo.lblUltimoSorteio_10.Caption := frmJanPrincipal.UltimoResultado[10];
          frmConferirJogo.lblUltimoSorteio_11.Caption := frmJanPrincipal.UltimoResultado[11];
          frmConferirJogo.lblUltimoSorteio_12.Caption := frmJanPrincipal.UltimoResultado[12];
          frmConferirJogo.lblUltimoSorteio_13.Caption := frmJanPrincipal.UltimoResultado[13];
          frmConferirJogo.lblUltimoSorteio_14.Caption := frmJanPrincipal.UltimoResultado[14];
          frmConferirJogo.lblUltimoSorteio_15.Caption := frmJanPrincipal.UltimoResultado[15];

          

          //Nao Sorteados
          i := 1;
          if btnResultado01.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado01.Caption;
               i := i + 1;
          end;

          if btnResultado02.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado02.Caption;
               i := i + 1;
          end;

          if btnResultado03.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado03.Caption;
               i := i + 1;
          end;

          if btnResultado04.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado04.Caption;
               i := i + 1;
          end;

          if btnResultado05.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado05.Caption;
               i := i + 1;
          end;

          if btnResultado06.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado06.Caption;
               i := i + 1;
          end;

          if btnResultado07.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado07.Caption;
               i := i + 1;
          end;

          if btnResultado08.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado08.Caption;
               i := i + 1;
          end;

          if btnResultado09.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado09.Caption;
               i := i + 1;
          end;

          if btnResultado10.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado10.Caption;
               i := i + 1;
          end;

          if btnResultado11.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado11.Caption;
               i := i + 1;
          end;

          if btnResultado12.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado12.Caption;
               i := i + 1;
          end;


          if btnResultado13.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado13.Caption;
               i := i + 1;
          end;

          if btnResultado14.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado14.Caption;
               i := i + 1;
          end;

          if btnResultado15.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado15.Caption;
               i := i + 1;
          end;

          if btnResultado16.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado16.Caption;
               i := i + 1;
          end;

          if btnResultado17.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado17.Caption;
               i := i + 1;
          end;

          if btnResultado18.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado18.Caption;
               i := i + 1;
          end;

          if btnResultado19.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado19.Caption;
               i := i + 1;
          end;

          if btnResultado20.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado20.Caption;
               i := i + 1;
          end;

          if btnResultado21.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado21.Caption;
               i := i + 1;
          end;

          if btnResultado22.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado22.Caption;
               i := i + 1;
          end;

          if btnResultado23.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado23.Caption;
               i := i + 1;
          end;

          if btnResultado24.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado24.Caption;
               i := i + 1;
          end;

          if btnResultado25.Enabled then
          begin
               frmJanPrincipal.NaoSorteados[i] := btnResultado25.Caption;
               i := i + 1;
          end;
          
          frmJanPrincipal.Show;
          Close;

          
     end;
end;
procedure TfrmUltimoResultado.btnResultado01Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado01.Caption;
          btnResultado01.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
     
end;
procedure TfrmUltimoResultado.btnResultado02Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado02.Caption;
          btnResultado02.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;   
procedure TfrmUltimoResultado.btnResultado03Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado03.Caption;
          btnResultado03.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;

     PosicResult := PosicResult + 1;
end;
procedure TfrmUltimoResultado.btnResultado04Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado04.Caption;
          btnResultado04.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;   
procedure TfrmUltimoResultado.btnResultado05Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado05.Caption;
          btnResultado05.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado06Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado06.Caption;
          btnResultado06.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado07Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado07.Caption;
          btnResultado07.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado08Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado08.Caption;
          btnResultado08.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado09Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado09.Caption;
          btnResultado09.Enabled := False;     
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado10Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado10.Caption;
          btnResultado10.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado11Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado11.Caption;
          btnResultado11.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado12Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado12.Caption;
          btnResultado12.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado13Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado13.Caption;
          btnResultado13.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado14Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado14.Caption;
          btnResultado14.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;
procedure TfrmUltimoResultado.btnResultado15Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado15.Caption;
          btnResultado15.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado17Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado17.Caption;
          btnResultado17.Enabled := False;     
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado18Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado18.Caption;
          btnResultado18.Enabled := False;     
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado19Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado19.Caption;
          btnResultado19.Enabled := False;     
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado20Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado20.Caption;
          btnResultado20.Enabled := False;     
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado21Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado21.Caption;
          btnResultado21.Enabled := False;     
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado22Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado22.Caption;
          btnResultado22.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado23Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado23.Caption;
          btnResultado23.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado24Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado24.Caption;
          btnResultado24.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.btnResultado25Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          if PosicResult = 15 then
             btnOK.Enabled := True;
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado25.Caption;
          btnResultado25.Enabled := False;
     end
     else
     begin
         btnOK.Enabled := True;
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     end;
     PosicResult := PosicResult + 1;
end;

procedure TfrmUltimoResultado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if frmJanPrincipal.UltimoResultado[15] = '' then
        Application.Terminate;
end;

procedure TfrmUltimoResultado.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := False;
     frmUltimoResultado.Hide;
     if frmJanPrincipal.UltimoResultado[15] = '' then
        Application.Terminate;
end;

procedure TfrmUltimoResultado.FormCreate(Sender: TObject);
begin
     PosicResult := 1;
     frmUltimoResultado.Show;

end;

procedure TfrmUltimoResultado.btnResultado16Click(Sender: TObject);
begin
     if PosicResult <= 15 then
     begin
          frmJanPrincipal.UltimoResultado[PosicResult] := btnResultado16.Caption;
          btnResultado16.Enabled := False;     
end
     else
         MessageDlg('Os 15 números já foram adicionados.', mtInformation, [mbOK], 0);
     PosicResult := PosicResult + 1;
end;

end.

unit untImprimeVolante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Printers, TBPRN, ExtCtrls, StdCtrls, Buttons, jpeg, Spin, Mask,
  pngimage;

type
  TfrmImprimirVolante = class(TForm)
    btnImprimirVolantes: TBitBtn;
    gbxMargensVolante: TGroupBox;
    gbxTamanhoVolante: TGroupBox;
    spnAltura: TSpinEdit;
    spnLargura: TSpinEdit;
    imgAltLarg: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Image1: TImage;
    pnlMrgEsquerda: TPanel;
    Label1: TLabel;
    spnMrgEsquerda: TSpinEdit;
    pnlQtdNumeros: TPanel;
    Label3: TLabel;
    spnQtdNumeros: TSpinEdit;
    pnlMrgSuperiorJg2: TPanel;
    Label2: TLabel;
    spnSuperiorJg2: TSpinEdit;
    pnlMrgSuperiorJg1: TPanel;
    Label4: TLabel;
    spnMrgSuperiorJg1: TSpinEdit;
    btnFechar: TBitBtn;

    procedure SetPrinterPage(Width, Height : LongInt);
    procedure ImpressaoVolantes;
    procedure btnImprimirVolantesClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImprimirVolante: TfrmImprimirVolante;
  DataImpressao: TDate;
  HoraImpressao: TTime;

implementation

uses frmJanelaPrincipal, frmJgsGerados;

{$R *.dfm}

function MMtoPixelX (MM : Real) : Longint;
var
   mmPointX : Real;
   PageSize, OffSetUL : TPoint;
begin
     mmPointX := Printer.PageWidth / GetDeviceCaps(Printer.Handle,HORZSIZE);
     Escape (Printer.Handle,GETPRINTINGOFFSET,0,nil,@OffSetUL);
     Escape (Printer.Handle,GETPHYSPAGESIZE,0,nil,@PageSize);
     if MM > 0 then
        Result := round ((MM * mmPointX) - OffSetUL.X)
     else
         Result := round (MM * mmPointX);
end;

function MMtoPixelY (MM : Real) : Longint;
var
   mmPointY : Real;
   PageSize, OffSetUL : TPoint;
begin
     mmPointY := Printer.PageHeight /
     GetDeviceCaps(Printer.Handle,VERTSIZE);
     Escape(Printer.Handle,GETPRINTINGOFFSET,0,nil,@OffSetUL);
     Escape(Printer.Handle,GETPHYSPAGESIZE,0,nil,@PageSize);
     if MM > 0 then
        Result := round ((MM * mmPointY) - OffSetUL.Y)
     else
         Result := round (MM * mmPointY);
end;
(******************************************************************************)
(******************************************************************************)
(******************************************************************************)
(******************************************************************************)

procedure TfrmImprimirVolante.SetPrinterPage(Width, Height : LongInt);
var
  Device : array[0..255] of char;
  Driver : array[0..255] of char;
  Port : array[0..255] of char;
  hDMode : THandle;
  PDMode : PDEVMODE;
begin
  Printer.GetPrinter(Device, Driver, Port, hDMode);
  If hDMode <> 0 then
  begin
  pDMode := GlobalLock( hDMode );
  If pDMode <> nil then
  begin
  pDMode^.dmPaperSize := DMPAPER_USER;
  pDMode^.dmPaperWidth := Width;
  pDMode^.dmPaperLength := Height;
  pDMode^.dmFields := pDMode^.dmFields or DM_PAPERSIZE;
  GlobalUnlock( hDMode );
  end;
  end;
end;

procedure TfrmImprimirVolante.btnFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmImprimirVolante.btnImprimirVolantesClick(Sender: TObject);
begin
     DataImpressao := Date;
     HoraImpressao := Time;
     frmJogosGerados.SalvarJogos;
     if not DirectoryExists(ExtractFileDir(Application.ExeName)+'\Jogos Impressos\') then
        ForceDirectories(ExtractFileDir(Application.ExeName)+'\Jogos Impressos\');

     frmJogosGerados.memJogos.Lines.SaveToFile(ExtractFileDir(Application.ExeName)+'\Jogos Impressos\'+ FormatDateTime('dd-MM-yyyy', DataImpressao)+' ['+ FormatDateTime('hh.mm.ss', HoraImpressao)+'].ltf');
     ImpressaoVolantes;
end;

procedure TfrmImprimirVolante.FormCreate(Sender: TObject);
begin
     Application.HintPause := 800;
     Application.HintHidePause := 5000;

     pnlMrgEsquerda.Hint := 'Distância da borda esquerda do volante até' +#13+
                            'a borda esquerda da primeira coluna de números dos jogos.';
     pnlMrgSuperiorJg1.Hint := 'Distância da borda superior do volante'+#13+
                               'até a borda superior da primeira fileira'+#13+
                               'de números do primeiro jogo';
     pnlMrgSuperiorJg2.Hint := 'Distância da borda superior do volante'+#13+
                               'até a borda superior da primeira fileira'+#13+
                               'de números do segundo jogo';
     pnlQtdNumeros.Hint := 'Distância da borda superior do volante até a borda superior'+#13+
                           'da fileira de quantidade de números marcados.';

end;

procedure TfrmImprimirVolante.ImpressaoVolantes;
var
   Altura, Largura, MargemEsquerda, MargemSuperior01, MargemSuperior02, MargemQtdeNumeros, i: Integer;

begin
     Altura := spnAltura.Value;
     Largura := spnLargura.Value;
     MargemEsquerda := spnMrgEsquerda.Value;
     MargemSuperior01 := spnMrgSuperiorJg1.Value;
     MargemSuperior02 := spnSuperiorJg2.Value;
     MargemQtdeNumeros := spnQtdNumeros.Value;


     with Printer do
     begin
          Orientation := poPortrait;
          SetPrinterPage(Largura, Altura);

          BeginDoc;
          Canvas.Pen.Color := clBlack;
          Canvas.Pen.Width := 5;
          Canvas.Font.Name := 'Arial';
          Canvas.Font.Size := 9;

          Canvas.TextOut(MMtoPixelX(MargemEsquerda), MMtoPixelY(10), 'JOGOS 1 E 2');
          Canvas.TextOut(MMtoPixelX(MargemEsquerda), MMtoPixelY(13), 'Gerados em: '+frmJanPrincipal.DataJogoGerado + ' - ' + frmJanPrincipal.HoraJogoGerado);
          Canvas.TextOut(MMtoPixelX(MargemEsquerda), MMtoPixelY(16), 'Impresso em: '+FormatDateTime('dd/MM/yyyy',DataImpressao)+ ' - ' + FormatDateTime('hh:mm:ss', HoraImpressao));

          Canvas.Brush.Color := clBlack;

(****************************************************************************)
(***********************   JOGO  1    ***************************************)
(****************************************************************************)
          for i := 1 to 15 do
          begin
               case StrToInt(frmJanPrincipal.Jogo1[i]) of

               //1ª LINHA
                   21:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior01), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior01 + 3));
                   end;
                   16:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior01), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior01 + 3));
                   end;
                   11:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior01), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior01 + 3));
                   end;
                   6:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior01), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior01 + 3));
                   end;
                   1:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior01), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior01 + 3));
                   end;

                   //2ª LINHA
                   22:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior01 + 4.5), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior01 + 7.5));
                   end;
                   17:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior01 + 4.5), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior01 + 7.5));
                   end;
                   12:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior01 + 4.5), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior01 + 7.5));
                   end;
                   7:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior01 + 4.5), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior01 + 7.5));
                   end;
                   2:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior01 + 4.5), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior01 + 7.5));
                   end;

                   //3ª LINHA
                   23:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior01 + 9), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior01 + 12));
                   end;
                   18:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior01 + 9), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior01 + 12));
                   end;
                   13:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior01 + 9), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior01 + 12));
                   end;
                   8:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior01 + 9), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior01 + 12));
                   end;
                   3:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior01 + 9), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior01 + 12));
                   end;

                   //4ª LINHA
                   24:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior01 + 13.5), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior01 + 16.5));
                   end;
                   19:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior01 + 13.5), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior01 + 16.5));
                   end;
                   14:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior01 + 13.5), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior01 + 16.5));
                   end;
                   9:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior01 + 13.5), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior01 + 16.5));
                   end;
                   4:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior01 + 13.5), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior01 + 16.5));
                   end;

                   //5ª LINHA
                   25:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior01 + 18), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior01 + 21));
                   end;
                   20:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior01 + 18), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior01 + 21));
                   end;
                   15:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior01 + 18), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior01 + 21));
                   end;
                   10:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior01 + 18), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior01 + 21));
                   end;
                   5:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior01 + 18), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior01 + 21));
                   end;
               end;
          end;

(****************************************************************************)
(***********************   JOGO  2    ***************************************)
(****************************************************************************)


          for i := 1 to 15 do
          begin
               case StrToInt(frmJanPrincipal.Jogo2[i]) of

               //1ª LINHA
                   21:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior02), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior02 + 3));
                   end;
                   16:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior02), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior02 + 3));
                   end;
                   11:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior02), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior02 + 3));
                   end;
                   6:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior02), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior02 + 3));
                   end;
                   1:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior02), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior02 + 3));
                   end;

                   //2ª LINHA
                   22:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior02 + 4.5), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior02 + 7.5));
                   end;
                   17:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior02 + 4.5), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior02 + 7.5));
                   end;
                   12:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior02 + 4.5), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior02 + 7.5));
                   end;
                   7:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior02 + 4.5), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior02 + 7.5));
                   end;
                   2:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior02 + 4.5), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior02 + 8));
                   end;

                   //3ª LINHA
                   23:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior02 + 9), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior02 + 12));
                   end;
                   18:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior02 + 9), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior02 + 12));
                   end;
                   13:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior02 + 9), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior02 + 12));
                   end;
                   8:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior02 + 9), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior02 + 12));
                   end;
                   3:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior02 + 9), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior02 + 12));
                   end;

                   //4ª LINHA
                   24:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior02 + 13.5), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior02 + 16.5));
                   end;
                   19:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior02 + 13.5), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior02 + 16.5));
                   end;
                   14:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior02 + 13.5), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior02 + 16.5));
                   end;
                   9:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior02 + 13.5), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior02 + 16.5));
                   end;
                   4:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior02 + 13.5), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior02 + 16.5));
                   end;

                   //5ª LINHA
                   25:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior02 + 18), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior02 + 21));
                   end;
                   20:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior02 + 18), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior02 + 21));
                   end;
                   15:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior02 + 18), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior02 + 21));
                   end;
                   10:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior02 + 18), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior02 + 21));
                   end;
                   5:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior02 + 18), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior02 + 21));
                   end;
               end;
          end;

          Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemQtdeNumeros), MMtoPixelX(MargemEsquerda + 3), MMtoPixelY(MargemQtdeNumeros + 2));
          Canvas.Brush.Style := bsClear;

          EndDoc;
     end;

     Sleep(1000);

     with Printer do
     begin
          Orientation := poPortrait;
          SetPrinterPage(Largura, Altura);

          BeginDoc;
          Canvas.Pen.Color := clBlack;
          Canvas.Pen.Width := 5;

          Canvas.Font.Name := 'Arial';
          Canvas.Font.Size := 9;

          Canvas.TextOut(MMtoPixelX(MargemEsquerda), MMtoPixelY(10), 'JOGOS 3 E 4');
          Canvas.TextOut(MMtoPixelX(MargemEsquerda), MMtoPixelY(13), 'Gerados em: '+frmJanPrincipal.DataJogoGerado + ' - ' + frmJanPrincipal.HoraJogoGerado);
          Canvas.TextOut(MMtoPixelX(MargemEsquerda), MMtoPixelY(16), 'Impresso em: '+FormatDateTime('dd/MM/yyyy',DataImpressao)+ ' - ' + FormatDateTime('hh:mm:ss', HoraImpressao));

          Canvas.Brush.Color := clBlack;

(****************************************************************************)
(***********************   JOGO  3    ***************************************)
(****************************************************************************)
          for i := 1 to 15 do
          begin
               case StrToInt(frmJanPrincipal.Jogo3[i]) of

               //1ª LINHA
                   21:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior01), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior01 + 3));
                   end;
                   16:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior01), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior01 + 3));
                   end;
                   11:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior01), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior01 + 3));
                   end;
                   6:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior01), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior01 + 3));
                   end;
                   1:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior01), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior01 + 3));
                   end;

                   //2ª LINHA
                   22:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior01 + 4.5), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior01 + 7.5));
                   end;
                   17:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior01 + 4.5), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior01 + 7.5));
                   end;
                   12:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior01 + 4.5), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior01 + 7.5));
                   end;
                   7:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior01 + 4.5), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior01 + 7.5));
                   end;
                   2:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior01 + 4.5), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior01 + 7.5));
                   end;

                   //3ª LINHA
                   23:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior01 + 9), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior01 + 12));
                   end;
                   18:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior01 + 9), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior01 + 12));
                   end;
                   13:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior01 + 9), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior01 + 12));
                   end;
                   8:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior01 + 9), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior01 + 12));
                   end;
                   3:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior01 + 9), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior01 + 12));
                   end;

                   //4ª LINHA
                   24:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior01 + 13.5), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior01 + 16.5));
                   end;
                   19:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior01 + 13.5), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior01 + 16.5));
                   end;
                   14:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior01 + 13.5), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior01 + 16.5));
                   end;
                   9:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior01 + 13.5), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior01 + 16.5));
                   end;
                   4:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior01 + 13.5), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior01 + 16.5));
                   end;

                   //5ª LINHA
                   25:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior01 + 18), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior01 + 21));
                   end;
                   20:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior01 + 18), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior01 + 21));
                   end;
                   15:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior01 + 18), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior01 + 21));
                   end;
                   10:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior01 + 18), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior01 + 21));
                   end;
                   5:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior01 + 18), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior01 + 21));
                   end;
               end;
          end;

(****************************************************************************)
(***********************   JOGO  4    ***************************************)
(****************************************************************************)
          for i := 1 to 15 do
          begin
               case StrToInt(frmJanPrincipal.Jogo4[i]) of

               //1ª LINHA
                   21:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior02), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior02 + 3));
                   end;
                   16:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior02), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior02 + 3));
                   end;
                   11:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior02), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior02 + 3));
                   end;
                   6:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior02), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior02 + 3));
                   end;
                   1:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior02), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior02 + 3));
                   end;

                   //2ª LINHA
                   22:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior02 + 4.5), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior02 + 7.5));
                   end;
                   17:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior02 + 4.5), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior02 + 7.5));
                   end;
                   12:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior02 + 4.5), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior02 + 7.5));
                   end;
                   7:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior02 + 4.5), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior02 + 7.5));
                   end;
                   2:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior02 + 4.5), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior02 + 7.5));
                   end;

                   //3ª LINHA
                   23:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior02 + 9), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior02 + 12));
                   end;
                   18:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior02 + 9), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior02 + 12));
                   end;
                   13:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior02 + 9), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior02 + 12));
                   end;
                   8:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior02 + 9), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior02 + 12));
                   end;
                   3:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior02 + 9), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior02 + 12));
                   end;

                   //4ª LINHA
                   24:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior02 + 13.5), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior02 + 16.5));
                   end;
                   19:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior02 + 13.5), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior02 + 16.5));
                   end;
                   14:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior02 + 13.5), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior02 + 16.5));
                   end;
                   9:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior02 + 13.5), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior02 + 16.5));
                   end;
                   4:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior02 + 13.5), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior02 + 16.5));
                   end;

                   //5ª LINHA
                   25:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemSuperior02 + 18), MMtoPixelX(MargemEsquerda + 4.5), MMtoPixelY(MargemSuperior02 + 21));
                   end;
                   20:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 12.5), MMtoPixelY(MargemSuperior02 + 18), MMtoPixelX(MargemEsquerda + 17), MMtoPixelY(MargemSuperior02 + 21));
                   end;
                   15:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 25.2), MMtoPixelY(MargemSuperior02 + 18), MMtoPixelX(MargemEsquerda + 30), MMtoPixelY(MargemSuperior02 + 21));
                   end;
                   10:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 38.5), MMtoPixelY(MargemSuperior02 + 18), MMtoPixelX(MargemEsquerda + 43), MMtoPixelY(MargemSuperior02 + 21));
                   end;
                   5:
                   begin
                        Canvas.Rectangle(MMtoPixelX(MargemEsquerda + 51), MMtoPixelY(MargemSuperior02 + 18), MMtoPixelX(MargemEsquerda + 55.5), MMtoPixelY(MargemSuperior02 + 21));
                   end;
               end;
          end;
          Canvas.Rectangle(MMtoPixelX(MargemEsquerda), MMtoPixelY(MargemQtdeNumeros), MMtoPixelX(MargemEsquerda + 3), MMtoPixelY(MargemQtdeNumeros + 2));
          Canvas.Brush.Style := bsClear;

          EndDoc;
     end;
end;

end.

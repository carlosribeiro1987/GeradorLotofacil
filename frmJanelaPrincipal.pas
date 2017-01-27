unit frmJanelaPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Math, pngimage;

type
  TfrmJanPrincipal = class(TForm)
    gbxCombinacoes: TGroupBox;
    edtFixas10: TEdit;
    edtFixas09: TEdit;
    edtFixas08: TEdit;
    edtFixas07: TEdit;
    edtFixas06: TEdit;
    edtFixas05: TEdit;
    edtFixas04: TEdit;
    edtFixas03: TEdit;
    edtFixas02: TEdit;
    edtFixas01: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    edtPrim01: TEdit;
    edtPrim02: TEdit;
    edtPrim03: TEdit;
    edtPrim04: TEdit;
    edtPrim05: TEdit;
    Bevel2: TBevel;
    edtTerc01: TEdit;
    edtTerc02: TEdit;
    edtTerc03: TEdit;
    edtTerc04: TEdit;
    edtTerc05: TEdit;
    Bevel4: TBevel;
    gbxNumCombinacoes: TGroupBox;
    btn02: TButton;
    btn03: TButton;
    btn04: TButton;
    btn05: TButton;
    btn01: TButton;
    btn07: TButton;
    btn08: TButton;
    btn09: TButton;
    btn10: TButton;
    btn06: TButton;
    btn12: TButton;
    btn13: TButton;
    btn14: TButton;
    btn15: TButton;
    btn11: TButton;
    btn17: TButton;
    btn18: TButton;
    btn19: TButton;
    btn20: TButton;
    btn16: TButton;
    btn22: TButton;
    btn23: TButton;
    btn24: TButton;
    btn25: TButton;
    btn21: TButton;
    btnGerarJogos: TBitBtn;
    Bevel3: TBevel;
    edtSeg01: TEdit;
    edtSeg02: TEdit;
    edtSeg03: TEdit;
    edtSeg04: TEdit;
    edtSeg05: TEdit;
    gbxUltimoSorteio: TGroupBox;
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
    Panel5: TPanel;
    imgLogo: TImage;
    btnMostrarJogos: TBitBtn;
    gbxTipoCombinacao: TGroupBox;
    rbtAutomatico: TRadioButton;
    rbtManual: TRadioButton;
    pnlLotofacil: TPanel;
    imgLotofacil: TImage;
    btnLimparCombinacoes: TBitBtn;
    btnConfJogos: TBitBtn;
    opnJogoSalvo: TOpenDialog;
    procedure btn01Click(Sender: TObject);
    procedure btn02Click(Sender: TObject);
    procedure btn03Click(Sender: TObject);
    procedure btn04Click(Sender: TObject);
    procedure btn05Click(Sender: TObject);
    procedure btn06Click(Sender: TObject);
    procedure btn07Click(Sender: TObject);
    procedure btn08Click(Sender: TObject);
    procedure btn09Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure btn16Click(Sender: TObject);
    procedure btn17Click(Sender: TObject);
    procedure btn18Click(Sender: TObject);
    procedure btn19Click(Sender: TObject);
    procedure btn20Click(Sender: TObject);
    procedure btn21Click(Sender: TObject);
    procedure btn22Click(Sender: TObject);
    procedure btn23Click(Sender: TObject);
    procedure btn24Click(Sender: TObject);
    procedure btn25Click(Sender: TObject);
    procedure GeraJogos;
    procedure GeraArrays;
    procedure btnGerarJogosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure JogoAleatório;
    procedure ParesImpares;
    procedure AleatórioFixas;
    procedure Aleatorio3Pares2Impares;
    procedure Aleatorio3Impares2Pares;
    procedure AleatorioTerceiraCombinacao;
    procedure btnMostrarJogosClick(Sender: TObject);
    procedure rbtAutomaticoClick(Sender: TObject);
    procedure rbtManualClick(Sender: TObject);
    procedure btnLimparCombinacoesClick(Sender: TObject);
    procedure LimpaBotoes;
    procedure FormShow(Sender: TObject);
    procedure ConferirJogo;
    procedure btnConfJogosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgLogoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    UltimoResultado: array[1..15] of String;
    NaoSorteados: array[1..10] of string;
    Jogo1, Jogo2, Jogo3, Jogo4: array[1..15] of string;
    JogoSalvo, DataJogoGerado, HoraJogoGerado: String;
  end;

var
  frmJanPrincipal: TfrmJanPrincipal;
  DezenasFixas: array[1..10] of String;
  PrimCombinacao: array[1..5] of String;
  SegCombinacao: array[1..5] of String;
  TercCombinacao: array[1..5] of String;
  NumerosClicados: Integer;
  ParesSorteados: array of string;
  ImparesSorteados: array of string;
  ParesNaoSorteados: array of string;
  ImparesNaoSorteados: array of string;

implementation

uses frmUltimResult, frmJgsGerados, frmConfJogo, untSobre;

{$R *.dfm}

procedure TfrmJanPrincipal.ConferirJogo;
var
   Linha, NumJogado: String;
   PosStr, Acertos, VerifNum: Integer;
   ArqJogo: TextFile;
  i: Integer;
begin
      AssignFile(ArqJogo, JogoSalvo);
      Reset(ArqJogo);

      while not Eof(ArqJogo) do
      begin
           Readln(ArqJogo, Linha);
           PosStr := Pos('Jogo 01: ', Linha);
           Delete(Linha, 1, PosStr+8);
           for i := 1 to 14 do
           begin
                PosStr := Pos('|', Linha);
                NumJogado := Copy(Linha, 1, PosStr-1);
                Delete(Linha, 1, PosStr);
                frmConferirJogo.lbxJogo1.Items.Add(NumJogado);
           end;
           NumJogado := Linha;
           frmConferirJogo.lbxJogo1.Items.Add(NumJogado);

           Readln(ArqJogo, Linha);
           PosStr := Pos('Jogo 02: ', Linha);
           Delete(Linha, 1, PosStr+8);
           for i := 1 to 14 do
           begin
                PosStr := Pos('|', Linha);
                NumJogado := Copy(Linha, 1, PosStr-1);
                Delete(Linha, 1, PosStr);
                frmConferirJogo.lbxJogo2.Items.Add(NumJogado);
           end;
           NumJogado := Linha;
           frmConferirJogo.lbxJogo2.Items.Add(NumJogado);
               
           Readln(ArqJogo, Linha);
           PosStr := Pos('Jogo 03: ', Linha);
           Delete(Linha, 1, PosStr+8);
           for i := 1 to 14 do
           begin
                PosStr := Pos('|', Linha);
                NumJogado := Copy(Linha, 1, PosStr-1);
                Delete(Linha, 1, PosStr);
                frmConferirJogo.lbxJogo3.Items.Add(NumJogado);
           end;
           NumJogado := Linha;
           frmConferirJogo.lbxJogo3.Items.Add(NumJogado);

           Readln(ArqJogo, Linha);
           PosStr := Pos('Jogo 04: ', Linha);
           Delete(Linha, 1, PosStr+8);
           for i := 1 to 14 do
           begin
                PosStr := Pos('|', Linha);
                NumJogado := Copy(Linha, 1, PosStr-1);
                Delete(Linha, 1, PosStr);
                frmConferirJogo.lbxJogo4.Items.Add(NumJogado);
           end;
           NumJogado := Linha;
           frmConferirJogo.lbxJogo4.Items.Add(NumJogado);

           for i := 1 to 15 do
               frmConferirJogo.lbxResultado.Items.Add(UltimoResultado[i]);

           /////////////
           Acertos := 0;
           frmConferirJogo.lblJogo1_01.Caption := frmConferirJogo.lbxJogo1.Items[0];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[0]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_01.Color := clLime;
                Acertos := Acertos + 1;
           end;

           frmConferirJogo.lblJogo1_02.Caption := frmConferirJogo.lbxJogo1.Items[1];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[1]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_02.Color := clLime;
                Acertos := Acertos + 1;
           end;
           
           frmConferirJogo.lblJogo1_03.Caption := frmConferirJogo.lbxJogo1.Items[2];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[2]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_03.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo1_04.Caption := frmConferirJogo.lbxJogo1.Items[3];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[3]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_04.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo1_05.Caption := frmConferirJogo.lbxJogo1.Items[4];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[4]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_05.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo1_06.Caption := frmConferirJogo.lbxJogo1.Items[5];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[5]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_06.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo1_07.Caption := frmConferirJogo.lbxJogo1.Items[6];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[6]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_07.Color := clLime;
                Acertos := Acertos + 1;
           end;

           frmConferirJogo.lblJogo1_08.Caption := frmConferirJogo.lbxJogo1.Items[7];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[7]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_08.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo1_09.Caption := frmConferirJogo.lbxJogo1.Items[8];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[8]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_09.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo1_10.Caption := frmConferirJogo.lbxJogo1.Items[9];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[9]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_10.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo1_11.Caption := frmConferirJogo.lbxJogo1.Items[10];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[10]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_11.Color := clLime;
                Acertos := Acertos + 1;
           end;

           frmConferirJogo.lblJogo1_12.Caption := frmConferirJogo.lbxJogo1.Items[11];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[11]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_12.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo1_13.Caption := frmConferirJogo.lbxJogo1.Items[12];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[12]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_13.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo1_14.Caption := frmConferirJogo.lbxJogo1.Items[13];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[13]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_14.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo1_15.Caption := frmConferirJogo.lbxJogo1.Items[14];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo1.Items[14]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo1_15.Color := clLime;
                Acertos := Acertos + 1;
           end;
           if Acertos >= 11 then
           begin
                frmConferirJogo.lblAcertosJg01.Font.Color := clGreen;
           end;
           frmConferirJogo.lblAcertosJg01.Caption := IntToStr(Acertos)+' ACERTOS';            
           ////////////////////////////////

           /////////////
           Acertos := 0;
           frmConferirJogo.lblJogo2_01.Caption := frmConferirJogo.lbxJogo2.Items[0];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[0]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_01.Color := clLime;
                Acertos := Acertos + 1;
           end;

           frmConferirJogo.lblJogo2_02.Caption := frmConferirJogo.lbxJogo2.Items[1];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[1]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_02.Color := clLime;
                Acertos := Acertos + 1;
           end;
           
           frmConferirJogo.lblJogo2_03.Caption := frmConferirJogo.lbxJogo2.Items[2];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[2]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_03.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo2_04.Caption := frmConferirJogo.lbxJogo2.Items[3];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[3]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_04.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo2_05.Caption := frmConferirJogo.lbxJogo2.Items[4];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[4]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_05.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo2_06.Caption := frmConferirJogo.lbxJogo2.Items[5];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[5]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_06.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo2_07.Caption := frmConferirJogo.lbxJogo2.Items[6];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[6]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_07.Color := clLime;
                Acertos := Acertos + 1;
           end;

           frmConferirJogo.lblJogo2_08.Caption := frmConferirJogo.lbxJogo2.Items[7];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[7]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_08.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo2_09.Caption := frmConferirJogo.lbxJogo2.Items[8];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[8]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_09.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo2_10.Caption := frmConferirJogo.lbxJogo2.Items[9];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[9]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_10.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo2_11.Caption := frmConferirJogo.lbxJogo2.Items[10];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[10]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_11.Color := clLime;
                Acertos := Acertos + 1;
           end;

           frmConferirJogo.lblJogo2_12.Caption := frmConferirJogo.lbxJogo2.Items[11];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[11]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_12.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo2_13.Caption := frmConferirJogo.lbxJogo2.Items[12];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[12]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_13.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo2_14.Caption := frmConferirJogo.lbxJogo2.Items[13];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[13]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_14.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo2_15.Caption := frmConferirJogo.lbxJogo2.Items[14];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo2.Items[14]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo2_15.Color := clLime;
                Acertos := Acertos + 1;
           end;
           if Acertos >= 11 then
           begin
                frmConferirJogo.lblAcertosJg02.Font.Color := clGreen;
           end;
           frmConferirJogo.lblAcertosJg02.Caption := IntToStr(Acertos)+' ACERTOS';            
           ////////////////////////////////

           Acertos := 0;
           frmConferirJogo.lblJogo3_01.Caption := frmConferirJogo.lbxJogo3.Items[0];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[0]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_01.Color := clLime;
                Acertos := Acertos + 1;
           end;

           frmConferirJogo.lblJogo3_02.Caption := frmConferirJogo.lbxJogo3.Items[1];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[1]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_02.Color := clLime;
                Acertos := Acertos + 1;
           end;
           
           frmConferirJogo.lblJogo3_03.Caption := frmConferirJogo.lbxJogo3.Items[2];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[2]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_03.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo3_04.Caption := frmConferirJogo.lbxJogo3.Items[3];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[3]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_04.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo3_05.Caption := frmConferirJogo.lbxJogo3.Items[4];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[4]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_05.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo3_06.Caption := frmConferirJogo.lbxJogo3.Items[5];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[5]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_06.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo3_07.Caption := frmConferirJogo.lbxJogo3.Items[6];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[6]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_07.Color := clLime;
                Acertos := Acertos + 1;
           end;

           frmConferirJogo.lblJogo3_08.Caption := frmConferirJogo.lbxJogo3.Items[7];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[7]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_08.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo3_09.Caption := frmConferirJogo.lbxJogo3.Items[8];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[8]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_09.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo3_10.Caption := frmConferirJogo.lbxJogo3.Items[9];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[9]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_10.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo3_11.Caption := frmConferirJogo.lbxJogo3.Items[10];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[10]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_11.Color := clLime;
                Acertos := Acertos + 1;
           end;

           frmConferirJogo.lblJogo3_12.Caption := frmConferirJogo.lbxJogo3.Items[11];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[11]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_12.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo3_13.Caption := frmConferirJogo.lbxJogo3.Items[12];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[12]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_13.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo3_14.Caption := frmConferirJogo.lbxJogo3.Items[13];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[13]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_14.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo3_15.Caption := frmConferirJogo.lbxJogo3.Items[14];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo3.Items[14]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo3_15.Color := clLime;
                Acertos := Acertos + 1;
           end;
           if Acertos >= 11 then
           begin
                frmConferirJogo.lblAcertosJg03.Font.Color := clGreen;
           end;
           frmConferirJogo.lblAcertosJg03.Caption := IntToStr(Acertos)+' ACERTOS';            
           ////////////////////////////////

           Acertos := 0;
           frmConferirJogo.lblJogo4_01.Caption := frmConferirJogo.lbxJogo4.Items[0];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[0]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_01.Color := clLime;
                Acertos := Acertos + 1;
           end;

           frmConferirJogo.lblJogo4_02.Caption := frmConferirJogo.lbxJogo4.Items[1];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[1]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_02.Color := clLime;
                Acertos := Acertos + 1;
           end;
           
           frmConferirJogo.lblJogo4_03.Caption := frmConferirJogo.lbxJogo4.Items[2];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[2]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_03.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo4_04.Caption := frmConferirJogo.lbxJogo4.Items[3];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[3]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_04.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo4_05.Caption := frmConferirJogo.lbxJogo4.Items[4];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[4]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_05.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo4_06.Caption := frmConferirJogo.lbxJogo4.Items[5];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[5]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_06.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo4_07.Caption := frmConferirJogo.lbxJogo4.Items[6];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[6]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_07.Color := clLime;
                Acertos := Acertos + 1;
           end;

           frmConferirJogo.lblJogo4_08.Caption := frmConferirJogo.lbxJogo4.Items[7];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[7]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_08.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo4_09.Caption := frmConferirJogo.lbxJogo4.Items[8];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[8]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_09.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo4_10.Caption := frmConferirJogo.lbxJogo4.Items[9];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[9]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_10.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo4_11.Caption := frmConferirJogo.lbxJogo4.Items[10];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[10]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_11.Color := clLime;
                Acertos := Acertos + 1;
           end;

           frmConferirJogo.lblJogo4_12.Caption := frmConferirJogo.lbxJogo4.Items[11];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[11]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_12.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo4_13.Caption := frmConferirJogo.lbxJogo4.Items[12];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[12]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_13.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo4_14.Caption := frmConferirJogo.lbxJogo4.Items[13];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[13]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_14.Color := clLime;
                Acertos := Acertos + 1;
           end;
           frmConferirJogo.lblJogo4_15.Caption := frmConferirJogo.lbxJogo4.Items[14];           
           VerifNum := frmConferirJogo.lbxResultado.Items.IndexOf(frmConferirJogo.lbxJogo4.Items[14]+'');
           if VerifNum > -1 then
           begin
                frmConferirJogo.lblJogo4_15.Color := clLime;
                Acertos := Acertos + 1;
           end;
           if Acertos >= 11 then
           begin
                frmConferirJogo.lblAcertosJg04.Font.Color := clGreen;
           end;
           frmConferirJogo.lblAcertosJg04.Caption := IntToStr(Acertos)+' ACERTOS';            

           frmConferirJogo.Show;
      end;
end;


procedure TfrmJanPrincipal.LimpaBotoes;
begin
if edtFixas01.Text <> '' then
        edtFixas01.Text := '';
     if edtFixas02.Text <> '' then
        edtFixas02.Text := '';
     if edtFixas03.Text <> '' then
        edtFixas03.Text := '';
     if edtFixas04.Text <> '' then
        edtFixas04.Text := '';
     if edtFixas05.Text <> '' then
        edtFixas05.Text := '';
     if edtFixas06.Text <> '' then
        edtFixas06.Text := '';
     if edtFixas07.Text <> '' then
        edtFixas07.Text := '';
     if edtFixas08.Text <> '' then
        edtFixas08.Text := '';
     if edtFixas09.Text <> '' then
        edtFixas09.Text := '';
     if edtFixas10.Text <> '' then
        edtFixas10.Text := '';

     if edtPrim01.Text <> '' then
        edtPrim01.Text := '';
     if edtPrim02.Text <> '' then
        edtPrim02.Text := '';
     if edtPrim03.Text <> '' then
        edtPrim03.Text := '';
     if edtPrim04.Text <> '' then
        edtPrim04.Text := '';
     if edtPrim05.Text <> '' then
        edtPrim05.Text := '';

     if edtSeg01.Text <> '' then
        edtSeg01.Text := '';
     if edtSeg02.Text <> '' then
        edtSeg02.Text := '';
     if edtSeg03.Text <> '' then
        edtSeg03.Text := '';
     if edtSeg04.Text <> '' then
        edtSeg04.Text := '';
     if edtSeg05.Text <> '' then
        edtSeg05.Text := '';

     if edtTerc01.Text <> '' then
        edtTerc01.Text := '';
     if edtTerc02.Text <> '' then
        edtTerc02.Text := '';
     if edtTerc03.Text <> '' then
        edtTerc03.Text := '';
     if edtTerc04.Text <> '' then
        edtTerc04.Text := '';
     if edtTerc05.Text <> '' then
        edtTerc05.Text := '';

     if btn01.Enabled = False then
                  btn01.Enabled := True;
               if btn02.Enabled = False then
                  btn02.Enabled := True;
               if btn03.Enabled = False then
                  btn03.Enabled := True;
               if btn04.Enabled = False then
                  btn04.Enabled := True;
               if btn05.Enabled = False then
                  btn05.Enabled := True;
               if btn06.Enabled = False then
                  btn06.Enabled := True;
               if btn07.Enabled = False then
                  btn07.Enabled := True;
               if btn08.Enabled = False then   
                  btn08.Enabled := True;
               if btn09.Enabled = False then
                  btn09.Enabled := True;
               if btn10.Enabled = False then   
                  btn10.Enabled := True;                
               if btn11.Enabled = False then
                  btn11.Enabled := True;
               if btn12.Enabled = False then
                  btn12.Enabled := True;
               if btn13.Enabled = False then
                  btn13.Enabled := True;
               if btn14.Enabled = False then
                  btn14.Enabled := True;
               if btn15.Enabled = False then
                  btn15.Enabled := True;
               if btn16.Enabled = False then
                  btn16.Enabled := True;
               if btn17.Enabled = False then   
                  btn17.Enabled := True;
               if btn18.Enabled = False then
                  btn18.Enabled := True;
               if btn19.Enabled = False then
                  btn19.Enabled := True;
               if btn20.Enabled = False then
                  btn20.Enabled := True; 
               if btn21.Enabled = False then
                  btn21.Enabled := True;
               if btn22.Enabled = False then
                  btn22.Enabled := True;
               if btn23.Enabled = False then
                  btn23.Enabled := True;
               if btn24.Enabled = False then
                  btn24.Enabled := True;
               if btn25.Enabled = False then
                  btn25.Enabled := True;
end;

procedure TfrmjanPrincipal.AleatorioTerceiraCombinacao;
begin
      if btn01.Enabled then
         btn01.Click;
      if btn02.Enabled then
         btn02.Click;
      if btn03.Enabled then
         btn03.Click;
      if btn04.Enabled then
         btn04.Click;
      if btn05.Enabled then
         btn05.Click;
      if btn06.Enabled then
         btn06.Click;
      if btn07.Enabled then
         btn07.Click;
      if btn08.Enabled then
         btn08.Click;
      if btn09.Enabled then
         btn09.Click;
      if btn10.Enabled then
         btn10.Click;
      if btn11.Enabled then
         btn11.Click;
      if btn12.Enabled then
         btn12.Click;
      if btn13.Enabled then
         btn13.Click;
      if btn14.Enabled then
         btn14.Click;
      if btn15.Enabled then
         btn15.Click;
      if btn16.Enabled then
         btn16.Click;
      if btn17.Enabled then
         btn17.Click;
      if btn18.Enabled then
         btn18.Click;
      if btn19.Enabled then
         btn19.Click;
      if btn20.Enabled then
         btn20.Click;
      if btn21.Enabled then
         btn21.Click;
      if btn22.Enabled then
         btn22.Click;
      if btn23.Enabled then
         btn23.Click;
      if btn24.Enabled then
         btn24.Click;
      if btn25.Enabled then
         btn25.Click;       
end;

procedure TfrmjanPrincipal.AleatórioFixas;
var
   Rand: Integer;
   Escolhidos: Integer;
begin
     Randomize;

     //4 NUMEROS PARES SORTEADOS
     Escolhidos := 1;
     while Escolhidos <= 4 do
     begin
          Rand := RandomRange(1, Length(ParesSorteados));
          if (ParesSorteados[Rand] = '01') and  (btn01.Enabled) then
          begin
               btn01.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '02') and  (btn02.Enabled) then
          begin
               btn02.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '03') and  (btn03.Enabled) then
          begin
               btn03.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '04') and  (btn04.Enabled) then
          begin
               btn04.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '05') and  (btn05.Enabled) then
          begin
               btn05.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '06') and  (btn06.Enabled) then
          begin
               btn06.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '07') and  (btn07.Enabled) then
          begin
               btn07.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '08') and  (btn08.Enabled) then
          begin
               btn08.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '09') and  (btn09.Enabled) then
          begin
               btn09.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '10') and  (btn10.Enabled) then
          begin
               btn10.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '11') and  (btn11.Enabled) then
          begin
               btn11.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '12') and  (btn12.Enabled) then
          begin
               btn12.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '13') and  (btn13.Enabled) then
          begin
               btn13.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '14') and  (btn14.Enabled) then
          begin
               btn14.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '15') and  (btn15.Enabled) then
          begin
               btn15.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '16') and  (btn16.Enabled) then
          begin
               btn16.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '17') and  (btn17.Enabled) then
          begin
               btn17.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '18') and  (btn18.Enabled) then
          begin
               btn18.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '19') and  (btn19.Enabled) then
          begin
               btn19.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '20') and  (btn20.Enabled) then
          begin
               btn20.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '21') and  (btn21.Enabled) then
          begin
               btn21.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '22') and  (btn22.Enabled) then
          begin
               btn22.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '23') and  (btn23.Enabled) then
          begin
               btn23.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '24') and  (btn24.Enabled) then
          begin
               btn24.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesSorteados[Rand] = '25') and  (btn25.Enabled) then
          begin
               btn25.Click;
               Escolhidos := Escolhidos + 1;
          end;         
     end;

     //4 NUMEROS IMPARES SORTEADOS
     Escolhidos := 1;
     while Escolhidos <= 4 do
     begin
          Rand := RandomRange(1, Length(ImparesSorteados));
          if (ImparesSorteados[Rand] = '01') and  (btn01.Enabled) then
          begin
               btn01.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '02') and  (btn02.Enabled) then
          begin
               btn02.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '03') and  (btn03.Enabled) then
          begin
               btn03.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '04') and  (btn04.Enabled) then
          begin
               btn04.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '05') and  (btn05.Enabled) then
          begin
               btn05.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '06') and  (btn06.Enabled) then
          begin
               btn06.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '07') and  (btn07.Enabled) then
          begin
               btn07.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '08') and  (btn08.Enabled) then
          begin
               btn08.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '09') and  (btn09.Enabled) then
          begin
               btn09.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '10') and  (btn10.Enabled) then
          begin
               btn10.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '11') and  (btn11.Enabled) then
          begin
               btn11.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '12') and  (btn12.Enabled) then
          begin
               btn12.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '13') and  (btn13.Enabled) then
          begin
               btn13.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '14') and  (btn14.Enabled) then
          begin
               btn14.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '15') and  (btn15.Enabled) then
          begin
               btn15.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '16') and  (btn16.Enabled) then
          begin
               btn16.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '17') and  (btn17.Enabled) then
          begin
               btn17.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '18') and  (btn18.Enabled) then
          begin
               btn18.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '19') and  (btn19.Enabled) then
          begin
               btn19.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '20') and  (btn20.Enabled) then
          begin
               btn20.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '21') and  (btn21.Enabled) then
          begin
               btn21.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '22') and  (btn22.Enabled) then
          begin
               btn22.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '23') and  (btn23.Enabled) then
          begin
               btn23.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '24') and  (btn24.Enabled) then
          begin
               btn24.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesSorteados[Rand] = '25') and  (btn25.Enabled) then
          begin
               btn25.Click;
               Escolhidos := Escolhidos + 1;
          end;         
     end;

     //1 NUMERO PAR NAO SORTEADO
     Escolhidos := 1;
     while Escolhidos <= 1 do
     begin
          Rand := RandomRange(1, Length(ParesNaoSorteados));
          if (ParesNaoSorteados[Rand] = '01') and  (btn01.Enabled) then
          begin
               btn01.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '02') and  (btn02.Enabled) then
          begin
               btn02.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '03') and  (btn03.Enabled) then
          begin
               btn03.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '04') and  (btn04.Enabled) then
          begin
               btn04.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '05') and  (btn05.Enabled) then
          begin
               btn05.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '06') and  (btn06.Enabled) then
          begin
               btn06.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '07') and  (btn07.Enabled) then
          begin
               btn07.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '08') and  (btn08.Enabled) then
          begin
               btn08.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '09') and  (btn09.Enabled) then
          begin
               btn09.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '10') and  (btn10.Enabled) then
          begin
               btn10.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '11') and  (btn11.Enabled) then
          begin
               btn11.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '12') and  (btn12.Enabled) then
          begin
               btn12.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '13') and  (btn13.Enabled) then
          begin
               btn13.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '14') and  (btn14.Enabled) then
          begin
               btn14.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '15') and  (btn15.Enabled) then
          begin
               btn15.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '16') and  (btn16.Enabled) then
          begin
               btn16.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '17') and  (btn17.Enabled) then
          begin
               btn17.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '18') and  (btn18.Enabled) then
          begin
               btn18.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '19') and  (btn19.Enabled) then
          begin
               btn19.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '20') and  (btn20.Enabled) then
          begin
               btn20.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '21') and  (btn21.Enabled) then
          begin
               btn21.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '22') and  (btn22.Enabled) then
          begin
               btn22.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '23') and  (btn23.Enabled) then
          begin
               btn23.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '24') and  (btn24.Enabled) then
          begin
               btn24.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ParesNaoSorteados[Rand] = '25') and  (btn25.Enabled) then
          begin
               btn25.Click;
               Escolhidos := Escolhidos + 1;
          end;         
     end;

     //1 NUMERO IMPAR NAO SORTEADO
     Escolhidos := 1;
     while Escolhidos <= 1 do
     begin
          Rand := RandomRange(1, Length(ImparesNaoSorteados));
          if (ImparesNaoSorteados[Rand] = '01') and  (btn01.Enabled) then
          begin
               btn01.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '02') and  (btn02.Enabled) then
          begin
               btn02.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '03') and  (btn03.Enabled) then
          begin
               btn03.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '04') and  (btn04.Enabled) then
          begin
               btn04.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '05') and  (btn05.Enabled) then
          begin
               btn05.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '06') and  (btn06.Enabled) then
          begin
               btn06.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '07') and  (btn07.Enabled) then
          begin
               btn07.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '08') and  (btn08.Enabled) then
          begin
               btn08.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '09') and  (btn09.Enabled) then
          begin
               btn09.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '10') and  (btn10.Enabled) then
          begin
               btn10.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '11') and  (btn11.Enabled) then
          begin
               btn11.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '12') and  (btn12.Enabled) then
          begin
               btn12.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '13') and  (btn13.Enabled) then
          begin
               btn13.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '14') and  (btn14.Enabled) then
          begin
               btn14.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '15') and  (btn15.Enabled) then
          begin
               btn15.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '16') and  (btn16.Enabled) then
          begin
               btn16.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '17') and  (btn17.Enabled) then
          begin
               btn17.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '18') and  (btn18.Enabled) then
          begin
               btn18.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '19') and  (btn19.Enabled) then
          begin
               btn19.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '20') and  (btn20.Enabled) then
          begin
               btn20.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '21') and  (btn21.Enabled) then
          begin
               btn21.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '22') and  (btn22.Enabled) then
          begin
               btn22.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '23') and  (btn23.Enabled) then
          begin
               btn23.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '24') and  (btn24.Enabled) then
          begin
               btn24.Click;
               Escolhidos := Escolhidos + 1;
          end;
          if (ImparesNaoSorteados[Rand] = '25') and  (btn25.Enabled) then
          begin
               btn25.Click;
               Escolhidos := Escolhidos + 1;
          end;         
     end;
end;

procedure TfrmJanPrincipal.btnLimparCombinacoesClick(Sender: TObject);
begin
     LimpaBotoes;       
end;

procedure TfrmJanPrincipal.btnConfJogosClick(Sender: TObject);
begin
     if opnJogoSalvo.Execute then
     begin
          JogoSalvo := opnJogoSalvo.FileName;
          ConferirJogo;
     end;
end;

procedure TfrmjanPrincipal.Aleatorio3Pares2Impares;
var
   Rand: Integer;
   Escolhidos: Integer;
begin
     Randomize;

     //3 DEZENAS PARES
     Escolhidos := 1;
     while Escolhidos <= 3 do
     begin
          Rand := RandomRange(1, 25);
          if Rand mod 2 = 0 then
          begin
               if (Rand = 2) and (btn02.Enabled) then
               begin
                    btn02.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 4) and (btn04.Enabled) then
               begin
                    btn04.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 6) and (btn06.Enabled) then
               begin
                    btn06.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 8) and (btn08.Enabled) then
               begin
                    btn08.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 10) and (btn10.Enabled) then
               begin
                    btn10.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 12) and (btn12.Enabled) then
               begin
                    btn12.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 14) and (btn14.Enabled) then
               begin
                    btn14.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 16) and (btn16.Enabled) then
               begin
                    btn16.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 18) and (btn18.Enabled) then
               begin
                    btn18.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 20) and (btn20.Enabled) then
               begin
                    btn20.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 22) and (btn22.Enabled) then
               begin
                    btn22.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 24) and (btn24.Enabled) then
               begin
                    btn24.Click;
                    Escolhidos := Escolhidos + 1;
               end;
          end;
     end;

     //2 DEZENAS IMPARES
    Escolhidos := 1;
     while Escolhidos <= 2 do
     begin
          Rand := RandomRange(1, 25);
          if Rand mod 2 <> 0 then
          begin
               if (Rand = 1) and (btn01.Enabled) then
               begin
                    btn01.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 3) and (btn03.Enabled) then
               begin
                    btn03.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 5) and (btn05.Enabled) then
               begin
                    btn05.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 7) and (btn07.Enabled) then
               begin
                    btn07.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 9) and (btn09.Enabled) then
               begin
                    btn09.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 11) and (btn11.Enabled) then
               begin
                    btn11.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 13) and (btn13.Enabled) then
               begin
                    btn13.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 15) and (btn15.Enabled) then
               begin
                    btn15.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 17) and (btn17.Enabled) then
               begin
                    btn17.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 19) and (btn19.Enabled) then
               begin
                    btn19.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 21) and (btn21.Enabled) then
               begin
                    btn21.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 23) and (btn23.Enabled) then
               begin
                    btn23.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 25) and (btn25.Enabled) then
               begin
                    btn25.Click;
                    Escolhidos := Escolhidos + 1;
               end;              
          end;
     end;
end;


procedure TfrmjanPrincipal.Aleatorio3Impares2Pares;
var
   Rand: Integer;
   Escolhidos: Integer;
begin
     Randomize;

     //2 DEZENAS PARES
     Escolhidos := 1;
     while Escolhidos <= 2 do
     begin
          Rand := RandomRange(1, 25);
          if Rand mod 2 = 0 then
          begin
               if (Rand = 2) and (btn02.Enabled) then
               begin
                    btn02.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 4) and (btn04.Enabled) then
               begin
                    btn04.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 6) and (btn06.Enabled) then
               begin
                    btn06.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 8) and (btn08.Enabled) then
               begin
                    btn08.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 10) and (btn10.Enabled) then
               begin
                    btn10.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 12) and (btn12.Enabled) then
               begin
                    btn12.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 14) and (btn14.Enabled) then
               begin
                    btn14.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 16) and (btn16.Enabled) then
               begin
                    btn16.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 18) and (btn18.Enabled) then
               begin
                    btn18.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 20) and (btn20.Enabled) then
               begin
                    btn20.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 22) and (btn22.Enabled) then
               begin
                    btn22.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 24) and (btn24.Enabled) then
               begin
                    btn24.Click;
                    Escolhidos := Escolhidos + 1;
               end;
          end;         
     end;

     //3 DEZENAS IMPARES

    Escolhidos := 1;
     while Escolhidos <= 3 do
     begin
          Rand := RandomRange(1, 25);
          if Rand mod 2 <> 0 then
          begin
               if (Rand = 1) and (btn01.Enabled) then
               begin
                    btn01.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 3) and (btn03.Enabled) then
               begin
                    btn03.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 5) and (btn05.Enabled) then
               begin
                    btn05.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 7) and (btn07.Enabled) then
               begin
                    btn07.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 9) and (btn09.Enabled) then
               begin
                    btn09.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 11) and (btn11.Enabled) then
               begin
                    btn11.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 13) and (btn13.Enabled) then
               begin
                    btn13.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 15) and (btn15.Enabled) then
               begin
                    btn15.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 17) and (btn17.Enabled) then
               begin
                    btn17.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 19) and (btn19.Enabled) then
               begin
                    btn19.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 21) and (btn21.Enabled) then
               begin
                    btn21.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 23) and (btn23.Enabled) then
               begin
                    btn23.Click;
                    Escolhidos := Escolhidos + 1;
               end;
               if (Rand = 25) and (btn25.Enabled) then
               begin
                    btn25.Click;
                    Escolhidos := Escolhidos + 1;
               end;              
          end;
     end;
end;

procedure TfrmjanPrincipal.JogoAleatório;
var
   Rand: Integer;
begin
     Randomize;
     
     ParesImpares;
     Sleep(500);

     AleatórioFixas;
     Sleep(500);
     Rand := RandomRange(1, 9999999999999);
     if Rand mod 2 = 0 then
     begin
          Aleatorio3Pares2Impares;
          Sleep(500);
          Aleatorio3Impares2Pares;
          Sleep(500);
          AleatorioTerceiraCombinacao;
          Sleep(500);
     end
     else
     begin
          Aleatorio3Impares2Pares;
          Sleep(500);
          Aleatorio3Pares2Impares;
          Sleep(500);
          AleatorioTerceiraCombinacao;
          Sleep(500);
     end;
end;

procedure TfrmJanPrincipal.ParesImpares;
var
   i,par, impar: Integer;   
begin
     SetLength(ParesSorteados, 12);
     SetLength(ImparesSorteados, 13); 
     SetLength(ParesNaoSorteados, 10);
     SetLength(ImparesNaoSorteados, 10);

     //ARRAY NUMEROS SORTEADOS (PARES E IMPARES)
     par := 1;
     impar := 1;
     for i := 1 to 15 do
     begin
          if (StrToInt(UltimoResultado[i]) mod 2 = 0) then
          begin   //PARES
             ParesSorteados[par] := UltimoResultado[i];
             par := par + 1;            
          end
          else
          begin     //IMPARES
              ImparesSorteados[impar] := UltimoResultado[i];
              impar := impar + 1;        
          end;
     end;
     SetLength(ParesSorteados, par);
     SetLength(ImparesSorteados, impar);

     //ARRAY NUMEROS NAO SORTEADOS (PARES E IMPARES)
     par := 1;
     impar := 1;
     for i := 1 to 10 do
     begin
          if (StrToInt(NaoSorteados[i]) mod 2 = 0) then
          begin     //PARES
             ParesNaoSorteados[par] := NaoSorteados[i];
             par := par + 1;            
          end
          else
          begin   //IMPARES
              ImparesNaoSorteados[impar] := NaoSorteados[i];
              impar := impar + 1;        
          end;
     end;
     SetLength(ParesNaoSorteados, par);
     SetLength(ImparesNaoSorteados, impar);
end;

procedure TfrmJanPrincipal.rbtAutomaticoClick(Sender: TObject);
begin
     if NumerosClicados > 0 then
        NumerosClicados := 0;
     pnlLotofacil.Visible := True;
     gbxNumCombinacoes.Visible := False;
     LimpaBotoes;
end;

procedure TfrmJanPrincipal.rbtManualClick(Sender: TObject);
begin
     if NumerosClicados > 0 then
        NumerosClicados := 0;
     pnlLotofacil.Visible := False;
     gbxNumCombinacoes.Visible := True;
     LimpaBotoes;
end;

procedure TfrmJanPrincipal.GeraArrays;
begin
     //ARRAY DAS DEZENAS FIXAS
     if edtFixas01.Text <> '' then
        DezenasFixas[1] := edtFixas01.Text;
     if edtFixas02.Text <> '' then
        DezenasFixas[2] := edtFixas02.Text;
     if edtFixas03.Text <> '' then
        DezenasFixas[3] := edtFixas03.Text;
     if edtFixas04.Text <> '' then
        DezenasFixas[4] := edtFixas04.Text;
     if edtFixas05.Text <> '' then
        DezenasFixas[5] := edtFixas05.Text;
     if edtFixas06.Text <> '' then
        DezenasFixas[6] := edtFixas06.Text;
     if edtFixas07.Text <> '' then
        DezenasFixas[7] := edtFixas07.Text;
     if edtFixas08.Text <> '' then
        DezenasFixas[8] := edtFixas08.Text;
     if edtFixas09.Text <> '' then
        DezenasFixas[9] := edtFixas09.Text;
     if edtFixas10.Text <> '' then
        DezenasFixas[10] := edtFixas10.Text;
     
     //ARRAY DA 1ª COMBINAÇÃO
     if edtPrim01.Text <> '' then
        PrimCombinacao[1] := edtPrim01.Text;
     if edtPrim02.Text <> '' then
        PrimCombinacao[2] := edtPrim02.Text;
     if edtPrim03.Text <> '' then
        PrimCombinacao[3] := edtPrim03.Text;
     if edtPrim04.Text <> '' then
        PrimCombinacao[4] := edtPrim04.Text;
     if edtPrim05.Text <> '' then
        PrimCombinacao[5] := edtPrim05.Text;

     //ARRAY DA 2ª COMBINAÇÃO
     if edtSeg01.Text <> '' then
        SegCombinacao[1] := edtSeg01.Text;
     if edtSeg02.Text <> '' then
        SegCombinacao[2] := edtSeg02.Text;
     if edtSeg03.Text <> '' then
        SegCombinacao[3] := edtSeg03.Text;
     if edtSeg04.Text <> '' then
        SegCombinacao[4] := edtSeg04.Text;
     if edtSeg05.Text <> '' then
        SegCombinacao[5] := edtSeg05.Text;

     //ARRAY DA 3ª COMBINAÇÃO
     if edtTerc01.Text <> '' then
        TercCombinacao[1] := edtTerc01.Text;
     if edtTerc02.Text <> '' then
        TercCombinacao[2] := edtTerc02.Text;
     if edtTerc03.Text <> '' then
        TercCombinacao[3] := edtTerc03.Text;
     if edtTerc04.Text <> '' then
        TercCombinacao[4] := edtTerc04.Text;
     if edtTerc05.Text <> '' then
        TercCombinacao[5] := edtTerc05.Text; 

end;

procedure TfrmJanPrincipal.GeraJogos;
var
   i, j: Integer;
   Aux: String;
begin
     for i := 1 to 10 do
     begin
          Jogo1[i] := DezenasFixas[i];
          Jogo2[i] := DezenasFixas[i];
          Jogo3[i] := DezenasFixas[i];           
     end;
     for i := 1 to 5 do
     begin
          Jogo1[i+10] := PrimCombinacao[i];
          Jogo2[i+10] := SegCombinacao[i];
          Jogo3[i+10] := TercCombinacao[i];
          Jogo4[i] := PrimCombinacao[i];
          Jogo4[i+5] := SegCombinacao[i];
          Jogo4[i+10] :=TercCombinacao[i];  
     end;
     //ORDENAR JOGO 1
     for i := 1 to 15 do
     begin
          begin
           for j := (i + 1) to 15 do
              if (StrToInt(Jogo1[i]) > StrToInt(Jogo1[j])) then
               begin
                     Aux := Jogo1[i];
                     Jogo1[i] := Jogo1[j];
                     Jogo1[j] := Aux;
               end;
          end;
     end;
     //ORDENAR JOGO 1
     for i := 1 to 15 do
     begin
          for j := (i + 1) to 15 do
          begin
               if (StrToInt(Jogo1[i]) > StrToInt(Jogo1[j])) then
               begin
                     Aux := Jogo1[i];
                     Jogo1[i] := Jogo1[j];
                     Jogo1[j] := Aux;
               end;
          end;
     end;
     //ORDENAR JOGO 2
     for i := 1 to 15 do
     begin
          for j := (i + 1) to 15 do
          begin
               if (StrToInt(Jogo2[i]) > StrToInt(Jogo2[j])) then
               begin
                     Aux := Jogo2[i];
                     Jogo2[i] := Jogo2[j];
                     Jogo2[j] := Aux;
               end;
          end;
     end;
     //ORDENAR JOGO 3
     for i := 1 to 15 do
     begin
          for j := (i + 1) to 15 do
          begin
               if (StrToInt(Jogo3[i]) > StrToInt(Jogo3[j])) then
               begin
                     Aux := Jogo3[i];
                     Jogo3[i] := Jogo3[j];
                     Jogo3[j] := Aux;
               end;
          end;
     end;
     //ORDENAR JOGO 4
     for i := 1 to 15 do
     begin
          for j := (i + 1) to 15 do
          begin
               if (StrToInt(Jogo4[i]) > StrToInt(Jogo4[j])) then
               begin
                     Aux := Jogo4[i];
                     Jogo4[i] := Jogo4[j];
                     Jogo4[j] := Aux;
               end;
          end;
     end;

     frmJogosGerados.lblJogo1_01.Caption := Jogo1[1];
     frmJogosGerados.lblJogo1_02.Caption := Jogo1[2];
     frmJogosGerados.lblJogo1_03.Caption := Jogo1[3];
     frmJogosGerados.lblJogo1_04.Caption := Jogo1[4];
     frmJogosGerados.lblJogo1_05.Caption := Jogo1[5];
     frmJogosGerados.lblJogo1_06.Caption := Jogo1[6];
     frmJogosGerados.lblJogo1_07.Caption := Jogo1[7];
     frmJogosGerados.lblJogo1_08.Caption := Jogo1[8];
     frmJogosGerados.lblJogo1_09.Caption := Jogo1[9];
     frmJogosGerados.lblJogo1_10.Caption := Jogo1[10];
     frmJogosGerados.lblJogo1_11.Caption := Jogo1[11];
     frmJogosGerados.lblJogo1_12.Caption := Jogo1[12];
     frmJogosGerados.lblJogo1_13.Caption := Jogo1[13];
     frmJogosGerados.lblJogo1_14.Caption := Jogo1[14];
     frmJogosGerados.lblJogo1_15.Caption := Jogo1[15]; 

     frmJogosGerados.lblJogo2_01.Caption := Jogo2[1];
     frmJogosGerados.lblJogo2_02.Caption := Jogo2[2];
     frmJogosGerados.lblJogo2_03.Caption := Jogo2[3];
     frmJogosGerados.lblJogo2_04.Caption := Jogo2[4];
     frmJogosGerados.lblJogo2_05.Caption := Jogo2[5];
     frmJogosGerados.lblJogo2_06.Caption := Jogo2[6];
     frmJogosGerados.lblJogo2_07.Caption := Jogo2[7];
     frmJogosGerados.lblJogo2_08.Caption := Jogo2[8];
     frmJogosGerados.lblJogo2_09.Caption := Jogo2[9];
     frmJogosGerados.lblJogo2_10.Caption := Jogo2[10];
     frmJogosGerados.lblJogo2_11.Caption := Jogo2[11];
     frmJogosGerados.lblJogo2_12.Caption := Jogo2[12];
     frmJogosGerados.lblJogo2_13.Caption := Jogo2[13];
     frmJogosGerados.lblJogo2_14.Caption := Jogo2[14];
     frmJogosGerados.lblJogo2_15.Caption := Jogo2[15];

     frmJogosGerados.lblJogo3_01.Caption := Jogo3[1];
     frmJogosGerados.lblJogo3_02.Caption := Jogo3[2];
     frmJogosGerados.lblJogo3_03.Caption := Jogo3[3];
     frmJogosGerados.lblJogo3_04.Caption := Jogo3[4];
     frmJogosGerados.lblJogo3_05.Caption := Jogo3[5];
     frmJogosGerados.lblJogo3_06.Caption := Jogo3[6];
     frmJogosGerados.lblJogo3_07.Caption := Jogo3[7];
     frmJogosGerados.lblJogo3_08.Caption := Jogo3[8];
     frmJogosGerados.lblJogo3_09.Caption := Jogo3[9];
     frmJogosGerados.lblJogo3_10.Caption := Jogo3[10];
     frmJogosGerados.lblJogo3_11.Caption := Jogo3[11];
     frmJogosGerados.lblJogo3_12.Caption := Jogo3[12];
     frmJogosGerados.lblJogo3_13.Caption := Jogo3[13];
     frmJogosGerados.lblJogo3_14.Caption := Jogo3[14];
     frmJogosGerados.lblJogo3_15.Caption := Jogo3[15];

     frmJogosGerados.lblJogo4_01.Caption := Jogo4[1];
     frmJogosGerados.lblJogo4_02.Caption := Jogo4[2];
     frmJogosGerados.lblJogo4_03.Caption := Jogo4[3];
     frmJogosGerados.lblJogo4_04.Caption := Jogo4[4];
     frmJogosGerados.lblJogo4_05.Caption := Jogo4[5];
     frmJogosGerados.lblJogo4_06.Caption := Jogo4[6];
     frmJogosGerados.lblJogo4_07.Caption := Jogo4[7];
     frmJogosGerados.lblJogo4_08.Caption := Jogo4[8];
     frmJogosGerados.lblJogo4_09.Caption := Jogo4[9];
     frmJogosGerados.lblJogo4_10.Caption := Jogo4[10];
     frmJogosGerados.lblJogo4_11.Caption := Jogo4[11];
     frmJogosGerados.lblJogo4_12.Caption := Jogo4[12];
     frmJogosGerados.lblJogo4_13.Caption := Jogo4[13];
     frmJogosGerados.lblJogo4_14.Caption := Jogo4[14];
     frmJogosGerados.lblJogo4_15.Caption := Jogo4[15];

     frmJogosGerados.Show;
     Screen.Cursor := crDefault;
end;



procedure TfrmJanPrincipal.imgLogoClick(Sender: TObject);
begin
     frmSobre.Show;
end;

procedure TfrmJanPrincipal.btn01Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn01.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn01.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn01.Enabled := False;
end;

procedure TfrmJanPrincipal.btn02Click(Sender: TObject);
begin
          case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn02.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn02.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn02.Enabled := False;
end;

procedure TfrmJanPrincipal.btn03Click(Sender: TObject);
begin
          case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn03.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn03.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn03.Enabled := False;
end;

procedure TfrmJanPrincipal.btn04Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn04.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn04.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn04.Enabled := False;
end;

procedure TfrmJanPrincipal.btn05Click(Sender: TObject);
begin
          case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn05.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn05.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn05.Enabled := False;
end;

procedure TfrmJanPrincipal.btn06Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn06.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn06.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn06.Enabled := False;
end;

procedure TfrmJanPrincipal.btn07Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn07.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn07.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn07.Enabled := False;
end;

procedure TfrmJanPrincipal.btn08Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn08.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn08.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn08.Enabled := False;
end;

procedure TfrmJanPrincipal.btn09Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn09.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn09.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn09.Enabled := False;
end;

procedure TfrmJanPrincipal.btn10Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn10.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn10.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn10.Enabled := False;
end;

procedure TfrmJanPrincipal.btn11Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn11.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn11.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn11.Enabled := False;
end;

procedure TfrmJanPrincipal.btn12Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn12.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn12.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn12.Enabled := False;
end;

procedure TfrmJanPrincipal.btn13Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn13.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn13.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn13.Enabled := False;
end;

procedure TfrmJanPrincipal.btn14Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn14.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn14.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn14.Enabled := False;
end;

procedure TfrmJanPrincipal.btn15Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn15.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn15.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn15.Enabled := False;
end;

procedure TfrmJanPrincipal.btn16Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn16.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn16.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn16.Enabled := False;
end;

procedure TfrmJanPrincipal.btn17Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn17.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn17.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn17.Enabled := False;
end;

procedure TfrmJanPrincipal.btn18Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn18.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn18.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn18.Enabled := False;
end;

procedure TfrmJanPrincipal.btn19Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn19.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn19.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn19.Enabled := False;
end;

procedure TfrmJanPrincipal.btn20Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn20.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn20.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn20.Enabled := False;
end;

procedure TfrmJanPrincipal.btn21Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn21.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn21.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn21.Enabled := False;
end;

procedure TfrmJanPrincipal.btn22Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn22.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn22.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn22.Enabled := False;
end;

procedure TfrmJanPrincipal.btn23Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn23.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn23.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn23.Enabled := False;
end;

procedure TfrmJanPrincipal.btn24Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn24.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn24.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn24.Enabled := False
end;

procedure TfrmJanPrincipal.btn25Click(Sender: TObject);
begin
     case NumerosClicados of
          0: 
          begin
               edtFixas01.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          1:
          begin
               edtFixas02.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          2:
          begin
               edtFixas03.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          3:
          begin
               edtFixas04.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          4:
          begin
               edtFixas05.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          5:
          begin
               edtFixas06.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          6:
          begin
               edtFixas07.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          7:
          begin
               edtFixas08.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          8:
          begin
               edtFixas09.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          9:
          begin
               edtFixas10.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          10:
          begin
               edtPrim01.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          11:
          begin
               edtPrim02.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          12:
          begin
               edtPrim03.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          13:
          begin
               edtPrim04.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          14:
          begin
               edtPrim05.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          15:
          begin
               edtSeg01.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          16:
          begin
               edtSeg02.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          17:
          begin
               edtSeg03.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          18:
          begin
               edtSeg04.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          19:
          begin
               edtSeg05.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          20:
          begin
               edtTerc01.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          21:
          begin
               edtTerc02.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          22:
          begin
               edtTerc03.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          23:
          begin
               edtTerc04.Text := btn25.Caption;
               NumerosClicados := NumerosClicados + 1;
          end;
          24:
          begin
               edtTerc05.Text := btn25.Caption;
               btnGerarJogos.Enabled := True;
          end;
     end;
     btn25.Enabled := False 
end;



procedure TfrmJanPrincipal.btnGerarJogosClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
               DataJogoGerado := FormatDateTime('DD/MM/YYYY', Date);
          HoraJogoGerado := FormatDateTime('hh:mm:ss', Time);
          if rbtAutomatico.Checked then
          begin
               if NumerosClicados > 0 then
                  NumerosClicados := 0;                  
               LimpaBotoes;
               JogoAleatório;
          end
          else
              if NumerosClicados < 24 then
                 MessageDlg('Jogo manual: Escolha todos os números para continuar!', mtInformation, [mbOK], 0);
                         
          if NumerosClicados = 24 then
          begin
               GeraArrays;
               GeraJogos;
               NumerosClicados := 0;
          end;
          LimpaBotoes;
end;

procedure TfrmJanPrincipal.btnMostrarJogosClick(Sender: TObject);
begin
     frmJogosGerados.Show;
end;

procedure TfrmJanPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Application.Terminate;
end;

procedure TfrmJanPrincipal.FormCreate(Sender: TObject);
begin
     NumerosClicados := 0;     
     frmJanPrincipal.Visible := False;
     frmJanPrincipal.Hide;
     pnlLotofacil.Visible := True;
     gbxNumCombinacoes.Visible := False;
end;

procedure TfrmJanPrincipal.FormShow(Sender: TObject);
begin
     btnGerarJogos.SetFocus;
end;

end.
                            
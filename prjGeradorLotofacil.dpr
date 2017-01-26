program prjGeradorLotofacil;

uses
  Forms,
  frmJanelaPrincipal in '..\frmJanelaPrincipal.pas' {frmJanPrincipal},
  frmJgsGerados in 'frmJgsGerados.pas' {frmJogosGerados},
  frmUltimResult in 'frmUltimResult.pas' {frmUltimoResultado},
  frmConfJogo in 'frmConfJogo.pas' {frmConferirJogo},
  untImprimeVolante in 'untImprimeVolante.pas' {frmImprimirVolante};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;  
  Application.Title := 'Gerador de Jogos da Lotofácil';
  Application.CreateForm(TfrmUltimoResultado, frmUltimoResultado);
  Application.CreateForm(TfrmJanPrincipal, frmJanPrincipal);
  Application.CreateForm(TfrmJogosGerados, frmJogosGerados);
  Application.CreateForm(TfrmConferirJogo, frmConferirJogo);
  Application.CreateForm(TfrmImprimirVolante, frmImprimirVolante);
  Application.Run;




  
end.

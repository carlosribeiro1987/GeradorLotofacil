program prjGeradorLotofacil;

uses
  Forms,
  frmJgsGerados in 'frmJgsGerados.pas' {frmJogosGerados},
  frmUltimResult in 'frmUltimResult.pas' {frmUltimoResultado},
  frmConfJogo in 'frmConfJogo.pas' {frmConferirJogo},
  untImprimeVolante in 'untImprimeVolante.pas' {frmImprimirVolante},
  frmJanelaPrincipal in 'frmJanelaPrincipal.pas' {frmJanPrincipal},
  untSobre in 'untSobre.pas' {frmSobre};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;  
  Application.Title := 'Gerador de Jogos da Lotofácil';
  Application.CreateForm(TfrmUltimoResultado, frmUltimoResultado);
  Application.CreateForm(TfrmJogosGerados, frmJogosGerados);
  Application.CreateForm(TfrmConferirJogo, frmConferirJogo);
  Application.CreateForm(TfrmImprimirVolante, frmImprimirVolante);
  Application.CreateForm(TfrmJanPrincipal, frmJanPrincipal);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.Run;




  
end.

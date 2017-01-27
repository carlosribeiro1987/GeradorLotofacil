object frmSobre: TfrmSobre
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Sobre o Gerador Lotof'#225'cil'
  ClientHeight = 197
  ClientWidth = 361
  Color = 16707296
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gbxSobre: TGroupBox
    Left = 8
    Top = 0
    Width = 345
    Height = 161
    Caption = 'Gerador de jogos da Lotof'#225'cil'
    TabOrder = 0
    OnClick = gbxSobreClick
    object lblSobre: TLabel
      Left = 4
      Top = 16
      Width = 336
      Height = 126
      Alignment = taCenter
      Caption = 
        'Gera, confere e imprime jogos da Lotof'#225'cil'#13#13'Projeto desenvolvido' +
        ' como hobby no Delphi 2010.'#13'Baseado no '#250'ltimo resultado (informa' +
        'do pelo usu'#225'rio),'#13' s'#227'o gerados 4 jogos que podem ser impressos e' +
        #13'salvos para conferir posteriormente.'#13'Distribuido sob a licen'#231'a ' +
        'GPL v3.0. '#13#13'Carlos Ribeiro - 2016'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblLinkGpl: TLabel
      Left = 217
      Top = 100
      Width = 54
      Height = 14
      Cursor = crHandPoint
      Caption = 'GPL v3.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 143
    Top = 165
    Width = 75
    Height = 26
    Caption = 'Fechar'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end

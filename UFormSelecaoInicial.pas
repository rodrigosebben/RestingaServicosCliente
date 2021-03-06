unit UFormSelecaoInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormSelecaoInicial = class(TForm)
    Rectangle1: TRectangle;
    RctContratarProfissional: TRectangle;
    BtnContratarProfissional: TCornerButton;
    RctPrestador: TRectangle;
    BtnPrestadorServico: TCornerButton;
    ImgLogo: TImage;
    RctTenhoCadastro: TRectangle;
    BtnTenhoCadastro: TCornerButton;
    procedure BtnContratarProfissionalClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure BtnTenhoCadastroClick(Sender: TObject);
    procedure BtnPrestadorServicoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSelecaoInicial: TFormSelecaoInicial;

implementation

{$R *.fmx}

uses UFormSelecionaArea, UFormLogin, UFormPesquisaSemLogin;

procedure TFormSelecaoInicial.BtnContratarProfissionalClick(Sender: TObject);
begin

  if FormPesquisaSemLogin=nil then
    Application.CreateForm(TFormPesquisaSemLogin,FormPesquisaSemLogin);
  TFormPesquisaSemLogin.create(self).show;


//  if FormSelecionaArea=nil then
//    Application.CreateForm(TFormSelecionaArea,FormSelecionaArea);
//  TFormSelecionaArea.create(self).show;

end;

procedure TFormSelecaoInicial.BtnPrestadorServicoClick(Sender: TObject);
begin
  ShowMessage('Acesse www.restingaservicos.com.br e baixe nosso aplicativo para se cadastrar como profissional em nossa plataforma.');
//  MessageDlg('Acesse www.restingaservicos.com.br e baixe nosso aplicativo para se cadastrar como profissional em nossa plataforma.',System.UITypes.TMsgDlgType.mtInformation,[System.UITypes.TMsgDlgBtn.mbOK],0);

end;

procedure TFormSelecaoInicial.BtnTenhoCadastroClick(Sender: TObject);
begin
  if Formlogin=nil then
    Application.CreateForm(TFormlogin,Formlogin);
  TFormlogin.create(self).show;
end;

procedure TFormSelecaoInicial.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    key := 0;
    Application.Terminate;
  end;
end;

end.

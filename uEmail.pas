unit uEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ShellApi, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdBaseComponent, IdMessage, Vcl.ExtCtrls,IdAttachmentFile;

type
  TForm1 = class(TForm)
    edtUser: TEdit;
    edtPassword: TEdit;
    edtTo: TEdit;
    edtSubject: TEdit;
    mBody: TMemo;
    Button1: TButton;
    rgHost: TRadioGroup;
    Button2: TButton;
    Button3: TButton;
    edtAnexo: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FPath: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  mail_username: String;
  mail_password: String;
  mail_to: String;
  mail_subject: String;
  mail_body: String;
  mail_anexo: String;

implementation


{$R *.dfm}

procedure SendMail(UserName, Password, totarger, subject, bory,sFile: String; iHost: Integer);
const
  hostGmail = 'smtp.gmail.com';
  hostOutlook = 'smtp.office365.com';
var
  DATA: TIdMessage;
  SMTP: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;

begin

  SMTP := TIdSMTP.Create(nil);
  DATA := TIdMessage.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  SSL.SSLOptions.Method := sslvTLSv1;
  SSL.SSLOptions.Mode := sslmUnassigned;
  SSL.SSLOptions.VerifyMode := [];
  SSL.SSLOptions.VerifyDepth := 0;

  DATA.From.Address := username;
  DATA.Recipients.EMailAddresses := totarger;
  DATA.subject := subject;
  DATA.body.text := bory;

  if not sFile.Trim.IsEmpty then
    TIdAttachmentFile.Create(DATA.MessageParts, sFile);

  SMTP.IOHandler := SSL;

  case iHost of
    0:  SMTP.Host := hostGmail;
    1:  SMTP.Host := hostOutlook;
  end;

  SMTP.Port := 587;
  SMTP.username := username;
  SMTP.password := password;
  SMTP.UseTLS := utUseExplicitTLS;

  SMTP.Connect;
  SMTP.Send(DATA);
  SMTP.Disconnect;

  SMTP.Free;
  DATA.Free;
  SSL.Free;
end;

//procedure SendEmail2;
//var string1,string2:string;
//i:integer;
//begin
//  EmailCorpo.Body.add('=asssunto=');
//  EmailCorpo.Body.add(#13#10);
//  EmailCorpo.Body.add('assuntoopcional.');
//  EmailCorpo.From.Name := 'informação Keylooger : ';
//  EmailCorpo.From.Address := 'eu@eu.com.br';
//  EmailCorpo.Recipients.EMailAddresses :='seuemail@hotmail.com';
//  EmailCorpo.Priority := mpHighest;
//  EmailCorpo.Subject := 'corpo da mesagem';
// TIdAttachment.Create(emailcorpo.MessageParts,TFileName('local onde esta o anexo aqui'));
//  SMTP.Host:='serverSMTP';
//  SMTP.AuthenticationType :=atLogin;
//  SMTP.Port := 25;
//  SMTP.Username:='userSMTP'; //seu login
//  SMTP.Password:='senhaSMTp'; //sua senha
//  SMTP.Connect;
//Try
//  SMTP.Send(EmailCorpo);
//except
//  SMTP.Disconnect;
//  SMTP.Host:='serverSMTP'; // smtp.mail.exemplo.com.br
//  SMTP.AuthenticationType :=atLogin;
//  SMTP.Connect;
//try
//  SMTP.Send(EmailCorpo);
//except
//end;
//  SMTP.Disconnect;
//end;
//  SMTP.Disconnect;
//end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  mail_username := edtUser.Text;
  mail_password := edtPassword.Text;
  mail_subject  := edtSubject.Text;
  mail_to := edtTo.Text;
  mail_body := mBody.Text;

  if not Trim(edtAnexo.Text).IsEmpty then
    mail_anexo := IncludeTrailingPathDelimiter(FPath)+edtAnexo.Text;

  SendMail(mail_username,mail_password, mail_to, mail_subject,mail_body,mail_anexo, rgHost.ItemIndex);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edtUser.Text   := 'xxxx@gmail.com';
  edtPassword.Text := 'xxxxx';
  edtTo.Text := 'xxxxx@hotmail.com';
  rgHost.ItemIndex := 0;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  edtUser.Text   := 'xxxxxx12@hotmail.com';
  edtPassword.Text := 'xxxxxxx';
  edtTo.Text   := 'xxxxxx@gmail.com';
  rgHost.ItemIndex := 1;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
   // ShellApi
   FPath := ExtractFilePath(ParamStr(0));
   ShellExecute(0,'open',PChar(FPath),nil,nil,SW_SHOWNORMAL);
end;



end.

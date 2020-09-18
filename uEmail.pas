unit uEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ShellApi, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdBaseComponent, IdMessage;

type
  TForm1 = class(TForm)
    edtUser: TEdit;
    edtPassword: TEdit;
    edtTo: TEdit;
    edtSubject: TEdit;
    mBody: TMemo;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

implementation


{$R *.dfm}

procedure Gmaio(UserName, Password, totarger, subject, bory: String);
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

  SMTP.IOHandler := SSL;
  SMTP.Host := 'smtp.gmail.com';
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  mail_username := edtUser.Text;
  mail_password := edtPassword.Text;
  mail_subject  := edtSubject.Text;
  mail_to := edtTo.Text;
  mail_body := mBody.Text;



    begin
      Gmaio(mail_username,mail_password, mail_to, mail_subject,mail_body);
    end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
   // ShellApi
   FPath := ExtractFilePath(ParamStr(0));
   ShellExecute(0,'open',PChar(FPath),nil,nil,SW_SHOWNORMAL);
end;



end.

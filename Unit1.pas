unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, jpeg, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnBmp2Jpeg: TButton;
    procedure ConvertBMPtoJPG(SFileName, DFileName: string);
    procedure btnBmp2JpegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnBmp2JpegClick(Sender: TObject);
begin
  ConvertBMPtoJPG('from.bmp', 'to.jpeg');
end;

procedure TForm1.ConvertBMPtoJPG(SFileName, DFileName: string);
Var
  J: TJpegImage;
  I: TBitmap;
  S, D: String;
begin
  S := SFileName;
  D := DFileName;
  J := TJpegImage.Create;
  I := TBitmap.Create;
  I.LoadFromFile(S);
  J.Assign(I);
  I.Free;
  D := changefileext(D, '.jpg');
  J.SaveToFile(D);
  Application.processmessages;
  J.Free;
end;

end.

unit uModal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Threading, Vcl.Imaging.GIFImg, Vcl.ExtCtrls;

type
  TfrmModal = class(TForm)
    btnCancel: TButton;
    imgWait: TImage;
    Label1: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    taskMain: ITask;
    counter: word;
  end;

var
  frmModal: TfrmModal;

implementation

{$R *.dfm}

procedure TfrmModal.btnCancelClick(Sender: TObject);
begin
  taskMain.Cancel;
end;

procedure TfrmModal.FormShow(Sender: TObject);
var
  task: System.Threading.ITask;
begin
  taskMain.Start;
  (imgWait.Picture.Graphic as TGifImage).Animate := true;
  task:=TTask.Create(
    procedure
    begin
      while taskMain.Status = TTaskStatus.Running do
      begin
        Application.ProcessMessages;
      end;
      self.Close;
    end
  );
  task.Start;
end;

end.

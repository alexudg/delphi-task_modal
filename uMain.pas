unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Threading,
  UModal;

type
  TfrmMain = class(TForm)
    btnStart: TButton;
    mmConsole: TMemo;
    btnStop: TButton;
    chkIsModal: TCheckBox;
    procedure mmConsoleClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    _task: System.Threading.ITask;
    _counter: word;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnStartClick(Sender: TObject);
begin
  _task:=TTask.Create(
    procedure
    var
      i: word;
    begin
      _counter:=0;
      for i:=0 to 5000 - 1 do
      begin
        if TTask.CurrentTask.Status = TTaskStatus.Canceled then
        begin
          btnStart.Enabled:=true;
          btnStop.Enabled:=false;
          Exit;
        end;
        Sleep(2);

        if TTask.CurrentTask.Status = TTaskStatus.Running then
        begin
          TThread.Queue(
            TThread.CurrentThread,
            procedure
            begin
              Inc(_counter);
              mmConsole.Lines.Add(_counter.ToString());
            end
          );
        end;
      end;
      mmConsole.Lines.Add('task finalized');
      btnStart.Enabled:=true;
      btnStop.Enabled:=false;
    end
  );
  mmConsole.Lines.Add('task created');
  btnStart.Enabled:=false;
  _task.Start;
  mmConsole.Lines.Add('task started');
  btnStop.Enabled:=true;


  if chkIsModal.Checked then
  begin
    frmModal:=TfrmModal.Create(nil);
    frmModal.taskMain:=_task;
    frmModal.counter:=_counter;
    frmModal.ShowModal;
    FreeAndNil(frmModal);
  end;
end;

procedure TfrmMain.btnStopClick(Sender: TObject);
begin
  if Assigned(_task) then
    _task.Cancel;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(_task) then
  begin
    _task.Cancel;
  end;
end;

procedure TfrmMain.mmConsoleClick(Sender: TObject);
begin
  mmConsole.Clear;
end;

end.

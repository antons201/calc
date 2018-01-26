unit Calc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, LResources, numbers;

type

  { TFCalc }

  TFCalc = class(TForm)
    Num1: TButton;
    Pole: TEdit;
    MemC: TButton;
    MemR: TButton;
    Back: TButton;
    ClearE: TButton;
    Num0: TButton;
    point: TButton;
    Clear: TButton;
    Minus: TButton;
    Plus: TButton;
    MemS: TButton;
    Num2: TButton;
    multiply: TButton;
    Divizh: TButton;
    PlusMinus: TButton;
    MemPl: TButton;
    Result: TButton;
    OneX: TButton;
    percent: TButton;
    root: TButton;
    MemMi: TButton;
    Num3: TButton;
    Num4: TButton;
    Num5: TButton;
    Num6: TButton;
    Num7: TButton;
    Num8: TButton;
    Num9: TButton;
    procedure BackClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure ClearEClick(Sender: TObject);
    procedure DivizhClick(Sender: TObject);
    procedure MemCClick(Sender: TObject);
    procedure MemMiClick(Sender: TObject);
    procedure MemPlClick(Sender: TObject);
    procedure MemRClick(Sender: TObject);
    procedure MemSClick(Sender: TObject);
    procedure MinusClick(Sender: TObject);
    procedure multiplyClick(Sender: TObject);
    procedure OneXClick(Sender: TObject);
    procedure PlusClick(Sender: TObject);
    procedure PlusKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure PlusMinusClick(Sender: TObject);
    procedure PoleChange(Sender: TObject);
    procedure PoleKeyPress(Sender: TObject; var Key: char);
    procedure percentClick(Sender: TObject);
    procedure ResultClick(Sender: TObject);
    procedure rootClick(Sender: TObject);
    procedure pointClick(Sender: TObject);
    procedure unlockKeys();
    procedure lockKeys();
    procedure NumClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FCalc: TFCalc;
  a, b, c, d, per, zn, rez, h, zn2, viz: real;

implementation

{$R *.lfm}

{ TFCalc }

procedure TFCalc.unlockKeys();
begin
  Divizh.Enabled := True;
  Plus.Enabled := True;
  multiply.Enabled := True;
  OneX.Enabled := True;
  percent.Enabled := True;
  root.Enabled := True;
  Minus.Enabled := True;
  PlusMinus.Enabled := True;
  MemC.Enabled := True;
  MemR.Enabled := True;
  MemS.Enabled := True;
  MemPl.Enabled := True;
  MemMi.Enabled := True;
  point.Enabled := True;
end;

procedure TFCalc.lockKeys();
begin
  Divizh.Enabled := False;
  Plus.Enabled := False;
  multiply.Enabled := False;
  OneX.Enabled := False;
  percent.Enabled := False;
  root.Enabled := False;
  Minus.Enabled := False;
  PlusMinus.Enabled := False;
  MemC.Enabled := False;
  MemR.Enabled := False;
  MemS.Enabled := False;
  MemPl.Enabled := False;
  MemMi.Enabled := False;
  point.Enabled := False;
end;

procedure TFCalc.NumClick(Sender: TObject);
begin
  if per = 1 then
  begin
    Pole.Text := (Sender as TButton).Caption;
    unlockKeys();
  end
  else
  if Pole.Text = FloatToStr(0) then
    Pole.Text := (Sender as TButton).Caption
  else
    Pole.Text := Pole.Text + (Sender as TButton).Caption;
  per := 0;
end;

procedure TFCalc.MinusClick(Sender: TObject);
begin
  h := 0;
  if zn > 0 then
  begin
    b := StrToFloat(Pole.Text);
    if zn = 1 then
      rez := a + b;
    if zn = 2 then
      rez := a - b;
    if zn = 3 then
      rez := a * b;
    if zn = 4 then
      if B <> 0 then
        rez := a / b;
    a := rez;
    if (b = 0) and (zn = 4) then
    begin
      Pole.Text := 'Деление на 0 невозможно';
      per := 1;
      zn := 0;
      lockKeys();
    end
    else
      Pole.Text := FloatToStr(rez);
    zn := 2;
    per := 1;
  end
  else
  begin
    a := StrToFloat(Pole.Text);
    zn := 2;
    per := 1;
  end;
end;

procedure TFCalc.DivizhClick(Sender: TObject);
begin
  h := 0;
  if zn > 0 then
  begin
    b := StrToFloat(Pole.Text);
    if zn = 1 then
      rez := a + b;
    if zn = 2 then
      rez := a - b;
    if zn = 3 then
      rez := a * b;
    if zn = 4 then
      if B <> 0 then
        rez := a / b;
    a := rez;
    zn := 4;
    if (b = 0) and (zn = 4) then
    begin
      Pole.Text := 'Деление на 0 невозможно';
      per := 1;
      zn := 0;
      lockKeys();
    end
    else
      Pole.Text := FloatToStr(rez);
    per := 1;
  end
  else
  begin
    a := StrToFloat(Pole.Text);
    zn := 4;
    per := 1;
  end;
end;

procedure TFCalc.MemCClick(Sender: TObject);
begin
  Viz := 0;
end;

procedure TFCalc.MemMiClick(Sender: TObject);
begin
  Viz := viz - StrToFloat(Pole.Text);
  per := 1;
end;

procedure TFCalc.MemPlClick(Sender: TObject);
begin
  Viz := viz + StrToFloat(Pole.Text);
  per := 1;
end;

procedure TFCalc.MemRClick(Sender: TObject);
begin
  Pole.Text := FloatToStr(viz);
  per := 1;
end;

procedure TFCalc.MemSClick(Sender: TObject);
begin
  viz := StrToFloat(Pole.Text);
  per := 1;
end;

procedure TFCalc.ClearClick(Sender: TObject);
begin
  Pole.Clear;
  Pole.Text := FloatToStr(0);
  a := 0;
  b := 0;
  per := 0;
  zn := 0;
  rez := 0;
  h := 0;
  zn2 := 0;
  unlockKeys();
end;

procedure TFCalc.BackClick(Sender: TObject);
var
  uda: string;
begin
  if (Pole.Text = 'Деление на 0 невозможно') or (Pole.Text = 'Неверные данные') then
  begin
    Pole.Text := FloatToStr(0);
    unlockKeys();
  end;
  if per = 1 then
    Pole.Text := Pole.Text
  else
  if (StrToFloat(Pole.Text) <> 0) and ((StrToFloat(Pole.Text) > -1) or
    (StrToFloat(Pole.Text) < -9)) then
  begin
    uda := Pole.Text;
    Delete(uda, length(uda), 1);
    if length(uda) = 0 then
      Pole.Text := FloatToStr(0)
    else
      Pole.Text := uda;
  end
  else
    Pole.Text := FloatToStr(0);
end;

procedure TFCalc.ClearEClick(Sender: TObject);
begin
  h := 0;
  Pole.Clear;
  Pole.Text := FloatToStr(0);
  unlockKeys();
end;

procedure TFCalc.multiplyClick(Sender: TObject);
begin
  H := 0;
  if zn > 0 then
  begin
    b := StrToFloat(Pole.Text);
    if zn = 1 then
      rez := a + b;
    if zn = 2 then
      rez := a - b;
    if zn = 3 then
      rez := a * b;
    if zn = 4 then
      if B <> 0 then
        rez := a / b;
    a := rez;
    if (b = 0) and (zn = 4) then
    begin
      Pole.Text := 'Деление на 0 невозможно';
      per := 1;
      zn := 0;
      lockKeys();
    end
    else
      Pole.Text := FloatToStr(rez);
    zn := 3;
    per := 1;
  end
  else
  begin
    a := StrToFloat(Pole.Text);
    zn := 3;
    per := 1;
  end;
end;

procedure TFCalc.OneXClick(Sender: TObject);
begin
  if StrToFloat(Pole.Text) <> 0 then
    Pole.Text := FloatToStr(1 / StrToFloat(Pole.Text))
  else
  begin
    Pole.Text := 'Деление на 0 невозможно';
    lockKeys();
    per := 1;
  end;
end;

procedure TFCalc.PlusClick(Sender: TObject);
begin
  H := 0;
  if zn > 0 then
  begin
    b := StrToFloat(Pole.Text);
    if zn = 1 then
      rez := a + b;
    if zn = 2 then
      rez := a - b;
    if zn = 3 then
      rez := a * b;
    if zn = 4 then
      if B <> 0 then
        rez := a / b;
    a := rez;
    if (b = 0) and (zn = 4) then
    begin
      Pole.Text := 'Деление на 0 невозможно';
      per := 1;
      zn := 0;
      lockKeys();
    end
    else
      Pole.Text := FloatToStr(rez);
    zn := 1;
    per := 1;
  end
  else
  begin
    a := StrToFloat(Pole.Text);
    zn := 1;
    per := 1;
  end;
end;

procedure TFCalc.PlusKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin

end;

procedure TFCalc.PlusMinusClick(Sender: TObject);
var
  dell: string;
begin
  if StrToFloat(Pole.Text) > 0 then
    Pole.Text := '-' + Pole.Text
  else
  begin
    dell := Pole.Text;
    Delete(dell, 1, 1);
    Pole.Text := dell;
    per := 1;
  end;
end;

procedure TFCalc.PoleChange(Sender: TObject);
begin

  if Pole.Text = '' then
    Pole.Text := FloatToStr(0);
end;

procedure TFCalc.PoleKeyPress(Sender: TObject; var Key: char);
begin
  if (Pole.Text = 'Деление на 0 невозможно') or (Pole.Text = 'Неверные данные') then
    key := #0
  else
  begin
    Key := TrueFloatKeys(key, Pole.Text);
  end;
end;

procedure TFCalc.percentClick(Sender: TObject);
begin
  if a = 0 then
    Pole.Text := FloatToStr(0)
  else
    Pole.Text := FloatToStr(a * 0.01 * StrToFloat(Pole.Text));
  per := 1;
end;

procedure TFCalc.ResultClick(Sender: TObject);
begin
  h := 0;
  if (Pole.Text = 'Деление на 0 невозможно') or (Pole.Text = 'Неверные данные') then
  begin
    Pole.Text := FloatToStr(0);
    unlockKeys();
  end;
  if zn = 0 then
  begin
    a := StrToFloat(Pole.Text);
    if zn2 = 1 then
      rez := a + b;
    if zn2 = 2 then
      rez := a - b;
    if zn2 = 3 then
      rez := a * b;
    if zn2 = 4 then
      rez := a / b;
    Pole.Text := FloatToStr(rez);
  end;
  if zn > 0 then
  begin
    b := StrToFloat(Pole.Text);
    if zn = 1 then
      rez := a + b;
    if zn = 2 then
      rez := a - b;
    if zn = 3 then
      rez := a * b;
    if zn = 4 then
      if B <> 0 then
        rez := a / b;
    a := rez;
    if (b = 0) and (zn = 4) then
    begin
      Pole.Text := 'Деление на 0 невозможно';
      per := 1;
      zn := 0;
      lockKeys();
    end
    else
      Pole.Text := FloatToStr(rez);
    zn2 := zn;
    zn := 0;
    per := 1;
  end
  else
  begin
    a := StrToFloat(Pole.Text);
    zn := 0;
    per := 1;
  end;

end;

procedure TFCalc.rootClick(Sender: TObject);
begin
  if Pole.Text = 'Неверные данные' then
    per := 0
  else
  if StrToFloat(Pole.Text) < 0 then
  begin
    Pole.Text := 'Неверные данные';
    lockKeys();
  end
  else
    Pole.Text := FloatToStr(sqrt(StrToFloat(Pole.Text)));
  per := 1;
end;

procedure TFCalc.pointClick(Sender: TObject);
var
  i: integer;
begin
  if per = 1 then
    Pole.Text := ('0,')
  else
  begin
    for i := 1 to length(Pole.Text) do
      if Pole.Text[i] = (',') then
        h := 1;
    if h <> 1 then
      Pole.Text := Pole.Text + (',');
  end;
  per := 0;
end;

end.

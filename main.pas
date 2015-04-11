program SimpleStack;

uses 
    crt;

type
    TNodePointer = ^TNode;
    TNode = record
        Item : integer;
        Next : TNodePointer;
    end;

var
    Top: TNodePointer;
    Option : integer;

function isEmpty(Top : TNodePointer) : boolean;

begin
    isEmpty := false;
    if (Top = nil) then
        isEmpty := true;
end;

function isOneList(Top : TNodePointer) : boolean;

begin
    isOneList := false;
    if (Top^.Next = nil) then
        isOneList := true;
end;

procedure Initialize(var Top : TNodePointer);

begin
    Top := nil;
end;

procedure MainMenu(var Option : integer);

begin
    write('+------------------------------------------------------------------------------+');
    write('|                     | [1] Push | [2] Pop | [0] Exit |                        |');
    write('+------------------------------------------------------------------------------+');
    write('|                     | Choose one :                  |                        |');
    write('+------------------------------------------------------------------------------+');
    gotoxy(38, 4);
    readln(Option);
    writeln;
end;

begin
    Initialize(Top);
    clrscr;
    MainMenu(Option);
    readln;
end.

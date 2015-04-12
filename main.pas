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

function Empty(Top : TNodePointer) : boolean;

begin
    Empty := false;
    if (Top = nil) then
        Empty := true;
end;

function OneList(Top : TNodePointer) : boolean;

begin
    OneList := false;
    if (Top^.Next = nil) then
        OneList := true;
end;

procedure Initialize(var Top : TNodePointer);

begin
    Top := nil;
end;

procedure MainMenu;

begin
    write('+------------------------------------------------------------------------------+');
    write('|                     | [1] Push | [2] Pop | [0] Exit |                        |');
    write('+------------------------------------------------------------------------------+');
    write('|                     | Choose one :                  |                        |');
    write('+------------------------------------------------------------------------------+');
    writeln;
end;

procedure PushMenu;

begin
    write('+------------------------------------------------------------------------------+');
    write('|                     |    Please input number only   |                        |');
    write('+------------------------------------------------------------------------------+');
    write('|                     |    Item :                     |                        |');
    write('+------------------------------------------------------------------------------+');
    writeln;
end;

procedure PopHistory(Item : integer);

begin
    write('+------------------------------------------------------------------------------+');
    write('|                     Item Pop : ', Item);
    gotoxy(80, 2);
    write('|');
    write('+------------------------------------------------------------------------------+');
    writeln;
end;

procedure ShowList(Top : TNodePointer);

var 
    Assist : TNodePointer;

begin
    write('+------------------------------------------------------------------------------+');
    if (Top = nil) then
    begin
        write('                                    | / |                                       ');
        write('                                     Top                                        ');
    end
    else
    begin
        Assist := Top;
        writeln('Top');
        while (Assist <> nil) do
        begin
            write(Assist^.Item, ' -> ');
            Assist := Assist^.Next;
        end;
        writeln('nil');
    end;
    write('+------------------------------------------------------------------------------+');
end;

procedure Push(var Top : TNodePointer; Item : integer);

var
    NewNode: TNodePointer;

begin
    New(NewNode);
    NewNode^.Item := Item;
    NewNode^.Next := Top;
    Top := NewNode;
end;

procedure Pop(var Top : TNodePointer; var Item : integer);

var
    DeletedNode: TNodePointer;

begin
    DeletedNode := Top;
    Item := DeletedNode^.Item;
    if (not OneList(Top)) then
    begin
        Top := Top^.Next;
    end
    else
    begin
        Top := nil;
    end;
    Dispose(DeletedNode);
end;

procedure ActionFor(Option : integer; var Top : TNodePointer);

var
    Item: integer;

begin
    case Option of
        1 : begin
                clrscr;
                PushMenu;
                gotoxy(35, 4);
                readln(Item);
                Push(Top, Item);
                ShowList(Top);
                readln;
            end;
        2 : begin
                clrscr;
                if (not Empty(Top)) then
                begin
                    Pop(Top, Item);
                    PopHistory(Item);
                    ShowList(Top);
                end
                else
                begin
                    writeln('Empty List');
                end;
                readln;
            end;
    end;
end;

begin
    Initialize(Top);
    repeat
        clrscr;
        MainMenu;
        ShowList(Top);
        gotoxy(38, 4);
        readln(Option);
        ActionFor(Option, Top);
    until Option = 0;
end.

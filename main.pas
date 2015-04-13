program SimpleStack;
{I.S : Memilih menu yang diinginkan}
{F.S : Menghasilkan menu yang dipilih}

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
{I.S : Harga Top sudah di definisikan}
{F.S : Menghasilkan nilai benar atau salah}

begin
    Empty := false;
    if (Top = nil) then
        Empty := true;
end;

function OneList(Top : TNodePointer) : boolean;
{I.S : Harga Top sudah di definisikan}
{F.S : Menghasilkan nilai benar atau salah}

begin
    OneList := false;
    if (Top^.Next = nil) then
        OneList := true;
end;

procedure Initialize(var Top : TNodePointer);
{I.S : Harga Top sudah di definisikan}
{F.S : Menghasilkan Top dengan nilai Nil}

begin
    Top := nil;
end;

procedure MainMenu;
{I.S : Parameter sembarang}
{F.S : Menghasilkan tampilan menu utama}

begin
    write('+------------------------------------------------------------------------------+');
    write('|                     | [1] Push | [2] Pop | [0] Exit |                        |');
    write('+------------------------------------------------------------------------------+');
    write('|                     | Choose one :                  |                        |');
    write('+------------------------------------------------------------------------------+');
    writeln;
end;

procedure PushMenu;
{I.S : Parameter sembarang}
{F.S : Menghasilkan tampilan menu push}

begin
    write('+------------------------------------------------------------------------------+');
    write('|                     |    Please input number only   |                        |');
    write('+------------------------------------------------------------------------------+');
    write('|                     |    Item :                     |                        |');
    write('+------------------------------------------------------------------------------+');
    writeln;
end;

procedure PopHistory(Item : integer);
{I.S : Parameter sembarang}
{F.S : Menghasilkan tampilan history pop}

begin
    write('+------------------------------------------------------------------------------+');
    write('|                     Item Pop : ', Item);
    gotoxy(80, 2);
    write('|');
    write('+------------------------------------------------------------------------------+');
    writeln;
end;

procedure ShowList(Top : TNodePointer);
{I.S : Harga Top sudah didefinisikan}
{F.S : Menampilkan list}

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
{I.S : Harga Top dan Item sudah didefinisikan}
{F.S : Menambahkan item ke dalam list}

var
    NewNode: TNodePointer;

begin
    New(NewNode);
    NewNode^.Item := Item;
    NewNode^.Next := Top;
    Top := NewNode;
end;

procedure Pop(var Top : TNodePointer; var Item : integer);
{I.S : Harga Top dan Item sudah didefinisikan}
{F.S : Menghapus item dari list}

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

procedure DestroyList(var Top : TNodePointer);
{I.S : Harga Top sudah didefinisikan}
{F.S : Melakukan penghancuran pada list}

var
    DeletedNode: TNodePointer;

begin
    DeletedNode := Top;
    while (DeletedNode <> nil) do
    begin
        Top := Top^.Next;
        Dispose(DeletedNode);
        DeletedNode := Top;
    end;
end;

procedure ActionPush(var Top : TNodePointer);
{I.S : Harga Top sudah didefinisikan}
{F.S : Melakukan aksi push}

var
    Item: integer;

begin
    clrscr;
    PushMenu;
    gotoxy(35, 4);
    readln(Item);
    Push(Top, Item);
    ShowList(Top);
    readln;
end;

procedure ActionPop(var Top : TNodePointer);
{I.S : Harga Top sudah didefinisikan}
{F.S : Melakukan aksi pop}

var
    Item: integer;

begin
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

procedure ActionFor(Option : integer; var Top : TNodePointer);
{I.S : Harga Option dan Top sudah didefinisikan}
{F.S : Melakukan aksi pada menu utama}

begin
    case Option of
        1 : ActionPush(Top);
        2 : ActionPop(Top);
        0 : DestroyList(Top);
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

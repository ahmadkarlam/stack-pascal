program SimpleStack;

type
    TNodePointer: ^TNode;
    TNode : record
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

begin
    Initialize(Top);
end.

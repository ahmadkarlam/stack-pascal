program SimpleStack;

type
    TNodePointer: ^TNode;
    TNode : record
        Item : integer;
        Next : TNodePointer;
    end;

var
    Top: TNodePointer;

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

begin
    {} 
end.

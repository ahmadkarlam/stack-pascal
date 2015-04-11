program SimpleStack;

type
	TNodePointer: ^TNode;
	TNode : record
		Item : integer;
		Next : TNodePointer;
	end;

var
	Top: TNodePointer;

begin
	{} 
end.

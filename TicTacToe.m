clear; clc;

bsize = input("Size of Board = ");
board = zeros(bsize, bsize);
turn = 1;
showboard(board);
while 1
    while 1
        tickpos = input(FriendlyName(turn)+": ");
        try
            if(board(tickpos(1),tickpos(2))==0)
                board(tickpos(1),tickpos(2))=turn;
                break;
            end
        catch
        end
    end
    showboard(board);
    if ~ismember(0,board)
        disp("Draw.");
        break;
    end
    if Eval(board)~=0
        disp("Player"+FriendlyName(turn)+" wins.");
        break;
    end
    turn=turn*-1;
end

function e = Eval(b)
w1=EvalSide(b>0);
w2=EvalSide(b<0); 
e=w1-w2;
end

function e = EvalSide(b)
bsz=size(b,1);
c=sum(b,1);
r=sum(b,2);
d1=sum(b.*diag(ones(bsz,1)),"all");
d2=sum(b.*flip(diag(ones(bsz,1))),"all");
e=max([r',c,d1,d2])>=bsz;
end

function showboard(board)
clc; disp(FriendlyBoard(board));
end

function board = FriendlyBoard(board)
board = arrayfun(@(x) FriendlyName(x),board);
end

function name = FriendlyName(num)
switch num
    case 1; name = "X";
    case -1; name = "O";
    otherwise; name = "";
end
end
clear all;
clc;

tol=0.0001
g=input("Enter the manipulated function g(x) from f(x)= ");
d=input("Enter the initial guess= ");

for i=1:1:100
    c=g(d);
    fprintf("\n Iteration (%d) : \t x(%d)=%f",i,i,c);
    if(abs(c-d)<tol)
        break;
    else
        d=c;
    end
end
fprintf("\n Total Number of iterations %d\n Root is %f",i,c);

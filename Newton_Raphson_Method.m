clear all;
clc;

f=input("Enter the function: ");
%for derivative of function, use symbolic
syms x;
%g will store the derivative of the function f wrt x
g=diff(f,x);

tol=0.00001;

%find the interval where the IVT holds

for i=-10:1:10
    fprintf("\n f(%d) = %f \t f(%d) = %f ",i,f(i),i+1,f(i+1));
    if(f(i)*f(i+1)<0)
        fprintf("Root of equation lies in interval [%d,%d]",i,i+1);
        break;
    end
end

%take value closer to 0
if f(i)<f(i+1) 
    d=i;
else
    d=i+1;
end

for i=1:1:100
    a=d-(f(d)/subs(g,d));
    fprintf("\n Iteration %d : x(%d)= %f",i,i,a);
    if(abs(f(a))<tol)
        break;
    else
        d=a;
    end
end

fprintf("\n The root is %f and no of iterations are %d ",a,i);

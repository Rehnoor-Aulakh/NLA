format short;
clear all;
clc;

f=input("Enter a function f(x)= ");
%finding the initial interval
for i=-10:1:10
    a=i;
    b=a+1;
    fprintf("\n f(%d)=%f \t f(%d)=%f",a,f(a),b,f(b));
    if(f(a)*f(b)<0)
        fprintf("\nRoot lies in interval [%d , %d]\n",a,b);
        break
    end
end

tol=0.0001;

for i=1:1:100
     %finding the mid point,
     m=(a+b)/2;
     fprintf("\n Here f(%f)=%f\n",m,f(m));
     if(f(m)*f(a)<0)
         %change the interval j
         b=m;
         fprintf("Iteration %d a=%f and b=%f\n",i,a,b);
     else
         a=m;
         fprintf("Iteration %d a=%f and b=%f\n",i,a,b);
     end
     %now check for tolerance
     if(abs(a-b)<tol)
        break
     end
end

fprintf("\nThe root is approximately= %f and number of iterations are %d\n",a,i);

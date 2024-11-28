format short
clear all

%Input the Matrix A, which should be diagonal dominant
A = [27 6 -1; 6 15 2; 1 1 54];

%Input RHS
b = [85; 72; 110];

max_error = 1e-5;
 
%We will take the initial guess as all zeros
x=zeros(1,size(A,1));

err=Inf;    %We need to minimize the error, set initial error as HIGH

itr=0;

while all(err>max_error)
       %Preserve the old values of x
       x_old=x;
       for i=1:size(A,1)
           sum=0;
           for j=1:i-1
               sum=sum+A(i,j)*x(j);
           end
           for j=i+1:size(A,1)
               sum=sum+A(i,j)*x_old(j);
           end
           x(i)=(1/A(i,i))*(b(i)-sum); 
       end 
       itr=itr+1; 
       y(itr,:)=x;
       err=abs(x_old-x);
end

fprintf("Number of iterations is %d\n",itr);
disp(x);



format short    %Display upto 4 digits
clear all       %clear all the stored variables

%Input the matrix
A=[15 3 -2; 2 10 1; 1 -2 8];

b=[85; 51; 5];    %RHS of the system

%Set the tolerance
max_error = 1e-5;

%Take the initial guess as all zeros for all the rows of A Matrix

x= zeros(1,size(A,1));

n=(size(A,1));  %Number of variables

err=Inf;    %Initialize Error as HIGH

itr=0;      %Set iteration counter as zero

while all(err>max_error)
    %preserve the previous value of x
    x_old=x;
    for i=1:n
        sum=0;          %Initialize sum=0
        for j=1:n
            if j~=i     %Leave ith variable
                sum=sum+A(i,j)*x_old(j);    %Compute total
            end
        end
        x(i)=(1/A(i,i))*(b(i)-sum);      %Jacobi Method Updation
    end
    itr=itr+1;
    y(itr,:)=x;
    err=abs(x_old-x); 
end

fprintf("Method Converges in %d Iterations\n",itr);
disp(x);

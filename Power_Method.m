format short;
clear all;
clc;

%Input Matrix A
A = [2 -1 0; -1 2 -1; 0 -1 2];

%Initial Eigen Vector
x = [1 ; 1 ; 1];

choice=menu('Pick the choice','Largest','Smallest');

if choice==1
    B=A;
else
    B=inv(A);
end

iter=1;
max_error = 1e-2;
err=Inf;
lambda=Inf;

fprintf("     Iter    Eigen Value \t Eigen Vector \n");
fprintf('    ---------------------------------------------- \n');

while all(err>max_error)
    %Preserve the old x for updating the error
    x_old=x;
    Y=B*x;
    eigen_value=max(abs(Y));
    eigen_vector=Y./eigen_value;
    x=eigen_vector;
    err=abs(sum(x_old-x));
    lambda=eigen_value;
    disp([iter lambda x']); 
    iter=iter+1;
end

fprintf("Method converges in %d iteration\n",iter-1);
fprintf('------------------------------------------- \n');

if choice==1
    fprintf("The greatest eigen value is %5.5f\n",lambda);
else
    fprintf("The smallest eigen value is %5.5f\n",1/lambda);
end

disp("The corresponding eigenvector is: ");
fprintf("\t %5.5f \n",x);

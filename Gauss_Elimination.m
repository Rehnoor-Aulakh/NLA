%Given Matrix A
Info=[6 3 2; 6 4 3; 20 15 12];
b=[6; 0 ;0];%RHS
%Augmented form of the matrix
A=[Info b];    % [A|b]
disp("Number of rows in A: ");
rows=size(A,1);
disp(rows);
disp("Number of cols in A(one col extra for b): ");
cols=size(A,2);
disp(cols);
disp("-----------------------Initially--------------------");
disp(A);

for i=1:rows
    for j=i+1:rows
        key=A(j,i)./A(i,i);
        A(j,:)=A(j,:)-key*A(i,:);
    end
end

disp("------------After Gauss Elimitaion Algorithm---------");
disp(A);

%Now forming the X Matrix, which has the size of columns of Info
%This creates the row vector all initialized to zero
x=zeros(1,size(Info,2));

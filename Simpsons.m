f=input("Enter a function: ");      %@(x)(1./(1+x.^2))

a=input("Enter the lower limit: "); %0

b=input("Enter the upper limit: "); %6

%define number of sub intervals
n=input("Enter the number of sub intervals: ");     %6

if(mod(n,2)~=0)
    error("Number of sub intervals must be even for Simpson's Rule");
end

%calculate the step size

h=(b-a)/n;

%create the x values
x=a:h:b

%evaluate the function at x values

y=f(x)

%initialize the sum

sum=0;

%Applying trapezoidal rule

integral_value=(h/3)*(y(1) + 4 * sum(y(2:2:end-2)) + 2 * sum(y(3:2:end-1)) + y(end));

%display the result

fprintf("The Integral value using Simpson's Rule is %f",integral_value);







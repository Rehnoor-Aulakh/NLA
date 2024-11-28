%defining the function

f=input("Enter the function: ");    %@(x)(x.^2+2*x+1)./(1+(1+x).^4)

a=input("Enter the lower limit of the function: ");     %0

b=input("Enter the upper limit of the function: ");     %2

if(a~=-1 && b~=-1)
    %x=0.5*(b-a)*u+0.5*(b+a);
    f_u=@(u)f(0.5*(b-a)*u+0.5*(b+a))*0.5*(b-a);
else
    f_u=f;
end

%Number of gauss points

n=input("Enter the value of n: ");

if(n==2)
    g_points=[-0.577350,0.577350];
    w_points=[1,1];

elseif(n==3)
    g_points=[-0.774596,0,0.774596];
    w_points=[0.555556,0.888889,0.555556];
else
    error("only n=2 or n=3 are supported");
end

f_mapping=f_u(g_points);

I=sum(w_points.*f_mapping);

disp("Gauss approximation: ");
disp(I);


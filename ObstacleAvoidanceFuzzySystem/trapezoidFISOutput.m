function trapezoidFISOutput(lowerbound,a,c,d,b,upperbound)

global OUTPUT mu_OUTPUT;

alfa=1; 
X1=lowerbound:0.001:a-0.001; 
X2=a:0.001:c-0.001;
X3=c:0.001:d-0.001;
X4=d:0.001:b-0.001;
X5=b:0.001:upperbound;

mu_X1=zeros(size(X1));
mu_X2=alfa*(X2-a)/(c-a);
mu_X3=alfa*ones(size(X3));
mu_X4=alfa*(X4-b)/(d-b);
mu_X5=zeros(size(X5));

OUTPUT=[X1 X2 X3 X4 X5];
mu_OUTPUT=[mu_X1 mu_X2 mu_X3 mu_X4 mu_X5];

plot(OUTPUT,mu_OUTPUT)

end
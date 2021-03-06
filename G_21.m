x0=[214.32908  216.75206  220.99609  229.1128   237.68936  236.98756  250.05724  251.82675  271.19394  286.80406  290.3843   292.31283    306.92742  315.40872  304.18767  288.85728  294.89671  304.66277   297.35406  298.37614  275.57369  280.34786  258.26847  255.24713   261.63943  264.76963  257.7866   251.8583   256.36862  260.36465   257.52035  252.84034  251.23905  246.71948  248.56202  245.16896   251.0069   250.65409  254.79536  256.5768   258.10295  251.94157 247.31301  244.24754  248.6344   247.53844  247.21967  247.07152   237.73298  220.76352];
n=length(x0);
x1=cumsum(x0);
a_x0=diff(x0);
a_x0=[0,a_x0];
for i=2:n
   z(i)=0.5*(x1(i)+x1(i-1));
end
B=[-x0(2:end)',-z(2:end)',ones(n-1,1)];
Y=a_x0(2:end)';
u=B\Y
x=dsolve('D2x+a1*Dx+a2*x=b','x(0)=c1,x(5)=c2'); x=subs(x,{'a1','a2','b','c1','c2'},{u(1),u(2),u(3),x1(1),x1(6)}); 
yuce=subs(x,'t',0:n-1);
yuce=eval(yuce)
digits(6),x=vpa(x);
x0_hat=[yuce(1),diff(yuce)];
epsilon=x0-x0_hat;
delta=abs(epsilon./x0);
hold on;
xx=1:n;
plot(xx,x0);
plot(xx,x0_hat);
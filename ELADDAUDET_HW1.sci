clear;
clc;
clf;
disp("PART 1");

disp("question 1");

x=2.5;y=-2e-3;z=%pi;
disp("x+y is: " + string(x+y));
disp("x-y is: " + string(x-y))
disp("x*y is: " + string(x*y))
disp("x/y is: " + string(x/y))
disp("x+z is: " + string(x+z))
disp("x*z is: " + string(x*z))
disp("y-z is: " + string(y-z))
disp("y/z is: " + string(y/z))

disp("question 2");
//I used a function to make work easier but if you want each steps
// a) disp((.5)*(.5)-(2*(.5)*cos(%pi/5))+1);
// b) disp((9.5)*(9.5)-(2*(9.5)*cos(%pi/5))+1);
// a) disp(1*1-(2*1*cos(%pi/5))+1);
function[s]=trig(s)
   s= s*s-(2*s*cos(%pi/5))+1;
endfunction
disp("a)"+string(trig(.5)));
disp("b)"+string(trig(9.5)));
disp("c)"+string(trig(1)));

disp("question 3");
x=2+3*%i;
y=1-%i;
disp("x*y is: " + string(x*y));
disp("x/y is: " + string(x/y));

disp("question 4");
a=2.3;b=-2.3;c=%pi/2;x=2/%pi;y=sqrt(3);
disp("a) a^2+bc+x is: " + string((a^2)+b*c+x));
disp("b) sin(c)+y/c is: " + string(sin(c)+y/c));
disp("c) (a+c)/(x+y) is: " + string((a+c)/(x+y)));
disp("d) 1/(cos(c)+in(x)) is: " + string(1/(cos(c)+ log(x)/log(exp(1)))));
disp("e) ((a+c)^3)/b is: " + string(((a+c)^3)/b));

disp("question 5");
disp("sin^-1(0.5) is: " + string(asin(0.5)));
x=0.5;
disp("(sin(sin^-1(x)))-x is: " + string((sind(asind(x)))-x));
O=%pi/3;
disp("(sin(sin^-1(O)))-O is: " + string((sin(asin(O)))-O)+" when O=pi/3");
O=(5*%pi)/11;
disp("(sin(sin^-1(O)))-O is: " + string((sin(asin(O)))-O)+" when O=(5*pi)/11");

disp("PART 2");

disp("question 1");
m=[0 1 2 3 4 5 6 7 8 9];
disp(m);
disp(m(6));
disp(m(6:8));
y=m(6:8)+3;
disp(y);
n=[9 8 7 6 5 4 3 2 1 0];
disp(m+n);

disp("question 2");
x=[0 0.5 1 1.3 1.6 2 2.3 2.6 3 3.3 3.6 4 4.3 4.6 5 6 8 13 18];
y=(x.*(1/2))-3;
disp(y);
y= ((exp(x.*(2/3))).*4)+2
disp(y)
y=((x.*3).^2)+(x.*2)+6;
disp(y);
y=sin(x);
disp(y);
y=sin(x).*(cos(x));
disp(y);

disp("question 3");
mx=[1 2 3 4; 2 4 6 8; 1 3 5 7; 8 6 4 2];
disp(mx);
disp(mx(:,2));
disp(mx(3,:));
disp(mx(length(mx):length(mx)));
disp(mx(3,2));

disp("question 4");
disp(1:10);
disp(10:-1:1);
disp(2:2:20);
disp(.1:.1:1);
disp(4:-.5:.5);

disp("question 5");
a=[5 3 1; 3 4 2; 1 2 3];
b=[1 0 1; 0 1 1; 1 1 0];
c=[1 2 3; 3 2 1];
x=[1;-1;1];
y=[3 -1 2];

disp("A) ");
disp(a*b);
disp(a*c');
disp(c*b);
disp(a*x);
disp(a*y');
disp(c*x);
disp(y*b);
disp(x*y);
disp(y*x);

disp("B)");
d=[c;y];
disp(d);

disp("C)");
disp(a\x);
disp(b\(y'));

disp("D)");
disp("  BC can not be solved");
disp("  Ay can not be solved");
disp("  xx can not be solved");
disp("  A+C can not be solved");

disp("E)");
disp(((-3/5).*a(1,:))+a(2,:));

disp("F)");
disp(((-1/5).*a(1,:))+a(3,:));


disp("PART C");

clf;

disp("question 1");
x= linspace(0,4*%pi,200);
//this will consider the x-axis from 0 to 4pi and draw 200 posints 
subplot(221);
plot(x,sin(x));//plot the graph of x on x-axis and sin(x) on y-axis 
subplot(222);
plot(x,sin(x).^2,'r--');//plot the graph of x on x-axis and sin(x) on y-axis
//the r represent red line, the -- represent dashed lines
subplot(223);
plot(x,cos(x/2),'g-.');//plot the graph of x on x-axis and sin(x) on y-axis
//the r represent red line, the -. represent dotted lines
y = linspace(0,4*%pi,200).';
subplot(224);
plot(y,[sin(y) sin(y).^2 cos(y/2)]); 
//it will plot the 3 curve on same graph
//plot the graph of y on x-axis and both  [sin(y), sin(y).^2 and cos(y/2) on y-axis
xgrid(1);// make black grid

disp("question 2");
figure(1);//create another window, i did not want to mix them

subplot(2,1,1);
x=0:10;
plot(x,exp(-x).*sin(x));
title("graph of exp(-x).*sin(x) on x");

subplot(2,1,2);
x=-5:5;
plot(x,(x.^-1).*sin(x));
title("graph of ,(x.^-1).*sin(x) on x");

disp("PART D");

disp("question 1");
function[y]=test(x)
    if x>0 then 
        y=3;
    else if x<0 then
        y=1;       
    else
        y=2;
    end;
    end;
endfunction
x=input("enter a value : ")
disp(test(x))

function[y]=test2(x,n)
    y=x(1);
    for k=2:n
        y=y + x(k);
    end
endfunction

disp(test2([1 2 3 4],4))

function[Min,Max]=test3(x,n)
    Min =x(1);Max=x(1);
    for k=2:n
        if Max< x(k) then
            Max = x(k);
        else if Min > x(k) then
            Min = x(k);
        end;
        end;    
    end
    
endfunction
//I just felt as to put the vector outside 
u=[8 2 3 4]
[Min,Max]=test3(u,length(u));
disp(Min);
disp(Max);

disp("question 2");
function[Sum,Max,Min]=mod(x,n)
      Min =x(1);Max=x(1);Sum=x(1);
    for k=2:n
        if Max< x(k) then
            Max = x(k);
            Sum = Sum+x(k);
        else if Min > x(k) then
            Min = x(k);
            Sum= Sum+x(k);
        end;
        end;    
    end
    
endfunction
u=[1 2 3];
[s,mx,m]=mod(u,length(u))
disp("the sum is: "+string(s));
disp("the maximum is: "+string(mx));
disp("the minimun is: "+string(m));

disp("question 3");
function[w]= usf(x,y)
    if x>=0 && y>=0 then
        w=x+y;
    if x>=0 && y<0 then
        w=x+y^2;
    if x<0 && y>=0 then
        w=(x^2)+y;
    if x<0 && y>0 then
        w=(x^2)+y^2;
    end;
    end;
    end;
    end;
endfunction

disp("enter a value x");
x=input("x:");

disp("enter a value y");
y=input("y:");

disp(usf(x,y));

disp("question 4");
function[y]= f(x)
    y=(x^2)-(2*x)-2;
endfunction
disp(f(2));

disp("question 5");
deff('[v]=g(x)',['v=(x^2)-(2*x)-2']);
disp(g(1));

disp("question 6");
m= 1:100;
n= m.^2;
y= cos(n*%pi/1e4);
//plot(m,y);

disp("question 7");
function[y]=MyTaylorExp(x,n)
    y=1+x; m=1; xx=x;
    for k=2:n
        xx=xx*x;
        m=m*k;
        y=y + xx/m;
    end
endfunction
//x=input("enter the value of x")
//n=input("enter last power")
s=MyTaylorExp(2,3);
disp(s);

function[y]=MyTaylorCos(x,n)
    y=1; m=1; xx=1;
    for k=1:n
        xx=xx*x*(-1)^k;
        m=m*k;
        y=y + xx/m;
    end
endfunction
s=MyTaylorCos(2,2);
disp(s);

function[y]=MyTaylorSin(x,n)
    y=1+x; m=1; xx=x;
    for k=2:n
        xx=xx*x*(-(-1)^k);
        m=m*k;
        y=y + xx/m;
    end
endfunction

s=MyTaylorSin(2,2);
disp(s);


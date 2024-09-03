clear;clc;
y=input("enter divident,y; ");
disp(y);
x=input("enter divisor,x: ");
disp(x);

//this is to rearrange them
function [x,y] = arrange(x,y)
    if x>y then
        a=x;x=y;y=a;
    end
endfunction
[x,y]=arrange(x,y);

//division algorithm
function [i,r]= DivisionAlgorithm(x,y)
    
    i=0;q=0;

    while q>=0
        i=i+1;
        q=y-(x*i);
    end
    i=i-1
    r=y-(x*i);

endfunction

[i,r]=DivisionAlgorithm(x,y)
disp("the interger division is: "+string(x)+"("+string(i)+")+"+string(r));

// euclidean algorithm
function [y] = euclidean(x,y)
    [x,y]=arrange(x,y)
    while x>0
        [i,r]=DivisionAlgorithm(x,y)
        y=x;x=r;       
    end
endfunction

[g]=euclidean(x,y);
disp("the GCD using euclidean is: " + string(g));

//euclidean inverse algorithm
//this function assumes thier GCD is zero else it will work but give fack answers
function [S,T] = euclideanInv(x,y)
    [x,y]=arrange(x,y)
    t1=0;t2=1;s1=1;s2=0;
    while x>1
        [i,r]=DivisionAlgorithm(x,y);
        T=t1-(t2*i);
        S=s1-(s2*i);
        y=x;x=r;
        t1=t2;
        s1=s2;
        t2=T;s2=S;
    
    end

endfunction

[inv1,inv2]=euclideanInv(x,y);
disp("1="+string(x)+"("+string(inv2)+")"+"+"+string(y)+"("+string(inv1)+")");
disp("the inverse using euclidean is: " + string(inv2)+" at mod"+string(y));
disp("the inverse using euclidean is: " + string(inv1)+" at mod"+string(x));

//fermat little theorem
funcprot(0);
function [F] = Fermat_little(b,z,w)
        W=w-1;r=modulo(b,W);
        Z=z^r;F=modulo(Z,w);
endfunction
disp(" your equation is of the form (X^a)modY")
z=input("enter the value of X:  ")
b=input("enter the value of a:  ")
w=input("enter the value of Y:  ")
e=euclidean(z,w);
if e==1 then
   [F]=Fermat_little(b,z,w);    
   disp("the solution using fermat theorem is: "+string(F)+ " mod"+string(w));
else
    disp("they are not relatively prime");
end

   
function [c]= chinese(a,m,n,M)
    i=1;j=2;
    //to check if all M are relatively prime
    while i<n
        while j<=n 
            if euclidean(m(i),m(j))==1 then
                j=j+1;c=1
            else
                c=0;
                i=n;
                break;
            end
        end
        i=i+1;
    end
    Mk=zeros(1,n);
    Mv1=zeros(1,n);
    Mv2=zeros(1,n);
    C=0;
    if c==1 then
        for i=1:n
            Mk(i)=M/m(i);
            [Mv1(i),Mv2(i)]=euclideanInv(Mk(i),m(i));
            C=C+(a(i)*Mk(i)*Mv1(i));
        end
        c=modulo(C,M)
    end
    
    
endfunction

n=input("enter the number of equations: ")
a=zeros(1,n);
m=zeros(1,n);
M=1;
for i=1:n
    disp(" in the form x = a mod m enter your equation "+string(i))
    a(i)=input("enter a: ");
    m(i)=input("enter m: ");
    M=M*m(i);
end

disp(m)
for i=1:n
    disp("eqn"+string(i)+" :"+"x ="+string(a(i))+"mod"+string(m(i)))
end
[c]= chinese(a,m,n,M)
if c==0 then
    disp(string(m(:))+" are not relatinely prime");
else if c==1 then
        disp("we good");
     else
        disp("using chinese theory x="+string(c))
     end
end



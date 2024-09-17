clear;clc;
disp("this is to find gce,euclidian algorithm, inverse euclidian algorithm")
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
disp("the interger division using division algorithm is: "+string(x)+"("+string(i)+")+"+string(r));





// euclidean algorithm
function [y] = euclidean(x,y)
    [x,y]=arrange(x,y)
    while x>0
        [i,r]=DivisionAlgorithm(x,y)
        y=x;x=r;       
    end
endfunction

[g]=euclidean(x,y);
disp("the GCD using euclidean algorithm is: " + string(g));






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






//to remove a warning
funcprot(0);
//fermat little theorem

function [F] = Fermat_little(b,z,w)
        W=w-1;r=modulo(b,W);
        Z=z^r;F=modulo(Z,w);
endfunction
disp("")
disp(" your equation is of the form (a^x)modp for fermat ")
z=input("enter the value of a:  ")
b=input("enter the value of x:  ")
w=input("enter the value of p:  ")
e=euclidean(z,w);

//to check if a and p are relatively prime
if e==1 then
   [F]=Fermat_little(b,z,w);    
   disp("the solution using fermat theorem is: "+string(F)+ " mod"+string(w));
else
    disp("they are not relatively prime");
end








//chinese remainder theory   
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
    //if they are paire wise primes do the following
    Mk=zeros(1,n);
    Mv1=zeros(1,n);
    Mv2=zeros(1,n);
    C=0;
    if c==1 then
        for i=1:n
            Mk(i)=M/m(i);
            [Mv1(i),Mv2(i)]=euclideanInv(Mk(i),m(i));
            //make sure the inverse dont give negative values
            if Mv1(i)<0 then
                Mv1(i)=Mv1(i)+m(i);
            end
            C=C+(a(i)*Mk(i)*Mv1(i));
        end
        c=modulo(C,M)
    end
    
    
endfunction
disp("good now lets do a little chinese remainder theorem")
n=input("enter the number of equations: ")
a=zeros(1,n);
m=zeros(1,n);
M=1;
for i=1:n
    disp(" in the form x = a mod n enter your equation "+string(i))
    a(i)=input("enter a: ");
    m(i)=input("enter n: ");
    M=M*m(i);
end
//display all thier products
disp(m)
//display the equations
for i=1:n
    disp("eqn"+string(i)+" :"+"x ="+string(a(i))+"mod"+string(m(i)))
end
[c]= chinese(a,m,n,M)
if c==0 then
    disp(string(m(:))+" are not relatinely prime");
else
    disp("using chinese theory x="+string(c))
end








// this function is to reduce the environment load as scilab don't support valus greater than 25 places and tend to give wrong answers
//it just does modulos progressively thereby reducing work load
function [g]= bigValues(m,e,n)
    
    if modulo(e,2)==0 then
        h=2;
        g=modulo((m(i)^2),n);
        while h<e
            g=g*modulo((m(i)^2),n);
            g=modulo(g,n);
            h=h+2;
        end
    else
        h=3;
        g=modulo((m(i)^3),n);
        while h<e
            g=g*modulo((m(i)^2),n);
            g=modulo(g,n);
            h=h+2;
        end 
    end
endfunction



//encryption function
function [c]= RSAencription(e,n,m)
    c=zeros()
    for i=1:length(m)
        c(i)=bigValues(m,e,n)
    end
endfunction



//decription function
function [m]= RSAdecription(d,n,c)
    for i=1:length(c)
            m(i)=bigValues(c,d,n)
    end
endfunction


disp("")
disp("now lets do real things that is encrypting and decrypting a real message usind RSA ")
disp("this is for RSA , enter two large prime p and q")
p=input("enter a value p: ")
q=input("enter a value q: ")
text=zeros()
text=input("enter your text to encrypt : ","string");
disp(text)
disp("the string is "+string(text))
//convert the text in to thier ascii number equivalent
m=zeros()
m=ascii(text())

disp(m)
n=p*q;
disp("n is "+string(n))

$q=(p-1)*(q-1);
disp(" Q(n) is "+string($q))

disp("choose a value e such that 1<e<"+string($q)+" and Gcd(e,Q("+string(n)+"))=1")
e=input("enter e from the above condition: ");
while euclidean(e,$q)>1 && e>=$q then
    e=input("wrong value please enter a value e such that e>1<"+string($q)+" and Gcd(e,Q("+string(n)+"))=1");
end
disp(" e is "+string(e))

[l,E]= euclideanInv(e,$q)
d=modulo(E,$q)
disp(" d is "+string(d))

c= RSAencription(e,n,m)
disp("the encrypted value is ",c)

dm= RSAdecription(d,n,c)
disp("the decrypted value is ",dm)
disp("which is equivalent to ",char(dm))



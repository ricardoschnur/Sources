LIB "arcpoint.lib"; // TODO: update test result!
LIB "tst.lib";
tst_init();
ring R=0,(x,y,z),dp;
poly f=z4+y3-x2;
// We obtain six families in Tr(i) for
// i sufficiently large, and the following
// corresponding sequences of
// Nash multiplicities:
//
// a(1)=b(1)=c(1)^4-a(2)^2=0,
// c(1)!=0,a(2)!=0
// from (2,2,1) ==> two families
//
// a(1)=b(1)=a(2)=c(1)=b(2)^3-a(3)^2=0,
// b(2)!=0,a(3)!=0 from (2,2,2,1)
//
// a(1)=b(1)=c(1)=a(2)=b(2)=a(3)
//     =c(2)^4-a(4)^2=0,
// c(2)!=0,a(4)!=0
// from (2,2,2,2,1) ==> two families
//
// a(1)=b(1)=c(1)=a(2)=b(2)=c(2)=a(3)=b(3)
//     =a(4)=a(5)=c(3)^4+b(4)^3-a(6)^2=0,
// a(6)!=0,c(3)^4+b(4)^3!=0
// from (2,2,2,2,2,2,1)

def S1=nashmult(f,6);
setring S1;
allsteps;


setring R;
// we allow only for positive integer
// arguments
def S2=nashmult(f,-6);

//----------------------------------------
kill R;

ring R=0,(x,y,z),dp;
ideal I=x,y2,z3;
ideal J=x2+y3;
// J in I but I not in J

equalJinI(I,J);

ideal I1=x+y,xy,z;
ideal J1=x2+y2,z2;
// J1 in I1 but I1 not in J1

equalJinI(I1,J1);

ideal I2=x,y,z;
ideal J2=x+y,y+z,y;
// I2==J2

equalJinI(I2,J2);


kill R;
//----------------------------------------

ring R=0,(a(1..3),b(1..3),c(1..3)),dp;
ideal I=a(1)^3,a(2)^7,a(3),b(1)^34,b(2)*b(3),c(1)*a(1),c(3)^4;
// I has generators
//
// I[1]=a(1)^3
// I[2]=a(2)^7
// I[3]=a(3)
// I[4]=b(1)^34
// I[5]=b(2)*b(3)
// I[6]=a(1)*c(1)
// I[7]=c(3)^4
//
// and replacing powers of variables by the
// respective variables leads to an ideal
// generated by
// a(1),a(2),a(3),b(1),b(2)*b(3),a(1)*c(1),c(3)

removepower(I);

kill R;
//----------------------------------------

ring R=0,(a(1..3),b(1..3),c(1..3)),dp;
ideal I=a(1)^3,a(2)^7,a(3),b(1)^34,b(2)*b(3),c(1)*a(1),c(3)^4;

// pairwise reduction of the generators of I gives
// an ideal J (such that V(I)=V(J)) generated by
// a(1),a(2),a(3),b(1),b(2)*b(3),c(3)

idealsimplify(I,10);

// .. but we admit only positive integer
// arguments:

idealsimplify(I,-10);

tst_status(1);$

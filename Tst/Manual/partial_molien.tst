LIB "tst.lib"; tst_init();
LIB "finvar.lib";
ring R=0,(x,y,z),dp;
matrix A[3][3]=0,1,0,-1,0,0,0,0,-1;
matrix REY,M=reynolds_molien(A);
poly p(1..2);
p(1..2)=partial_molien(M,5);
p(1);
p(1..2)=partial_molien(M,5,p(2));
p(1);
tst_status(1);$

/*Programa que resuelve cadenas de Markov con 2 estados en n pasos
y su probabilidad limitrofe
*/
a=input("\nIngrese la probabilidad de a: ");
b=input("\nIngrese la probabilidad de b: ");
printf("\nLa matriz P es: ");
P=[1-a,a;b,1-b];
disp(P);

//Calculo de P a la n
n=input("\nIngrese n:");
PalaN=[b/(a+b)+a*((1-a-b)^n)/(a+b),a/(a+b)-a*((1-a-b)^n)/(a+b);b/(a+b)-b*((1-a-b)^n)/(a+b),a/(a+b)+b*((1-a-b)^n)/(a+b)];
printf("\nLa matriz P^%d es:",n);
disp(PalaN);

/*Calculo de la matriz P estable
i=2;
A=P
while i<1000
    Pestable=A;
    A=A^i;
    i=i+1;
    if Pestable == A then
        i=1001;
    end
end
printf("\nA largo plazo, la matriz P tendrá los siguientes valores: ");
disp(A);*/
printf("\nEl vector fila de probabilidad Limitrofe es: ");
pi=[b/(a+b),a/(a+b)];
disp(pi);
printf("\nLa matriz pi es: ");
Mpi=[pi;pi];
disp(Mpi);

//Calculo del valor esperado
Miu=[n*b/(a+b)+(a*(1-a-b)*(1-((1-a-b)^n)))/((a+b)^2),n*a/(a+b)-(a*(1-a-b)*(1-((1-a-b)^n)))/((a+b)^2);n*b/(a+b)-(b*(1-a-b)*(1-((1-a-b)^n)))/((a+b)^2),n*a/(a+b)+(b*(1-a-b)*(1-((1-a-b)^n)))/((a+b)^2)];
printf("\nEl valor esperado de P es:");
disp(Miu);

//Calculo de E(C^(n))
printf("\nIngrese el porcentaje del estado A");
A=input("\nIngrese el porcentaje");
printf("\nIngrese el porcentaje del estado B");
B=input("\nIngrese el porcentaje");
printf("\nIngrese el periodo del cual desea conocer su valor esperado");
periodo=input("\nPeriodo");
EC0=(b/(a+b))*(A+B)+(((1-a-b)^periodo)/(a+b))*(a*A-b*B);
EC1=(a/(a+b))*(A+B)-(((1-a-b)^periodo)/(a+b))*(a*A-b*B);
printf("\nValor Esperado de C0 en %d periodos",periodo);
disp(EC0);
printf("\nValor Esperado de C1 en %d periodos",periodo);
disp(EC1);

//Calculo de la varianza
VC0=((b*a)*(A+B))/((a+b)^2)-(((b*a)*((1-a-b)^periodo))*(A+B))/((a+b)^2)+((1-((1-a-b)^periodo))*((1-a-b)^periodo)*((a^2)*A+(b^2)*B))/((a+b)^2);
printf("\nEl valor de la Varianza para C0 y C1 en %d periodos es: ",periodo);
disp(VC0);

/*Programa que ayuda a calcular la matriz fundamental M la cual denota
el numero promedio de pasos para regresar del estado j al estado i
Este resuelve ingresando la matriz Q a traves del teclado*/
printf("\nIngrese el orden de Q ");
orden=input("\nOrden: ");
printf("La matriz es de orden %d",orden);
I=eye(orden,orden);
Q=zeros(orden,orden);
printf("\nIngresando la matriz Q");
for i=1:orden
    for j=1:orden
        printf("\nIngrese el valor de la posición (%d,%d)",i,j);
        Q(i,j)=input("\nValor =");
    end
end
disp(Q);
//Encontrando M
A=I-Q;
M=inv(A);
printf("\nLa matriz Fundamental es");
disp(M);

//Calculo de Mrho
Mrho=zeros(orden,1);
x=0;
for i=1:orden
    for j=1:orden
        x=x+M(i,j);
    end
    Mrho(i,1)=x;
    x=0;
end
printf("\nLa matriz Mrho es: ")
disp(Mrho);
printf("¿Desea calcular la varianza de M?\nDigite 1. Si o 2. No");
x=input("\nDigite 1 o 2");
if x==1 then
    //Calculo de la matriz diagonal de M
    x=diag(M);
    Mdiag=zeros(orden,orden);
    for i=1:orden
        for j=1:orden
            if j==i then
                Mdiag(i,j)=x(i);
            end
        end
    end
    printf("\nLa matriz Diagonal de M es: ")
    disp(Mdiag);
    //Calculo de los cuadrados de M
    Mcuad=M^2;
    printf("\nLos cuadrados de M son: ")
    disp(Mcuad);
    //Calculo de la varianza V(Nij) de M
    Desv=M*(2*Mdiag-I)-Mcuad;
    printf("\nLa varianza V(Nij) de M es: ")
    disp(Desv);
    //Calculo de la varianza V(Ni) de M
    Mrhocuad=Mrho^2;
    printf("\nLos cuadrados de Mrho son: ");
    disp(Mrhocuad);
    Mvar=(2*M-I)*Mrho-Mrhocuad;
    printf("\nLa varianza V(Ni) de M es: ")
    disp(Mvar);
end
printf("\n¿Desea calular la Matriz F?\nDigite 1. Si o 2. No");
x=input("\nDigite 1 o 2");
if x==1 then
    printf("\nA continuación ingrese el número de filas y columnas de R")
    fil=input("\nIngrese las filas: ");
    col=input("\nIngrese las columnas: ");
    R=zeros(fil,col);
    for i=1:fil
        for j=1:col
            printf("\nIngrese el dato de la fila (%d,%d)",i,j);
            R(i,j)=input("\nIngrese el valor");
        end
    end
    printf("\nMatriz R");
    disp(R);
    F=M*R;
    printf("\nLa Matriz F es: ")
    disp(F);
end
printf("Gracias por usar el programa, Exitos en MEP XD");

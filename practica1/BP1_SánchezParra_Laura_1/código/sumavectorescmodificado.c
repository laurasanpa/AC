/* SumaVectoresmodificado.c
  Suma de dos vectores:
  v3 = v1 + v2
  Para compilar usar (-lrt: real time library):
    gcc  -O2 SumaVectores.c -o SumaVectores –lrt
    gcc  -O2 –S SumaVectores.c –lrt  //para generar el código ensamblador
  Para ejecutar use: SumaVectoresC longitud
*/

#include <stdlib.h>
#include<stdio.h>
#include"omp.h"

#define VECTOR_GLOBAL
#define MAX 67108864    //=2^26
double v1[MAX], v2[MAX], v3[MAX];

int main(int argc,char** argv){
  int  i;


 	double start, end, time;
  //Leer argumento de entrada (nº de componentes del vector)

  if  (argc<2){
    printf("Faltan nº componentes del vector \n");
    exit(-1);
  }

  unsigned int N = atoi(argv[1]);   // Máximo N =2^32  -1=4294967295 (sizeof(unsigned int) = 4 B)
  if (N>MAX)
    N=MAX;
	#pragma omp parallel
  //Inicializar vectores
	#pragma omp for
  for  (i=0; i<N; i++){
    v1[i] =  N*0.1+  i*0.1; v2[i] = N*0.1  -  i*0.1;
	}
    //los valores dependen de N

  start=omp_get_wtime( );
  //Calcular suma de vectores
	#pragma omp for
  for  (i=0; i<N; i++)
    v3[i] = v1[i] + v2[i];

  end=omp_get_wtime( );
  time=end-start;

  //Imprimir resultado de la suma y el tiempo de ejecución

  printf("Tiempo(seg.):%0.5f \t/ Tamaño Vectores:%u \t/"
      "V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / /"
      "V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) / \n",
      time, N, v1[0], v2[0], v3[0], N-1, N-1, N-1, v1[N-1], v2[N-1], v3[N-1]);

  return  0;
}

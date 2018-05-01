#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif

int main(int argc, char **argv) {
  int i, n=16,chunk, a[n],suma=0;

  if(argc < 2) {
  fprintf(stderr,"\nFalta chunk \n");
  exit(-1);
  }

  chunk = atoi(argv[1]);

  for (i=0; i<n; i++) a[i] = i;
  int dyn=0,threads=0,limit=0, run=0;

  printf("Fuera del bucle: \n");
  printf("dyn-var: %d \t nthreads-var: %d \t thread-limit-var: %d \t run-sched-var: %d  \n",omp_get_dynamic(), omp_get_max_threads(), omp_get_thread_limit(), omp_get_schedule(&static, &chunk));

  #pragma omp parallel for firstprivate(suma,dyn,threads,limit,run) \
  lastprivate(suma,dyn,threads,limit,run) schedule(static,chunk)
    for (i=0; i<n; i++){
      suma = suma + a[i];
      printf(" thread %d suma a[%d] suma=%d \n",omp_get_thread_num(),i,suma);
      dyn = omp_get_dynamic();
      threads = omp_get_max_threads();
      limit = omp_get_thread_limit();
      run = omp_get_schedule(&static,&chunk);
      }
    printf("Dentro del bucle:  \n");
    printf("dyn-var: %d \t nthreads-var: %d \t thread-limit-var: %d \t run-sched-var: %d  \n",dyn,threads,limit,run);


    printf("Fuera de 'parallel for' suma=%d\n",suma);
}

#include <stdio.h>
#ifdef _OPENMP
#include <omp.h>
#endif
main(){
  int i, n = 7;
  int a[n];
  int a = 1;

  for (i=0; i<n; i++)
  a[i] = i+1;

  #pragma omp parallel for private(a)
  for (i=0; i<n; i++)
    a[i] += i;
    a=i;

  printf("Después de parallel for:\n");

  for (i=0; i<n; i++)
    printf("a[%d] = %d\n",i,a[i]);
    printf("a=%d\n",a);
}

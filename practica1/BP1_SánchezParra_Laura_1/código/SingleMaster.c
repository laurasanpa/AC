#include<stdio.h>
#include<omp.h>

main(){
	int n=9,i,a,b[n];

	for(i=0;i<n;i++) b[i]=-1;
	#pragma omp parallel
	{
		#pragma omp single
		{
			printf("Introduce valor de inicialización de a: ");
			scanf("%d", &a);
			printf("Single ejecutada por el thread %d\n", omp_get_thread_num());
		}
					
		#pragma omp for
		for(i=0;i<n;i++)
			b[i]=a;
		
		#pragma omp master
		{
			printf("Después de la región del parallel:\n");
			for(i=0;i<n;i++) printf("c[%d] = %d impreso por el thread %d\t", i, b[i], omp_get_thread_num());
			printf("\n");
			}	
		}
	}
				

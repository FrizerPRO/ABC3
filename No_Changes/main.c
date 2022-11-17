#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>


double findPi(double accurancy);

int64_t timespecDiff(
    struct timespec timeA,  // { tv_sec, tv_nsec }
    struct timespec timeB   // { tv_sec, tv_nsec }
)
{
    int64_t nsecA, nsecB;

    nsecA = timeA.tv_sec;
    nsecA *= 1000000000;
    nsecA += timeA.tv_nsec;

    nsecB = timeB.tv_sec;
    nsecB *= 1000000000;
    nsecB += timeB.tv_nsec;

    return nsecA - nsecB;
}

int main(int argc, char *argv[])
{
    double result;
    double accuracy;
    int count = 1;
    struct timespec start;
    struct timespec end;
    int64_t elapsed_ns;
    int ch;
    int i = 0;
    
    //ввод
    if(argc == 1 || strcmp(argv[1], "1") == 0){
        scanf("%lf",&accuracy);
    } else if(strcmp(argv[1], "2") == 0){
        FILE *fread = fopen(argv[2], "r");
        if(fread == NULL){
            printf("File doesn't exist.");
            return 0;
        } else{
            fscanf(fread,"%lf",&accuracy);
        }   
         fclose(fread);
    } else if(strcmp(argv[1], "3") == 0){
        accuracy = 100*(double)rand()/RAND_MAX;
        printf("%lf\n", accuracy); 
        if(argc == 3){
            count = atoi(argv[2]);
        }
    }
    if(accuracy > 100 || accuracy <= 0){
        printf("accurancy must be >0 && <=100");
        return 0;
    }
        //Исполнение функции
    clock_gettime(CLOCK_MONOTONIC, &start);
    for (int j = 0; j < count; j++)
    {
        result = findPi(accuracy);
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    elapsed_ns = timespecDiff(end, start);
    printf("Elapsed: %ld ns\n", elapsed_ns);

    //вывод
    printf("Result = %lf",result);
     if(argc>1 && strcmp(argv[1], "2") == 0){
        FILE *fwrite = fopen(argv[3], "w");
        if(fwrite == NULL){
            printf("File doesn't exist.");
            return 1;
        }
        else{
        fprintf(fwrite, "%lf\n", result);  
        }
        fclose(fwrite);
    }
    return 0;
}

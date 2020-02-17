#include "types.h"
#include "param.h"
#include "stat.h"
#include "user.h"

#define MAX_TESTE 5000
#define MAX_PROCESS 3

void teste(){
  int i, j;
    for(i=0; i<MAX_TESTE; i++)
      for(j=0; j<MAX_TESTE; j++);
}

int main() {
  int i, vet_pid[MAX_PROCESS];

  for(i=1; i<=MAX_PROCESS; i++) {

    if(i==1){
      vet_pid[i]=fork(200);
    }else if(i==2){
      vet_pid[i]=fork(25);
    }else{
      vet_pid[i]=fork(50);
    }





    if (vet_pid[i] == 0){
      teste();
      exit();
    }

  }

  for(i=0; i<MAX_PROCESS; i++)
    wait();
  exit();

  return 0;
}
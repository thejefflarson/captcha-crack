#include <stdio.h>
#include <fann.h>
#include <math.h>

int
main() {
  fann_type *calc_out;
  fann_type input[1600];

  for(int i = 0; i < 1600; i++){
    fscanf(stdin, FANNSCANF " ", &input[i]);
  }
  struct fann *ann = fann_create_from_file("img.net");

  calc_out = fann_run(ann, input);
  for(int i = 0; i < 2; i++)
    printf(FANNSCANF " ",  calc_out[i] * 10);
  puts("");
  fann_destroy(ann);
  return 0;
}

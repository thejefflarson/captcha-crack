#include <stdio.h>
#include <fann.h>
#include <math.h>

int
main(int argc, char **argv) {
  fann_type *calc_out;
  fann_type input[16 * 16];

  for(int i = 0; i < 16 * 16; i++){
    fscanf(stdin, FANNSCANF " ", &input[i]);
  }
  struct fann *ann = fann_create_from_file(argv[1]);

  calc_out = fann_run(ann, input);
  for(int i = 0; i < 10; i++)
    printf(FANNSCANF " ",  calc_out[i]);
  puts("");
  fann_destroy(ann);
  return 0;
}

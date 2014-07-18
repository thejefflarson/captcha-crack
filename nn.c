#include <fann.h>

int
main(void) {
  const unsigned int num_input = 16 * 16;
  const unsigned int num_output = 10;
  const unsigned int num_layers = 3;
  const unsigned int num_neurons_hidden = 130;
  const float desired_error = (const float) 0.001;
  const unsigned int max_epochs = 1000;
  const unsigned int epochs_between_reports = 1;

  struct fann *ann = fann_create_standard(num_layers, num_input,
      num_neurons_hidden, num_output);

  fann_set_activation_function_hidden(ann, FANN_SIGMOID_SYMMETRIC);
  fann_set_activation_function_output(ann, FANN_SIGMOID_SYMMETRIC);

  fann_train_on_file(ann, "out.dat", max_epochs,
      epochs_between_reports, desired_error);

  fann_save(ann, "img.net");

  fann_destroy(ann);
	return 0;
}

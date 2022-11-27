#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void input(FILE *input_, unsigned int *precision) {
    fscanf(input_, "%u", precision);
}

double compute() {
    // f(10) = pi * pi / 93555
    // pi * pi = 93555 * f(10)
    // pi = sqrt (93555 * f(10))
    double res = 1;
    for (int i = 2; i < 38; ++i) {
        res += (1 / pow(i, 10));
    }
    return pow(res * 93555, 0.1);
}

void output(FILE *output_, double out, unsigned int precision) {
    char* format = malloc(20 * sizeof (char));
    format[0] = '\0';
    strcat(format, "%.");
    sprintf(format + 2, "%u", precision);
    strcat(format, "f\n");
    fprintf(output_, format, out);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Please give input and output file");
        return 0;
    }

    FILE *input_;
    FILE *output_;

    if (strcmp(argv[1], "stdin") == 0) {
        input_ = stdin;
    } else {
        input_ = fopen(argv[1], "r");
        if (!input_) {
            printf("BAD INPUT FILE");
            return 0;
        }
    }

    if (strcmp(argv[2], "stdout") == 0) {
        output_ = stdout;
    } else {
        output_ = fopen(argv[2], "w");
        if (!output_) {
            fclose(input_);
            printf("BAD OUTPUT FILE");
            return 0;
        }
    }

    unsigned int precision;
    input(input_, &precision);
    output(output_, compute(), precision);

    fclose(input_);
    fclose(output_);
    return 0;
}

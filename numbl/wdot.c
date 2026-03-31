__attribute__((export_name("my_malloc")))
void *my_malloc(int size) {
    extern void *malloc(unsigned long);
    return malloc(size);
}

__attribute__((export_name("my_free")))
void my_free(void *ptr) {
    extern void free(void *);
    free(ptr);
}

__attribute__((export_name("wdot")))
double wdot(const double *a, const double *b, int n) {
    double sum = 0.0;
    for (int i = 0; i < n; i++) {
        sum += a[i] * b[i];
    }
    return sum;
}

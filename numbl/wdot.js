// wasm: wdot
// wdot(a, b) -> dot product
register({
  resolve: function (argTypes, nargout) {
    if (argTypes.length !== 2) {
      return null;
    }
    return {
      outputTypes: [{ kind: "number" }],
      apply: function (args) {
        var a = args[0];
        var b = args[1];
        var n = a.data.length;

        var BYTES = 8;
        var exports = wasm.exports;
        var mem = exports.memory;

        // Allocate WASM memory for both vectors
        var a_ptr = exports.my_malloc(n * BYTES);
        var b_ptr = exports.my_malloc(n * BYTES);

        // Copy input data to WASM memory
        var view = new Float64Array(mem.buffer);
        view.set(new Float64Array(a.data.buffer, a.data.byteOffset, n), a_ptr / BYTES);
        view.set(new Float64Array(b.data.buffer, b.data.byteOffset, n), b_ptr / BYTES);

        // Call the WASM function
        var result = exports.wdot(a_ptr, b_ptr, n);

        // Free WASM memory
        exports.my_free(a_ptr);
        exports.my_free(b_ptr);

        return result;
      },
    };
  },
});

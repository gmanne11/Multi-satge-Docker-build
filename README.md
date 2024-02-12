The reason for using a Go-based application is because Go is a statically-typed programming language. Unlike other languages like Python or JavaScript, Go doesn't need a separate runtime environment to run its code. Instead, it compiles directly to machine code, making it more efficient.

By using multi-stage Docker builds and distroless images with Go, we can significantly reduce the size of the resulting Docker image. This is because we only include the necessary components for running the application, resulting in a smaller and more efficient image.

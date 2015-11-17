# requires statically linked go binary to be compiled
# to ./thisApp before docker build
FROM scratch
COPY thisApp /staticbinary
ENTRYPOINT ["/staticbinary"]
EXPOSE 8080

FROM andrewshawcare/mit-scheme

COPY ./src /src

WORKDIR /src

ENTRYPOINT ["scm"]
CMD ["-f", "assert.scm", "-f", "answers.scm"]

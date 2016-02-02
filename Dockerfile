FROM andrewshawcare/mit-scheme

COPY . .

ENTRYPOINT ["./docker-entrypoint.sh"]

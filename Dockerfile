FROM alpine:latest

RUN echo wow && date

CMD ['/bin/sh', 'echo', 'wow']

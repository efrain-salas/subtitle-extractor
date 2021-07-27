FROM ubuntu:20.04
RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y git build-essential libglew-dev libglfw3-dev cmake gcc libcurl4-gnutls-dev tesseract-ocr libtesseract-dev libleptonica-dev php

RUN git clone "https://github.com/CCExtractor/ccextractor.git"
RUN cd ccextractor/linux && ./build && cp ccextractor /usr/bin/ccextractor

COPY index.php /index.php

CMD php -S 0.0.0.0:80
EXPOSE 80

FROM golang
RUN apt update
RUN apt install -y unzip
# ARG http_proxy=socks5://dev.star:1080
# ARG https_proxy=socks5://dev.star:1080
ENV GOPROXY=https://goproxy.io
# ENV http_proxy=${http_proxy}
# ENV https_proxy=${https_proxy}

WORKDIR /
ENV PUB_HOSTED_URL=https://pub.flutter-io.cn
ENV FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
RUN git clone -b dev https://github.com/flutter/flutter.git
ENV PATH="$PWD/flutter/bin:$PATH"
RUN go version
RUN flutter --version
RUN flutter doctor

# Install Hover dependencies
RUN apt install -y libgl1-mesa-dev xorg-dev

RUN go get -u github.com/go-flutter-desktop/hover

# gpsbabel
FROM alpine:latest as build

RUN apk add --no-cache --update git cmake qt5-qttools-dev alpine-sdk qt5-qtserialport-dev libusb-dev qt5-qtwebengine-dev
RUN git clone https://github.com/gpsbabel/gpsbabel.git gpsbabel && \
    cd gpsbabel && \
    cmake -DCMAKE_BUILD_TYPE=Release && \
    make gpsbabel


FROM alpine:latest
LABEL maintainer=https://github.com/peatfaerie

RUN apk add --no-cache --update qt5-qtbase libusb
COPY --from=build /gpsbabel/gpsbabel /usr/local/bin/gpsbabel

ENTRYPOINT ["gpsbabel"]

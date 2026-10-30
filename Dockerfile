FROM ubuntu:24.04

# * Client ubuntu 24 noble configuration
# COPY ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources


RUN apt update && apt install -y curl wget apt-transport-https ca-certificates dotnet-sdk-10.0 aspnetcore-runtime-10.0


WORKDIR /app

# example test dotnet
RUN dotnet new webapp -o MyWebApp && \
    cd MyWebApp && \
    dotnet build && \
    dotnet publish -c Release


WORKDIR /app/MyWebApp

EXPOSE 8080
# ENV ASPNETCORE_URLS=http://+:8080

CMD dotnet run --urls http://0.0.0.0:8080

# or

# ENTRYPOINT ["dotnet", "run", "--urls", "http://0.0.0.0:8080"]

# docker build -t dotnet:10 .

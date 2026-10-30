FROM debian:bookworm

WORKDIR /app/


# RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb
RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb
# COPY packages-microsoft-prod.deb ./

RUN  apt update && \
    apt install -y apt-transport-https ca-certificates curl nano && \
    dpkg -i packages-microsoft-prod.deb && \
    apt update && \
    apt install -y dotnet-sdk-8.0 && \
    apt install -y aspnetcore-runtime-8.0

# RUN dotnet --info    

RUN dotnet new webapp -o MyWebApp && \
    cd MyWebApp && \
    dotnet build && \
    dotnet publish -c Release


WORKDIR /app/MyWebApp

# RUN dotnet publish -c Release

#   MyWebApp -> /app/MyWebApp/bin/Release/net8.0/MyWebApp.dll
#   MyWebApp -> /app/MyWebApp/bin/Release/net8.0/publish/

# Now listening on: https://localhost:5001
# Now listening on: http://localhost:5000
# 5144 dev
# EXPOSE  5144 

EXPOSE 5000

# Set environment variable and run the app
# ENV ASPNETCORE_URLS=http://+:8080

# CMD dotnet /app/MyWebApp/bin/Release/net8.0/MyWebApp.dll

CMD dotnet run --urls http://0.0.0.0:5000

# docker build -t asp-web:0.0.1 .

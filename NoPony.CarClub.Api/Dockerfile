FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["NoPony.CarClub.Api/NoPony.CarClub.Api.csproj", "NoPony.CarClub.Api/"]
RUN dotnet restore "NoPony.CarClub.Api/NoPony.CarClub.Api.csproj"
COPY . .
WORKDIR "/src/NoPony.CarClub.Api"
RUN dotnet build "NoPony.CarClub.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "NoPony.CarClub.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "NoPony.CarClub.Api.dll"]
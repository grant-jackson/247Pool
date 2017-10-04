FROM microsoft/aspnetcore:2.0.0-jessie
ENV JWTVERIFICATIONKEYS B54FD3F6692B6A3F7284FC57E9A71
WORKDIR /app
COPY Carfinance.Poolleague.Gateway.Api ./
EXPOSE 80
ENTRYPOINT ["dotnet", "Carfinance.Poolleague.Gateway.Api.dll"]

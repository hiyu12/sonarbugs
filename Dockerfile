  FROM mcr.microsoft.com/dotnet/aspnet:6.0
  COPY ./out/ App/
  WORKDIR /App
  ENTRYPOINT ["dotnet", "newapp.dll"]

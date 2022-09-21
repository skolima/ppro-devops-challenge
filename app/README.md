### This is the app part of the challenge

Written in dotnet, as that's what I'm most familiar with and I don't think languge choice here impacts the results in any meaningful way. This can be worked on using [Visual Studio](https://visualstudio.microsoft.com/downloads/) on Windows or [Visual Studio Code](https://visualstudio.microsoft.com/downloads/) on any platform. The project is setup for one-click debugging in those editors. It's also simple enough that any other text editor should be suitable.

You will need either [dotnet](https://dotnet.microsoft.com/en-us/download) (it is cross-platform) or [Docker](https://docs.docker.com/get-docker/) to run this on your machine.

Running with `dotnet`:
```
dotnet run
```

Running with `docker`:
```
docker build --pull -t ppro-challenge-app .
docker run --rm ppro-challenge-app
```

The most significant part missing are tests. Also things such as editorconfig, style settings, linter, etc. For a real-world code those should be setup and run at least on every pull request - preferrably also in-editor for faster developer feedback.
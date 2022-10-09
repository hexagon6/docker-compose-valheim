# Run a valheim server with Docker Compose:

# Folder setup

required folders:
	- `runfiles/UnityPlayer.so`
	- `runfiles/valheim_server.x86_64`
	- `runfiles/valheim_server_Data/`

Since these files change after every new Valheim release you have to maintain this yourself until there is a better Docker Hub Image.

Copy those files from your [steam folder] after installing Valheim Server via Steam on Linux:
	[steam folder](file:~/.local/share/Steam/steamapps/common/Valheim dedicated server)

# Game World

If you want to use an existing World copy it into the docker volume: `valheim_data`. Make sure you put them at the right hierarchy. E.g. `adminlist.txt, bannedlist.txt, permittedlist.txt and world/` should all be in the same folder level.

Use the Environment Variable WORLD to reference the World file, e.g. "Dedicated" for "Dedicated.db" in the worlds/ folder.

An example Game Server folder (using the local default path) looks like this:
```bash
ls ~/.config/unity3d/IronGate/Valheim/
adminlist.txt  bannedlist.txt  characters  permittedlist.txt  Player.log  Player-prev.log  prefs  worlds
ls ~/.config/unity3d/IronGate/Valheim/worlds/
Dedicated.db
```

# Docker Compose

## Set up environment variables
1. Copy compose.yml.example file: `cp compose.yml{.example,}`
2. Adjust Environment Variables, which are passed to `runfiles/start_server.sh`
3. `docker compose up` (requires installation of [docker-compose-plugin](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) for docker, not! docker-compose)

## Warning: Shutdown only with SIGINT (CTRL+C) to valheim_server.x86_64
Use the provided `stop_valheim_server.sh` script or manually send `kill -2 VALHEIM_PROCESS_ID` to the relevant process.
Otherwise you might prevent the valheim server from saving the world state into the filesystem on shutdown since docker-compose does not pass on SIGINT to the process.

# Your Spotify - Personal Spotify Statistics

## Description

Your Spotify is a web application that allows you to view your Spotify listening statistics. It displays your most listened to artists and tracks, generates personalized playlists based on your tastes, and provides detailed analyses of your listening habits.

### Services

- **your_spotify**: Main web application
- **mongo**: MongoDB database to store user data

## Images

- **your_spotify**: `linuxserver/your_spotify:latest`
- **mongo**: `mongo:6`

## Environment Variables

### your_spotify

- **PUID**: User ID for file permissions (`1000`)
- **PGID**: Group ID for file permissions (`1000`)
- **TZ**: Timezone (`Europe/Paris`)
- **APP_URL**: Application URL (must match the redirect URL in the Spotify API)
- **SPOTIFY_PUBLIC**: Spotify API public key
- **SPOTIFY_SECRET**: Spotify API secret key
- **CORS**: CORS configuration for external connections
- **MONGO_ENDPOINT**: MongoDB database connection URL (`mongodb://mongo:27017/your_spotify`)

## Volumes

- `/homelab/your_spotify:/data/db`: MongoDB data storage

## Exposed Ports

- **3240**: HTTP web interface (mapped to port 80 in the container)
- **3241**: HTTPS web interface (mapped to port 443 in the container)

## Spotify API Configuration

To use Your Spotify, you need to create an application in the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/applications):

1. Create an application in the Spotify Developer dashboard
2. Note the Client ID (SPOTIFY_PUBLIC) and Client Secret (SPOTIFY_SECRET)
3. Add the redirect URL in the application settings (matching APP_URL)
4. Set these values in your .env file

## Useful Links

- [GitHub Repository](https://github.com/Yooooomi/your_spotify)
- [Docker Hub](https://hub.docker.com/r/linuxserver/your_spotify)
- [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/applications)

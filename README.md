# GitRepo

### iOS Interview Task for [Modus Capital](https://modus.vc)

## Discription
With GitRepo you can login to your GitHub account and view all of your public and private repositories and also you can search for other GitHub user's to view thier public repositories.

## Done
- [x] Screen should show list of user's github repos with each card contains repository title, description, forks_count, language, creation date and user's image.
- [x] Pressing on each card should open the repository in web browser.
- [x] The list should support paginations, the more the user is scrolling, the more the list
should be retrieving data.
- [x] Save access token with [KeychainWrapper](https://github.com/jrendel/SwiftKeychainWrapper) so user dosen't has to login every time the app opens.

## Todo/ Improvments
* Screen should load to already cached data, then be updated with current live data,
which will be the cached data for next time logging to this screen.
* Improve the app archticture.
* Write UnitTests.

## Screenshots
<img src="https://github.com/HassanElDesouky/GitRepo/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%20Xs%20-%202019-07-27%20at%2005.57.50.png" width="250" align="left">
<img src="https://github.com/HassanElDesouky/GitRepo/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%20Xs%20-%202019-07-27%20at%2005.58.05.png" width="250" align="right">
<img src="https://github.com/HassanElDesouky/GitRepo/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%20Xs%20-%202019-07-27%20at%2005.58.10.png" width="250">
<img src="https://github.com/HassanElDesouky/GitRepo/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%20Xs%20-%202019-07-27%20at%2005.58.32.png" width="250">

## Resources Used
[GitHub API](https://developer.github.com/v3/)
<br/>
[serhii-londar/GithubAPI](https://github.com/serhii-londar/GithubAPI)
<br/>
[KeychainWrapper](https://github.com/jrendel/SwiftKeychainWrapper)

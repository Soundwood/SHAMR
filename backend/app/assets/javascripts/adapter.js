const BASE = 'http://localhost:3000'
const GETFRIENDS_URL = `${BASE}/twitter_gets`

const getFriends = (username) => {
    const sanitizedUsername = sanitizeUsername(username)
    fetch(`${GETFRIENDS_URL}/${sanitizedUsername}`)
    .then(res => res.json())
    .then(json => {
        const friends_list = []
        console.log(json)
        // json.forEach(function(profile) { 
        //     // debugger
        //     prof = new Profile(profile)
        //     prof.render()
        // })
        console.log("Twitter Friends Loaded")
    })
}
function sanitizeUsername(username) {
    if (username[0] === "@") {
        return username.substring(1)
    } else {
        return username
    }
}

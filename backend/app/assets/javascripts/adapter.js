const BASE = 'http://localhost:3000'
const GETFRIENDS_URL = `${BASE}/twitter_gets`
const USERINFO_URL = `${BASE}/twitter_user_info/`

const getFriends = (username) => {
    clearSHAME()
    let sanitizedUsername = sanitizeUsername(username)
    fetch(`${GETFRIENDS_URL}/${sanitizedUsername}`)
    .then(res => res.json())
    .then(json => {
        let friends_ids_list = []
        let offenders_ids = []
        Profile.all.forEach((profile) => {
            offenders_ids.push(profile.user_id)
        })
        json.users.forEach((user) => {
            friends_ids_list.push(user.id)
        })
        let intersection = offenders_ids.filter(element => friends_ids_list.includes(element))
        renderSHAME(intersection)
    })
}
function sanitizeUsername(username) {
    if (username[0] === "@") {
        return username.substring(1)
    } else {
        return username
    }
}
function getTwitterUserInfo(username, offensesArray) {
    let sanitizedUsername = sanitizeUsername(username)
    fetch(`${USERINFO_URL}${sanitizedUsername}`)
    .then(res => res.json())
    .then(json => {
        let newTwittOff = new Profile(
            {username: json.data.username, user_id: json.data.id,
                 display_name: json.data.name, offense_categories: offensesArray})
        newTwittOff.createNew()
        // Profile.all.push(newTwittOff)
    })
}

function renderSHAME(intersection_array) {
    let associatedOffenders = []
    let shameDiv = document.getElementById("shame_response_cont")
    intersection_array.forEach((twitter_user_id) => {
        associatedOffenders.push(Profile.all.find(x => x.user_id === twitter_user_id))
    })
    associatedOffenders.forEach((offender) => {
        let offenderH4 = document.createElement('h4')
        offenderH4.innerText = `Your association with ${offender.display_name} means that you support -`
        shameDiv.appendChild(offenderH4)
        offender.offense_categories.forEach((offense) => {
            let offenseP = document.createElement('P')
            offenseP.innerText = offense.name
            shameDiv.appendChild(offenseP)
        })
    })
}
function clearSHAME() {
    let shameDiv = document.getElementById("shame_response_cont")
    while (shameDiv.firstChild) {
        shameDiv.firstChild.remove()
    }
}
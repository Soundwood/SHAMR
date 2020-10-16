const BASE_URL = 'http://localhost:3000'
const PROFS_URL = `${BASE_URL}/twitter_profiles`
const OFFENSES_URL = `${BASE_URL}/offense_categories`

document.addEventListener("DOMContentLoaded", () => {
    loadProfiles()
    loadOffenses()
    let newOff = document.getElementById("create_new_offense")
    newOff.addEventListener("click", (e) => {
        let offInput = document.getElementById("offense_input")
        let offense = new Offense({name: offInput.value})
        offense.createNew()
    })
    let createOffenderBtn = document.getElementById("create_change_offender_btn")
    createOffenderBtn.addEventListener("click", function(event){
        event.preventDefault()
        let twitterHandle = document.getElementById("twitter_handle_input")
        var array = []
        var checkboxes = document.querySelectorAll('input[type=checkbox]:checked')
        for (var i = 0; i < checkboxes.length; i++) {
            array.push(checkboxes[i].id)
        }
        let newTwittOff = new Profile({username: twitterHandle.value, offense_categories: array})
        newTwittOff.createNew()
        // create offender
    })
    let shame = document.getElementById("shame_button")
    shame.addEventListener("click", (e) => {
        let shameInput = document.getElementById("shame_input")
        getFriends(shameInput.value)
    })
})
const loadProfiles = () => {
    fetch(PROFS_URL)
    .then(res => res.json())
    .then(json => {
        console.log(json)
        json.forEach(function(profile) { 
            // debugger
            prof = new Profile(profile)
            prof.render()
        })
        console.log("Profiles Loaded")
    })
}
const loadOffenses = () => {
    fetch(OFFENSES_URL)
    .then(res => res.json())
    .then(json => {
        console.log(json)
        json.forEach(function(offense) {
            off = new Offense(offense)
            off.render()
            off.renderCheckbox()
        })
        console.log("Offenses Loaded")
    })
}
function showOffenders() {
    let x = document.getElementById("Offenses")
    let y = document.getElementById("Offenders")
    let offenderBut = document.getElementById("offender_button")
    let offenseBut = document.getElementById("offense_button")
    if (y.style.display === "none" && x.style.display ==="block") {
        y.style.display = "block"
        offenderBut.classList = "w3-col s6 tablink w3-dark-grey"
        offenseBut.classList = "w3-col s6 tablink"
        x.style.display = "none"
    }
}
function showOffenses() {
    let x = document.getElementById("Offenses")
    let y = document.getElementById("Offenders")
    let offenderBut = document.getElementById("offender_button")
    let offenseBut = document.getElementById("offense_button")
    if (x.style.display === "none" && y.style.display ==="block") {
        x.style.display = "block"
        offenderBut.classList = "w3-col s6 tablink"
        offenseBut.classList = "w3-col s6 tablink w3-dark-grey"
        y.style.display = "none"
    }
}
function clearOffenses() {
    let offenderDiv = document.getElementById("Offenses")
    // debugger
    let offCont = document.getElementById("off_opt_cont")
    while (offenderDiv.firstChild) {
        offenderDiv.firstChild.remove()
    }
    while (offCont.firstChild) {
        offCont.firstChild.remove()
    }
}
function scrollTo(element_id) {
    const elmnt = document.getElementById(element_id);
    elmnt.scrollIntoView()
}

// video game - sandwich - diamonds
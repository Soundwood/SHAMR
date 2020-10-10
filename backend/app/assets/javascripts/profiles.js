console.log("Profile class loaded")
// https://www.w3schools.com/js/js_reserved.asp

class Profile {
    static all = []

    constructor({ id, username, user_id, display_name, offender, irreproachable, created_at, offense_categories}) {
        this.id = id
        this.username = username
        this.user_id = user_id
        this.display_name = display_name
        this.offender = offender
        this.irreproachable = irreproachable
        this.created_at = created_at
        this.offense_categories = offense_categories
    }

    render() {
        let profilesDiv = document.getElementById("Offenders")
        let profileCont = document.createElement('div')
        let profileH5 = document.createElement('h5')
        let profileP = document.createElement('p')
        let button = document.createElement('button')
        profileCont.id = `profile_container_for_${this.id}`
        profilesDiv.appendChild(profileCont)
        button.innerText = `Remove ${this.display_name} from Offenders List`
        profileH5.innerText = this.display_name
        if (this.offense_categories.length > 0) {
            // debugger
            this.offense_categories.forEach(element => profileP.innerText = ` - ${element.name} `)
        }
        profileCont.appendChild(profileH5)
        profileCont.appendChild(profileP)
        profileP.appendChild(button)
        button.addEventListener("click", (e) => {
            // debugger
            if (this.offender === true) {
                alert("This person is a known offender and cannot be removed from the OFFENDERS list!")
            } else {
            fetch(`http://localhost:3000/twitter_profiles/${this.id}`, {
              method: "DELETE",
            }).then(profileCont.remove());
            }
        })
    }   
}
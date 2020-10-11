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
        let button = document.createElement('button')
        profileCont.id = `profile_container_for_id${this.id}`
        profilesDiv.appendChild(profileCont)
        button.innerText = `Remove ${this.display_name} from Offenders List`
        profileH5.innerText = this.display_name
        profileCont.appendChild(profileH5)
        if (this.offense_categories.length > 0) {
            // debugger
            this.offense_categories.forEach((element) => {
                let profileP = document.createElement('p')
                profileP.id = `profile_offense_id${element.id}`
                profileP.innerText = ` - ${element.name} `
                profileCont.appendChild(profileP)
            })
        }
        profileCont.appendChild(button)
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
    createNew() {
        // debugger
        fetch("http://localhost:3000/twitter_profiles", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                    username: this.username,
                    display_name: this.username,
                    offense_categories: this.offense_categories,
                },
            ),
        })
        .then((resp) => resp.json())
        .then((data) => {
          if (data.errors) {
            console.log(info.errors);
          } else {
            this.id = data.id;
            document.querySelector('input[id=twitter_handle_input]').value = "";
            loadProfiles()
          }
        })
    }   
}
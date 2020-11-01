class Offense {
  static all = []

  constructor({ id, name, created_at}) {
    this.id = id
    this.name = name
    this.created_at = created_at
    Offense.all.push(this)
  }
  render() {
    let offensesDiv = document.getElementById("Offenses")
    let offenseCont = document.createElement('div')
    offenseCont.setAttribute("id", `offense_container_for_${this.id}`)
    offenseCont.className = "w3-col s6 w3-center"
    let offenseH5 = document.createElement('h5')
    let button = document.createElement('button')
    button.innerText = `Remove from Offense List`
    offenseH5.innerText = this.name + "  "
    offensesDiv.appendChild(offenseCont)
    offenseCont.appendChild(offenseH5)
    offenseCont.appendChild(button)
    button.addEventListener("click", (e) => {
        // debugger
        fetch(`http://localhost:3000/offense_categories/${this.id}`, {
          method: "DELETE",
        }).then(offenseCont.remove());
    })
  }
  renderCheckbox() {
    let off_cont = document.getElementById("off_opt_cont")
    let checkbox = document.createElement('input')
    let br = document.createElement("br")
    checkbox.setAttribute("type", "checkbox")
    checkbox.setAttribute("id", `checkbox_offense_id_${this.id}`)
    checkbox.setAttribute("name", `${this.id}`)
    let checkboxLabel = document.createElement('label')
    checkboxLabel.setAttribute("for", `name_offense_${this.id}`)
    checkboxLabel.innerText = `  ${this.name}`
    off_cont.appendChild(checkbox)
    off_cont.appendChild(checkboxLabel)
    off_cont.appendChild(br)
  }
  createNew() {
    fetch("http://localhost:3000/offense_categories", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
                name: this.name,
            },
        ),
    }).then((resp) => resp.json())
    .then((data) => {
      if (data.errors) {
        console.log(info.errors);
      } else {
        this.id = data.id;
        document.querySelector('input[id=offense_input]').value = "";
        const newOffense = new Offense(data)
        newOffense.render()
        newOffense.renderCheckbox()
      }
    })
  }
}
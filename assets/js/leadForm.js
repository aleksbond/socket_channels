import serialize from "form-serialize"

function deleteAllErrors (form) {
  const errorElements = form.querySelectorAll("span.error")
  errorElements.forEach((error) => error.remove())
}

export default function leadForm (channel) {
  const formContainer = document.getElementById("form-container")

  if (formContainer) {
    const form = formContainer.querySelector("#lead-form")
    form.addEventListener('input', function(event) {
      const form_params = serialize(form, { hash: true }).lead || {}

      channel.push("validate_form", {params: form_params})
        .receive("ok", (msg) => {
          console.log("validation success", msg) 
          deleteAllErrors(form)
        })
        .receive("error", (reasons) => {
          const {errors} = reasons
          console.log("validation failed", errors) 

          deleteAllErrors(form)

          // add error spans
          Object.entries(errors).map(([field, error_msg]) => {
            const input = form.querySelector(`input[name="lead[${field}]"]`)
            const text = document.createTextNode(error_msg)
            const span = document.createElement("span")
            span.classList.add("help-block", "error")
            span.appendChild(text)

            input.after(span)
          })
        })
    })
  }
}

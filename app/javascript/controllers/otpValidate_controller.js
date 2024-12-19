import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = {
        redirecturl: String,
        incorrect: String,
    }
    static targets = ["input", "errorMessage"];
    validate() {
        fetch(`/oauth2/verify?otp_code=${this.inputTarget.value}`, {
            method: "POST"
        }).then((val) => {
            val.json().then((val) => {
                if (!val.success) throw console.error("OTP validation was unsuccessful")
                if (val.valid) {
                    location.href = this.redirecturlValue
                } else {
                    this.errorMessageTarget.innerHTML = `<p class="text-red text-bold">${this.incorrectValue}</p>`
                }
            })
        })
    }
}
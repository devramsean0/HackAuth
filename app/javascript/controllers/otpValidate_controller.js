import { Controller } from "stimulus"

export default class extends Controller {
    static values = {
        redirectUrl: String,
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
                    location.href = this.redirectUrlValue
                } else {
                    this.errorMessageTarget.innerHTML = `<p class="text-red text-bold">Invalid OTP code, try again?</p>`
                }
            })
        })
    }
}
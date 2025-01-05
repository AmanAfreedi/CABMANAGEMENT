
function validateLoginForm() {
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var emailError = document.getElementById("emailError");
    var passwordError = document.getElementById("passwordError");

    var valid = true;

    // Clear previous error messages
    emailError.innerHTML = "";
    passwordError.innerHTML = "";

    // Validate email
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if (!email.match(emailPattern)) {
        emailError.innerHTML = "Please enter a valid email address.";
        valid = false;
    }

    // Validate password
    if (password.length < 6) {
        passwordError.innerHTML = "Password must be at least 6 characters long.";
        valid = false;
    }

    return valid;
}


function validateRegistrationForm() {
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var emailError = document.getElementById("emailError");
    var passwordError = document.getElementById("passwordError");
    var confirmPasswordError = document.getElementById("confirmPasswordError");

    var valid = true;

   
    emailError.innerHTML = "";
    passwordError.innerHTML = "";
    confirmPasswordError.innerHTML = "";


    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if (!email.match(emailPattern)) {
        emailError.innerHTML = "Please enter a valid email address.";
        valid = false;
    }

   
    if (password.length < 6) {
        passwordError.innerHTML = "Password must be at least 6 characters long.";
        valid = false;
    }

   
    if (password !== confirmPassword) {
        confirmPasswordError.innerHTML = "Passwords do not match.";
        valid = false;
    }

    return valid;
}


function handleCabBooking() {
    var availableCabs = document.querySelectorAll('.cab-info');

    if (availableCabs.length > 0) {
        alert("Cab booked successfully!");
    } else {
        alert("No cabs available at the moment.");
    }
}

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 500px;
            margin: 50px auto;
        }
        .error-message {
            color: red;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2 class="text-center mb-4">Register</h2>
        <form id="registerForm">
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
                <div id="nameError" class="error-message"></div>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required>
                <div id="emailError" class="error-message"></div>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
                <div id="passwordError" class="error-message"></div>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                <div id="confirmPasswordError" class="error-message"></div>
            </div>
            <button type="submit" class="btn btn-primary w-100">Register</button>
        </form>
    </div>

    <script>
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            e.preventDefault();
            let isValid = true;

            // Clear previous errors
            document.getElementById('nameError').textContent = '';
            document.getElementById('emailError').textContent = '';
            document.getElementById('passwordError').textContent = '';
            document.getElementById('confirmPasswordError').textContent = '';

            // Validate name
            const name = document.getElementById('name').value;
            if (!name) {
                document.getElementById('nameError').textContent = 'Name is required.';
                isValid = false;
            }

            // Validate email
            const email = document.getElementById('email').value;
            if (!email || !/\S+@\S+\.\S+/.test(email)) {
                document.getElementById('emailError').textContent = 'Please enter a valid email address.';
                isValid = false;
            }

            // Validate password
            const password = document.getElementById('password').value;
            if (!password || password.length < 6) {
                document.getElementById('passwordError').textContent = 'Password must be at least 6 characters long.';
                isValid = false;
            }

            // Validate confirm password
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (password !== confirmPassword) {
                document.getElementById('confirmPasswordError').textContent = 'Passwords do not match.';
                isValid = false;
            }

            if (isValid) {
                alert('Registration successful!');
            }
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

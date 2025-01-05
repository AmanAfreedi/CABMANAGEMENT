<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login Page</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
    
    <script src="${pageContext.request.contextPath}/scripts.js"></script>
    <style>
        .form-container {
            max-width: 400px;
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
        <h2 class="text-center mb-4">Login</h2>
        <form id="loginForm">
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
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
    </div>

    <script>
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            let isValid = true;

            // Clear previous errors
            document.getElementById('emailError').textContent = '';
            document.getElementById('passwordError').textContent = '';

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

            if (isValid) {
                alert('Login successful!');
            }
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


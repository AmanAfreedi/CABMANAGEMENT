<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .profile-container {
            max-width: 600px;
            margin: 50px auto;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <h2 class="text-center mb-4">User Profile</h2>
        <form id="profileForm">
            <div class="mb-3">
                <label for="username" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="username" name="username" value="John Doe" readonly>
            </div>
            <div class="mb-3">
                <label for="userEmail" class="form-label">Email address</label>
                <input type="email" class="form-control" id="userEmail" name="userEmail" value="john.doe@example.com" readonly>
            </div>
            <div class="mb-3">
                <label for="userPassword" class="form-label">Password</label>
                <input type="password" class="form-control" id="userPassword" name="userPassword" value="password123">
            </div>
            <button type="submit" class="btn btn-primary w-100">Update Profile</button>
        </form>
    </div>

    <script>
        document.getElementById('profileForm').addEventListener('submit', function(e) {
            e.preventDefault();
            alert('Profile updated successfully!');
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

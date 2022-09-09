unless User.exists?(email: "testuser@artistsonly.com")
    User.create!(email: "testuser@artistsonly.com", username: "testuser", password: "passwordtest")
end

unless User.exists?(email: "testuser2@artistsonly.com")
    User.create!(email: "testuser2@artistsonly.com", username: "testuser2", password: "passwordtest")
end
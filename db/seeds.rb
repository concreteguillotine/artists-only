unless User.exists?(email: "testuser@artistsonly.com")
    User.create!(email: "testuser@artistsonly.com", username: "testuser", password: "passwordtest")
end

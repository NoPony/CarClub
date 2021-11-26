-- Scaffold-DbContext -Connection 'Server=.\;Database=CarClub;Integrated Security=SSPI;' Microsoft.EntityFrameworkCore.SqlServer -OutputDir EF -NoPluralize -Force

-- Scaffold-DbContext -Connection 'Server=localhost;Database=CarClub;Uid=stumpy;Pwd=password;' MySql.EntityFrameworkCore -OutputDir EF -NoPluralize -Force

-- Scaffold-DbContext -Connection 'Host=localhost;Database=CarClub;Uid=car_club_deploy;Pwd=password;' Npgsql.EntityFrameworkCore.PostgreSQL -OutputDir EF -NoPluralize -Force

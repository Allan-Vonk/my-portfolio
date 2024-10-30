# Define the root directory of your project
$rootDir = "C:\Users\Allan\Desktop\New portfolio\my-portfolio"

# Create the pages directory
New-Item -Path "$rootDir\pages" -ItemType Directory -Force

# Define the projects and their details
$projects = @(
    @{
        Name = "Planet Generation"
        File = "planet-generation.html"
        Image = "Marching_cubes_with_shader.png"
        Description = "A world generation project using the Marching Cube algorithm and quad tree for a performant, real-sized planet with high fidelity near the player."
        Technologies = "C#, Unity, HLSL, Compute Shaders"
    },
    @{
        Name = "SpaceZ"
        File = "spacez.html"
        Image = "yLSNlB.png"
        Description = "A zombie game created during an international game jam event. Developed in collaboration with two Swedish developers over the course of a week, based on the prompt: 'And also there were zombies'."
        Technologies = "C#, Unity"
    },
    @{
        Name = "Autonomous Greenhouse"
        File = "autonomous-greenhouse.html"
        Image = "Poster2.webp"
        Description = "An autonomous greenhouse system designed to operate with minimal user input. Features a dashboard for monitoring the system's status and environmental conditions."
        Technologies = "Raspberry Pi, Arduino, Node-RED, C++, UART, MQTT, SSH tunneling, Ultrasonic sensors"
    },
    @{
        Name = "Zitu Island"
        File = "zitu-island.html"
        Image = "Zitu.jpg"
        Description = "A collaborative puzzle game featuring unique rooms created by each team member. My contribution includes a light diversion puzzle where players rotate pillars to reflect light to an endpoint, opening doors."
        Technologies = "Unity, C#, Shader programming"
    }
)

# Function to create HTML content
function Get-ProjectHTML($project) {
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$($project.Name) - Allan Vonk</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../styles/main.css">
    <script src="https://kit.fontawesome.com/your-font-awesome-kit.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <nav>
            <a href="../index.html">Home</a>
            <a href="../projects.html">Projects</a>
        </nav>
    </header>

    <main class="project-page">
        <h1>$($project.Name)</h1>
        <img src="../images/$($project.Image)" alt="$($project.Name)" class="project-image">
        <div class="project-content">
            <p>$($project.Description)</p>
            <h2>Technical Details</h2>
            <p><strong>Technologies used:</strong> $($project.Technologies)</p>
            <h2>Key Features</h2>
            <ul>
                <li>Feature 1</li>
                <li>Feature 2</li>
                <li>Feature 3</li>
            </ul>
            <h2>Challenges and Solutions</h2>
            <p>Describe any significant challenges you faced during the project and how you overcame them.</p>
            <h2>Future Improvements</h2>
            <p>Discuss any plans or ideas for future enhancements to the project.</p>
            <div class="project-links">
                <a href="#" class="btn">View Demo</a>
                <a href="https://github.com/yourusername/$($project.File.Replace('.html', ''))" target="_blank" rel="noopener noreferrer" class="btn">
                    <i class="fab fa-github"></i> View on GitHub
                </a>
            </div>
        </div>
    </main>

    <script src="../scripts/main.js"></script>
</body>
</html>
"@
}

# Create project pages
foreach ($project in $projects) {
    $content = Get-ProjectHTML $project
    $content | Out-File -FilePath "$rootDir\pages\$($project.File)" -Encoding utf8
    Write-Host "Created $($project.File)"
}

Write-Host "All project pages have been created in the 'pages' folder."
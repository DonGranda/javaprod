<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="floating-elements">
        <div class="floating-circle circle-1"></div>
        <div class="floating-circle circle-2"></div>
        <div class="floating-circle circle-3"></div>
        <div class="floating-circle circle-4"></div>
        <div class="stars" id="stars"></div>
    </div>

    <div class="container">
        <h1 class="welcome-text">Welcome Leslie Kofi!</h1>
        <p class="subtitle">Step into something amazing</p>
        <button class="pulse-button" onclick="handleClick()">Get Started</button>
    </div>

    <script>
        // Create twinkling stars
        function createStars() {
            const starsContainer = document.getElementById('stars');
            const numStars = 50;

            for (let i = 0; i < numStars; i++) {
                const star = document.createElement('div');
                star.className = 'star';
                star.style.left = Math.random() * 100 + '%';
                star.style.top = Math.random() * 100 + '%';
                star.style.animationDelay = Math.random() * 3 + 's';
                starsContainer.appendChild(star);
            }
        }

        // Button click handler
        function handleClick() {
            const button = document.querySelector('.pulse-button');
            button.style.transform = 'scale(0.95)';
            button.style.background = 'rgba(255, 255, 255, 0.4)';
            
            setTimeout(() => {
                button.style.transform = 'translateY(-2px) scale(1)';
                button.style.background = 'rgba(255, 255, 255, 0.2)';
            }, 150);

            // You can add your navigation logic here
            console.log('Welcome button clicked!');
        }

        // Initialize stars when page loads
        window.addEventListener('load', createStars);

        // Add some interactive particles on mouse move
        document.addEventListener('mousemove', (e) => {
            if (Math.random() < 0.1) { // 10% chance to create particle
                const particle = document.createElement('div');
                particle.style.position = 'absolute';
                particle.style.left = e.clientX + 'px';
                particle.style.top = e.clientY + 'px';
                particle.style.width = '4px';
                particle.style.height = '4px';
                particle.style.background = 'rgba(255, 255, 255, 0.6)';
                particle.style.borderRadius = '50%';
                particle.style.pointerEvents = 'none';
                particle.style.zIndex = '999';
                particle.style.animation = 'twinkle 1s ease-out forwards';
                
                document.body.appendChild(particle);
                
                setTimeout(() => {
                    particle.remove();
                }, 1000);
            }
        });
    </script>
</body>
</html>
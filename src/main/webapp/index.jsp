<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .container {
            text-align: center;
            color: white;
            position: relative;
            z-index: 2;
        }

        .welcome-text {
            font-size: 4rem;
            font-weight: bold;
            margin-bottom: 1rem;
            opacity: 0;
            transform: translateY(50px);
            animation: slideUp 1s ease-out 0.5s forwards;
        }

        .subtitle {
            font-size: 1.5rem;
            opacity: 0;
            transform: translateY(30px);
            animation: slideUp 1s ease-out 1s forwards;
            margin-bottom: 2rem;
        }

        .floating-elements {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }

        .floating-circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            animation: float 6s ease-in-out infinite;
        }

        .circle-1 {
            width: 80px;
            height: 80px;
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .circle-2 {
            width: 120px;
            height: 120px;
            top: 60%;
            right: 15%;
            animation-delay: 2s;
        }

        .circle-3 {
            width: 60px;
            height: 60px;
            bottom: 20%;
            left: 20%;
            animation-delay: 4s;
        }

        .circle-4 {
            width: 100px;
            height: 100px;
            top: 10%;
            right: 30%;
            animation-delay: 1s;
        }

        .pulse-button {
            background: rgba(255, 255, 255, 0.2);
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: white;
            padding: 15px 30px;
            font-size: 1.1rem;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            opacity: 0;
            transform: translateY(20px);
            animation: slideUp 1s ease-out 1.5s forwards;
            backdrop-filter: blur(10px);
        }

        .pulse-button:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .stars {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }

        .star {
            position: absolute;
            width: 2px;
            height: 2px;
            background: white;
            border-radius: 50%;
            animation: twinkle 3s infinite;
        }

        @keyframes slideUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px) rotate(0deg);
            }
            50% {
                transform: translateY(-20px) rotate(180deg);
            }
        }

        @keyframes twinkle {
            0%, 100% {
                opacity: 0.3;
                transform: scale(1);
            }
            50% {
                opacity: 1;
                transform: scale(1.2);
            }
        }

        @keyframes glow {
            0%, 100% {
                text-shadow: 0 0 20px rgba(255, 255, 255, 0.5);
            }
            50% {
                text-shadow: 0 0 40px rgba(255, 255, 255, 0.8);
            }
        }

        .welcome-text {
            animation: slideUp 1s ease-out 0.5s forwards, glow 2s ease-in-out 2s infinite;
        }

        @media (max-width: 768px) {
            .welcome-text {
                font-size: 2.5rem;
            }
            .subtitle {
                font-size: 1.2rem;
            }
        }
    </style>
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
        <h1 class="welcome-text">Welcome!</h1>
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
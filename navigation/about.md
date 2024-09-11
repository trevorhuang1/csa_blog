---
layout: page
title: About
permalink: /about/
---

<style>
    /* Style looks pretty compact, 
       - grid-container and grid-item are referenced the code 
    */
    .grid-container {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(150px, 1fr)); /* Dynamic columns */
        gap: 10px;
    }
    .grid-item {
        text-align: center;
    }
    .grid-item img {
        width: 100%;
        height: 100px; /* Fixed height for uniformity */
        object-fit: contain; /* Ensure the image fits within the fixed height */
    }
    .grid-item p {
        margin: 5px 0; /* Add some margin for spacing */
    }

    .image-gallery {
        display: flex;
        flex-wrap: nowrap;
        overflow-x: auto;
        gap: 10px;
        }

    .image-gallery img {
        max-height: 150px;
        object-fit: cover;
        border-radius: 5px;
    }
</style>

<!-- This grid_container class is used by CSS styling and the id is used by JavaScript connection -->
<div class="grid-container" id="grid_container">
    <!-- content will be added here by JavaScript -->
</div>

<script>
    // 1. Make a connection to the HTML container defined in the HTML div
    var container = document.getElementById("grid_container"); // This container connects to the HTML div

    // 2. Define a JavaScript object for our http source and our data rows for the Living in the World grid
    var http_source = "https://upload.wikimedia.org/wikipedia/commons/";
    var living_in_the_world = [
        {"flag": "0/01/Flag_of_California.svg", "greeting": "Hey", "description": "California - 15 years"},
        {"flag": "b/b9/Flag_of_Oregon.svg", "greeting": "Hi", "description": "Oregon - 1 month"},
        {"flag": "7/72/Flag_of_the_Republic_of_China.svg", "greeting": "你好/Lí-hó", "description": "Taiwan - 6 month"},
        {"flag": "5/54/Flag_of_Washington.svg", "greeting": "Hello", "description": "Washington - 6 months"},
    ];

    // 3a. Consider how to update style count for size of container
    // The grid-template-columns has been defined as dynamic with auto-fill and minmax

    // 3b. Build grid items inside of our container for each row of data
    for (const location of living_in_the_world) {
        // Create a "div" with "class grid-item" for each row
        var gridItem = document.createElement("div");
        gridItem.className = "grid-item";  // This class name connects the gridItem to the CSS style elements
        // Add "img" HTML tag for the flag
        var img = document.createElement("img");
        img.src = http_source + location.flag; // concatenate the source and flag
        img.alt = location.flag + " Flag"; // add alt text for accessibility

        // Add "p" HTML tag for the description
        var description = document.createElement("p");
        description.textContent = location.description; // extract the description

        // Add "p" HTML tag for the greeting
        var greeting = document.createElement("p");
        greeting.textContent = location.greeting;  // extract the greeting

        // Append img and p HTML tags to the grid item DIV
        gridItem.appendChild(img);
        gridItem.appendChild(description);
        gridItem.appendChild(greeting);

        // Append the grid item DIV to the container DIV
        container.appendChild(gridItem);
    }
</script>

### My Culture:

- My mom's side of the family owns a scroll which has all the names of her family on a scroll. Turns out, I'm the 25th generation of Chinese immigrants into Taiwan!
- Throughout my childhold, I always went to Chinese school on Saturdays so that I can connect with my extended family. As of now, I've been learning a bit of Taiwanese so that the next time I visit, I can interact with locals a lot better.
- My mom is an immigrant from Taiwan, while my dad's parents immigrated.<br>

### Hobbies:

- Computers:
  - First Robotics Competition
  - CyberCEO
  - Del Norte Algorithmic Coding Club
- Sports:
  - Cross Country
  - Track and field
  - Badminton (for fun)
- Chess:
  - I've been playing a lot recently, and hopefully I can improve to the point where I can participate in tournaments.
  - I play a lot of puzzles to relax: peak elo of 2683
![image](https://github.com/user-attachments/assets/78ef53df-ee7d-4033-a8ff-9c7721f1e47c)<br>

## My Aspirations:

Hi, my name is Trevor and I'm a junior at Del Norte High School who aspires to be a computer scientist. 

I've been programming for on and off since 5th grade, but it wasn't until last year before I started seeing it as a career path. As of now, I'm fluent in python, javascript, html/css, and I'm currently learning Java. 

In the past year, I've worked in groups using agile methodologies extensively and I've produced many projects that I'm proud of. Check out my [LinkedIn](https://www.linkedin.com/in/trevor-huang-003391304/) for projects that I'm especially proud of.

My dream is to contribute to technologies that will end up changing people's lives for the better. I'm interested in cutting edge technology such as **artificial intelligence, quantum computing, robotics, and more!** When I'm not coding or doing robotics, you might catch me running cross country/track, playing chess, or learning something new! Feel free to contact me by sending me a message on LinkedIn or shooting me an email at **trevorhuangsd@gmail.com**.



<script src="https://utteranc.es/client.js"
        repo="trevorhuang1/csa_blog"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
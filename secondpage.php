<?php
session_start();
$department = $_SESSION['department'];

include "db_connection.php";
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    
    <link rel="icon" type="image/Logo.png" href="../images/Logo.png">
    <link rel="stylesheet" href="2ndDesign.css">
</head>

<body>
    <header>
        <img src="images/Official UMak Logo 2048px.png" class="Logo">
        <h2 class="brand">University Of Makati</h2>
        <nav>
            <ul class="nav_Links">
                <li><a href="resources/resources.html">Resources</a></li>
                <li><a href="Upcoming_Events.php?url=/secondpage.php">Events</a></li>
                <li><a href="calendar/calendar.php">Appointment</a></li>
                <li><a href="logout.php" class="btnn Delete logout-button">Logout</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <div class="image_header">
            <img class="Team" src="/images/meet.jpg" alt="">
            <div class="meet">
                <div class="meet-header">
                    <img src="/images/Logo.png" alt="">
                    <h4>CENTER FOR GUIDANCE AND COUNSELING SERVICES APPOINTMENT</h4>
                </div>
                <div class="about">
                    <h4>About Us</h4>
                    <h5>We help students in the achievement of their personal, social, spiritual, and academic development as well as the acquisition of relevant knowledge and skills in career planning.</h5>
                </div>
                <div class="visit">
                    <button><a href="https://www.facebook.com/UMakCGCS">Visit us</a></button>
                </div>
            </div>
        </div>
        <hr>
        <div class="Info">
            <div class="Appoint">
                <div class="">
                    <h5>Hey, if something doesn't feel quite right, why not take a step towards feeling better? Book an appointment at our office where we offer a range of services to support you:</h5>
                    <div class="services">
                        <ul>
                            <li>Counseling</li>
                            <li>Testing</li>
                            <li>Parent-Teacher Consultation</li>
                            <li>Psychoeducation</li>
                            <li>Information services</li>
                            <li>Individual inventory </li>
                            <li>Research and Evaluation</li>
                        </ul>
                    </div>
                    <div class="Book">
                        <button><a href="calendar/calendar.php">Book Now</a></button>
                    </div>
                </div>
            </div>
            <div class="events">
                <div class="Title">
                    <h4>Upcoming Events & Seminar</h4>
                </div>
                <hr>
                <div class="image_holder">
                    <?php
                    // Query to fetch events
                    $sql_events = "SELECT * FROM events";
                    $query_events = $conn->query($sql_events);
                    ?>
                    <!-- Slideshow for Event Images -->
                    <div class="slideshow-container">
                        <?php
                        // Loop through each event to display images and corresponding information
                        while ($row = $query_events->fetch_assoc()) {
                        ?>
                            <div class="mySlides  fade ">
                                <div class="info">
                                    <img src="<?php echo "upload/" . $row['event_Image']; ?>" width="100px">
                                    <div class="info_container">
                                        <div class="title"><?php echo $row['event_name']; ?></div>
                                        <div class="text"><?php
                                                            $eventInfo = $row['event_info'];
                                                            $maxlength = 200;

                                                            if (strlen($eventInfo) > $maxlength) {

                                                                $trimmedText = substr($eventInfo, 0, $maxlength) . '...';
                                                                echo $trimmedText;
                                                            } else {
                                                                echo $eventInfo;
                                                            }
                                                            ?></div>
                                        <div class="learn">
                                            <button><a href="Upcoming_Events.php?url=secondpage.php">Learn More</a></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                    <!-- Slideshow for Event Titles and Information -->

                    <script>
                        let slideIndex = 0;
                        showSlides();

                        function showSlides() {
                            let i;
                            let slides = document.querySelectorAll(".mySlides, .mySlides-info");
                            // Check if slides are defined
                            if (slides.length === 0) {
                                console.error("Slides not found");
                                return;
                            }
                            // Hide all slides
                            for (i = 0; i < slides.length; i++) {
                                slides[i].style.display = "none";
                            }
                            // Increment slideIndex and display the next slide
                            slideIndex++;
                            if (slideIndex > slides.length) {
                                slideIndex = 1;
                            }
                            slides[slideIndex - 1].style.display = "block";
                            // Repeat the slideshow after a timeout
                            setTimeout(showSlides, 5000); // Change slide every 3 seconds
                        }
                    </script>
                </div>
            </div>


            <hr>
            <div class="images">
                <?php
                $sql_images = "SELECT * FROM images";
                $query_sql = $conn->query($sql_images);
                while ($rows = $query_sql->fetch_assoc()) {
                ?>
                    <div class="MySlides">

                        <div class="row">

                            <div class="image">
                                <img src="../upload/<?php echo $rows['file_name']; ?>">
                            </div>
                            <div class="caption">
                                <p><?php echo $rows['caption'] ?></p>
                            </div>

                        </div>
                    </div>
                <?php } ?>
                <div class="btnnn">
                    <button class=" btn prev" onclick="plusDivs(-1)">&#10094;</button>
                    <button class=" btn next" onclick="plusDivs(1)">&#10095;</button>
                </div>

                <script>
                    var SlideIndex = 1;
                    showDivs(SlideIndex);

                    function plusDivs(n) {
                        showDivs(SlideIndex += n);
                    }

                    function showDivs(n) {
                        var i;
                        var x = document.getElementsByClassName("MySlides");
                        if (n > x.length) {
                            SlideIndex = 1
                        }
                        if (n < 1) {
                            SlideIndex = x.length
                        }
                        for (i = 0; i < x.length; i++) {
                            x[i].style.display = "none";
                        }
                        x[SlideIndex - 1].style.display = "block";
                    }
                </script>

            </div>

            <div class="Title">
                <h4>Videos</h4>
            </div>
            <hr>




            <div class="videos">

                <?php

                $sql = "SELECT * FROM videos WHERE kind = 'Upload'";
                $query = $conn->query($sql);
                while ($row = $query->fetch_assoc()) { ?>
                    <div class="Box">

                        <video class="video" controls ">
                            <source src=" ../upload/<?php echo $row['video_path'] ?>" type="video/<?php echo pathinfo($row['video_path'], PATHINFO_EXTENSION) ?>">
                            Your browser does not support the video tag.

                        </video>
                        <div class="Video_Title">
                            <p><?php echo $row['video_name'] ?></p>
                        </div>


                    </div>
                <?php } ?>
                <script>
                    var video = document.getElementById("video");

                    function openFullscreen() {
                        if (video.requestFullscreen) {
                            video.requestFullscreen();
                        } else if (video.mozRequestFullScreen) {
                            /* Firefox */
                            video.mozRequestFullScreen();
                        } else if (video.webkitRequestFullscreen) {
                            /* Chrome, Safari & Opera */
                            video.webkitRequestFullscreen();
                        } else if (video.msRequestFullscreen) {
                            /* IE/Edge */
                            video.msRequestFullscreen();
                        }
                    }

                    function closeFullscreen() {
                        if (document.exitFullscreen) {
                            document.exitFullscreen();
                        } else if (document.mozCancelFullScreen) {
                            /* Firefox */
                            document.mozCancelFullScreen();
                        } else if (document.webkitExitFullscreen) {
                            /* Chrome, Safari & Opera */
                            document.webkitExitFullscreen();
                        } else if (document.msExitFullscreen) {
                            /* IE/Edge */
                            document.msExitFullscreen();
                        }
                    }

                    function toggleFullscreen() {
                        if (!document.fullscreenElement && !document.mozFullScreenElement && !document.webkitFullscreenElement && !document.msFullscreenElement) {
                            openFullscreen();
                        } else {
                            closeFullscreen();
                        }
                    }



                    var video = document.getElementById("video");
                    var seekBar = document.getElementById("seekBar");

                    // Function to seek the video
                    function seek(time) {
                        video.currentTime += time;
                    }

                    // Function to update the seek bar and current time
                    function updateSeekBar() {
                        var currentTime = video.currentTime;
                        var duration = video.duration;
                        seekBar.value = (currentTime / duration) * 100;
                    }

                    // Function to seek to a specific position in the video
                    function seekTo(value) {
                        var duration = video.duration;
                        var time = (value / 100) * duration;
                        video.currentTime = time;
                    }

                    // Update the seek bar and current time when the video time updates
                    video.addEventListener("timeupdate", function() {
                        updateSeekBar();
                    });

                    // Update the seek bar when the video metadata is loaded
                    video.addEventListener("loadedmetadata", function() {
                        updateSeekBar();
                    });
                </script>
            </div>

        </div>
    </div>
    </div>
</body>

</html>
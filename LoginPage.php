<?php
session_start();
include "db_connection.php";
include 'CodeGenerator.php';
require 'plugins/PHPMailer/src/Exception.php';
require 'plugins/PHPMailer/src/PHPMailer.php';
require 'plugins/PHPMailer/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// Instantiate the $mail object
$mail = new PHPMailer(true);
$email_verified = false;
if (isset($_SESSION['counselor_college']) && isset($_SESSION['counselor_id'])) {
    $college = $_SESSION['department'];
} else {
    // Default values if information is not available

    $counselorId = 'DefaultCounselorID';
}
$Status = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['EMAIL'])) {
        $email = $_POST['EMAIL'];
        $_SESSION['email'] = $email;
        // Generate a new code
        $Code = generateRandomPassword(6); // Change the length if needed
        $_SESSION['generated_code'] = $Code;

        try {
            $mail->isSMTP();
            $mail->Host       = 'smtp.gmail.com';
            $mail->SMTPAuth   = true;
            $mail->Username   = 'cgcsemailexample@gmail.com';
            $mail->Password   = 'logk aach ruut jhkv';
            $mail->SMTPSecure = 'tls';
            $mail->Port       = 587;

            $recipientEmail = $email;
            $allowedDomain  = 'umak.edu.ph';

            if (filter_var($recipientEmail, FILTER_VALIDATE_EMAIL)) {
                $recipientDomain = explode('@', $recipientEmail)[1] ?? '';

                if ($recipientDomain === $allowedDomain) {
                    $email_verified = true;

                    $mail->setFrom('cgcsemailexample@gmail.com', 'CGCS');
                    $mail->addAddress($email);

                    $mail->isHTML(true);
                    $mail->Subject = "Verification Code";
                    $mail->Body    = "<br>I hope this email finds you well."
                        . "<br><br>"
                        . "This communication is to provide you with your verification code. Below, you will find the necessary details:"
                        . "<br><br>"
                        . "Verification Code:<b>" . $Code . "</b>"
                        . "<br>"
                        . " Please ensure to keep this code confidential to maintain the security of your account."
                        . "<br><br><br>"
                        . " Warm regards,"
                        . "<br>Center For Guidance and Counseling Services";
                    $mail->send();

                    $Status = "<div class='codeStatus'><p>Code has been sent to " . $email . ", <br>  Please check your Umak email.</p></div>";
                } else {
                    $Status = "<div class='alert'>
                       <p>Invalid or unauthorized email address.</p>
                       </div>";
                }
            } else {
                $Status = "<div class='alert'>
                   <p>Invalid email address.</p>
                   </div>";
            }
        } catch (Exception $e) {
            echo 'Error: ' . $e->getMessage();
        }
    }
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['verify'])) {
    // Check if the stored code and the inputted code match
    if (isset($_SESSION['generated_code']) && isset($_POST['code']) && $_SESSION['generated_code'] === $_POST['code']) {
        // Codes match
        $Status = "<div class='codeStatus'>Verification successful!</div>";
        $department = $_POST['department'];
        $_SESSION['department'] = $department;
        header("Location: secondpage.php");
        exit();
        // Now you can proceed with your further logic, such as logging in the user or redirecting to another page
    } else {
        // Codes do not match
        $Status = "<div class='alert'>Verification failed. Please make sure you entered the correct code.</div>";
    }
}


?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>CGCS Appointment</title>
    <link rel="icon" type="image/Logo.png" href="../images/Logo.png">
    <link rel="stylesheet" href="firstpagedesign.css">
    <script src="script.js"></script>
</head>

<body>
    <header>
        <img src="images/Official UMak Logo 2048px.png" class="Logo">
        <h2 class="brand">University Of Makati</h2>
    </header>
    <div class="cointainer">

        <div class="Login">
            <div class="Login_Logo">
                <img src="images/UMak Logo.png" class="logo_size">
                <img src="images/Logo.png" class="logo_size">

            </div>
            <h3 class="login_header">
                Login to- UMak Center for Guidance and Counseling Services

            </h3>
            <div class="input">
                <form action="" method="post">
                    <input type="text" placeholder=" Umak Email" name="EMAIL" class="email" value="<?php echo isset($_POST['EMAIL']) ? htmlspecialchars($_POST['EMAIL']) : ''; ?>">

                    <input type="submit" class="getcode" value="Get code">
                </form>
                <div class="input2">
                    <?php

                    if (isset($_SESSION['generated_code'])) :  ?>

                        <form action="" method="post">
                            <select name="department" Class="department">
                                <option value="Default">Department</option>
                                <option value="CITE">Collage of Innovative Teacher Education</option>
                                <option value="CHK">College of Human Kinetics</option>
                                <option value="ITEST"> Institute for Technical Education and Skills Training</option>
                                <option value="CCIS">College of Computing and Information Sciences</option>
                                <option value="ION">Instute of Nursing</option>
                                <option value="IIHS">Institute of Imaging Health and Science</option>
                                <option value="IOP">Institute of Pharmacy</option>
                                <option value="CBFS">College of Businees and Financial Sciences</option>
                                <option value="CGPP">College of Governance and Public Policy</option>
                                <option value="IOA">Institute of Accountancy</option>
                                <option value="CAL">College oof Arts and Letters</option>
                                <option value="CTHM"> College of Tourism and Hospitality Managemen</option>
                                <option value="SOL">School of Law</option>
                                <option value="HSU (G11)">Higher School ng Umak (G11)</option>
                                <option value="HSU (G12)">Higher School ng Umak (G12)</option>
                                <option value="CTM">College of Technology Management</option>
                                <option value="CCSE">College of Contruction Sciences and Engineering</option>
                                <option value="COS">College of Sciences</option>
                                <option value="CAD">Center for Athletic Development</option>
                            </select>
                            <input type="text" placeholder="Verification Code" class="code" name="code" value="">
                            <input type="submit" class="LogginBtn" name="verify" value="Submit">

                        </form>
                    <?php
                    endif;

                    ?>

                </div>

            </div>


            <?php echo  $Status; ?>
        </div>
        <div class="upcoming">
            <div class="Upcoming_Header">
                <h3> UPCOMING</h3>
                <h3>EVENTS & SEMINARS</h3>
            </div>
            <div class="image">
                <?php
                // Assuming $conn is your database connection

                // Query to fetch events
                $sql_events = "SELECT * FROM events";
                $query_events = $conn->query($sql_events);
                $event_count = $query_events->num_rows;

                // Query to fetch images
                $sql_images = "SELECT * FROM images";
                $query_images = $conn->query($sql_images);
                $image_count = $query_images->num_rows;

                $total_count = $event_count + $image_count;

                // Set maximum number of images per "page"
                $images_per_page = 4; // Change this number as desired

                // Calculate the total number of "pages" needed
                $total_pages = ceil($total_count / $images_per_page);

                // Output the slides
                while ($row = $query_events->fetch_assoc()) {
                ?>
                    <div class="mySlides fade">
                        <img src="<?php echo "upload/" . $row['event_Image']; ?>" width="100px">
                        <div class="text title">
                            <?php echo $row['event_name']; ?>
                        </div>
                        <div class="text"><?php
                                            $eventInfo = $row['event_info'];
                                            $maxlength = 80;

                                            if (strlen($eventInfo) > $maxlength) {

                                                $trimmedText = substr($eventInfo, 0, $maxlength) . '...';
                                                echo $trimmedText;
                                            } else {
                                                echo $eventInfo;
                                            }




                                            ?></div>
                    </div>
                <?php
                }

                while ($row = $query_images->fetch_assoc()) {
                ?>
                    <div class="mySlides fade">
                        <img src="<?php echo "upload/" . $row['file_name']; ?>" width="100px">
                        <div class="text">Caption Text</div>
                    </div>
                <?php
                }

                // Output the dots
                ?>
                <div style="text-align:center">
                    <?php
                    for ($i = 0; $i < $total_pages; $i++) {
                    ?>
                        <span class="dot"></span>
                    <?php
                    }
                    ?>
                </div>

                <script>
                    let slideIndex = 0;
                    showSlides();

                    function showSlides() {
                        let i;
                        let slides = document.getElementsByClassName("mySlides");
                        let dots = document.getElementsByClassName("dot");

                        // Check if slides and dots are defined
                        if (slides.length === 0 || dots.length === 0) {
                            console.error("Slides or dots not found");
                            return;
                        }

                        // Hide all slides
                        for (i = 0; i < slides.length; i++) {
                            slides[i].style.display = "none";
                        }

                        // Reset slideIndex if it exceeds the number of slides
                        if (slideIndex >= slides.length) {
                            slideIndex = 0;
                        }

                        // Remove active class from all dots
                        for (i = 0; i < dots.length; i++) {
                            dots[i].className = dots[i].className.replace(" active", "");
                        }

                        // Display current slide and activate corresponding dot
                        slides[slideIndex].style.display = "block";
                        dots[Math.floor(slideIndex / <?php echo $images_per_page; ?>)].className += " active";

                        // Increment slideIndex
                        slideIndex++;

                        // Repeat the slideshow after a timeout (e.g., 3000 milliseconds = 3 seconds)
                        setTimeout(showSlides, 3000); // Change image every 3 seconds
                    }
                </script>



            </div>
        </div>
    </div>
</body>

</html>
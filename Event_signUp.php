<?php
session_start();
$conn = mysqli_connect("localhost", "root", "", "cgcs");
$Status = "";
$email = $_SESSION['email'];
$ID = $_GET['event_id'];
$department = $_SESSION['department'];
require 'plugins/PHPMailer/src/Exception.php';
require 'plugins/PHPMailer/src/PHPMailer.php';
require 'plugins/PHPMailer/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="icon" type="../image/Logo.png" href="../images/Logo.png">
    <link rel="stylesheet" href="2ndDesign.css">
    <link rel="stylesheet" href="design.css">

</head>

<body>
    <header>

        <img src="/images/Official UMak Logo 2048px.png" class="Logo">
        <img src="/images/Logo.png" alt="" class="Logo">
        <h2 class="brand">University Of Makati</h2>

        <nav>

            <ul class="nav_Links">
                
                <li><a href="/Upcoming_Events.php">Back</a></li>
            </ul>
        </nav>
    </header>
    <div class="container">
        <div class="event_container">
            <?php
            $query = "SELECT * FROM events WHERE id = $ID";
            $query_run = mysqli_query($conn, $query);

            if (mysqli_num_rows($query_run) > 0) {
                foreach ($query_run as $row) {


            ?>


                    <div class="image_container">
                        <img src="<?php echo "upload/" . $row['event_Image']; ?>" width="100px">
                    </div>
                    <div class="event_name_container">
                        <h4><?php

                            echo $row['event_name']; ?></h4>
                    </div>
                    <br>

                    <div class="event_info_container">
                        <p><?php echo $row['event_info']; ?></p>
                    </div>
            <?php
                }
            } else {
                $Status = "No Record Available";
            }
            ?>
        </div>
        <div class="sign_up_container">
            <div class="input_box">
                <div class="header_container">
                    <img src="/images/Official UMak Logo 2048px.png" class="Logo_size">
                    <h5>Center for Guidance and Counceling Services</h5>
                    <img src="/images/Logo.png" class="Logo_size">
                </div>
                <div class="input_container">
                    <form action="" method="post">
                        <div class="seperate">

                            <div class="input">
                                <div class="input_header">
                                    <label for="name">NAME OF STUDENT</label>
                                </div>


                                <input type="text" name="name" id="">
                            </div>

                            <div class="input">
                                <div class="input_header">
                                    <label for="email">EMAIL </label>
                                </div>
                                <input type="text" name="email" value="">
                            </div>
                            <div class="input">
                                <div class="input_header">
                                    <label for="department">DEPARTMENT </label>
                                </div>
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

                            </div>
                            <div class="input">

                                <div class="input_header">
                                    <label for="Grade/Section">GRADE/SECTION</label>
                                </div>
                                <input type="text" name="Grade/Section">
                            </div>
                            <br>

                            <div class="btn">
                                <input type="submit" value="SIGN UP">
                            </div>


                            <?php
                            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                                if (mysqli_num_rows($query_run) > 0) {
                                    foreach ($query_run as $row) {
                                        $mail = new PHPMailer(true);
                                        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                                            if (isset($_POST['email'])) {
                                                $email = $_POST['email'];
                                                $Status = '';
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
                                                            $mail->Subject = 'Thank You for Registering - Important Reminder for ' . $row['event_name'];

                                                            $mail->Body = "Thank you for registering for " . $row['event_name'] . "! We're thrilled to have you on board."
                                                                . "Just a quick reminder: punctuality is key! Please aim to arrive on time to ensure a smooth and enjoyable experience for all."
                                                                . "<br><br>"
                                                                . "<br>Stay tuned for event updates on Center for Guidance and Counseling Services. We can't wait to see you there!"
                                                                . "<br><br>"
                                                                . "<br>Best regards,"
                                                                . "<br>Center for Guidance and Counseling Services";

                                                            $mail->send();
                                                            $Status = "<div class='status'><p>Thank you for signing up for " . $row['event_name'] . "! Just a reminder, the event is scheduled for " . $row['event_date'] . " at " . $row['event_time'] . ", and it will be held at " . $row['event_where'] . ". We look forward to seeing you there!</p></div>";
                                                        } else {
                                                            $Status = "<div class='status alert'><p>Invalid or unauthorized email address.</p></div>";
                                                        }
                                                    } else {
                                                        $Status = "<div class='status alert'><p>Invalid email address.</p>
 </div>";
                                                    }
                                                } catch (Exception $e) {
                                                    echo 'Error: ' . $e->getMessage();
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            echo $Status; ?>



                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

    </div>
    </div>

</body>

</html
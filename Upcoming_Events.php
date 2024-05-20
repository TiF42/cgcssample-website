<?php
error_reporting(E_ALL ^ E_WARNING);
?>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>University of Makati Upcoming Events & Seminars</title>
  <link rel="icon" type="../image/Logo.png" href="../images/Logo.png">
  <link rel="stylesheet" href="2ndDesign.css">
  <style>
    @font-face {
      font-family: Umakfont;
      src: url(font/Marcellus/Marcellus-Regular.ttf);


      font-family: Metropolis;
      src: url("https://fonts.cdnfonts.com/css/metropolis-2");

    }

    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      color: #000;
    }

    .Container {
      display: flex;
      flex-direction: column;
      min-height: 100vh;
      background-image: url("images/Untitled\ design.png");
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
    }



    .main {

      padding: 20px;
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      overflow-x: auto;
    }

    .event-card {

      border-radius: 5px;
      width: 30%;
      height: 200px;
      margin: 10px auto;
      text-align: center;
      box-sizing: border-box;
      background: white;
    }

    .event-card:nth-child(1),
    .event-card:nth-child(2),
    .event-card:nth-child(3),
    .event-card:nth-child(4) {
      background-color: white;

    }


    .event-card p {
      font-family: Umakfont;

      margin: 5px 0;
      border: none;
      border-radius: 25%;
      color: black;

    }

    header h1 {
      margin: 0;
      margin-left: 10px;
      margin-right: -5px;
    }



    .clickable {
      width: 90%;
      height: 100%;
      text-decoration: none;
    }

    .event_name {
      font-family: Umakfont;
      font-weight: 500;
      background-color: #111C4B;
      color: #fdf100;
      text-align: center;
      padding: 10px 0 5px 0;
    }

    .header_brand {
      display: flex;
      flex-direction: column;
      margin-right: auto;
    }

    .header_brand h1 {
      font-size: 12px;
    }

    @media screen and (max-width: 768px) {
      .main {
        justify-content: space-around;
        flex-direction: column;
        align-items: center;
      }

      .event-card {
        width: 100%;

        padding: auto;

      }
    }
  </style>
</head>

<body>

  <header>

    <img src="/images/Official UMak Logo 2048px.png" class="Logo">
    <img src="/images/Logo.png" alt="" class="Logo">

    <div class="header_brand">
      <h2 class="brand">University Of Makati</h2>
      <h1 class="brand">Center For Guidance And Counseling Services</h1>
    </div>

    <nav>
      <?php
      $url = $_GET['url'];

      ?>
      <ul class="nav_Links">
        <li><a href="./secondpage.php">Home</a></li>
        <li><a href="../resources/resources.html">Resources</a></li>
        <li><a href="/Upcoming_Events.php?url=/resources/resources.html">Events</a></li>
        <li><a href="../calendar/calendar.php">Appointment</a></li>

        <li><a href="<?php echo $url ?>">Back</a></li>
      </ul>
    </nav>



  </header>
  <div class="Container">
    <h3>Upcoming Events</h3>
    <div class="main">
      <?php
      session_start();
      include "db_connection.php";

      // Get today's date
      $today = date("Y-m-d");

      $sql = "SELECT * FROM events WHERE event_date >= '$today' ";
      $query = $conn->query($sql);

      while ($row = $query->fetch_assoc()) { ?>
        <div class="event-card">
          <a href="Event_signUp.php?event_id=<?php echo $row['id']; ?>" class="clickable">
            <div class="event_name">
              <h3><?php echo $row['event_name']; ?></h3><br>
            </div>
            <p>Date: <?php echo $row['event_date']; ?></p>
            <p>Time: <?php echo $row['event_time']; ?></p>
            <p>Venue: <?php echo $row['event_where']; ?></p>
          </a>
        </div>
      <?php } ?>
    </div>

    <div class="main2">
      <h3>Past Events</h3>
      <?php
      $pastsql = "SELECT * FROM events WHERE event_date <= '$today'";
      $pastquery = $conn->query($pastsql);

      while ($rows = $pastquery->fetch_assoc()) { ?>
        <div class="event-card">
          <a href="Event_signUp.php?event_id=<?php echo $rows['id']; ?>" class="clickable">
            <div class="event_name">
              <h3><?php echo $rows['event_name']; ?></h3><br>
            </div>
            <p>Date: <?php echo $rows['event_date']; ?></p>
            <p>Time: <?php echo $rows['event_time']; ?></p>
            <p>Venue: <?php echo $rows['event_where']; ?></p>
          </a>
        </div>
      <?php } ?>
    </div>
  </div>

  
</body>

<!-- ... (previous HTML code) ... -->


</html>
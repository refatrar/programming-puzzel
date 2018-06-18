<?php

class View
{
    //definition
    private $fullname;
    private $average;
    private $time;

    /*
     * Constructor
     */
    public function __construct($fullname, $average, $time)
    {
        $this->fullname = $fullname;
        $this->average = $average;
        $this->time = $time;
    }

    /*
     * get Full Name
     */
    public function getName()
    {
        return $this->fullname;
    }

    /*
     * get Average Number
     */
    public function getAveMark()
    {
        return $this->average;
    }

    /*
     * get Time
     */
    public function getTime()
    {
        return $this->time;
    }
}


// New View List Class which extends arrayObject in PHP
class ViewList extends ArrayObject
{
    /*
     * a public function to return data
     */
    public function displayAsTable() // or you could even override the __toString if you want.
    {
        $sOutput = '<table border="1">
          <thead>
            <tr>
              <th>Full Name</th>
              <th>Average</th>
              <th>Time</th>
            </tr>
          </thead>
          <tbody>';
            foreach ($this AS $user)
            {
                $sOutput .= sprintf('<tr><td>%s</td><td>%s</td><td>%s</td></tr>',
                    $user->getName(),
                    $user->getAveMark(),
                    $user->getTime()
                );
            }
            $sOutput .= '</tbody></table>';

        return $sOutput;
    }

    /*
     * return data to string
     */
    public function __toString()
    {
        return $this->displayAsTable();
    }
}

/*
 *  data(s)
 */
$data = new ViewList();
$con=mysqli_connect("localhost","root","","fieldNation");
// Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$sql="SELECT CONCAT(user.first_name,' ',user.last_name) fullname, AVG(test_result.correct) average, MAX(test_result.time_taken) time
FROM user
LEFT JOIN test_result ON test_result.user_id = user.user_id
GROUP BY user.user_id
ORDER BY average DESC";

if ($result=mysqli_query($con,$sql))
{
  while ($obj=mysqli_fetch_object($result))
  {    
    $data[] = new View($obj->fullname, ($obj->average ? number_format($obj->average, 2) : ''), $obj->time);
    }
  // Free result set
  mysqli_free_result($result);
}

/*
 * final output
 */
print $data;
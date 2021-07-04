<HTML>
    <HEAD><Title>Query</Title></HEAD>
    <Body>
    <form name="query" action="query_result.php" method="GET">
        <table>
            <tr>
                <td>Select the SSN:</td>
                <td>
                    <?php

                    $link = mysqli_connect("localhost","root","","multimedia");

                    $sql = "SELECT SSN
                        FROM RATING";

                    $result = mysqli_query($link,$sql);
                    if ($result != null) {
                        echo '<select name="ssn">';

                        $num_results = mysqli_num_rows($result);
                        for ($i=0;$i<$num_results;$i++) {
                            $row = mysqli_fetch_array($result);
                            $name = $row['SSN'];
                            echo '<option value="' .$name. '">' .$name. '</option>';
                        }

                        echo '</select>';
                        echo '</label>';
                    }

                    mysqli_close($link);

                    ?>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="reset" name="cancel" value="cancel">
                </td>
                <td>
                    <input type="submit" name="submit" value="submit">
                </td>
            </tr>
        </table>
    </form>
    </Body>
</HTML>
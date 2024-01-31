<?php
error_reporting(-1);
require_once("./db_connect.php");

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        if (isset($_GET["choice"]) && $_GET["choice"] === "getClientDetails") {
            if (!isset($_GET["NROCLIE"]) || empty(trim($_GET["NROCLIE"]))) {
                echo json_encode(["success" => false, "error" => "Id manquant"]);
                die;
            }

            $clientId = $_GET["NROCLIE"];
            $req = $db->prepare("SELECT * FROM client WHERE NROCLIE = ?");
            $req->execute([$clientId]);
            $clientDetails = $req->fetch(PDO::FETCH_ASSOC);

            if ($clientDetails) {
                echo json_encode(["success" => true, "client" => $clientDetails]);
            } else {
                echo json_encode(["success" => false, "error" => "Aucun détail trouvé pour le client avec l'ID $clientId"]);
            }
            break;
        } else {
            $req = $db->query("SELECT * FROM client;");
            $clients = $req->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode(["success" => true, "clients" => $clients]);
        }
        break;

    case "POST":
        if (!isset($_POST["choice"])) {
            echo json_encode(["success" => false, "error" => "Choix non spécifié"]);
            die;
        }

        switch ($_POST["choice"]) {
            case "insert":
                if (!isset($_POST["NOMCLIE"], $_POST["PRENOMCLIE"], $_POST["ADRESSECLIE"], $_POST["VILLECLIE"], $_POST["CODEPOSTALCLIE"], $_POST["TITRECLIE"], $_POST["NROTELCLIE"])
                    || empty(trim($_POST["NOMCLIE"])) || empty(trim($_POST["PRENOMCLIE"])) || empty(trim($_POST["ADRESSECLIE"])) || empty(trim($_POST["VILLECLIE"]))
                    || empty(trim($_POST["CODEPOSTALCLIE"])) || empty(trim($_POST["TITRECLIE"])) || empty(trim($_POST["NROTELCLIE"]))) {
                    echo json_encode(["success" => false, "error" => "Données manquantes"]);
                    die;
                }

                $req = $db->prepare("INSERT INTO client (NOMCLIE, PRENOMCLIE, ADRESSECLIE, VILLECLIE, CODEPOSTALCLIE, TITRECLIE, NROTELCLIE)
                                    VALUES (:NOMCLIE, :PRENOMCLIE, :ADRESSECLIE, :VILLECLIE, :CODEPOSTALCLIE, :TITRECLIE, :NROTELCLIE)");
                $req->bindValue(":NOMCLIE", $_POST["NOMCLIE"]);
                $req->bindValue(":PRENOMCLIE", $_POST["PRENOMCLIE"]);
                $req->bindValue(":ADRESSECLIE", $_POST["ADRESSECLIE"]);
                $req->bindValue(":VILLECLIE", $_POST["VILLECLIE"]);
                $req->bindValue(":CODEPOSTALCLIE", $_POST["CODEPOSTALCLIE"]);
                $req->bindValue(":TITRECLIE", $_POST["TITRECLIE"]);
                $req->bindValue(":NROTELCLIE", $_POST["NROTELCLIE"]);
                $req->execute();

                echo json_encode(["success" => true, "NROCLIE" => $db->lastInsertId()]);
                break;

            case "update":
                if (!isset($_POST["NOMCLIE"], $_POST["PRENOMCLIE"], $_POST["ADRESSECLIE"], $_POST["VILLECLIE"], $_POST["CODEPOSTALCLIE"], $_POST["TITRECLIE"], $_POST["NROTELCLIE"], $_POST["NROCLIE"])
                    || empty(trim($_POST["NOMCLIE"])) || empty(trim($_POST["PRENOMCLIE"])) || empty(trim($_POST["ADRESSECLIE"])) || empty(trim($_POST["VILLECLIE"]))
                    || empty(trim($_POST["CODEPOSTALCLIE"])) || empty(trim($_POST["TITRECLIE"])) || empty(trim($_POST["NROTELCLIE"])) || empty(trim($_POST["NROCLIE"]))) {
                    echo json_encode(["success" => false, "error" => "Données manquantes"]);
                    die;
                }

                $req = $db->prepare("UPDATE client SET NOMCLIE = :NOMCLIE, PRENOMCLIE = :PRENOMCLIE, ADRESSECLIE = :ADRESSECLIE, VILLECLIE = :VILLECLIE,
                                    CODEPOSTALCLIE = :CODEPOSTALCLIE, TITRECLIE = :TITRECLIE, NROTELCLIE = :NROTELCLIE WHERE NROCLIE = :NROCLIE");
                $req->bindValue(":NOMCLIE", $_POST["NOMCLIE"]);
                $req->bindValue(":PRENOMCLIE", $_POST["PRENOMCLIE"]);
                $req->bindValue(":ADRESSECLIE", $_POST["ADRESSECLIE"]);
                $req->bindValue(":VILLECLIE", $_POST["VILLECLIE"]);
                $req->bindValue(":CODEPOSTALCLIE", $_POST["CODEPOSTALCLIE"]);
                $req->bindValue(":TITRECLIE", $_POST["TITRECLIE"]);
                $req->bindValue(":NROTELCLIE", $_POST["NROTELCLIE"]);
                $req->bindValue(":NROCLIE", $_POST["NROCLIE"]);
                $req->execute();

                echo json_encode(["success" => true]);
                break;

            case "DELETE":
                if (!isset($_POST["NROCLIE"]) || empty(trim($_POST["NROCLIE"]))) {
                    echo json_encode(["success" => false, "error" => "Id manquant"]);
                    die;
                }

                $req = $db->prepare("DELETE FROM client WHERE NROCLIE = ?");
                $req->execute([$_POST["NROCLIE"]]);

                if ($req->rowCount()) echo json_encode(["success" => true]);
                else echo json_encode(["success" => false, "error" => "Erreur lors de la suppression du client"]);
                break;

            default:
                echo json_encode(["success" => false, "error" => "Choix non valide"]);
                break;
        }
        break;

    default:
        echo json_encode(["success" => false, "error" => "Ce choix n'existe pas"]);
        break;
}
?>

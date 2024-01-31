<?php
// Permet l'affichage des erreurs - À ne pas commit
error_reporting(-1);

// J'intègre obligatoirement (une fois) le contenu de mon fichier de connexion à ma bdd
require_once("./db_connect.php");

// Spécifie que le contenu est au format JSON
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); // Remplacez * par le domaine réel de votre application si possible.

// En fonction du paramètre "choice" de ma requête, j'exécute les instructions de la case correspondante
switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        // je récupère tous les livreurs
        if (isset($_GET["choice"]) && $_GET["choice"] === "getLivreurDetails") {
            if (!isset($_GET["NROLIVR"]) || empty(trim($_GET["NROLIVR"]))) {
                echo json_encode(["success" => false, "error" => "Id manquant"]);
                die;
            }

            $livreurId = $_GET["NROLIVR"];
            $req = $db->prepare("SELECT * FROM livreur WHERE NROLIVR = ?");
            $req->execute([$livreurId]);
            $livreurDetails = $req->fetch(PDO::FETCH_ASSOC);

            if ($livreurDetails) {
                echo json_encode(["success" => true, "livreur" => $livreurDetails]);
            } else {
                echo json_encode(["success" => false, "error" => "Aucun détail trouvé pour le livreur avec l'ID $livreurId"]);
            }
            break;
        } else {
            $req = $db->query("SELECT * FROM livreur;");
            // J'affecte la totalité de mes résultats à la variable $livreurs
            $livreurs = $req->fetchAll(PDO::FETCH_ASSOC);
            // j'envoie une réponse avec un success
            echo json_encode(["success" => true, "livreurs" => $livreurs]);
        }
        break;

    case "POST": // Utilisez "POST" pour les opérations d'insertion, de mise à jour et de suppression
        if (!isset($_POST["choice"])) {
            echo json_encode(["success" => false, "error" => "Choix non spécifié"]);
            die;
        }

        switch ($_POST["choice"]) {
            case "insertLivreur":
                if (!isset($_POST["NOMLIVR"], $_POST["PRENOMLIVR"], $_POST["DATEEMBAUCHLIVR"]) || empty(trim($_POST["NOMLIVR"])) || empty(trim($_POST["PRENOMLIVR"])) || empty(trim($_POST["DATEEMBAUCHLIVR"]))) {
                    echo json_encode(["success" => false, "error" => "Données manquantes"]);
                    die;
                }

                $req = $db->prepare("INSERT INTO livreur (NOMLIVR, PRENOMLIVR, DATEEMBAUCHLIVR) VALUES (:NOMLIVR, :PRENOMLIVR, :DATEEMBAUCHLIVR)");
                $req->bindValue(":NOMLIVR", $_POST["NOMLIVR"]);
                $req->bindValue(":PRENOMLIVR", $_POST["PRENOMLIVR"]);
                $req->bindValue(":DATEEMBAUCHLIVR", $_POST["DATEEMBAUCHLIVR"]);
                $req->execute();

                echo json_encode(["success" => true, "NROLIVR" => $db->lastInsertId(), "created_at" => date("Y-m-d H:i:s")]);
                break;

            case "updateLivreur":
                parse_str(file_get_contents("php://input"), $put_vars);

                if (!isset($put_vars["NOMLIVR"], $put_vars["PRENOMLIVR"], $put_vars["DATEEMBAUCHLIVR"], $put_vars["NROLIVR"]) || empty(trim($put_vars["NOMLIVR"])) || empty(trim($put_vars["PRENOMLIVR"])) || empty(trim($put_vars["DATEEMBAUCHLIVR"])) || empty(trim($put_vars["NROLIVR"]))) {
                    echo json_encode(["success" => false, "error" => "Données manquantes"]);
                    die;
                }

                $req = $db->prepare("UPDATE livreur SET NOMLIVR = :NOMLIVR, PRENOMLIVR = :PRENOMLIVR, DATEEMBAUCHLIVR = :DATEEMBAUCHLIVR WHERE NROLIVR = :NROLIVR;");
                $req->bindValue(":NOMLIVR", $put_vars["NOMLIVR"]);
                $req->bindValue(":PRENOMLIVR", $put_vars["PRENOMLIVR"]);
                $req->bindValue(":DATEEMBAUCHLIVR", $put_vars["DATEEMBAUCHLIVR"]);
                $req->bindValue(":NROLIVR", $put_vars["NROLIVR"]);
                $req->execute();

                if ($req->rowCount()) echo json_encode(["success" => true]);
                else echo json_encode(["success" => false, "error" => "Vous n'êtes pas propriétaire"]);
                break;

            case "deleteLivreur":
                if (!isset($_POST["NROLIVR"]) || empty(trim($_POST["NROLIVR"]))) {
                    echo json_encode(["success" => false, "error" => "Id manquant"]);
                    die;
                }

                $req = $db->prepare("DELETE FROM livreur WHERE NROLIVR = ?");
                $req->execute([$_POST["NROLIVR"]]);

                if ($req->rowCount()) echo json_encode(["success" => true]);
                else echo json_encode(["success" => false, "error" => "Vous n'êtes pas propriétaire"]);
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

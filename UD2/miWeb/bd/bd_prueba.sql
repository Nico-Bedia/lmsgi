<?php
// Conexión inicial a MySQL (sin especificar base de datos)
$servername = "localhost";
$username = "root";
$password = ""; // Cambiar si tienes una contraseña en MySQL

$conn = new mysqli($servername, $username, $password);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Crear base de datos
$dbname = "FormularioDB";
$sql = "CREATE DATABASE IF NOT EXISTS $dbname";
if ($conn->query($sql) === TRUE) {
    echo "Base de datos creada exitosamente (si no existía).<br>";
} else {
    die("Error al crear la base de datos: " . $conn->error);
}

// Seleccionar la base de datos
$conn->select_db($dbname);

// Crear tabla para guardar datos del formulario
$tabla = "usuarios";
$sql = "CREATE TABLE IF NOT EXISTS $tabla (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mensaje TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)";
if ($conn->query($sql) === TRUE) {
    echo "Tabla '$tabla' creada exitosamente (si no existía).<br>";
} else {
    die("Error al crear la tabla: " . $conn->error);
}

// Procesar formulario cuando se envíe
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $conn->real_escape_string($_POST["nombre"]);
    $email = $conn->real_escape_string($_POST["email"]);
    $mensaje = $conn->real_escape_string($_POST["mensaje"]);

    $sql = "INSERT INTO $tabla (nombre, email, mensaje) VALUES ('$nombre', '$email', '$mensaje')";
    if ($conn->query($sql) === TRUE) {
        echo "Datos guardados exitosamente.<br>";
    } else {
        echo "Error al guardar los datos: " . $conn->error;
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario PHP</title>
</head>
<body>
    <h1>Formulario</h1>
    <form method="POST" action="">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="mensaje">Mensaje:</label><br>
        <textarea id="mensaje" name="mensaje" rows="5" cols="30" required></textarea><br><br>

        <button type="submit">Enviar</button>
    </form>
</body>
</html>

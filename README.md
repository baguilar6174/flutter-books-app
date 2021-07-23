# Books App

Esta aplicación ha sido creada usando [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) y Cubit para la gestión del estado. Esta sencilla aplicación consume datos de la ApiRest [Faker Api](https://fakerapi.it/en) para mostrar libros (fake) de manera aleatoria. La interfaz presentada es sencilla ya que se han concentrado los esfuerzos en crear una arquitectura y estructura de directorios flexible y escalable.

# Autor

Este proyecto ha sido basado en el [repositorio](https://github.com/deus-magna/clean_books) de [@deus-magna](https://github.com/deus-magna).

## Cómo usar

Esta aplicación ha sido creada con Flutter en su versión `2.2.3` y Dart en su versión `2.13.4`,

Paso 1:

Descargar o clonar este repositorio con el siguiente comando

```
git clone https://github.com/bryanAguilar001/flutter-books-app.git
```

Paso 2

En la raíz del proyecto ejecute el siguiente comando en la consola para obtener las dependencias necesarias:

```
flutter pub get
```

## Características

- La aplicación ha sido estructurada siguiendo Clean Architecture
- Consumo de una ApiRest
- Muestra información en una interfaz sencilla
- Es adaptable a dispositivos desktop, tablet y mobile
- Ha sido creada usando el gestor de estados Cubit

## Librerías & Paquetes usados

- `equatable: ^2.0.3`: Permite hacer una comparación de objetos en un nivel profundo (amigable con testing).
- `dartz: ^0.10.0-nullsafety.2`: Provee función de enviar un modelo y una excepción en un mismo encapsulado. Esto permite el control y manipulación de errores.
- `http: ^0.13.3`: Permite realizar peticiones http
- `bloc: ^7.0.0`: Manejo de estado con Cubit
- `flutter_bloc: ^7.0.1`: Manejo de estado con Cubit
- `responsive_builder: ^0.4.1`: Permite controlar la parte responsiva de la interfaz de usuario.
- `get_it: ^7.2.0`: Para realizar la inyección de dependencias

# Arquitectura del proyecto

![Project Architecture](https://github.com/bryanAguilar001/flutter-books-app/blob/main/media/architecture.png?raw=true)

> Project Architecture

Básicamente se ha dividido el proyecto en tres capas: principalmente las capas de `data`, `domain` y `ui`.
1. La capa de `ui` contiene todo lo relacionado a la interfaz de usuario. Aquí se maneja el gestor de estados para controlar acciones como animaciones, transiciones acciones de botones, etc.
2. En la capa de `domain` se manejan los casos de uso, se pueden ver como las tareas, feature o historias de usuario. Aquí se encuentran las entidades o modelos de los datos que permiten el uso y transferencia de datos.
3. En la capa de `data` se implementa el patrón `repository` que nos ayuda a tener un gestor de datos para controlar la recepción de información de diversas fuentes. Estas fuentes de datos se denominan `datasources` que se encargan de obtener la información de distintas fuentes (locales o remotos).

Hay que tener en cuenta que tanto la capa de datos como de presentación están acopladas a la de dominio. Esto permite, cambiar de manera sencilla la fuente de datos o la interfaz gráfica (siempre que el dominio se mantenga).

## Books App

<br>
<table>
  <tr>
    <td>Main Screen</td>
  </tr>
  <tr>
    <td align="center" valign="center"><img src="https://github.com/bryanAguilar001/flutter-books-app/blob/main/media/books_detail.png?raw=true" width="40%"></td>
  </tr>
 </table>
<br>

# InteHouse

InteHouse es una aplicación Flutter orientada a la gestión y control visual de un hogar inteligente. La app presenta una interfaz moderna y animada para seleccionar habitaciones y ajustar configuraciones como iluminación, temperatura, temporizador y reproducción de música, simulando un panel central de control del hogar.

Se trata de una experiencia de UI/UX enfocada en un dashboard de automatización del hogar, con un estilo oscuro, visuales dinámicos y una navegación entre habitaciones con transiciones suaves.

## Capturas de la idea del producto

La aplicación se compone de:

- Pantalla principal con selección de habitaciones
- Vista tipo carrusel de habitaciones con animación
- Detalle de cada ambiente con controles interactivos
- Diseño oscuro y personalizado para un look premium
- Uso de imágenes, tipografía y animaciones para reforzar la experiencia visual

## Funcionalidades principales

- Selección de distintas habitaciones del hogar
- Vista panorámica de los ambientes disponibles
- Dashboard detallado por habitación
- Control de iluminación con intensidad
- Gestión del temporizador de luces
- Ajuste de climatización / aire acondicionado
- Estado de música y sonido
- Interfaz responsiva y adaptable para múltiples tamaños de pantalla

## Arquitectura del proyecto

La estructura del proyecto está organizada con un enfoque modular y claro:

```text
lib/
├── main.dart
├── features/
│   ├── home/
│   │   └── presentation/
│   │       ├── screens/
│   │       └── widgets/
│   └── smart_room/
│       ├── screens/
│       └── widgets/
├── main_core/
│   ├── app/
│   │   └── app.dart
│   ├── shared/
│   │   ├── domain/
│   │   │   └── entities/
│   │   └── presentation/
│   │       └── widgets/
│   ├── theme/
│   │   ├── sh_colors.dart
│   │   ├── sh_icons.dart
│   │   ├── sh_theme.dart
│   │   └── theme.dart
│   └── core.dart
└── ...
```

### Descripción de capas

- `main.dart`
  - Punto de entrada de la aplicación.
  - Inicializa la app con `runApp(const HomeApp());`

- `lib/main_core/app/app.dart`
  - Define el `MaterialApp`.
  - Configura `ScreenUtilInit` para escalado responsivo.
  - Asigna el tema principal de la app.

- `lib/main_core/theme/`
  - Contiene la paleta de colores, íconos y tema visual global.
  - Define `SHTheme.dark`, que personaliza tipografía, sliders, navegación y fondos.

- `lib/main_core/shared/`
  - Separa la lógica y elementos reutilizables:
    - `domain`: entidades y modelos del negocio
    - `presentation`: widgets compartidos de UI

- `lib/features/home/`
  - Responsable de la pantalla principal del hogar y el selector de habitaciones.

- `lib/features/smart_room/`
  - Contiene la pantalla de detalle de cada habitación y los widgets de control para iluminación, música, clima y temporizadores.

## Modelo de dominio

La app usa modelos como `SmartRoom`, `SmartDevice` y `MusicInfo` para representar el estado de cada ambiente. Los datos actuales se encuentran como valores simulados (`fakeValues`), por lo que la experiencia actual es un prototipo funcional visual más que una integración con backend real.

Esto permite:

- probar la interfaz rápidamente
- estructurar la app con un modelo claro
- facilitar ampliaciones futuras con API, Firebase o servicios reales

## Paquetes principales

El proyecto usa varios paquetes importantes en `pubspec.yaml`:

- `flutter`
  - SDK principal de la app.

- `cupertino_icons`
  - Íconos nativos estilo iOS.

- `flutter_screenutil`
  - Ayuda a adaptar layouts y tamaños en múltiples pantallas.

- `google_fonts`
  - Tipografía personalizada para mejorar la identidad visual.

- `fluttericon`
  - Íconos personalizados extra.

- `ui_common`
  - Dependencia remota (`git`) para compartir utilidades visuales y componentes comunes.

Además, se usa un tema personalizado y una paleta de colores propia para mantener una estética uniforme.

## Requisitos previos

Antes de ejecutar el proyecto, asegúrate de tener instalado:

- Flutter SDK 3.2.1 o superior
- Dart SDK compatible con la versión indicada en `pubspec.yaml`
- Un emulador o dispositivo físico Android/iOS/Web

## Instalación

1. Clona el repositorio:

```bash
git clone https://github.com/YaelHuerta1/InteHouse.git
cd InteHouse
```

2. Instala las dependencias:

```bash
flutter pub get
```

3. Ejecuta la aplicación:

```bash
flutter run
```

## Ejecución por plataforma

### Android
```bash
flutter run
```

### Web
```bash
flutter run -d chrome
```

### iOS
```bash
flutter run -d ios
```

## Comandos útiles

Para revisar el código y validar que todo esté correcto:

```bash
flutter analyze
```

Para ejecutar pruebas:

```bash
flutter test
```

Para generar una build de producción en Android:

```bash
flutter build apk
```

## Estado del proyecto

Este repositorio funciona como una interfaz de smart home con datos simulados y una arquitectura de Flutter bien definida para crecer con nuevas funcionalidades. Actualmente está centrado en la experiencia visual y la estructura modular del producto, más que en la integración con servicios externos.

## Conclusión

InteHouse es un proyecto Flutter enfocado en la experiencia de control inteligente del hogar, con una interfaz premium, diseño oscuro y componentes animados. Su organización por `features` y `main_core` facilita la escalabilidad y la incorporación de nuevas pantallas, estados y servicios en el futuro.

## Licencia

Este proyecto no especifica una licencia en el repositorio actual.

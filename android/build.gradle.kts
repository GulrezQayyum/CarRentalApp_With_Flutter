allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Optional: Custom build directory (only if needed)
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    // Apply custom build dir per subproject
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)

    // Ensure ':app' is evaluated first
    project.evaluationDependsOn(":app")
}

// Clean task to delete build dir
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

// Dependencies for the root project (e.g., Google Services plugin)
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:7.3.0") // Match Flutter's version
        classpath("com.google.gms:google-services:4.4.3")  // For Firebase
    }
}
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.buildDir = file("build")
subprojects {
    buildDir = file("build")
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

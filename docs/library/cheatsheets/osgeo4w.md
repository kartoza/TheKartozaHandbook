# OSGeo4W

??? danger "Work in Progress"

    This article is under heavy development and is not considered production ready

OSGeo4W is an initiative from osgeo.org for packaging OpenSource Geospatial Systems, which are typically designed on and for Linux based systems, in an easy to use process that allows these systems (such as GRASS, QGIS, and others) to function well on the Windows Platform and manage each system and its dependencies in an easy to use way.

## Legacy systems

Note that OSGeo4W _used_ to be called `OSGeo4W` for the 32-bit installation and `OSGeo4W64` for the 64-bit installation. In 2021 a new OSGeo4W installer was created and support for legacy 32-bit systems was dropped. If you are using an older installation, it is highly recommended

## CLI

OSGeo4W provides an isolated environment that keeps to the "everything is a file" philosophy of Linux systems. This means that all of the dependencies of the system are packaged within the OSGeo4W directory (typically "C:\OSGeo4W"). This makes it easy to install and manage the system, however it also means that the windows environment doesn't know how to access these utilities all by itself.

This means that using some commandline tools, like GDAL for example, will not be available by default.

```powershell
PS C:\Users\Username> Get-Command gdalinfo
Get-Command: The term 'gdalinfo' is not recognized as a name of a cmdlet, function, script file, or executable program.
Check the spelling of the name, or if a path was included, verify that the path is correct and try again.
PS C:\Users\Username> cmd /k "where gdalinfo"
INFO: Could not find files for the given pattern(s).
```

To access the OSGeo4W environment, we simply need to "call" the OSGeo4W batch script which handles the environment for us.

```powershell
PS C:\Users\Username> cmd /k "call C:/OSGeo4W/OSGeo4W.bat"
run o-help for a list of available commands
C:\OSGeo4W>where gdalinfo
C:\OSGeo4W\bin\gdalinfo.exe
C:\OSGeo4W>o-help
```

When you start an OSGeo4W application, like QGIS Desktop for example, it will handle this environment configuration for you. If, however, you are performing other operations, such as using the qgis_processing framework or GRASS commandline tools, you will need to configure this environment yourself.

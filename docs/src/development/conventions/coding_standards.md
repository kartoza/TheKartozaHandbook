# Python Coding Standards

## General Approach

* Use github for revision control, issue tracking and management. And use the [the recommended workflow](https://github.com/inasafe/inasafe/wiki/Contribute-new-features-workflow) whenever possible.
* Adherence to regression/unit testing wherever possible (`make test`) with a 
minimum code coverage of 80%.
* Simple deployment procedure - all dependencies must be delivered with
  the plugin installer for QGIS or exist in standard QGIS installs.
* Develop in the spirit of XP/Agile, i.e. frequent releases, continuous
  integration and iterative development. The master branch should always
  be assumed to represent a working demo with all tests passing.
* If a method or function is longer than a single screen, it is probably a
  candidate for refactoring into smaller methods / functions. Writing smaller
  methods makes your code easier to read and to test.
* If you use a few lines of code in more than one place, refactor them into
  their own function.

## Platform support

Currently the following platforms should be supported:

* OSX - latest release
* Linux - Ubuntu current LTS
* Windows - 7, 8



## Compliance

* Coding must follow a style guide. In case of Python it is
  [PEP8](http://www.python.org/dev/peps/pep-0008) and
  using the command line tool pep8 (or `make pep8`) to enforce this.
  The pep8 checks E121-E128 have been disabled until pep8 version 1.3 becomes
  widely available.
* [Python documentation guide](http://www.python.org/dev/peps/pep-0257)
* Code must pass a [pylint validation](
  http://www.logilab.org/card/pylint_manual#what-is-pylint). You can test
  this using the make target ``make pylint``. In some cases you may wish to
  override a line or group of lines so that they are not validated by pylint.
  You can do this by adding either:

```python
     import foo  # pylint: disable=unused-imports
```

or:

```python
     # pylint: disable=unused-imports
     import foo
     print 'hello'
     print 'goodbye'
     # pylint: enable=unused-imports
```

**Note:** The use of messages codes (e.g. ``disable=W1234``) should be considered deprecated.
Any new exceptions should be added using the keyword format (e.g. ``disable=unused-exceptions``).


  .. note:: You can globally ignore messages by adding them to :file:`pylintrc`
     in the :samp:`[MESSAGES CONTROL]` section.

The following pylint messages have been thus globally excluded from the
check. For a discussion of these see also github issue
[#245](https://github.com/AIFDR/inasafe/issues/245).

  * All type R: Refactor suggestions such as limiting the number of local
                variables. We may bring some back later.
  * All type I: Information only
  * W0142: Allow the Python feature F(\*args, \*\*kwargs)
  * W0201: Allow definition of class attributes outside the constructor.
  * W0212: Allow access to protected members (e.g. _show_system_info)
  * W0231: Allow classes without constructors.
  * W0232: Un-instantiated classes is a feature used in this project.
  * W0403: Relative imports are OK for modules that live in the same dir
  * W0511: Appearance of TODO and FIXME is not a sign of poor quality
  * E1101: Disable check for missing attributes.
  * E1103: This one does not understand numpy variables.
  * C0103: Allow mathematical variables such as x0 or A.
  * C0111: Allow missing docstrings in some cases
  * C0302: No restriction on the number of lines per module

The following pylint check has been removed from Jenkins due to a bug in astroid.
  * E1002: Use of super on an old style class.

It is of course possible to run all pylint checks on any part of the code
  if desired: E.g pylint safe/storage/raster.py

# Naming conventions

Variable names should as far as possible follow python naming conventions (see
**Qt Notes** below for exceptions to this rule).

We reject the idea the code should be obfuscated with hard to understand
symbol names. For this reason all classes, methods, functions, variable names
should be written in full. At the same time overly verbose names should be
avoided. Here is an example of what we mean by this:

**Bad**:

```python
    cur_dpth = 0  # obscure
    currentDepth = 0  # camel case is not python standard
    content_of_page = 'foo'  # overly verbose
```

**Good**

```python
    current_depth = 0
    page_content = 'foo'
```

Avoid 'yoda speak' in variable names. 

**Bad**:

```python
    title_dialog = self.tr('Save Scenario')
```


**Good**:

```python
    dialog_title = self.tr('Save Scenario')
```

This is a summary of the naming conventions you should use:

* **package dir name**: concise (preferably single word) lower case, underscore
  separated e.g. ``utilities``.
* **module file name**: concise (preferably single word) lower case, underscore
  separated e.g. ``utilities.py``.
* **class name**: Concise singular camel case phrase e.g. ``PrintDialog``.
* **method and function name**: Concise lower case underscore separated name
  .e.g. ``remove_entry``. Avoid java style *get* suffixes as it adds no
  useful meaning to a symbol name.
* **variable naming**: Concise, unabbreviated, lower case, underscore separated
  e.g. ``population_count``.

# Code formatting

The guidelines above still leave substantial room for your own approach to
code style so the following provide some more explicit guidelines.

We follow a **'pull left'** policy in our code. This means that instead of e.g.::

```python
    def polygonize_thresholds(raster_file_name,
                          threshold_min=0.0,
                          threshold_max=float('inf')):
```

You should rather do this:

```python
    def polygonize_thresholds(
        raster_file_name,
        threshold_min=0.0,
        threshold_max=float('inf')):
```

The same applies in all other contexts. For example, calling a function:

```python
    clipped_exposure = clip_layer(
        layer=exposure_layer,
        extent=geo_extent,
        cell_size=cell_size,
        extra_keywords=extra_exposure_keywords,
        hard_clip_flag=self.clip_hard)
```

We do this because the 80 character line limit in PEP8 can cause visual clutter
in your code as you manage line breaks as you run up to the 80 column limit. By
always pulling code left as much as possible, we reduce the amount of line
continuation management we have to do.

# Ordering of imports

When importing please adhere to the following rules:

Do not do ``*`` imports e.g. 

```python
from PyQt4.QtGui import *
```
is bad.

Either import the individual modules you need e.g.

```python
from PyQt4.QtGui import QProgressDialog
``` 
or import the whole package and use the namespace to reference a module e.g.:

```python
    from PyQt4 import QtGui

    progress = QtGui.QProgressDialog()
```

Imports should be made in the following order:

* core python imports (e.g. ``import os``)
* third party imports (e.g. ``from PyQt4 import QtGui``)
* application imports (e.g. ``from foo import bar``)

Doc strings and comments
------------------------

All code should be self documenting. Please take special note and follow
these PEP guidelines and sphinx documents:

* http://www.python.org/dev/peps/pep-0287/
* http://sphinx-doc.org/markup/desc.html#info-field-lists
* http://thomas-cokelaer.info/tutorials/sphinx/docstring_python.html

We follow these specific guidelines for our code:

* Docstrings must triple quoted with ``"""``
* Inline comments should start with a # and a single space.
* Comments should be **complete sentences** ending with a full stop / period.
* If a comment is a phrase or sentence, its first word should be capitalized,
  unless it is an identifier that begins with a lower case letter (never alter
  the case of identifiers!).

We use the following style for documenting functions and class methods:

```python

class MyObject(object):

   """My new class."""

    def set_keyword_db_path(self, path):
        """Set the path for the keyword database (sqlite).

        The file will be used to search for keywords for non local datasets.

        :param path: A valid path to a sqlite database. The database does
            not need to exist already, but the user should be able to write
            to the path provided.
        :type path: str

        :returns: Flag indicating if the path was set successfully.
        :rtype: boolean
        """
        self.keyword_db_path = str(path)
```

Another example:

```
class MyObject(object):

   """My new class."""

    def add_layers(scenario_dir, paths):
        """Add the layers described in a scenario file to QGIS.

        :param scenario_dir: Base directory to find path.
        :type scenario_dir: str

        :param paths: Path of scenario file (or a list of paths).
        :type paths: str, list

        :raises: Exception, TypeError, FileNotFoundError

        .. note::
            * Exception - occurs when paths have illegal extension
            * TypeError - occurs when paths is not string or list
            * FileNotFoundError - occurs when file not found
    """
```

Note the following in the above examples:

* The first line of a docstring should be a precis of the class/method/function
  expressed in less than 80 chars, terminated with a full stop and exclude
  redundant phrases such as 'Class to do x' or 'This method does...'.
* There should be an empty line following the first docstring line.
* More detailed explanation and usage examples can follow this first line. The
  detailed explanation should not repeat the information provided in the
  parameters and returns sections.
* A line break should follow the optional detailed description.
* **param** and **type** are grouped together with no line break between them.
* If the param description is more than one line, indent the successive lines
  with 4 spaces.
* A newline should be placed after each type and rtype.
* If multiple types are allowed, separate them with commas e.g. ``:rtype: str,
  boolean``.
* If a function or method returns nothing, no **returns** section is used.
* If a function or method does not raise anything explicitly, no raises section
  is used.
* If a function or method is extremely obvious there is no need to have
  anything more than a single line docstring.
* If a function or method returns a tuple it should be be documented as
  ``:rtype: (<type>, <type>, ..)`` e.g. ``:rtype: (int, int)``.

Please also see the **api documentation how-to** section for more
information on how to document your code properly.

# Annotating API changes and additions

Whenever you add or change a module, class, function or method, you should
annotate it accordingly. The method for doing this is described on the
`Sphinx paragraph markup page <http://sphinx-doc.org/markup/para.html>`_. Here
are a couple of examples:

Adding a new module:

```python
    """Impact function utilities.

    .. versionadded:: 2.1
    ""'
```

Adding a new method to a class:

```
    """Computes the number of affected people.

    .. versionadded:: 2.1
    """
```

Changing an existing method API:

```
    def show_static_message(self, message, foo):
    """Send a static message to the message viewer.

    .. versionchanged:: 2.1
        Added foo parameter.

    Static messages cause any previous content in the MessageViewer to be
    replaced with new content.

    :param message: An instance of our rich message class.
    :type message: Message

    :param foo: Some new parameter.
    :type foo: str

    """
    dispatcher.send(
        signal=STATIC_MESSAGE_SIGNAL,
        sender=self,
        message=message)
```


# Strings and internationalisation

* Simple strings in source code should be quoted with `'`
* Favour interpolation over concatenation. For example this is **bad**:

```python
    world = 'World'
    foo = 'Hello ' + world
```

And this is **good**:

```
    world = 'World'
    food = 'Hello %s' % world
```

* Use parenthesis for long strings. For example this is **bad**:

```python
    foo = 'The quick brown fox jumps over the lazy dog. ' +
          'The slow fat rat runs around the mouldy cheese.'
```

And this is **good**:

```python
    bar = (
        'The quick brown fox jumps over the lazy dog. '
        'The slow fat rat runs around the mouldy cheese.')
```

**Note**: The good example above follows the 'pull left' principle.

* All strings should be internationalisation enabled. Please see [i18n]
  for details.
* When using gettext, alias the uggettext as tr, and do not use the common
  convention of ``_('foo')`` as the underscore trips up some tools like pylint,
  sphinx. Also using ``tr`` makes it easy to migrate code to and from Qt's
  translation system and gettext. **Note**: gettext use is deprecated in InaSAFE.

* If you use a literal string or expression in more than one place, refactor
  it into a function or variable.

# Standard headers

Each source file should include a standard header containing copyright,
authorship and version metadata as shown in the exampled below.

**Example standard header**

```
# -*- coding: utf-8 -*-
"""One line description.

.. tip::
   Detailed multi-paragraph description...
"""

import os  # python core imports first
import qgis.core  # then external imports
import safe.utils.gis  # then project imports (always using full path)

__copyright__ = "Copyright 2016, The InaSAFE Project"
__license__ = "GPL version 3"
__email__ = "info@inasafe.org"
__revision__ = '$Format:%H$'

```

**Note**:: Please see [faq_developer] for details on how the revision tag
is replaced with the SHA1 for the file when the release packages are made.


# Qt Guidelines

Compile UI files at run time. There is no need to precompile UI files using
pyuic4. Rather you can dynamically compile them using this technique (see
[technical docs here](http://pyqt.sourceforge.net/Docs/PyQt4/designer.html#the-uic-module):

```python
    import os
    from PyQt4 import QtGui, uic

    BASE_CLASS = uic.loadUiType(os.path.join(
        os.path.dirname(__file__), 'foo_dialog_base.ui'))[0]


    class FooDialog(QtGui.QDialog, BASE_CLASS):
        
"""Dialog for defining the plugin properties.

        """
        def __init__(self, parent=None):
            """Constructor."""
            super(FooDialog, self).__init__(parent)
            # Set up the user interface from Designer.
            self.setupUi(self)
```

Don't use old style signal/slot connectors:

```python
    QtCore.QObject.connect(
        self.help_button, QtCore.SIGNAL('clicked()'), self.show_help)
```

Use new style connectors::

```
    self.help_button.clicked.connect(self.show_help)
```

Use multi-inheritance for designer based classes so that we can use autoconnect
slots.:

```python
    class FooDialog(QtGui.QDialog, Ui_FooBase):
        """Dialog to prompt for widget names."""

        def __init__(self, parent=None):
            """Constructor for the dialog.

            This dialog will allow the user to select foo names from  a list.

            :param parent: Optional widget to use as parent
            :type parent: QWidget
            """
            QtGui.QDialog.__init__(self, parent)
            # Set up the user interface from Designer.
            self.setupUi(self)
            # ... further implementation here ...
```

Then we can do this to listen for a click on button bar:

```python
    def on_bar_clicked(self):
        """Auto slot to listen for button click."""
        pass
```

The callback above is called when the button is clicked simply by virtue of the
fact that it uses the naming convention ``on_<object>_clicked``.

Note that in some cases you need to explicitly specify which signature is being
listened for by using the pyqtSignature decorator:

```
    @pyqtSignature('int')
    def on_polygon_layers_combo_currentIndexChanged(self, theIndex=None):
        """Automatic slot executed when the layer is changed to update fields.

        :param theIndex: Passed by the signal that triggers this slot.
        :type theIndex: int
        """
        layerId = self.polygon_layers_combo.itemData(
            theIndex, QtCore.Qt.UserRole)
        return layer_id
```

Failure to do this may result in the slot being called multiple times per event
which is usually undesirable.

Also in some cases using the Qt API will lead you into conflict with our PEP8
naming conventions for methods and variables. This is unavoidable but should
be used only in these specific instances e.g.:

```python
    def on_foo_indexChanged():
        pass
```

Qt's naming convention causes a bit of a clash when using with 'normal' python
underscore names. For this reason we adopt the following strategy:

* in designer use underscore based naming for objects
* in your concrete implementations you should be able to then use mostly
  underscore separated names except in cases where using autoconnect slots.
* in designer you should call the form a name ending in Base e.g.
  ``FooDialogBase``. By convention the concrete implementation is called the
  same sans the Base suffix e.g. ``FooDialog``.

# Human Interface Guidelines

Please see the dedicated page for [Human Interface Guidelines](human-interface-guidelines).

# Code statistics

* https://www.ohloh.net/p/inasafe/analyses/latest
* https://github.com/AIFDR/inasafe/network
* https://github.com/AIFDR/inasafe/graphs


# Working with GIT

* Additions to the develop branch should be made via the GitHub **pull request** mechanism
* Pull requests should preferably be **squashed** into a single commit before applying (see http://eli.thegreenplace.net/2014/02/19/squashing-github-pull-requests-into-a-single-commit)
* Commits and pull requests should reference the issue number they close or contribute to

# Landscape
```python
# coding=utf-8-

"""One line description with full stop. New line after file-docstring."""

import os
import qgis.core
import safe.utils.gis

__copyright__ = "Copyright 2016, The InaSAFE Project"
__license__ = "GPL version 3"
__email__ = "info@inasafe.org"
__revision__ = '$Format:%H$'

class MyObject(object):

    """Class docstring with one new line before and after and full stop."""

    def my_function(self, foo):
    """One line descriptive sentence with full stop and a new line between each block.

    Extra information goes here.

    :param foo: Text with full stop.
    :type foo: object

    :return: It returns something.
    :rtype: basestring
    """
    i = 0  # No new line after method/function docstring.
    return i
```
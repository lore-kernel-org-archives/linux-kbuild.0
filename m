Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:56742 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752574AbYB2WV5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Feb 2008 17:21:57 -0500
Received: from midway.site ([71.245.99.126]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Fri, 29 Feb 2008 14:21:54 -0800
Date: Fri, 29 Feb 2008 14:21:53 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH v2] kbuild: make *config usage docs
Message-Id: <20080229142153.9c6a656e.rdunlap@xenotime.net>
In-Reply-To: <20080215132223.GE1178@uranus.ravnborg.org>
References: <20080212155228.0c913874.rdunlap@xenotime.net>
	<20080215132223.GE1178@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Fri, 15 Feb 2008 14:22:23 +0100 Sam Ravnborg wrote:

> Hi Randy.
> 
> On Tue, Feb 12, 2008 at 03:52:28PM -0800, Randy Dunlap wrote:
> > Hi,
> > 
> > I'm trying to catch up on some old/dropped patches.
> > Here's from from Oct./2006:
> >   http://marc.info/?l=linux-kernel&m=116114965011388&w=2
> > 
> > Any interest in this or should I just nuke it?
> Please - do not nuke it...
> We need documentation for both kconfig and kbuild.
> 
> General comments...
> I would have preferred an asciidoc compatible format but no big deal.
> 
> Should we combine kconfig and kbuild stuff in a single file?
> People often confuse the two things - and they are also closely
> interrelated so documenting then in the same file makes sense.

Specifically which files would you consider combining?

> > Mostly contains user interface and search topics, along with
> > mini.config/custom.config usage.
> > 
> > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> > ---
> >  Documentation/kbuild/00-INDEX         |    2 
> >  Documentation/kbuild/make-configs.txt |  167 ++++++++++++++++++++++++++++++++++
> >  README                                |   17 +--
> >  3 files changed, 175 insertions(+), 11 deletions(-)
> > 
> > --- /dev/null
> > +++ linux-2619-rc2-ppc/Documentation/kbuild/make-configs.txt
> > @@ -0,0 +1,167 @@

> > +======================================================================
> > +menuconfig
> > +--------------------------------------------------
> > +
> > +SEARCHING for CONFIG symbols
> > +
> > +Searching in menuconfig:
> > +
> > +	The Search function searches for kernel configuration symbol
> > +	names, so you have to know something close to what you are
> > +	looking for.
> > +
> > +	Example:
> > +		/hotplug
> > +		This lists all config symbols that contain "hotplug",
> > +		e.g., HOTPLUG, HOTPLUG_CPU, MEMORY_HOTPLUG.
> > +
> > +	For search help, enter / followed TAB-TAB-TAB (to highlight
> > +	<Help>) and Enter.  This will tell you that you can also use
> > +	regular expressions (regexes) in the search string, so if you
> > +	are not interested in MEMORY_HOTPLUG, you could try
> > +
> > +		/^hotplug
> > +
> > +
> It is not entirely obvious that '/' brings up a dialog.

It's listed in menuconfig's main help text.
Do you have any suggestions?

> > +______________________________________________________________________
> > +Environment variables in 'menuconfig'
> > +
> > +KCONFIG_ALLCONFIG
> > +--------------------------------------------------
...
> > +
> Can I ask you to document the others:
> conf.c:         name = getenv("KCONFIG_ALLCONFIG");
> conf.c:         name = getenv("KCONFIG_NOSILENTUPDATE");

Those are already done.

> confdata.c:     char *name = getenv("KCONFIG_CONFIG");
> confdata.c:     env = getenv("KCONFIG_OVERWRITECONFIG");
> confdata.c:     env = getenv("KCONFIG_NOTIMESTAMP");
> confdata.c:     name = getenv("KCONFIG_AUTOCONFIG");
> confdata.c:     name = getenv("KCONFIG_AUTOHEADER");

Added.

> Their usage should be more or less self explanatory,
> otherwise look at the commit when they were added.
> 
> > +______________________________________________________________________
> > +menuconfig User Interface Options
> > +----------------------------------------------------------------------
> > +LINES and COLUMNS
> > +--------------------------------------------------
> > +See the menuconfig embedded help text.
> 
> We do not check these anymore. I do not see the need to reference these here.

Dropped.

> > --- linux-2619-rc2-ppc.orig/README
> > +++ linux-2619-rc2-ppc/README
> > @@ -50,9 +50,9 @@ DOCUMENTATION:
> >  
> >   - The Documentation/DocBook/ subdirectory contains several guides for
> >     kernel developers and users.  These guides can be rendered in a
> > -   number of formats:  PostScript (.ps), PDF, and HTML, among others.
> > -   After installation, "make psdocs", "make pdfdocs", or "make htmldocs"
> > -   will render the documentation in the requested format.
> > +   number of formats:  PostScript (.ps), PDF, HTML, & man-pages, among others.
> > +   After installation, "make psdocs", "make pdfdocs", "make htmldocs",
> > +   or "make mandocs" will render the documentation in the requested format.
> 
> Unrelated change...

It's related to "I was trying to fix some kbuild usage text."

Updated patch below.

---
From: Randy Dunlap <randy.dunlap@oracle.com>

Create a kconfig user assistance guide, with a few tips and hints
about using menuconfig, xconfig, and gconfig.

Mostly contains user interface, environment variables, and search topics,
along with mini.config/custom.config usage.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 Documentation/kbuild/00-INDEX         |    2 
 Documentation/kbuild/make-configs.txt |  188 ++++++++++++++++++++++++
 README                                |   32 ++--
 3 files changed, 210 insertions(+), 12 deletions(-)

--- linux-2625-rc3-kdoc.orig/Documentation/kbuild/00-INDEX
+++ linux-2625-rc3-kdoc/Documentation/kbuild/00-INDEX
@@ -4,5 +4,7 @@ kconfig-language.txt
 	- specification of Config Language, the language in Kconfig files
 makefiles.txt
 	- developer information for linux kernel makefiles
+make-configs.txt
+	- usage help for make *config
 modules.txt
 	- how to build modules and to install them
--- /dev/null
+++ linux-2625-rc3-kdoc/Documentation/kbuild/make-configs.txt
@@ -0,0 +1,188 @@
+This file contains some assistance for using "make *config".
+
+Use "make help" to list all of the possible configuration targets.
+
+The xconfig ('qconf') and menuconfig ('mconf') programs also
+have embedded help text.  Be sure to check it for navigation,
+search, and other general help text.
+
+======================================================================
+General
+--------------------------------------------------
+
+New kernel releases often introduce new config symbols.  Often more
+important, new kernel releases may rename config symbols.  When
+this happens, using a previously working .config file and running
+"make oldconfig" won't necessarily produce a working new kernel
+for you, so you may find that you need to see what NEW kernel
+symbols have been introduced.
+
+To see a list of new config symbols when using "make oldconfig", use
+
+	cp user/some/old.config .config
+	yes "" | make oldconfig >conf.new
+
+and the config program will list as (NEW) any new symbols that have
+unknown values.  Of course, the .config file is also updated with
+new (default) values, so you can use:
+
+	grep "(NEW)" conf.new
+
+to see the new config symbols or you can 'diff' the previous and
+new .config files to see the differences:
+
+	diff .config.old .config | less
+
+(Yes, we need something better here.)
+
+
+======================================================================
+menuconfig
+--------------------------------------------------
+
+SEARCHING for CONFIG symbols
+
+Searching in menuconfig:
+
+	The Search function searches for kernel configuration symbol
+	names, so you have to know something close to what you are
+	looking for.
+
+	Example:
+		/hotplug
+		This lists all config symbols that contain "hotplug",
+		e.g., HOTPLUG, HOTPLUG_CPU, MEMORY_HOTPLUG.
+
+	For search help, enter / followed TAB-TAB-TAB (to highlight
+	<Help>) and Enter.  This will tell you that you can also use
+	regular expressions (regexes) in the search string, so if you
+	are not interested in MEMORY_HOTPLUG, you could try
+
+		/^hotplug
+
+
+______________________________________________________________________
+Color Themes for 'menuconfig'
+
+It is possible to select different color themes using the variable
+MENUCONFIG_COLOR.  To select a theme use:
+
+	make MENUCONFIG_COLOR=<theme> menuconfig
+
+Available themes are:
+  mono       => selects colors suitable for monochrome displays
+  blackbg    => selects a color scheme with black background
+  classic    => theme with blue background. The classic look
+  bluetitle  => a LCD friendly version of classic. (default)
+
+______________________________________________________________________
+Environment variables in 'menuconfig'
+
+KCONFIG_ALLCONFIG
+--------------------------------------------------
+(partially based on lkml email from/by Rob Landley, re: miniconfig)
+--------------------------------------------------
+The allyesconfig/allmodconfig/allnoconfig/randconfig variants can
+also use the environment variable KCONFIG_ALLCONFIG as a flag or a
+filename that contains config symbols that the user requires to be
+set to a specific value.  If KCONFIG_ALLCONFIG is used without a
+filename, "make *config" checks for a file named
+"all{yes/mod/no/random}.config" (corresponding to the *config command
+that was used) for symbol values that are to be forced.  If this file
+is not found, it checks for a file named "all.config" to contain forced
+values.
+
+This enables you to create "miniature" config (miniconfig) or custom
+config files containing just the config symbols that you are interested
+in.  Then the kernel config system generates the full .config file,
+including dependencies of your miniconfig file, based on the miniconfig
+file.
+
+This 'KCONFIG_ALLCONFIG' file is a config file which contains
+(usually a subset of all) preset config symbols.  These variable
+settings are still subject to normal dependency checks.
+
+Examples:
+	KCONFIG_ALLCONFIG=custom-notebook.config make allnoconfig
+or
+	KCONFIG_ALLCONFIG=mini.config make allnoconfig
+or
+	make KCONFIG_ALLCONFIG=mini.config allnoconfig
+
+These examples will disable most options (allnoconfig) but enable or
+disable the options that are explicitly listed in the specified
+mini-config files.
+
+KCONFIG_NOSILENTUPDATE
+--------------------------------------------------
+If this variable has a non-blank value, it prevents silent kernel
+config udpates (requires explicit updates).
+
+KCONFIG_CONFIG
+--------------------------------------------------
+This environment variable can be used to specify a default kernel config
+file name to override the default name of ".config".
+
+KCONFIG_OVERWRITECONFIG
+--------------------------------------------------
+If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
+break symlinks when .config is a symlink to somewhere else.
+
+KCONFIG_NOTIMESTAMP
+--------------------------------------------------
+If this environment variable exists and is non-null, the timestamp line
+in generated .config files is omitted.
+
+KCONFIG_AUTOCONFIG
+--------------------------------------------------
+This environment variable can be set to specify the path & name of the
+"auto.conf" file.  Its default value is "include/config/auto.conf".
+
+KCONFIG_AUTOHEADER
+--------------------------------------------------
+This environment variable can be set to specify the path & name of the
+"autoconf.h" (header) file.  Its default value is "include/linux/autoconf.h".
+
+______________________________________________________________________
+menuconfig User Interface Options
+----------------------------------------------------------------------
+MENUCONFIG_MODE
+--------------------------------------------------
+This mode shows all sub-menus in one large tree.
+
+Example:
+	MENUCONFIG_MODE=single_menu make menuconfig
+
+======================================================================
+xconfig
+--------------------------------------------------
+
+Searching in xconfig:
+
+	The Search function searches for kernel configuration symbol
+	names, so you have to know something close to what you are
+	looking for.
+
+	Example:
+		Ctrl-F hotplug
+	or
+		Menu: File, Search, hotplug
+
+	lists all config symbol entries that contain "hotplug" in
+	the symbol name.  In this Search dialog, you may change the
+	config setting for any of the entries that are not grayed out.
+	You can also enter a different search string without having
+	to return to the main menu.
+
+
+======================================================================
+gconfig
+--------------------------------------------------
+
+Searching in gconfig:
+
+	None (gconfig isn't maintained as well as xconfig or menuconfig);
+	however, gconfig does have a few more viewing choices than
+	xconfig does.
+
+###
--- linux-2625-rc3-kdoc.orig/README
+++ linux-2625-rc3-kdoc/README
@@ -52,11 +52,11 @@ DOCUMENTATION:
 
  - The Documentation/DocBook/ subdirectory contains several guides for
    kernel developers and users.  These guides can be rendered in a
-   number of formats:  PostScript (.ps), PDF, and HTML, among others.
-   After installation, "make psdocs", "make pdfdocs", or "make htmldocs"
-   will render the documentation in the requested format.
+   number of formats:  PostScript (.ps), PDF, HTML, & man-pages, among others.
+   After installation, "make psdocs", "make pdfdocs", "make htmldocs",
+   or "make mandocs" will render the documentation in the requested format.
 
-INSTALLING the kernel:
+INSTALLING the kernel source:
 
  - If you install the full sources, put the kernel tarball in a
    directory where you have permissions (eg. your home directory) and
@@ -187,14 +187,9 @@ CONFIGURING the kernel:
 	"make randconfig"  Create a ./.config file by setting symbol
 			   values to random values.
 
-   The allyesconfig/allmodconfig/allnoconfig/randconfig variants can
-   also use the environment variable KCONFIG_ALLCONFIG to specify a
-   filename that contains config options that the user requires to be
-   set to a specific value.  If KCONFIG_ALLCONFIG=filename is not used,
-   "make *config" checks for a file named "all{yes/mod/no/random}.config"
-   for symbol values that are to be forced.  If this file is not found,
-   it checks for a file named "all.config" to contain forced values.
-   
+   You can find more information on using the Linux kernel config tools
+   in Documentation/kbuild/make-configs.txt.
+
 	NOTES on "make config":
 	- having unnecessary drivers will make the kernel bigger, and can
 	  under some circumstances lead to problems: probing for a
@@ -231,6 +226,19 @@ COMPILING the kernel:
  - If you configured any of the parts of the kernel as `modules', you
    will also have to do "make modules_install".
 
+ - Verbose kernel compile/build output:
+
+   Normally the kernel build system runs in a fairly quiet mode (but not
+   totally silent).  However, sometimes you or other kernel developers need
+   to see compile, link, or other commands exactly as they are executed.
+   For this, use "verbose" build mode.  This is done by inserting
+   "V=1" in the "make" command.  E.g.:
+
+	make V=1 all
+
+   To have the build system also tell the reason for the rebuild of each
+   target, use "V=2".  The default is "V=0".
+
  - Keep a backup kernel handy in case something goes wrong.  This is 
    especially true for the development releases, since each new release
    contains new code which has not been debugged.  Make sure you keep a

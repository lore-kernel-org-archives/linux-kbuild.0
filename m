Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:33752 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752029AbYBLACJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Feb 2008 19:02:09 -0500
Received: from midway.site ([71.245.99.126]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2008 16:02:04 -0800
Date: Mon, 11 Feb 2008 16:02:04 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [patch/rfc] relocate kconfig "package name" to
 Kconfig/environment
Message-Id: <20080211160204.c0e747e8.rdunlap@xenotime.net>
In-Reply-To: <200802111838.15973.vapier@gentoo.org>
References: <200802111838.15973.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-kbuild@vger.kernel.org

On Mon, 11 Feb 2008 18:38:15 -0500 Mike Frysinger wrote:

> This was discussed some time ago, but I don't really follow kconfig closely
> and the current source still doesn't do what I need, so I just banged it out.
> This moves the string "Linux kernel" out of hardcoded kconfig sources and into
> a Kconfig option.  This allows the projects that utilize kconfig as their
> build system to better integrate the menusystem into their project.  Rather
> than having to edit the sources all over the place, they only need to update
> the new "KERNELPACKAGE" setting to whatever represents their project.
> Feedback welcome! :)
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  Makefile                   |    3 ++-
>  init/Kconfig               |    4 ++++
>  scripts/kconfig/conf.c     |   10 +++++-----
>  scripts/kconfig/confdata.c |   17 ++++++++++++-----
>  scripts/kconfig/gconf.c    |    4 ++--
>  scripts/kconfig/mconf.c    |   21 ++++++++++++---------
>  scripts/kconfig/qconf.cc   |    4 ++--
>  7 files changed, 39 insertions(+), 24 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index c162370..5dac0d2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -338,8 +338,9 @@ KBUILD_AFLAGS   := -D__ASSEMBLY__
>  # Read KERNELRELEASE from include/config/kernel.release (if it exists)
>  KERNELRELEASE = $(shell cat include/config/kernel.release 2> /dev/null)
>  KERNELVERSION = $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
> +KERNELPACKAGE = Linux Kernel

Doesn't need quotes?

> -export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
> +export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION KERNELPACKAGE
>  export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
>  export CPP AR NM STRIP OBJCOPY OBJDUMP MAKE AWK GENKSYMS PERL UTS_MACHINE
>  export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
> diff --git a/init/Kconfig b/init/Kconfig
> index 824d48c..418f972 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -6,6 +6,10 @@ config KERNELVERSION
>  	string
>  	option env="KERNELVERSION"
>  
> +config KERNELPACKAGE
> +	string
> +	option env="KERNELPACKAGE"
> +

Each arch/$ARCH/Kconfig can have (and most do) a "mainmenu" entry
that could be useful here, either alone or combined with 'KERNELPACKAGE'.

>  config DEFCONFIG_LIST
>  	string
>  	depends on !UML
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index fda6313..aea2d3f 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -563,8 +563,8 @@ int main(int ac, char **av)
>  	case ask_silent:
>  		if (stat(".config", &tmpstat)) {
>  			printf(_("***\n"
> -				"*** You have not yet configured your kernel!\n"
> -				"*** (missing kernel .config file)\n"
> +				"*** You have not yet configured things!\n"

s/things/$KERNELPACKAGE/ ?

> +				"*** (missing .config file)\n"
>  				"***\n"
>  				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
>  				"*** \"make menuconfig\" or \"make xconfig\").\n"
> @@ -610,7 +610,7 @@ int main(int ac, char **av)
>  	} else if (conf_get_changed()) {
>  		name = getenv("KCONFIG_NOSILENTUPDATE");
>  		if (name && *name) {
> -			fprintf(stderr, _("\n*** Kernel configuration requires explicit update.\n\n"));
> +			fprintf(stderr, _("\n*** Configuration requires explicit update.\n\n"));

s/Configuration/$KERNELPACKAGE configuration/

>  			return 1;
>  		}
>  	} else
> @@ -621,12 +621,12 @@ int main(int ac, char **av)
>  		check_conf(&rootmenu);
>  	} while (conf_cnt);
>  	if (conf_write(NULL)) {
> -		fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
> +		fprintf(stderr, _("\n*** Error during writing of the configuration.\n\n"));

insert $KERNELPACKAGE where "kernel" was.

>  		return 1;
>  	}
>  skip_check:
>  	if (input_mode == ask_silent && conf_write_autoconf()) {
> -		fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
> +		fprintf(stderr, _("\n*** Error during writing of the configuration.\n\n"));

ditto.

>  		return 1;
>  	}
>  
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index ee5fe94..01796b8 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -392,7 +392,7 @@ int conf_read(const char *name)
>  int conf_write(const char *name)
>  {
>  	FILE *out;
> -	struct symbol *sym;
> +	struct symbol *sym, *pkg_sym;
>  	struct menu *menu;
>  	const char *basename;
>  	char dirname[128], tmpname[128], newname[128];
> @@ -438,6 +438,8 @@ int conf_write(const char *name)
>  
>  	sym = sym_lookup("KERNELVERSION", 0);
>  	sym_calc_value(sym);
> +	pkg_sym = sym_lookup("KERNELPACKAGE", 0);
> +	sym_calc_value(pkg_sym);
>  	time(&now);
>  	env = getenv("KCONFIG_NOTIMESTAMP");
>  	if (env && *env)
> @@ -445,9 +447,10 @@ int conf_write(const char *name)
>  
>  	fprintf(out, _("#\n"
>  		       "# Automatically generated make config: don't edit\n"
> -		       "# Linux kernel version: %s\n"
> +		       "# %s version: %s\n"
>  		       "%s%s"
>  		       "#\n"),
> +		     sym_get_string_value(pkg_sym),
>  		     sym_get_string_value(sym),

Why drop the "version: "?  I.e., must KERNELVERSION contain that
word if it is desired?


>  		     use_timestamp ? "# " : "",
>  		     use_timestamp ? ctime(&now) : "");
> @@ -668,7 +671,7 @@ out:
>  
>  int conf_write_autoconf(void)
>  {
> -	struct symbol *sym;
> +	struct symbol *sym, *pkg_sym;
>  	const char *str;
>  	char *name;
>  	FILE *out, *out_h;
> @@ -694,19 +697,23 @@ int conf_write_autoconf(void)
>  
>  	sym = sym_lookup("KERNELVERSION", 0);
>  	sym_calc_value(sym);
> +	pkg_sym = sym_lookup("KERNELPACKAGE", 0);
> +	sym_calc_value(pkg_sym);
>  	time(&now);
>  	fprintf(out, "#\n"
>  		     "# Automatically generated make config: don't edit\n"
> -		     "# Linux kernel version: %s\n"
> +		     "# %s version: %s\n"
>  		     "# %s"
>  		     "#\n",
> +		     sym_get_string_value(pkg_sym),
>  		     sym_get_string_value(sym), ctime(&now));

Ditto.

>  	fprintf(out_h, "/*\n"
>  		       " * Automatically generated C config: don't edit\n"
> -		       " * Linux kernel version: %s\n"
> +		       " * %s version: %s\n"
>  		       " * %s"
>  		       " */\n"
>  		       "#define AUTOCONF_INCLUDED\n",
> +		       sym_get_string_value(pkg_sym),
>  		       sym_get_string_value(sym), ctime(&now));

Ditto.

>  
>  	for_all_symbols(i, sym) {
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 199b22b..fcf80b5 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -266,8 +266,8 @@ void init_main_window(const gchar * glade_file)
>  					  /*"style", PANGO_STYLE_OBLIQUE, */
>  					  NULL);
>  
> -	sprintf(title, _("Linux Kernel v%s Configuration"),
> -		getenv("KERNELVERSION"));
> +	sprintf(title, _("%s v%s Configuration"),
> +		getenv("KERNELPACKAGE"), getenv("KERNELVERSION"));

But here at least a 'v' is added... (inconsistent)

>  	gtk_window_set_title(GTK_WINDOW(main_wnd), title);
>  
>  	gtk_widget_show(main_wnd);
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 734cf4f..cb5f1ee 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -362,13 +362,16 @@ static void set_config_filename(const char *config_filename)
>  {
>  	static char menu_backtitle[PATH_MAX+128];
>  	int size;
> -	struct symbol *sym;
> +	struct symbol *sym, *pkg_sym;
>  
>  	sym = sym_lookup("KERNELVERSION", 0);
>  	sym_calc_value(sym);
> +	pkg_sym = sym_lookup("KERNELPACKAGE", 0);
> +	sym_calc_value(pkg_sym);
>  	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
> -	                _("%s - Linux Kernel v%s Configuration"),
> -		        config_filename, sym_get_string_value(sym));
> +	                _("%s - %s v%s Configuration"),
> +	                config_filename, sym_get_string_value(pkg_sym),
> +	                sym_get_string_value(sym));

Ditto.

>  	if (size >= sizeof(menu_backtitle))
>  		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
>  	set_dialog_backtitle(menu_backtitle);
> @@ -894,7 +897,7 @@ int main(int ac, char **av)
>  		if (conf_get_changed())
>  			res = dialog_yesno(NULL,
>  					   _("Do you wish to save your "
> -					     "new kernel configuration?\n"
> +					     "new configuration?\n"
>  					     "<ESC><ESC> to continue."),
>  					   6, 60);
>  		else
> @@ -906,20 +909,20 @@ int main(int ac, char **av)
>  	case 0:
>  		if (conf_write(filename)) {
>  			fprintf(stderr, _("\n\n"
> -				"Error during writing of the kernel configuration.\n"
> -				"Your kernel configuration changes were NOT saved."
> +				"Error during writing of the configuration.\n"
> +				"Your configuration changes were NOT saved."

Insert $KERNELPACKAGE where "kernel" was.

>  				"\n\n"));
>  			return 1;
>  		}
>  	case -1:
>  		printf(_("\n\n"
> -			"*** End of Linux kernel configuration.\n"
> -			"*** Execute 'make' to build the kernel or try 'make help'."
> +			"*** End of source configuration.\n"
> +			"*** Execute 'make' to build the source or try 'make help'."
>  			"\n\n"));
>  		break;
>  	default:
>  		fprintf(stderr, _("\n\n"
> -			"Your kernel configuration changes were NOT saved."
> +			"Your configuration changes were NOT saved."
>  			"\n\n"));
>  	}
>  
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 5d0fd38..babf34a 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1276,8 +1276,8 @@ ConfigMainWindow::ConfigMainWindow(void)
>  	char title[256];
>  
>  	QWidget *d = configApp->desktop();
> -	snprintf(title, sizeof(title), _("Linux Kernel v%s Configuration"),
> -		getenv("KERNELVERSION"));
> +	snprintf(title, sizeof(title), _("%s v%s Configuration"),
> +		getenv("KERNELPACKAGE"), getenv("KERNELVERSION"));

'v' is added...

>  	setCaption(title);
>  
>  	width = configSettings->readNumEntry("/window width", d->width() - 64);
> -

---
~Randy

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:54231 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751539Ab0IKUWN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 16:22:13 -0400
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 13:22:08 -0700
Date: Sat, 11 Sep 2010 13:22:08 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH 04/15] kconfig: rephrase help texts/comments not to
 include the package name
Message-Id: <20100911132208.3b11b765.rdunlap@xenotime.net>
In-Reply-To: <1284220282-3500-5-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
	<1284220282-3500-5-git-send-email-lacombar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Sat, 11 Sep 2010 11:51:11 -0400 Arnaud Lacombe wrote:

> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/conf.c   |   11 +++++------
>  scripts/kconfig/gconf.c  |    3 +--
>  scripts/kconfig/mconf.c  |   38 ++++++++++++++++++--------------------
>  scripts/kconfig/nconf.c  |   43 +++++++++++++++++++------------------------
>  scripts/kconfig/qconf.cc |    2 +-
>  5 files changed, 44 insertions(+), 53 deletions(-)
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index b62d020..5459a38 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -508,8 +508,7 @@ int main(int ac, char **av)
>  		name = conf_get_configname();
>  		if (stat(name, &tmpstat)) {
>  			fprintf(stderr, _("***\n"
> -				"*** You have not yet configured your kernel!\n"
> -				"*** (missing kernel config file \"%s\")\n"
> +				"*** Configuration file \"%s\" not found!\n"
>  				"***\n"
>  				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
>  				"*** \"make menuconfig\" or \"make xconfig\").\n"

but these *config program names are OK?

> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index d669882..1636213 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -671,8 +671,7 @@ void on_introduction1_activate(GtkMenuItem * menuitem, gpointer user_data)
>  {
>  	GtkWidget *dialog;
>  	const gchar *intro_text = _(
> -	    "Welcome to gkc, the GTK+ graphical kernel configuration tool\n"
> -	    "for Linux.\n"
> +	    "Welcome to gkc, the GTK+ graphical configuration tool\n"

Should be "gconfig".  It's never been called "gkc" AFAIK.

>  	    "For each option, a blank box indicates the feature is disabled, a\n"
>  	    "check indicates it is enabled, and a dot indicates that it is to\n"
>  	    "be compiled as a module.  Clicking on the box will cycle through the three states.\n"
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 17ba222..037443b 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -25,11 +25,9 @@
>  static const char mconf_readme[] = N_(
>  "Overview\n"
>  "--------\n"
> -"Some kernel features may be built directly into the kernel.\n"
> -"Some may be made into loadable runtime modules.  Some features\n"
> -"may be completely removed altogether.  There are also certain\n"
> -"kernel parameters which are not really features, but must be\n"
> -"entered in as decimal or hexadecimal numbers or possibly text.\n"
> +"This interface let you select features and parameters for the build\n"

end above sentence with period.

> +"Features can either be built-in, modularized, or ignored. Parameters\n"
> +"must be entered in as decimal or hexadecimal numbers or text.\n"
>  "\n"
>  "Menu items beginning with following braces represent features that\n"
>  "  [ ] can be built in or removed\n"
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index da5e45d..6cc3a6e 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -15,11 +15,9 @@
>  static const char nconf_readme[] = N_(
>  "Overview\n"
>  "--------\n"
> -"Some kernel features may be built directly into the kernel.\n"
> -"Some may be made into loadable runtime modules.  Some features\n"
> -"may be completely removed altogether.  There are also certain\n"
> -"kernel parameters which are not really features, but must be\n"
> -"entered in as decimal or hexadecimal numbers or possibly text.\n"
> +"This interface let you select features and parameters for the build\n"

end sentence above with a period.

> +"Features can either be built-in, modularized, or ignored. Parameters\n"
> +"must be entered in as decimal or hexadecimal numbers or text.\n"
>  "\n"
>  "Menu items beginning with following braces represent features that\n"
>  "  [ ] can be built in or removed\n"
> @@ -128,9 +126,9 @@ static const char nconf_readme[] = N_(
>  "\n"
>  "Optional personality available\n"
>  "------------------------------\n"
> -"If you prefer to have all of the kernel options listed in a single\n"
> -"menu, rather than the default multimenu hierarchy, run the nconfig\n"
> -"with NCONFIG_MODE environment variable set to single_menu. Example:\n"
> +"If you prefer to have all of the options listed in a single menu, rather\n"
> +"than the default multimenu hierarchy, run the menuconfig with\n"

s/menuconfig/nconfig/

> +"NCONFIG_MODE environment variable set to single_menu. Example:\n"
>  "\n"
>  "make NCONFIG_MODE=single_menu nconfig\n"
>  "\n"
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index a04e451..fe18f7e 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1655,7 +1655,7 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
>  
>  void ConfigMainWindow::showIntro(void)
>  {
> -	static const QString str = _("Welcome to the qconf graphical kernel configuration tool for Linux.\n\n"
> +	static const QString str = _("Welcome to the qconf graphical configuration tool.\n\n"

s/qconf/xconfig/

>  		"For each option, a blank box indicates the feature is disabled, a check\n"
>  		"indicates it is enabled, and a dot indicates that it is to be compiled\n"
>  		"as a module.  Clicking on the box will cycle through the three states.\n\n"
> -- 


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:38229 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751054AbYBLAkC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Feb 2008 19:40:02 -0500
Received: from midway.site ([71.245.99.126]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2008 16:39:58 -0800
Date: Mon, 11 Feb 2008 16:39:57 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [patch/rfc] relocate kconfig "package name" to
 Kconfig/environment
Message-Id: <20080211163957.69b68251.rdunlap@xenotime.net>
In-Reply-To: <200802111929.27753.vapier@gentoo.org>
References: <200802111838.15973.vapier@gentoo.org>
	<20080211160204.c0e747e8.rdunlap@xenotime.net>
	<200802111929.27753.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-kbuild@vger.kernel.org

On Mon, 11 Feb 2008 19:29:27 -0500 Mike Frysinger wrote:

> On Monday 11 February 2008, Randy Dunlap wrote:
> > On Mon, 11 Feb 2008 18:38:15 -0500 Mike Frysinger wrote:
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -338,8 +338,9 @@ KBUILD_AFLAGS   := -D__ASSEMBLY__
> > >  # Read KERNELRELEASE from include/config/kernel.release (if it exists)
> > >  KERNELRELEASE = $(shell cat include/config/kernel.release 2> /dev/null)
> > >  KERNELVERSION = $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
> > > +KERNELPACKAGE = Linux Kernel
> >
> > Doesn't need quotes?
> 
> shouldnt ... or at least, it worked fine for me in testing menuconfig
> 
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -6,6 +6,10 @@ config KERNELVERSION
> > >  	string
> > >  	option env="KERNELVERSION"
> > >
> > > +config KERNELPACKAGE
> > > +	string
> > > +	option env="KERNELPACKAGE"
> > > +
> >
> > Each arch/$ARCH/Kconfig can have (and most do) a "mainmenu" entry
> > that could be useful here, either alone or combined with 'KERNELPACKAGE'.
> 
> i dont think that main menu option actually gets displayed anywhere ?  either 

No, it's not currently used.  Unfortunately.

> way, that string tends to be much longer than what we want here ...
> 
> > > --- a/scripts/kconfig/conf.c
> > > +++ b/scripts/kconfig/conf.c
> > > @@ -563,8 +563,8 @@ int main(int ac, char **av)
> > >  	case ask_silent:
> > >  		if (stat(".config", &tmpstat)) {
> > >  			printf(_("***\n"
> > > -				"*** You have not yet configured your kernel!\n"
> > > -				"*** (missing kernel .config file)\n"
> > > +				"*** You have not yet configured things!\n"
> >
> > s/things/$KERNELPACKAGE/ ?
> 
> i thought just making it generic in the generic sections kept things simple 
> and wasnt really a loss of information.  doesnt matter to me one way or the 
> other though.
> 
> > > --- a/scripts/kconfig/confdata.c
> > > +++ b/scripts/kconfig/confdata.c
> > > @@ -392,7 +392,7 @@ int conf_read(const char *name)
> > >  int conf_write(const char *name)
> > >  {
> > >  	FILE *out;
> > > -	struct symbol *sym;
> > > +	struct symbol *sym, *pkg_sym;
> > >  	struct menu *menu;
> > >  	const char *basename;
> > >  	char dirname[128], tmpname[128], newname[128];
> > > @@ -438,6 +438,8 @@ int conf_write(const char *name)
> > >
> > >  	sym = sym_lookup("KERNELVERSION", 0);
> > >  	sym_calc_value(sym);
> > > +	pkg_sym = sym_lookup("KERNELPACKAGE", 0);
> > > +	sym_calc_value(pkg_sym);
> > >  	time(&now);
> > >  	env = getenv("KCONFIG_NOTIMESTAMP");
> > >  	if (env && *env)
> > > @@ -445,9 +447,10 @@ int conf_write(const char *name)
> > >
> > >  	fprintf(out, _("#\n"
> > >  		       "# Automatically generated make config: don't edit\n"
> > > -		       "# Linux kernel version: %s\n"
> > > +		       "# %s version: %s\n"
> > >  		       "%s%s"
> > >  		       "#\n"),
> > > +		     sym_get_string_value(pkg_sym),
> > >  		     sym_get_string_value(sym),
> >
> > Why drop the "version: "?  I.e., must KERNELVERSION contain that
> > word if it is desired?
> 
> i really dont know what you're talking about ... nothing was dropped here

Ack, I misread the +- & context lines.

> > > --- a/scripts/kconfig/gconf.c
> > > +++ b/scripts/kconfig/gconf.c
> > > @@ -266,8 +266,8 @@ void init_main_window(const gchar * glade_file)
> > >  					  /*"style", PANGO_STYLE_OBLIQUE, */
> > >  					  NULL);
> > >
> > > -	sprintf(title, _("Linux Kernel v%s Configuration"),
> > > -		getenv("KERNELVERSION"));
> > > +	sprintf(title, _("%s v%s Configuration"),
> > > +		getenv("KERNELPACKAGE"), getenv("KERNELVERSION"));
> >
> > But here at least a 'v' is added... (inconsistent)
> 
> the 'v' wasn't added by me, it's always been there.  the title bar is 
> consistent across all the configuration interfaces:
> <package name> v<version> Configuration
> which becomes:
> Linux Kernel v2.6.25-rc1 Configuration

Yes, I misread some lines.  Sorry about that.

---
~Randy

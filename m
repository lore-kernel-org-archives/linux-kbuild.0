Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:43813 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750861AbYBLA33 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Feb 2008 19:29:29 -0500
From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [patch/rfc] relocate kconfig "package name" to Kconfig/environment
Date: Mon, 11 Feb 2008 19:29:27 -0500
References: <200802111838.15973.vapier@gentoo.org> <20080211160204.c0e747e8.rdunlap@xenotime.net>
In-Reply-To: <20080211160204.c0e747e8.rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2121821.8GS5OdAWVk";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200802111929.27753.vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

--nextPart2121821.8GS5OdAWVk
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 11 February 2008, Randy Dunlap wrote:
> On Mon, 11 Feb 2008 18:38:15 -0500 Mike Frysinger wrote:
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -338,8 +338,9 @@ KBUILD_AFLAGS   :=3D -D__ASSEMBLY__
> >  # Read KERNELRELEASE from include/config/kernel.release (if it exists)
> >  KERNELRELEASE =3D $(shell cat include/config/kernel.release 2> /dev/nu=
ll)
> >  KERNELVERSION =3D $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
> > +KERNELPACKAGE =3D Linux Kernel
>
> Doesn't need quotes?

shouldnt ... or at least, it worked fine for me in testing menuconfig

> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -6,6 +6,10 @@ config KERNELVERSION
> >  	string
> >  	option env=3D"KERNELVERSION"
> >
> > +config KERNELPACKAGE
> > +	string
> > +	option env=3D"KERNELPACKAGE"
> > +
>
> Each arch/$ARCH/Kconfig can have (and most do) a "mainmenu" entry
> that could be useful here, either alone or combined with 'KERNELPACKAGE'.

i dont think that main menu option actually gets displayed anywhere ?  eith=
er=20
way, that string tends to be much longer than what we want here ...

> > --- a/scripts/kconfig/conf.c
> > +++ b/scripts/kconfig/conf.c
> > @@ -563,8 +563,8 @@ int main(int ac, char **av)
> >  	case ask_silent:
> >  		if (stat(".config", &tmpstat)) {
> >  			printf(_("***\n"
> > -				"*** You have not yet configured your kernel!\n"
> > -				"*** (missing kernel .config file)\n"
> > +				"*** You have not yet configured things!\n"
>
> s/things/$KERNELPACKAGE/ ?

i thought just making it generic in the generic sections kept things simple=
=20
and wasnt really a loss of information.  doesnt matter to me one way or the=
=20
other though.

> > --- a/scripts/kconfig/confdata.c
> > +++ b/scripts/kconfig/confdata.c
> > @@ -392,7 +392,7 @@ int conf_read(const char *name)
> >  int conf_write(const char *name)
> >  {
> >  	FILE *out;
> > -	struct symbol *sym;
> > +	struct symbol *sym, *pkg_sym;
> >  	struct menu *menu;
> >  	const char *basename;
> >  	char dirname[128], tmpname[128], newname[128];
> > @@ -438,6 +438,8 @@ int conf_write(const char *name)
> >
> >  	sym =3D sym_lookup("KERNELVERSION", 0);
> >  	sym_calc_value(sym);
> > +	pkg_sym =3D sym_lookup("KERNELPACKAGE", 0);
> > +	sym_calc_value(pkg_sym);
> >  	time(&now);
> >  	env =3D getenv("KCONFIG_NOTIMESTAMP");
> >  	if (env && *env)
> > @@ -445,9 +447,10 @@ int conf_write(const char *name)
> >
> >  	fprintf(out, _("#\n"
> >  		       "# Automatically generated make config: don't edit\n"
> > -		       "# Linux kernel version: %s\n"
> > +		       "# %s version: %s\n"
> >  		       "%s%s"
> >  		       "#\n"),
> > +		     sym_get_string_value(pkg_sym),
> >  		     sym_get_string_value(sym),
>
> Why drop the "version: "?  I.e., must KERNELVERSION contain that
> word if it is desired?

i really dont know what you're talking about ... nothing was dropped here

> > --- a/scripts/kconfig/gconf.c
> > +++ b/scripts/kconfig/gconf.c
> > @@ -266,8 +266,8 @@ void init_main_window(const gchar * glade_file)
> >  					  /*"style", PANGO_STYLE_OBLIQUE, */
> >  					  NULL);
> >
> > -	sprintf(title, _("Linux Kernel v%s Configuration"),
> > -		getenv("KERNELVERSION"));
> > +	sprintf(title, _("%s v%s Configuration"),
> > +		getenv("KERNELPACKAGE"), getenv("KERNELVERSION"));
>
> But here at least a 'v' is added... (inconsistent)

the 'v' wasn't added by me, it's always been there.  the title bar is=20
consistent across all the configuration interfaces:
<package name> v<version> Configuration
which becomes:
Linux Kernel v2.6.25-rc1 Configuration
=2Dmike

--nextPart2121821.8GS5OdAWVk
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iQIVAwUAR7DoZ0FjO5/oN/WBAQKXjRAAl9H5J/01FyweFR/j4/QhZbLZSZBg4EEv
9hsip7H02GFp1DzT2z3UAXDutuB9mATekoLudrsBxogRh6xOST91fhumJ1PHoUPk
qCuUpKwhn63tQ7Hbt+4A+GxY3mxMl6GWJK8nJuixyABSYVNsAXYYmFAgdUb+WF0O
4P6wuEo+nM0UtpBrIZ1wH2I9jIxJZRK5sD4GvqkpPpChoosOskjfqnp8eWdN1WG8
uyieEsdB2BqNm7q/Bu2SvK7oDj29vUedgPjRxgh566ZLIH0/3daqfQ1BJLF40adJ
yD9X/ILorHlE1P1CiX4pZ/cTBYVpcn8NCcYZLZx/ViIyD9VYOs2SzwS07ta9Ug9T
z53oam/munEcOSvkGuSv6om3vDzaJU28ExHPI8X7cuBQ4LChfkztIszz+6F9vUgs
3cmQ7UO5y2kxGdG1zEBND3KGRCyubspw+q67tkSPDDiwhU+kzvbWKBGiZ0YX9Ns1
RLiW2r0m2+TpKXSnw+hS54gb3osmqIwJNKks0zJYpknpG7+kuhkXQ/Gjq8pYUJ7W
xxkQOA0gkSIXM09FJvq8tAoTRWII9QjfxtnZmDN4PX+obtWEaPvBjc8SDjV/iNig
B8d4uD5oY9fRbQHr7lzs/PzobHtVIXkXirA4xKFxKf61omtXaKlOQgWVgSWVC9Hq
/04HFhX9G1I=
=s1uo
-----END PGP SIGNATURE-----

--nextPart2121821.8GS5OdAWVk--

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.cs.msu.ru ([188.44.42.39]:59799 "EHLO mail.cs.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726235AbfCINMY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Mar 2019 08:12:24 -0500
Date: Sat, 9 Mar 2019 16:12:13 +0300
From: Arseny Maslennikov <ar@cs.msu.ru>
Message-ID: <20190309131213.GC25561@cello>
References: <20190221215901.23970-2-ar@cs.msu.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline
In-Reply-To: <20190221215901.23970-2-ar@cs.msu.ru>
Subject: Re: [PATCH] scripts/kconfig/Makefile: use KCONFIG_CONFIG if set
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Petr Vorel <pvorel@suse.cz>


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 22, 2019 at 12:58:58AM +0300, Arseny Maslennikov wrote:
> In a kernel source tree:
>=20
> % make mrproper
> % make KCONFIG_CONFIG=3D.myconfig kvmconfig
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTCC  scripts/kconfig/confdata.o
>   HOSTCC  scripts/kconfig/expr.o
>   HOSTCC  scripts/kconfig/symbol.o
>   HOSTCC  scripts/kconfig/preprocess.o
>   LEX     scripts/kconfig/zconf.lex.c
>   YACC    scripts/kconfig/zconf.tab.h
>   HOSTCC  scripts/kconfig/zconf.lex.o
>   YACC    scripts/kconfig/zconf.tab.c
>   HOSTCC  scripts/kconfig/zconf.tab.o
>   HOSTLD  scripts/kconfig/conf
> The base file '.config' does not exist.  Exit.
> make[1]: *** [scripts/kconfig/Makefile:96: kvm_guest.config] Error 1
> make: *** [Makefile:538: kvmconfig] Error 2
>=20
> Essentially `make kvmconfig' (and probably other similar targets)
> did ignore KCONFIG_CONFIG set to a different filename.
>=20
> If KCONFIG_CONFIG is set, use it; otherwise behave as if it was set
> to `.config'.
>=20
> Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>

Since this patch has nothing to do with debian packaging and thus with
the rest of the thread, I'll resend it separately.

> ---
>  scripts/kconfig/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 181973509a05..1c7ac07def4d 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -93,7 +93,7 @@ configfiles=3D$(wildcard $(srctree)/kernel/configs/$@ $=
(srctree)/arch/$(SRCARCH)/c
> =20
>  %.config: $(obj)/conf
>  	$(if $(call configfiles),, $(error No configuration exists for this tar=
get on this architecture))
> -	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .conf=
ig $(configfiles)
> +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(KCO=
NFIG_CONFIG) $(configfiles)
>  	+$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
> =20
>  PHONY +=3D kvmconfig
> --=20
> 2.20.1
>=20

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE56JD3UKTLEu/ddrm9dQjyAYL01AFAlyDu6YACgkQ9dQjyAYL
01Aa2A//Zy2lbgKQX4IPGbOJj8Id1ouZtRYqx9nKi073Qgy5U8fYNt7UA1LVbJg+
SPnXzPfVDY2+ugYFy5tAMWKSj+OLlzGtQ3i3/Tl/hAqc6D6awqnZCDHz3l7KQLMx
Jc4JDOZRqyy3Y64ZxCFE2neFGHTnKDs0qv6D5XNeYSqjy+JITiNF9krJN5rK5YjJ
uXu9Sl08gWMN32vKOcjhfOA1WzBmKxIn7H2Er2fHjTvB1ty3onevG7+q8+nR+ZPE
qZGs24oqvVJvEJluDNGZjU/fMNlDW+xGP0dHuCW7er6vbHruOsLPeLb2sbJuwRQu
dycfL21r3x3NCXAfyEftPQ7Annwoz1zTfqNqFihd7rjyPALFEi/sjN12F4DxLpLX
T3BLI+PmnLYvBmR1zlvVe8R3vCzlSZOuihpizrxNafYyashPqiL5G+f0AiFRDNQM
GaqQLk5tJgLoQqPkYgrRsX11088vnV6WKSdXSGpS7vRBEhEbJM1I8iKRf4zdBQA5
qfnGhWPBNXCyKradLtcVm4MAVaUvMzObFSG3wVbikq5qoLRvffks2nh7pHo/2YdL
XO30uJtIMoJKt0IQ6SKmJ0TrJkZr0y3Z06wyEl7xo3CMFw8F2y7HdzAJWjgvBEYb
B+b4lU3figN176Rs5nwgjx2HqeptQ4Yt2asONJ72F9H5eKArAhc=
=cfQe
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--

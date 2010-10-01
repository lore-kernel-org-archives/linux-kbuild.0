Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:34833 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752985Ab0JAWrk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 1 Oct 2010 18:47:40 -0400
From: Ben Hutchings <ben@decadent.org.uk>
In-Reply-To: <4CA5EA97.3060405@suse.cz>
References: <20100913143830.GK2919@stro.at>  <4C8E3B15.2040807@suse.cz>
	 <1284436209.5323.744.camel@localhost>  <4CA5EA97.3060405@suse.cz>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-JkafTObWpB3H9wLY/vs8"
Date: Fri, 01 Oct 2010 23:47:34 +0100
Message-ID: <1285973254.3916.68.camel@localhost>
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] Kbuild: Treat KBUILD_DEFCONFIG=old as request to
 use .config as the base
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: maximilian attems <max@stro.at>, linux-kbuild@vger.kernel.org, Bastian Blank <waldi@debian.org>


--=-JkafTObWpB3H9wLY/vs8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-10-01 at 16:05 +0200, Michal Marek wrote:
> On 14.9.2010 05:50, Ben Hutchings wrote:
> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > ---
> > This should work as a substitute for Debian's updateoldconfig.
> >=20
> > Ben.
> >=20
> >  scripts/kconfig/Makefile |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > index cef3f75..19558a7 100644
> > --- a/scripts/kconfig/Makefile
> > +++ b/scripts/kconfig/Makefile
> > @@ -112,9 +112,13 @@ defconfig: $(obj)/conf
> >  ifeq ($(KBUILD_DEFCONFIG),)
> >  	$< --defconfig $(Kconfig)
> >  else
> > +ifeq ($(KBUILD_DEFCONFIG),old)
> > +	$< --defconfig=3D.config $(Kconfig)
> > +else
> >  	@echo "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
> >  	$(Q)$< --defconfig=3Darch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kc=
onfig)
> >  endif
> > +endif
>=20
> KBUILD_DEFCONFIG is an internal variable used by arch Makefiles to
> select the defconfig file, it should not be abused for a completely
> different purpose.

OK.

> Also, the same can be achieved with 'make
> oldnoconfig' or 'yes "" | make oldconfig' in older kernels.

'make oldnoconfig' does something different - it answers N to all
questions rather than accepting the default.

'yes "" | make oldconfig' does pretty much what we want, except that
it's noisy.  But personally I don't care that much about it.  Max,
Bastian, do you rely on this target?

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-JkafTObWpB3H9wLY/vs8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIVAwUATKZk/ue/yOyVhhEJAQIH2xAAuF1Y4aV0ZIRl7JrmyfDYPL5jCJvk70pS
Akicobz1QzTUW2YPweTUb35zQl4gy1eMTjMcTyfinRZoowdriW+SIGcw4nv8v+SZ
931rurrbEIlHUQmWcJ+LO3xzFmaQhJJOABXSli7UCiaX9m6eG/kaOsUqfqa3g/4V
N4f/c56OFpDVW3rIt7zxwAlDcKG8L2yvnNRZTR7jj6s/HIeIV8rhICJl3ra/kO8T
/UARVyNV/7h5UL0QbDj8vV4SLqBdTq8yVthvyOuZfdY5+v9I+16fAy4SqnTQ7ddB
hX4/+uvSCpuX24N7QKPkUlk8QnFIqCvzzdeBgfOdhaUdEH5gcXBupkKei6V1LZFg
sKs1ZtoVaQc95goVvpqOOypGKpiGabh2jdDlBe8Gt0xEMsw4lA1ktCWr5QR0aOcO
ZFLrqDxdL9hhVyq1EaK3wwPMryXZwxxwOud+AsNTqIhFD8MqZf/RwgUfGitj5TPp
NL6BiOnhOU8S5Nhj535/fYdeED1OxJs36bMxQNn4zxfQXTT9Y9dSnKsZtxdwwlls
BqI/Qnp/bJoTcrHwDAi10o3nzkemCYePVr1XAUY8fM6R3ecwmYgsF3Hx1/8/sP2E
/fXt05SgRp1E7E9yfSilF+49BmKaY6kivI4Fk0FAiCK3g+8/Grz8x7ZYaKrO+sff
i4iRFV6INNY=
=ZD5w
-----END PGP SIGNATURE-----

--=-JkafTObWpB3H9wLY/vs8--

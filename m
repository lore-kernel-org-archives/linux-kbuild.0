Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:43527 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933806Ab3HIQIk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Aug 2013 12:08:40 -0400
Date: Fri, 9 Aug 2013 17:08:17 +0100
From: Mark Brown <broonie@kernel.org>
Message-ID: <20130809160817.GG6427@sirena.org.uk>
References: <1376046432-12588-1-git-send-email-broonie@kernel.org>
 <20130809123251.GB5794@merkur.ravnborg.org>
 <20130809150031.GE6427@sirena.org.uk>
 <20130809151346.GA6021@merkur.ravnborg.org>
 <20130809152748.GF6427@sirena.org.uk>
 <52050C4B.2060606@suse.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+WIyXkGFHMyqo73g"
Content-Disposition: inline
In-Reply-To: <52050C4B.2060606@suse.cz>
Subject: Re: [PATCH] kbuild: Allow scripts/* to be cross compiled
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>, linaro-kernel@lists.linaro.org, linux-kbuild@vger.kernel.org, John Rigby <john.rigby@linaro.org>, Andrey Konovalov <andrey.konovalov@linaro.org>


--+WIyXkGFHMyqo73g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 09, 2013 at 05:35:39PM +0200, Michal Marek wrote:
> On 9.8.2013 17:27, Mark Brown wrote:

> > ie, we can cross build the kernel but not fixdep, conf or mk_elfconfig
> > since those are assumed to be runnable for the kernel build, meaning
> > they can't be deployed onto a target system without hoop jumping.

> OK, but what what do you need cross compile them and deploy on the
> target? Their job is to build the kernel. So if you are going to build
> the kernel on the target, you can also build the tools there, can't you?
> Or are you using the tools from something else than building the kernel?

> I think that we are missing some detail of your use case and it does not
> make sense without that detail.

Well, fixdep in particular seems like a generically useful thing that
you might want installed but in general I agree - Andrey, why are we
carrying this patch?

--+WIyXkGFHMyqo73g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSBRPuAAoJELSic+t+oim9dIsP/1YQdp/gvxaIqfK7Yu++yAYe
3k0F0BaHG8Vs1MrLpWpvu8GtJqvJTYYD/PC8a9snFJjjwRQfZI76u43az57k/uRG
tWk9LPGWveoBoehX6m7La4QphMk3g+Tdu1QK7Y+Fh7UpQSu4Pespqv14w2aLYvq3
ML1LRPn7G1ATgIPmM4llP17XnrM1iXtZky9BiP+oI4m69kZ30CYfssR2Fvj3a6QZ
NTgh7nS0qsH8DwmgNq8SUv7L98Ik/IqBZgms38V/z7KeNcZM3boSQyPkMLjpWcWR
RtdgDklMJRbOhDWIU5Inzpf51qGP9GsGIx5SxExks3ay4tkEg1lkUT8oqS4IF56w
45SnYqutvUGcF2/OnCSexYJeGvLCEDC0lIvh5uscjhJBP3AnEV/PI4VmlRTadxce
fP8ebEvMMTbx4Orjko7FpXfqxFEOlmiNyFjFNuReqDbOjppUBZxN3nmeXqXKuZZ3
pjnVeCYuO2jVvb2xS6BE9tGfsMUZXZJzTqp8M3WAPhP135KUTSFwe7bfnOtUeUud
v2zUb7d+NDDUSINefVp6V7pbf9i1uS+4N9PalDMOSD4MB5QwgLaGS70Mqf6F4bLF
IHqtGZo3e71ljLsTGwTo/Xr6qJkurk2t7JLDhx428D36I2TCytUsE/7KiHShgVV+
u6Fc9mzXe8lTUtbW9Kdt
=3Pjl
-----END PGP SIGNATURE-----

--+WIyXkGFHMyqo73g--

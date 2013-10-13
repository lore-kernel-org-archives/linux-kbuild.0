Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:46032 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755000Ab3JMT7c (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Oct 2013 15:59:32 -0400
Message-ID: <1381694368.1301.91.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH 1/2] deb-pkg: Add automatic support for armhf
 architecture
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 13 Oct 2013 20:59:28 +0100
In-Reply-To: <CAODfWeFOB8ciUUTkdFn7_TUELVQC48XCC1oz+aYhZotewDtqzA@mail.gmail.com>
References: <1381079041.2788.25.camel@deadeye.wl.decadent.org.uk>
	 <CAODfWeFOB8ciUUTkdFn7_TUELVQC48XCC1oz+aYhZotewDtqzA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-LPRh2kI7iEY+2oBO1Itu"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Hector Oron <hector.oron@gmail.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, Fathi Boudra <fathi.boudra@linaro.org>, Debian ARM <debian-arm@lists.debian.org>


--=-LPRh2kI7iEY+2oBO1Itu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-10-08 at 02:23 +0200, Hector Oron wrote:
> Hello,
>=20
> 2013/10/6 Ben Hutchings <ben@decadent.org.uk>:
> > The Debian armhf architecture uses the ARM EABI hard-float variant,
> > whereas armel uses the soft-float variant.  Although the kernel
> > doesn't use FP itself, CONFIG_VFP must be enabled to support
> > hard-float userland and will probably be disabled when supporting a
> > soft-float userland.  So set the architecture to armhf by default when
> > CONFIG_AEABI and CONFIG_VFP are both enabled.
>=20
> Debian armel userland can be run on any device, so it is suggested to
> better rely on toolchain configuration rather than kernel config
> symbols.
>=20
> For arm-gnueabi(hf) toolchain something like:
>   $ gcc -dumpspecs | grep multilib_defaults -A2 | grep -q soft && echo
> "This is armel"
>   $ gcc -dumpspecs | grep multilib_defaults -A2 | grep -q hard && echo
> "This is armhf"
> could be checked instead.
[...]

Is the output of -dumpspecs really so stable that this is going to be
reliable?

Ben.

--=20
Ben Hutchings
Beware of bugs in the above code;
I have only proved it correct, not tried it. - Donald Knuth

--=-LPRh2kI7iEY+2oBO1Itu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIVAwUAUlr7oOe/yOyVhhEJAQpEtw//czOnjd0+O6P/jmKvYy1D6M3aoRn7zlHj
KJNVyQP6aUY5UYRHWHf9fj7nVtrzmTF/AmKP6pXiXcTdE4gqzGliHGPjPOFXQFAX
52xfzIVnm7g1iz2urY6tjBLAmVPQ9Q9vSHHgoeTeC7kgWvsTw+A0GzMg9TXMEwuS
LixE5Cqdc9wIX7IRmbP2HPvu7O8WKCz0OVvgQa8an+pXsj7YjFNeJO5y82VEwoOf
xH2gTPPclzf0Bcu0F4Ms75Y+YQFAvSr02MmFyBfvtKbICKiBCbzgh9NbZRl/qOln
AJS40NhB8RRUiyOanYawQJBfB3+posoIlIdoT9CTAOFFhUG49LguWrO4te+NOYxu
a2FFoz78sjVq2ahHsU/6QC7HTOVlf5CsTZxG5GiWq3A1AvdHmdP4PBsgQi+pm5pv
A/j2WrXSE81rvohVYxWrKkKAunAeDTUX2g9u6pgI9JDDZkT67hpanLPcVCy7Znkx
cDeWzrpsTzc18xoaSQVeOVFg+sSzg8x8kbSv9dbZJVVOHB/nXsSjCRIpjM0HRqIq
vQH8/5DvdQaLTxgP6SnHFsYWRUJOMgTur0Zxw+F45nlvoXgYuAYCEvdXdmwgtEhA
QxEDPAF9tcibHMFSsLmMIDXfyOFBY2SMz5Kx5AwbfJuq16LK8CcJRC2gpCO88A+7
3Ym9D/m+LEM=
=kmr8
-----END PGP SIGNATURE-----

--=-LPRh2kI7iEY+2oBO1Itu--

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:38145 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752681AbcKHWvr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Nov 2016 17:51:47 -0500
Message-ID: <1478645477.1727.18.camel@decadent.org.uk>
Subject: Re: -fno-PIE, take #3
From: Ben Hutchings <ben@decadent.org.uk>
Date: Tue, 08 Nov 2016 22:51:17 +0000
In-Reply-To: <20161104183940.30692-1-bigeasy@linutronix.de>
References: <20161104183940.30692-1-bigeasy@linutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-ZrIT7uo4TnVdsE63FVs/"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Sven Joachim <svenjoac@gmx.de>, "Austin S. Hemmelgarn" <ahferroin7@gmail.com>, Borislav Petkov <bp@alien8.de>


--=-ZrIT7uo4TnVdsE63FVs/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-04 at 19:39 +0100, Sebastian Andrzej Siewior wrote:
> Debian gcc's is nowdays compiled with --enable-default-pie which means it=
 does
> -fPIE by default. This breaks atleast x86-64 compiles.
> This is the third attempt to fix it, this time by using runtime detection=
 of
> the -fno-PIE compiler switch (it was introduced in gcc 3.4, min required =
gcc is
> currently 3.2) so it can be backported to the stable kernels.
> As noted by Al this won't fix `git bisect' of stable kernels prio this co=
mmit.
> However using always a wrapper around gcc which adds -fno-PIE is not soll=
ution
> I want to rely in future.

I applied the previous=C2=A0version of "kbuild: add -fno-PIE" plus
"scripts/has-stack-protector: add -fno-PIE" to the Debian kernel
package of v4.9-rc3 and built with gcc-6, and the results of auto-
building so far are (from
<https://buildd.debian.org/status/package.php?p=3Dlinux&suite=3Dexperimenta=
l>):

Debian    Description                  Result
name
----------------------------------------------
amd64     x86_64                       OK
arm64     ARMv8                        OK
armel     ARMv5                        pending
armhf     ARMv7                        pending
i386      i686                         OK
mips      MIPS{32,64}r2 big-endian     OK
mipsel    MIPS{32,64}r2 little-endian  pending
mips64el  MIPS64r2, little-endian      pending
ppc64el   POWER8, little-endian        OK
s390x     s390x                        OK

PIE has not been enabled by default on other Debian architectures.  The
build failures on hppa and sparc64 are unrelated.

We do enable CONFIG_KEXEC_FILE on amd64 so I don't know how why that
build succeeded without "x86/kexec: add -fno-PIE".

Ben.

--=20
Ben Hutchings
For every complex problem
there is a solution that is simple, neat, and wrong.

--=-ZrIT7uo4TnVdsE63FVs/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYIlblAAoJEOe/yOyVhhEJcWUP/1BBQuKy639Cavq2sjxs0RES
2uluWKBeRdaRHe69xM5M3rxivkzSCDgGJKX8e7jTOY29TRkBqVs1/nQWGWJ8DF4M
tAJi79wogpMM8v/ewk64w5D9Wl83yb6YZtyOkK42KyXJPYwxoSN8aYkvAWbX58bF
o10TxMnIBmB6JOXD+wYPindkx2ro1PU1s2picnrmFeb53xuF3h3Fd4Sa3nyyCabx
D92At0V00mqUmHAMfoyzZI6agT4afOzfDPnaRHKpjDizHpU5VOFoJGNwY0QljwZg
QBD0+HQHNbk9bmDtvVF7AWGm80US3YeA3dAfnGzbMpFzX8VbwQuxdy7O7DyE420v
wsUc0G/wgHLf432gEr3D7dCc4HrZyAdrVmU9qxmqJODEWkSmBl0fTr5vvPfFH5/b
JB3LPky8/lwsBl3FFaCLdGdr9FXMY2n8356ulqShEsGjsM85CWjYl6PKzCMZH3zI
YUPO2c4N774oRXxCCLmUJj6oCIXqGdjjY/VpU38H6NWv/iDbJwqDfDtyKKYbEO5h
S4l6VYr5wy5XOx2a7KZKnj2+iwBLYgszSrYQTvXG9pPEdXReplxlVauBWNmZBLVp
d4k+WDfwIa7l5arzztejGJehmfWnmfUBNv/M2x/DMSftTqxJo/jOz5Sqc7T5WLF3
ZrzVz5SHdyXDtwmv96Wi
=N5Zh
-----END PGP SIGNATURE-----

--=-ZrIT7uo4TnVdsE63FVs/--

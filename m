Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:56745 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750993AbaDORTx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Apr 2014 13:19:53 -0400
Message-ID: <1397582380.31481.48.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH] deb-pkg: install device tree blobs in linux-image
 package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Tue, 15 Apr 2014 18:19:40 +0100
In-Reply-To: <CAGNsrLCjsF+PipsREXX5kziZRJrGh8qGwQfD6ZXR+Buew14nWA@mail.gmail.com>
References: <1397322931-16688-1-git-send-email-fathi.boudra@linaro.org>
	 <1397505357.31481.24.camel@deadeye.wl.decadent.org.uk>
	 <CAGNsrLCjsF+PipsREXX5kziZRJrGh8qGwQfD6ZXR+Buew14nWA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-K5ui7sZSMx7L0QTHtLZI"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Maximilian Attems <maks@debian.org>


--=-K5ui7sZSMx7L0QTHtLZI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-04-15 at 08:02 +0300, Fathi Boudra wrote:
> On 14 April 2014 22:55, Ben Hutchings <ben@decadent.org.uk> wrote:
> > On Sat, 2014-04-12 at 20:15 +0300, Fathi Boudra wrote:
> >> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> >> ---
> >>  scripts/package/builddeb | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> >> index f46e4dd..24cb3b1 100644
> >> --- a/scripts/package/builddeb
> >> +++ b/scripts/package/builddeb
> >> @@ -165,6 +165,11 @@ if grep -q '^CONFIG_MODULES=3Dy' $KCONFIG_CONFIG =
; then
> >>       fi
> >>  fi
> >>
> >> +if grep -q '^CONFIG_OF=3Dy' $KCONFIG_CONFIG ; then
> >> +     mkdir -p "$tmpdir/boot/dtb/$version"
> >
> > The boot loader only needs to read at most one of the installed DTB
> > files on any given system, and you can't in general expect it to read a
> > DTB from the filesystem.  So why not install them in
> > /usr/lib/linux-image-$version where flash-kernel expects?
>=20
> From various discussions, I think it's agreed that /usr/lib/... isn't
> the right path to use (and we use it since years in Linaro images
> unfortunately).
> The consensus seems to follow bootloader spec:
> http://www.freedesktop.org/wiki/Specifications/BootLoaderSpec/
> and install the DTBs under /boot.

I wasn't aware of such consensus.  I have seen an earlier version of
this spec and it seemed to be only supported by one distribution.

> Get it versioned is preferable.
> It should address the various bootloaders (U-boot, UEFI, GRUB,
> barebox, etc...) requirements, except the VFAT file system.

It seems to me that:
- It might work with U-boot, except for the many exising versions that
it doesn't work with.
- It might work with GRUB, though that doesn't seem to be widely used
yet on ARM.
- It won't work with UEFI because /boot/dtb will not be on the ESP.
(And dpkg can't upgrade on a filesystem that doesn't support hard links
so you should never expect to install files directly on the ESP.)

> IMO we should support the distribution wide consensus in this case,
> instead of flash-kernel (Debian/Ubuntu specific tool) expectations.
> We'll probably end up by adding a symlink to keep compatibility with
> older systems or fix flash-kernel.
>=20
> Any other feedback on this topic is appreciated.
[...]

flash-kernel works today and you are proposing to do something that
might eventually work some time in the future.

Ben.

--=20
Ben Hutchings
The obvious mathematical breakthrough [to break modern encryption] would be
development of an easy way to factor large prime numbers. - Bill Gates

--=-K5ui7sZSMx7L0QTHtLZI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAU01qLOe/yOyVhhEJAQp/YA/7BlKWQSmUMvKj1Ezz7heJoKWzDql4tNrm
7PnI0VTp95hRmsyi4evBHhrtg6RJWudd0hSyaSgkNyF3/FDq1dG5763/VrjGah0v
9hAI9dtqCl0M2FdtmPUC8D5upJXUx1v4HwboguYddtuoK2Jt0TKC3gxIvp7jEvBW
jFbr4V9HSZ29qoYY3mtBtTLIww25DW+ZPMI4IFBE+LsvFy4jx0ntw+WjTnYFbmG6
j0o6Fr28ZscSkdBynouXf3JFVAne7DSWJG7pUc/xwxyhL7nvsxn73ouydXukJ0da
4vddwFhlQQA/P+41TLc6kNesIAtSg6exzsCuBQjnjZugMymVbSvFveXaK4mrXwdB
TjszofvtqGyrJjpWKbeApQLKp10QgLaEDwVtasG4fJAJlEFDKCnWHz7oaqyCar1m
H1+nB/s9l/l+0QiwwyWbo4ILTCQWQjXTxWyzuXrDTM0jQvpH6AXd9hxgzX2DhvGh
72dZl8yM5FPpZ/dT3tYSCzh2hMXTQaWKv4Ks0a9CqCvmrlyCXJC4kssHVb6AzcNO
t2ee0/Fj7JuqdjIZVVIaC0jqzGG1FO4DemI+BkPrjd2vLLnalO1DuQH9uv0bfWOs
8Lm1jxT0MPiK9yFsgarw2+vpU1HQOUFogW/oK6TP94R5T8+LKzl9kroT4ybNYfo7
tNAuru4nlUQ=
=t0X3
-----END PGP SIGNATURE-----

--=-K5ui7sZSMx7L0QTHtLZI--

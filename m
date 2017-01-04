Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33466 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751088AbdADNvS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jan 2017 08:51:18 -0500
Received: by mail-wm0-f66.google.com with SMTP id u144so91606140wmu.0
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Jan 2017 05:51:12 -0800 (PST)
Subject: Re: [PATCH] kbuild: Fix dependency checking for initramfs build
References: <20161223031508.30532-1-npiggin@gmail.com>
From: klondike <klondike@klondike.es>
Message-ID: <d541e17e-4a6b-0d5d-4111-eac33da8fe56@klondike.es>
Date: Wed, 4 Jan 2017 14:50:13 +0100
MIME-Version: 1.0
In-Reply-To: <20161223031508.30532-1-npiggin@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="S18LO1jrQDj2AhDnCa31rk5fdDTXe1RMR"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Florian Fainelli <f.fainelli@gmail.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--S18LO1jrQDj2AhDnCa31rk5fdDTXe1RMR
Content-Type: multipart/mixed; boundary="bvhQUE77uOq0RFDqfnohHxIWGxIb33BxI"
From: klondike <klondike@klondike.es>
To: Nicholas Piggin <npiggin@gmail.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d541e17e-4a6b-0d5d-4111-eac33da8fe56@klondike.es>
Subject: Re: [PATCH] kbuild: Fix dependency checking for initramfs build
References: <20161223031508.30532-1-npiggin@gmail.com>
In-Reply-To: <20161223031508.30532-1-npiggin@gmail.com>

--bvhQUE77uOq0RFDqfnohHxIWGxIb33BxI
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

El 23/12/16 a las 04:15, Nicholas Piggin escribi=F3:
> When using initramfs compression, the data file gets quotes pulled
> in from Kconfig, e.g., initramfs_data.cpio".gz" which make does not
> match a target and causes rebuild.
>
> Fix this by filtering out quotes from the Kconfig string.
>
> While we're here, set the target explicitly so the Makefile does not
> have to know about all the suffixes.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  usr/Makefile | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/usr/Makefile b/usr/Makefile
> index 17a513268325..3116b23d44f8 100644
> --- a/usr/Makefile
> +++ b/usr/Makefile
> @@ -5,8 +5,10 @@
>  klibcdirs:;
>  PHONY +=3D klibcdirs
> =20
> -suffix_y =3D $(CONFIG_INITRAMFS_COMPRESSION)
> -AFLAGS_initramfs_data.o +=3D -DINITRAMFS_IMAGE=3D"usr/initramfs_data.c=
pio$(suffix_y)"
> +suffix_y =3D $(subst $\",,$(CONFIG_INITRAMFS_COMPRESSION))
> +datafile_y =3D initramfs_data.cpio$(suffix_y)
> +AFLAGS_initramfs_data.o +=3D -DINITRAMFS_IMAGE=3Dusr/$(datafile_y)
> +
> =20
>  # Generate builtin.o based on initramfs_data.o
>  obj-$(CONFIG_BLK_DEV_INITRD) :=3D initramfs_data.o
> @@ -14,7 +16,7 @@ obj-$(CONFIG_BLK_DEV_INITRD) :=3D initramfs_data.o
>  # initramfs_data.o contains the compressed initramfs_data.cpio image.
>  # The image is included using .incbin, a dependency which is not
>  # tracked automatically.
> -$(obj)/initramfs_data.o: $(obj)/initramfs_data.cpio$(suffix_y) FORCE
> +$(obj)/initramfs_data.o: $(obj)/$(datafile_y) FORCE
> =20
>  #####
>  # Generate the initramfs cpio archive
> @@ -38,10 +40,8 @@ endif
>  quiet_cmd_initfs =3D GEN     $@
>        cmd_initfs =3D $(initramfs) -o $@ $(ramfs-args) $(ramfs-input)
> =20
> -targets :=3D initramfs_data.cpio.gz initramfs_data.cpio.bz2 \
> -	initramfs_data.cpio.lzma initramfs_data.cpio.xz \
> -	initramfs_data.cpio.lzo initramfs_data.cpio.lz4 \
> -	initramfs_data.cpio
> +targets :=3D $(datafile_y)
> +
>  # do not try to update files included in initramfs
>  $(deps_initramfs): ;
> =20
> @@ -51,6 +51,6 @@ $(deps_initramfs): klibcdirs
>  # 2) There are changes in which files are included (added or deleted)
>  # 3) If gen_init_cpio are newer than initramfs_data.cpio
>  # 4) arguments to gen_initramfs.sh changes
> -$(obj)/initramfs_data.cpio$(suffix_y): $(obj)/gen_init_cpio $(deps_ini=
tramfs) klibcdirs
> +$(obj)/$(datafile_y): $(obj)/gen_init_cpio $(deps_initramfs) klibcdirs=

>  	$(Q)$(initramfs) -l $(ramfs-input) > $(obj)/.initramfs_data.cpio.d
>  	$(call if_changed,initfs)
> -- 2.11.0

Hello!

First of all, sorry for taking too long to answer, Christmas kept me
awfully busy :(

Thanks a lot for catching the issue first, I didn't notice the spurious
rebuilds when testing my patches.

I have also reviewed and tested this one. I would split the two changes
(the quoted string fix and the one to make the Makefile not depend on
the extension) into two patches. Other than that feel free to add a
Reviewed-by and Tested-by if you need :)

Sincerely,
Francisco Blas Izquierdo Riera (klondike)



--bvhQUE77uOq0RFDqfnohHxIWGxIb33BxI--

--S18LO1jrQDj2AhDnCa31rk5fdDTXe1RMR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYbP2WAAoJEPS90u/o/3j5TyQP/08UqnhmIGtQcG+V64i5AZg9
BVOQ5KbiX70Qxe+myVC2F+IFZ7LgkBdqqH4D7s461+OFm9lgd2bAWRoWLoZIsnir
Y6MCL1M4nR1YGJIhh5z3Bq7CC3Kcdu5A4pm7WsjUN+fOKQ7eWRyLudjMcREwVojR
cqVm7peM9fodtyI3rub09WZGlXQ00Lyyy1Zm5u2L1Hj/x89iemzkn5qQ3jUfJt+d
IdW1NeCwsUREYkwFotWGuOEzMp1WsdcGztyruYHzvb5fL3DdR31fjW9jAHrU81hY
QP+c0qt2COGBOEYIsObwOJRrbXz4/dXD7JuHKDDt+eVwfGqHa3XJrCXDignZI8lJ
q7h6qnGFBLu6G+47Xkv6RDDVoHci7JmKbT8oTRRFbtoFYwU8exmWhOkrwEMWORuN
+25nw+bG26RJqYfD+3qeKv7upGHwwtOxl/Dp+IzGwdD2gCL39uxSJdEp9fW3VzTO
QlNBrSzpmsTw+++hzxfqOu1p12qdBmWssf4x5OwPASFNH/MMMO+yEGGMRWrVDTxF
LY1PpSzrIHkfqtm3DoeSX1s7WF04vbuYjKuopB3X4dkOORBcIjq6YnTDPAzxIcJK
4NNaShN+m+U/7dqoOgYH4RK8YXGoHg75Q/MBB/0WOAp9pb6wAGPIKoBXXC2rsLcw
O7Tt8l3Q1F2/Bolid4Rp
=eWU1
-----END PGP SIGNATURE-----

--S18LO1jrQDj2AhDnCa31rk5fdDTXe1RMR--

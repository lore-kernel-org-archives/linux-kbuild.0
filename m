Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44669 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfKEEw5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 23:52:57 -0500
Date: Tue, 5 Nov 2019 10:22:42 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191105045239.GC27350@Gentoo>
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
 <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org>
 <20191105043918.GB27350@Gentoo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline
In-Reply-To: <20191105043918.GB27350@Gentoo>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 10:09 Tue 05 Nov 2019, Bhaskar Chowdhury wrote:
>On 21:32 Mon 04 Nov 2019, J. Bruce Fields wrote:
>>On Mon, Nov 04, 2019 at 06:03:13PM -0800, Randy Dunlap wrote:
>>> On 11/1/19 11:30 PM, Bhaskar Chowdhury wrote:
>>> > This patch allow you to remove old kernels and associated modules
>>> > directory from the system.You can do it at once with the -r flag
>>> > and interactively with the -i flag.
>>> >=20
>>> > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>>> > ---
>>> >  scripts/prune-kernel | 82 +++++++++++++++++++++++++++++++++++-------=
--
>>> >  1 file changed, 65 insertions(+), 17 deletions(-)
>>>=20
>>> Hi,
>>> I believe that this script now does what the patch author intends it to=
 do.
>>> It does have a few whitespace issues, but no big deals.  (see below)
>>
>>My original comment stands: looks like it prompts for full module path
>>and kernel versions which means it's no more convenient than just doing
>>an "ls" and then removing the ones you want to.  (In fact, with "rm"
>>you'd also get the benefit of tab completion....)

Bruce,

There is -r or --remove option , with that you can pass the kernel
version and modules directory name , and the script will remove those
without prompting you for those.

For instance you need to pass the options like this :

=2E/scripts/prune-kernel -r kernel_version modules_directory_name
OR
=2E/scripts/prune-kernel --remove kernel_version modules_directory_name

Which I certainly believe is not just "ls and rm" stuff...could you
please give it a shot ,and let me know the shortcoming please??

So , I can fix the damn thing.
>
>Hi Bruce,
>I am forcing user to put full modules directory name,kinda engagement=20
>to the process.It is not a trivial operation, so the users should be=20
>aware.
>OHT Could you please state what else you would like to be inducted in
>the so it can be useful?? So sorry for my weak memory if you already=20
>explicitly stated something like that before.
>
>Thanks,
>Bhaskar
>>
>>It's quite different from the original script and I don't really see the
>>advantage.
>>
>>--b.
>>
>>>=20
>>> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>>>=20
>>>=20
>>> > diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>>> > index e8aa940bc0a9..01d0778db71f 100755
>>> > --- a/scripts/prune-kernel
>>> > +++ b/scripts/prune-kernel
>>> > @@ -1,21 +1,69 @@
>>> >  #!/bin/bash
>>> >  # SPDX-License-Identifier: GPL-2.0
>>> > +#This script will remove old kernels and modules directory related t=
o it.
>>> > +#"-r" or "--remove" show how to silently remove old kernel and modul=
es dir.
>>> > +# "-h" or "--help" show how to use this script or show without param=
eter.
>>> > +#"-i" or "--interactive" show how to remove interactively.
>>> > +
>>> > +flag=3D$1
>>> > +kernel_version=3D$2
>>> > +modules_version=3D$3
>>> > +boot_dir=3D/boot
>>> > +modules_dir=3D/lib/modules
>>> > +
>>> > +remove_old_kernel() {
>>> > +	cd $boot_dir
>>> > +	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$k=
ernel_version
>>> > +	return 0
>>> > +}
>>> > +
>>> > +remove_old_modules_dir() {
>>> > +	cd $modules_dir
>>> > +	rm -rf $modules_version
>>> > +	return 0
>>> > +}
>>> > +
>>> > +usage() {
>>> > +	printf "Usage: $(basename $0) [-ri]\n"
>>> > +	printf "\n -r or --remove  kernel_version modules_version\n"
>>> > +	printf "\n -i or --interactive do as interactive way\n"
>>> > +	return 0
>>> > +}
>>> > +
>>> > +case "$flag" in
>>> > +	-i | --interactive)
>>> > +		printf "\nEnter kernel version to remove or blank/empty to exit:"
>>> > +		read kernel_version
>>> > +		if [[ $kernel_version !=3D "" ]]; then
>>> > +			remove_old_kernel
>>> > +			printf "\nRemoved kernel version:$kernel_version from the system.=
\n\n"
>>>=20
>>> space after ':'
>>>=20
>>> drop one \n above.
>>>=20
>>> > +			printf "Please give the full modules directory name to remove:"
>>> > +			read modules_version
>>> > +			if [[ $modules_version !=3D "" ]]; then
>>> > +				remove_old_modules_dir
>>> > +				printf "\n\nRemoved modules directory:$modules_version from the =
system.\n\n"
>>>=20
>>> space after ':'
>>>=20
>>> drop one \n above.
>>>=20
>>> > +			else
>>> > +				exit 1
>>> > +			fi
>>> > +		fi
>>> > +		;;
>>> > +	-h | --help)
>>> > +		usage
>>> > +		exit 0
>>> > +		;;
>>> > +	-r | --remove)
>>> > +		if [[ $# -ne 3 ]]; then
>>> > +			 printf "You need to provide kernel version and modules directory=
 name.\n"
>>> > +			 exit 1
>>> > +		 else
>>> > +			 remove_old_kernel
>>> > +			 remove_old_modules_dir
>>> > +		fi
>>> > +		;;
>>> > +	*)
>>> > +		usage
>>> > +		exit 1
>>> > +		;;
>>> > +esac
>>> >=20
>>> > -# because I use CONFIG_LOCALVERSION_AUTO, not the same version again=
 and
>>> > -# again, /boot and /lib/modules/ eventually fill up.
>>> > -# Dumb script to purge that stuff:
>>> >=20
>>>=20
>>> OK, the former script's loop is removed.. good.
>>> But the 2 preceding blank lines are not removed, so the script
>>> now ends with 2 unnecessary blank lines.
>>>=20
>>> > -for f in "$@"
>>> > -do
>>> > -        if rpm -qf "/lib/modules/$f" >/dev/null; then
>>> > -                echo "keeping $f (installed from rpm)"
>>> > -        elif [ $(uname -r) =3D "$f" ]; then
>>> > -                echo "keeping $f (running kernel) "
>>> > -        else
>>> > -                echo "removing $f"
>>> > -                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
>>> > -                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
>>> > -                rm -rf "/lib/modules/$f"
>>> > -                new-kernel-pkg --remove $f
>>> > -        fi
>>> > -done
>>> > --
>>>=20
>>>=20
>>> --=20
>>> ~Randy

>-----BEGIN PGP SIGNATURE-----
>
>iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3A/PMACgkQsjqdtxFL
>KRUyqQgAya3BYL2iEMk0N3b1/Ji3TVzjrhaMrYM1bc6MDs7UA83ikBBG7C/dSmZ9
>3l9ANXfEnjaF64FpuLTNE2pT/tVxEj+xQz5iWw3JXV9TR7P2rq6814LH4b3hXX54
>A9r0sIRz0xwCMq7ihtNtgXziyviLp8UkUjIK+1C4vQ0h9/CvP0YETq8fgRWASMrS
>2+VErRPd06DryAAnapz9CnZz2Fju6S4mA2aaTJ3hiDLNmbj++6IoNQw+r5MZrWde
>yUqPQcfAzxs6/GIuUPK3uStudgofQjCKbHbPho9jjmwXrNSFH6/0/pjz5R91oMu9
>AWpkl0vkvAvzLsjRIeMG/MmClx0c3w=3D=3D
>=3DVReA
>-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3BABMACgkQsjqdtxFL
KRXGAAgAk9Kzh1JY6jpwGMleBn7hGbS53q8EmPa0bNeH5u8/tsvBOxamZYKKmvS3
0O2kOk0nvhxFbBtShI77N8uOx05lBrHJpmzMbn4DpH4tiiG1yZnwJP/qpDqHhGWA
lqlYfdKo2Jae9kt/dMBgDiOJ5OUgk2XStfKEW9Gwf0iBCeFpOkPnm3Rgnjtp0k11
+U8gPvUoEMFyhnxKy6K5VHEiVTDxn8FxVMFp9ZE+BgVfLRZKattvIsPGwoeV0+TW
uEmS7eXNY0zXHcmA2aAZ35YAEw54E8ERmjXmDID+NSsMEyFDZBm+BOidWpEas5cN
0OcZiWKdGKzEprawQEDRLO+J4+L2Dg==
=2PV7
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--

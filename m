Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42337 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfKBDmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Nov 2019 23:42:37 -0400
Date: Sat, 2 Nov 2019 09:12:22 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] scripts:prune-kernel:Removed old kernels and modules dir
 from system
Message-ID: <20191102034222.GA12001@Slackware>
References: <20191101080510.26247-1-unixbhaskar@gmail.com>
 <180b82ba-f90d-e3de-9ce1-c77a79d014d2@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <180b82ba-f90d-e3de-9ce1-c77a79d014d2@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: bfields@fieldses.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 19:04 Fri 01 Nov 2019, Randy Dunlap wrote:
>On 11/1/19 1:05 AM, Bhaskar Chowdhury wrote:
>> This patch allow you to remove old kernels and associated modules
>> directory from the system.You can do it at once with the -r flag
>> and interactively with the -i flag.
>>=20
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>
>Hi Bhaskar,
>
>I think that you are getting a lot closer with this patch, but
>there are still a few issues.  And of course, it's not up to me
>whether the patch is applied.
>
>See below.
>
Hi Randy,

Thank you for the review. My understanding below...kindly glean on it..
>> ---
>>  scripts/prune-kernel | 63 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 63 insertions(+)
>>=20
>> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> index a25aa2160d47..373a845792e6 100755
>> --- a/scripts/prune-kernel
>> +++ b/scripts/prune-kernel
>> @@ -1,3 +1,66 @@
>>  #!/bin/bash
>>  # SPDX-License-Identifier: GPL-2.0
>> +#This script will remove old kernels and modules directory related to i=
t.
>> +# "-h" or "--help" show how to use this script or show without paramete=
r.
>> +#"-r" or "--remove" show how to silently remove old kernel and modules =
dir.
>> +#"-i" or "--interactive" show how to remove interactively.
>>=20
>> +flag=3D$1
>> +kernel_version=3D$2
>> +modules_version=3D$3
>> +boot_dir=3D/boot
>> +modules_dir=3D/lib/modules
>> +
>> +remove_old_kernel() {
>> +	cd $boot_dir
>> +	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kern=
el_version
>> +	return 0
>> +}
>> +
>> +remove_old_modules_dir() {
>> +	cd $modules_dir
>> +	rm -rf $modules_version
>> +	return 0
>> +}
>> +
>> +usage() {
>> +	printf "Usage: $(basename $0) [-ri] \n"
>> +	printf "\n -r or --remove  kernel_version modules_version \n"
>> +	printf "\n -i or --interactive do as interactive way \n"
>
>In those 3 printf's, drop the ending space before the \n.
>
Will do in next patch.
>> +	return 0
>> +}
>> +
>> +	case "$flag" in
>> +		-i | --interactive)
>> +			printf "\nEnter kernel version to remove or blank/empty to exit:%s"
>
>Drop the %s - it's not needed.

Will do in next patch.
>
>> +			read kernel_version
>> +			if [[ $kernel_version !=3D "" ]]; then
>> +				remove_old_kernel
>> +				printf "Please give the full modules directory name to remove:%s"
>
>Drop the %s here also.

Will do it next patch.
>
>> +				read modules_version
>> +				if [[ $modules_version !=3D "" ]]; then
>> +					remove_old_modules_dir
>> +					printf "\n\nRemoved kernel version:$kernel_version and associated =
modules directory:$modules_version ...Done \n"
>> +				else
>> +					exit 1
>> +				fi
>> +			fi
>
>There is still a small problem here: if I enter a kernel_version and then
>remove_old_kernel() is called, and then I enter "" for modules_version,
>the script exits without that printf line.  I guess that it is possible
>that someone only wants to remove the kernel_version files and not the mod=
ules.
>

I beg to differ. I think keep around old modules only gobbles up the
space(I know it's aplenty these day...but I came from...)..anyway I
thought it would be good to get rid of these stale stuff at once.
>Perhaps the thing to do is just make the prompts and calls and printf tota=
lly
>separate and repeated for kernel_version and modules_version.  Do you see
>what I mean?  or do you have other ideas about this?

Okay, I can understand. I could have done that...but thought instead
show it at once . But again, I will take suggestion and put separate
print statement for kernel removal and modules removal.
>
>> +			;;
>> +		-h | --help)
>> +			usage
>> +			exit 1
>> +			;;
>> +		-r | --remove)
>> +			if [[ $# -ne 3 ]]; then
>> +				printf "You need to provide kernel version and modules directory na=
me \n"
>
>Drop the space before the \n.

Will do it next patch.
>
>> +				exit 1
>> +			else
>> +				remove_old_kernel
>> +				remove_old_modules_dir
>> +			fi
>> +			;;
>> +		*)
>> +			usage
>> +			exit 1
>> +			;;
>> +	esac
>> --
>
>Same comment as before: after applying this patch, the "new" scripts/prune=
-kernel file
>still contains the previous script's for-loop at the end of the "new" scri=
pt.
>
>
I am bemused and confused like hell Randy about this. This probably lack
of understanding about git ...not sure though...

In ,wild dream, can I implement a "real new file" and forget about this
whole chapter of trailing.??

Upfront apologies to Bruce...it seems I am getting defeated by my
shortcoming ...heck..
>--=20
>~Randy

Bhaskar
>

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl28+xsACgkQsjqdtxFL
KRUUPwgAskS6Upypx30wOOkoplnopnp7dP8PkM9+PXlWn8Q9iJMmM71ZjD1UBzSQ
rZYL6rsTYPSZkJkAAZdayWTHU6Ttet2F2LOtwCxDMPJvMHWBzffp4IC7+llskLeG
bi1/Z5kl5cyFdlT93rCtssjH28+AdG+z5Wbn+tLRaGU+Bf7w/nwVarulp4UR+mC0
W6/zvGLx+TuLMBP9zAZo9//dcUiCjntQE5z4xg4w91CgD4kLlZUEIQ1P45vYtczq
Rew5jBZ81QTnmHR+5yr4x6zVCOSqSTeFRAPK/LcVThPU8ZNfBM7uUV1Ns99Zacq6
BokIQKZ6n91brYO0goKojNEkFxa6dw==
=LLCI
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--

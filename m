Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36482 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfJ3Cn0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 22:43:26 -0400
Date: Wed, 30 Oct 2019 08:13:12 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] scripts:prune-kernel:prune kernel and modules dir from
 the system
Message-ID: <20191030024312.GA1251@ArchLinux>
References: <20191029030030.31659-1-unixbhaskar@gmail.com>
 <de2a4604-e3ba-dab1-c72c-a0ff451541cf@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <de2a4604-e3ba-dab1-c72c-a0ff451541cf@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: bfields@fieldses.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17:05 Tue 29 Oct 2019, Randy Dunlap wrote:

>Hi,
Thank you Randy, my answers are inline , kindly look.

The modified version(implemented your suggestions) of the=20
script and their interaction will send in next patch mail.
>
>On 10/28/19 8:00 PM, Bhaskar Chowdhury wrote:
>> This patch will remove old kernel and modules directory from=20
>> the system interactive way and also at once ,provied the parameter
>> given to the invoking script.
>>=20
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/prune-kernel | 58 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>=20
>> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> index 58a7650ce592..a6c990450ddc 100755
>> --- a/scripts/prune-kernel
>> +++ b/scripts/prune-kernel
>> @@ -1,2 +1,60 @@
>>  #!/bin/bash
>>  # SPDX-License-Identifier: GPL-2.0
>> +#This script will delete old kernels and modules directory related to i=
t,both
>> +#automated and interactive way, if you choose -i or --interactive as pa=
rameter.
>> +#For normal operation you have to invoke this script like below
>> +#prune-kernel -r kernel_ver modules_dir_name
>> +flag=3D$1
>> +kernel_ver=3D$2
>> +modules_dir_name=3D$3
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
>> +	printf "\n -r | --remove kernel_ver modules_dir_name \n"
>> +	printf "\n -i | --interactive use as interactive way \n"
>> +}
>> +
>> +while getopts :hir opt;do
>
>what is the purpose of "opt" above?
Getting rid of it, using alternative mechanism.
>It is not used AFAICT.
>
>My internet searching says that 'getopts' does not support "--options" (lo=
ng options).
>But then $flag is used below, not $opt, so the long options are just suppo=
rted
>by "flag=3D$1" at the beginning of the script.
>
Right.
>
>> +	case "$flag" in
>> +		-i | --interactive)
>> +			printf "\nEnter kernel version to remove or blank/empty to exit:%s"
>> +			read kernel_version
>> +			if [[ $kernel_version !=3D "" ]]; then
>> +				remove_old_kernel
>> +				printf "Please give the full modules directory name to remove:%s"
>> +				read modules_version
>
>Need to handle modules_version =3D "" here.
>
Exit if they fail to provide one...inducting that.
>> +				remove_old_modules_dir
>> +				printf "\n\n\n Removed kernel version:$kernel_version and associate=
d modules directory:$modules_version ..Done.\n"
>> +			else
>> +				exit 1
>> +			fi
>> +			;;
>> +		-h | --help)
>> +			usage
>> +			exit 1
>> +			;;
>> +		-r | --remove)
>
>What happens if a user enters:
>
>./scripts/prune-kernel -r
>and no kernel_ver or modules_dir_name after -r?
Simply die.That is also putting in,because not putting=20
anything will defeat the purpose of having the flag in=20
first place.
>
>> +			shift $(( OPTIND -1 ))
>
>What is the purpose of the 'shift' since there is no loop to process more =
options?
>
Getting rid of it ,as we opted for different mechanism.
>> +			cd $boot_dir
>> +			rm -f $kernel_ver
>> +			cd $modules_dir
>> +			rm -rf $modules_dir_name
>> +			printf "Removed kernel version:$kernel_ver and modules directory:$mo=
dules_dir_name from the system. \n\n"
>> +			exit 0
>> +			;;
>> +	esac
>> +done
>
>This patch does not delete the original script loop, so that still follows
>after the 'done' above.  Was that intentional?
This is confuse me! not sure  what you meant. Did you meant to say
the do loop inside does not match with this pair???=20
>
>--=20
>~Randy



--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl24+LsACgkQsjqdtxFL
KRVnzAf/bSjiy38NlfoWuaKR31XnyKoJ45zCUtvo3gY96+hof0bbNkHmdZQ/Lxxe
QlOufbv8B8biNcZB5gxEH+XLsLEqq8mu4DtvOrVaGxIE2AETcYRNF7ifMY3NduZL
cpvdF5tR5mst0GBSIW+Q+kfviiYhK4xOVf3g23al7UqLFgMg/eMcAPHACvmFERhg
GG4ATfNCuMzVtGrJCxGgd8kXNc3yLF4b9GLy92umfF0r5lsqp9sLwIf+gBATwSqJ
jYIfu68CEG5qDJZjXlc5AelJYm432i6m3UOQZeYoFHDklEmFtC5/m9A3zemx8cHn
RXI9q02R8l3Ia/RLRVEI0QLUmOatIg==
=4ETu
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--

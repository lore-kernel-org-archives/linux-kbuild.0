Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33126 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731726AbfJQGTo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 02:19:44 -0400
Date: Thu, 17 Oct 2019 11:49:28 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] scripts : prune-kernel : prune kernels generalized way
Message-ID: <20191017061925.GA1274@Gentoo>
References: <20191016061312.10626-1-unixbhaskar@gmail.com>
 <307349e6-69b0-b894-a2b9-edfd5b0fe4c7@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <307349e6-69b0-b894-a2b9-edfd5b0fe4c7@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, bfields@fieldses.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09:08 Wed 16 Oct 2019, Randy Dunlap wrote:
>On 10/15/19 11:13 PM, Bhaskar Chowdhury wrote:
>> This patch will remove old kernel from the system in a selective way.
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>> Thanks, a bunch to Randy for the hand holding . :)
>
>Hi Bhaskar,
>
>First problem is that patch complains:
>
>checking file scripts/prune-kernel
>Using Plan A...
>patch: **** malformed patch at line 87: 2.21.0
>
>IOW, this patch does not apply cleanly.

Whoops! Sending the patch with all the corrections.=20

>More comments below.
>
>
>>  scripts/prune-kernel | 71 ++++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 59 insertions(+), 12 deletions(-)
>>
>> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>> index e8aa940bc0a9..78dd4c854b2b 100755
>> --- a/scripts/prune-kernel
>> +++ b/scripts/prune-kernel
>> @@ -5,17 +5,64 @@
>>  # again, /boot and /lib/modules/ eventually fill up.
>>  # Dumb script to purge that stuff:
>>
>> +#for f in "$@"
>> +#do
>> +#        if rpm -qf "/lib/modules/$f" >/dev/null; then
>> +#                echo "keeping $f (installed from rpm)"
>> +#        elif [ $(uname -r) =3D "$f" ]; then
>> +#                echo "keeping $f (running kernel) "
>> +#        else
>> +#                echo "removing $f"
>> +#                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
>> +#                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
>> +#                rm -rf "/lib/modules/$f"
>> +#                new-kernel-pkg --remove $f
>> +#        fi
>> +#done
>> +boot_dir=3D/boot
>> +modules_dir=3D/lib/modules
>> +
>> +function remove_old_kernel(){
>> +	cd $boot_dir
>> +	rm -If vmlinuz-$kenrel_version System.map-$kernel_version config-$kern=
el_verison
>
>Typos:
>	               $kernel_version                                   $kernel_=
version
>
>I.e., you can't have tested this.
>
Fixed.
>> +}
>> +function remove_old_kernel_modules_dir(){
>> +	cd $modules_dir
>> +	rm -rf $modules_version
>> +}
>> +printf "\n\n Enlist the installed kernels \n\n"
>> +
>> +find $boot_dir -name "vmlinuz-*" -type f  -exec ls -1 {} \;
>> +
>> +printf "\n\n\n Please give the kernel version to remove: %s"
>> +read kernel_version
>> +
>
>If I enter nothing here, no need to call remove_old_kernel.
>
Okay, terminate it there, because allowing defeat the purpose=20
of the script.
>> +remove_old_kernel
>> +
>> +printf "\n\n Enlist the installed modules directory \n\n"
>> +
>> +find $modules_dir  -maxdepth 0 -type d -exec ls -1 {} \;
>> +
>> +printf "\n\n Please give the full modules directory name to remove: %s"
>> +read modules_version
>
>If I enter nothing here, don't call remove_old_kernel_modules_dir.
>
It will not reach here, because we have terminated it above.
>> +
>> +remove_old_kernel_modules_dir
>> +
>> +printf "\n\n Removed kernel version: $kernel_version and associcated mo=
dules: $modules_version ...Done \n"
>
>       typo:                                                associated
>
Fixed.
>> +while :
>>  do
>
>Why is the "do" line missing a '+'?  The only do/done in the current script
>are already listed above as being commented out.
>
>> +printf "\n\n Do you want to remove another?[YN] : %s"
>> +read response
>> +
>> +if [[ $response =3D=3D "Y" ]];then
>> +	printf "Please give another version to remove : %s"
>> +	read kernel_version
>> +	remove_old_kernel
>> +	printf "\n\n Please give the full modules directory name to remove: %s"
>> +	read modules_version
>> +	remove_old_kernel_modules_dir
>> +elif [[ $response =3D=3D "N" ]];then
>> +	printf "\n\n Alright,no more. \n\n"
>
>Just exit, no printf needed.
>
>> +	exit 1
>> +fi
>>  done

>Same comment for "done" as for "do" above.
I must have done something wrong that is why...now fixed it.
>
>> --
>> 2.21.0
>
>
Thank you Randy, and extremely sorry to gobbles up your and everyones
time...heck..
>--=20
>~Randy

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl2oB+cACgkQsjqdtxFL
KRUrzgf/ZWCjNSydZt2mQXRBXiVJJWlkezlaX9JwXvQOsapTS4qHalz1IrDqn4Lq
y1Tlwqu8cNIwTtCkCnUOcU/2KWjcav+CdoO2/0pJWm2newn8pTtCGoBYQkrIvElX
L12+g2wcEXMa2izMfRh1Ln9nJmyqyeHzRy+CxP1TsAwtgb0J/indWgCG1lxmp+Bq
P7hv77Iwm+v89nV1i5QDjGimVhTl9FclspD1Qg/QKgYGwNNsTMth6By32UJUVUqc
mwOz6CZXDdtAoGQA8B/PzN+3GeF8xiTMgWEJkW3K5CO/cFGxEdRf09tq8lL5AY75
r6HGpL31CupheOnxUCtUUmCVKN3qdw==
=0w9/
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--

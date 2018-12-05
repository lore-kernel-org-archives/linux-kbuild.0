Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34996 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbeLEPsG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Dec 2018 10:48:06 -0500
Received: by mail-wm1-f68.google.com with SMTP id c126so13365616wmh.0
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Dec 2018 07:48:05 -0800 (PST)
Reply-To: monstr@monstr.eu
Subject: Re: [PATCH 3/7] microblaze: move "... is ready" message to
 arch/microblaze/Makefile
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-4-git-send-email-yamada.masahiro@socionext.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <35d05327-e500-2f1a-a8d2-e1683ce190f2@monstr.eu>
Date: Wed, 5 Dec 2018 16:47:58 +0100
MIME-Version: 1.0
In-Reply-To: <1543823457-32478-4-git-send-email-yamada.masahiro@socionext.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="2sChAx3aDyzugjkRfWmrGilKbT141aqHz"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2sChAx3aDyzugjkRfWmrGilKbT141aqHz
Content-Type: multipart/mixed; boundary="EHR9gT7UoLF2R3wCKPwwnCcrdsaEnMyWo";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <35d05327-e500-2f1a-a8d2-e1683ce190f2@monstr.eu>
Subject: Re: [PATCH 3/7] microblaze: move "... is ready" message to
 arch/microblaze/Makefile
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-4-git-send-email-yamada.masahiro@socionext.com>

--EHR9gT7UoLF2R3wCKPwwnCcrdsaEnMyWo
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03. 12. 18 8:50, Masahiro Yamada wrote:
> To prepare for more fixes, move this to arch/microblaze/Makefile.
> Otherwise, the same "... is ready" would be printed multiple times.
>=20
> (Another solution would be, to remove these messages entirely unless
> people persist with them.)
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
>  arch/microblaze/Makefile      | 2 ++
>  arch/microblaze/boot/Makefile | 4 ----
>  2 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
> index 97e1384..cfd7bfca 100644
> --- a/arch/microblaze/Makefile
> +++ b/arch/microblaze/Makefile
> @@ -81,9 +81,11 @@ archclean:
> =20
>  linux.bin linux.bin.gz linux.bin.ub: vmlinux
>  	$(Q)$(MAKE) $(build)=3D$(boot) $(boot)/$@
> +	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
> =20
>  simpleImage.%: vmlinux
>  	$(Q)$(MAKE) $(build)=3D$(boot) $(boot)/$@
> +	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
> =20
>  define archhelp
>    echo '* linux.bin    - Create raw binary'
> diff --git a/arch/microblaze/boot/Makefile b/arch/microblaze/boot/Makef=
ile
> index e8684a2..c2579a7 100644
> --- a/arch/microblaze/boot/Makefile
> +++ b/arch/microblaze/boot/Makefile
> @@ -9,15 +9,12 @@ OBJCOPYFLAGS :=3D -R .note -R .comment -R .note.gnu.b=
uild-id -O binary
> =20
>  $(obj)/linux.bin: vmlinux FORCE
>  	$(call if_changed,objcopy)
> -	@echo 'Kernel: $@ is ready' ' (#'`cat .version`')'
> =20
>  $(obj)/linux.bin.ub: $(obj)/linux.bin FORCE
>  	$(call if_changed,uimage)
> -	@echo 'Kernel: $@ is ready' ' (#'`cat .version`')'
> =20
>  $(obj)/linux.bin.gz: $(obj)/linux.bin FORCE
>  	$(call if_changed,gzip)
> -	@echo 'Kernel: $@ is ready' ' (#'`cat .version`')'
> =20
>  quiet_cmd_cp =3D CP      $< $@$2
>  	cmd_cp =3D cat $< >$@$2 || (rm -f $@ && echo false)
> @@ -35,6 +32,5 @@ $(obj)/simpleImage.%: vmlinux FORCE
>  	$(call if_changed,objcopy)
>  	$(call if_changed,uimage)
>  	$(call if_changed,strip,.strip)
> -	@echo 'Kernel: $(UIMAGE_OUT) is ready' ' (#'`cat .version`')'
> =20
>  clean-files +=3D simpleImage.*
>=20

TBH I can't see this problematic but if this is aligned with others I
have no problem with it.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs



--EHR9gT7UoLF2R3wCKPwwnCcrdsaEnMyWo--

--2sChAx3aDyzugjkRfWmrGilKbT141aqHz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlwH8y4ACgkQykllyylKDCGsSgCfYlS4C4PPijmst3FQjB/x3eur
GAYAn2uEk4cEZwFHCJsXqHC+tUSqMiP5
=ayiA
-----END PGP SIGNATURE-----

--2sChAx3aDyzugjkRfWmrGilKbT141aqHz--

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:57237 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbgFZGSE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 02:18:04 -0400
MIME-Version: 1.0
References: <5ef50e52.1c69fb81.b6cbd.bd8e@mx.google.com>
In-Reply-To: <5ef50e52.1c69fb81.b6cbd.bd8e@mx.google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 26 Jun 2020 15:16:58 +0900
Message-ID: <CAK7LNASta=UfbK-C=6R+tT2nug8_MYyr9515J4CN8odWCh0CpA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: buildtar: add arm64 dtbs support
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Domenico Andreoli <domenico.andreoli@linux.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>

On Fri, Jun 26, 2020 at 5:51 AM Domenico Andreoli
<domenico.andreoli@linux.com> wrote:
>
> From: Domenico Andreoli <domenico.andreoli@linux.com>
>
> Make 'make tar-pkg' install dtbs on arm64.
>
> Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>
>
> v2:
>  - Destination path includes the kernel version, as expected
>
> ---
>  scripts/package/buildtar |    9 +++++++++
>  1 file changed, 9 insertions(+)
>
> Index: b/scripts/package/buildtar
> ===================================================================
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -125,6 +125,15 @@ case "${ARCH}" in
>                 ;;
>  esac
>
> +#
> +# Install dtbs
> +#
> +case "${ARCH}" in

Instead of checking ${ARCH},
can you you do

     if grep -q '^CONFIG_OF_EARLY_FLATTREE=y' include/config/auto.conf; then

?

This is what the deb package build does:
https://github.com/masahir0y/linux/blob/v5.7/scripts/package/builddeb#L145


> +       arm64)
> +               make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
> +               ;;
> +esac
> +


Or, you can use INSTALL_PATH="${tmpdir}/boot"
to make it shorter.




--
Best Regards
Masahiro Yamada

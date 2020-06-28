Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:29721 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgF1Drn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jun 2020 23:47:43 -0400
MIME-Version: 1.0
References: <20200627122505.GA6095@dumbo>
In-Reply-To: <20200627122505.GA6095@dumbo>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jun 2020 12:46:52 +0900
Message-ID: <CAK7LNASQNRdY1B8=XChZsnS8nGJwptKnZL=eES8sXgX+hCu6-Q@mail.gmail.com>
Subject: Re: [PATCH v4] kbuild: buildtar: add dtbs support
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>

On Sat, Jun 27, 2020 at 9:25 PM Domenico Andreoli
<domenico.andreoli@linux.com> wrote:
>
> From: Domenico Andreoli <domenico.andreoli@linux.com>
>
> Make 'make tar-pkg' install dtbs.
>
> v4:
>  - Install the dtbs before modules & kernel, not after
>  - Check for the dtbs_install target before attempting to invoke it
>
> v3:
>  - Check for CONFIG_OF_EARLY_FLATTREE=y instead of ARCH before installing dtbs
>
> v2:
>  - Add the kernel release to the destination path
>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>


Applied to linux-kbuild.
Thanks.

> ---
>  scripts/package/buildtar |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> Index: b/scripts/package/buildtar
> ===================================================================
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -53,6 +53,18 @@ rm -rf -- "${tmpdir}"
>  mkdir -p -- "${tmpdir}/boot"
>  dirs=boot
>
> +
> +#
> +# Try to install dtbs
> +#
> +if grep -q '^CONFIG_OF_EARLY_FLATTREE=y' include/config/auto.conf; then
> +       # Only some architectures with OF support have this target
> +       if [ -d "${srctree}/arch/${SRCARCH}/boot/dts" ]; then
> +               $MAKE ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
> +    fi
> +fi
> +
> +
>  #
>  # Try to install modules
>  #
>
> --
> rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
> ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05



-- 
Best Regards
Masahiro Yamada

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:63562 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751272AbdFEJCF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jun 2017 05:02:05 -0400
MIME-Version: 1.0
In-Reply-To: <20170514170942.27944-1-x-linux@infra-silbe.de>
References: <CAK7LNASc7NgthfZCWFT=3FhRQxxJuuzDVjT8GHik5A0+zBVxpw@mail.gmail.com>
 <20170514170942.27944-1-x-linux@infra-silbe.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 5 Jun 2017 18:02:00 +0900
Message-ID: <CAK7LNAR6HAe+DmdS8SrnYeWmfDPMxWzdfAn8VseOKvzmRKq95w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add explicit ARM support for tar-pkg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sascha Silbe <x-linux@infra-silbe.de>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Sascha,
Sorry for my late reply.

2017-05-15 2:09 GMT+09:00 Sascha Silbe <x-linux@infra-silbe.de>:
> buildtar warns when an architecture doesn't have an explicit rule on
> what files to copy, even when the generic rule works just fine. Add a
> rule for ARM that does the same as the explicit rule, but avoids the
> warning.
>
> Signed-off-by: Sascha Silbe <x-linux@infra-silbe.de>
> ---
> v1=E2=86=92v2: rebased on top of todays linus master, including commit 15=
2e6744ebfc
>
> Not duplicating the rule would have been nice from a maintenance point
> of view, but doesn't fit the current code structure very well. It also
> avoids breakage if the generic rule ever gets adjusted to something
> else that doesn't work for ARM.
>
>
>  scripts/package/buildtar | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index e046bff33589..ea84ba67619b 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -108,6 +108,9 @@ case "${ARCH}" in
>                         cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vml=
inux-${KERNELRELEASE}"
>                 fi
>                 ;;
> +       arm)
> +               [ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "$=
{tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
> +               ;;
>         *)
>                 [ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "$=
{tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
>                 echo "" >&2


I do not get why we need to add a separate entry
to avoid the WARNING.

With KBUILD_IMAGE fixed, mkspec and builddeb now
handle the kernel image in an (almost) arch-agnostic way.

I think the WARNING can be simply removed from the default case.
Also, could you rename vmlinux-kbuild-${KERNELRELEASE}
to vmlinuz-${KERNELRELEASE} in order to align with mkspec/builddeb?
Then, x86|i386|x86_64 can be merged into the default case.


--=20
Best Regards
Masahiro Yamada

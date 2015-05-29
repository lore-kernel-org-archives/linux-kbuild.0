Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:35436 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbbE2E4G (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 May 2015 00:56:06 -0400
Received: by wicmx19 with SMTP id mx19so6131072wic.0
        for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2015 21:56:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1431352946-6691-2-git-send-email-chris.j.arges@canonical.com>
References: <1431352946-6691-1-git-send-email-chris.j.arges@canonical.com>
	<1431352946-6691-2-git-send-email-chris.j.arges@canonical.com>
Date: Fri, 29 May 2015 07:56:05 +0300
Message-ID: <CAAqcGHkuDe9+mTuLeMq-BV4+zJBoqFWQ4nawfEMRTm=0oKYSgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] package: Makefile: ensure $MAKE can use jobserver
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Chris J Arges <chris.j.arges@canonical.com>
Cc: mmarek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel@vger.kernel.org

Hi,

On 11 May 2015 at 17:02, Chris J Arges <chris.j.arges@canonical.com> wrote:
> When using make deb-pkg, builddeb is called without proper MAKEFLAGS due to the
> script being invoked without '+'. This results in the following message when
> building:
> warning: jobserver unavailable: using -j1. Add `+' to parent make rule
>
> Add the '+' so the make operations can be parallelized.
>
> Signed-off-by: Chris J Arges <chris.j.arges@canonical.com>

Conflicts with my "add source package" patch now that it adds the
bindeb-pkg target. This patch is still correct, and manually updating
either your or my patch to apply after the other is quite trivial.

Reviewed-by: Riku Voipio <riku.voipio@linaro.org>

> ---
>  scripts/package/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 99ca6e7..0dbfae7 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -88,7 +88,7 @@ quiet_cmd_builddeb = BUILDDEB
>
>  deb-pkg: FORCE
>         $(MAKE) KBUILD_SRC=
> -       $(call cmd,builddeb)
> +       +$(call cmd,builddeb)
>
>  clean-dirs += $(objtree)/debian/
>
> --
> 1.9.1
>

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:38031 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932581AbbD1Iil (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Apr 2015 04:38:41 -0400
Received: by wiun10 with SMTP id n10so19845652wiu.1
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2015 01:38:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1429899940-32366-2-git-send-email-chris.j.arges@canonical.com>
References: <1429899940-32366-1-git-send-email-chris.j.arges@canonical.com>
	<1429899940-32366-2-git-send-email-chris.j.arges@canonical.com>
Date: Tue, 28 Apr 2015 11:38:39 +0300
Message-ID: <CAAqcGHk9Z4eVZWGhRBc3tPh_-nbQ78uLxxc_CFijastnt7_5jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] package: Makefile: ensure $MAKE can use jobserver
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Chris J Arges <chris.j.arges@canonical.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>, linux-kernel@vger.kernel.org

On 24 April 2015 at 21:25, Chris J Arges <chris.j.arges@canonical.com> wrote:
> When using make deb-pkg, builddeb is called without proper MAKEFLAGS due to the
> script being invoked without '+'. This results in the following message when
> building:
> warning: jobserver unavailable: using -j1. Add `+' to parent make rule
>
> Add the '+' so the make operations can be parallelized.

Looks good, and works fine in my tests.

Reviewed-by: Riku Voipio <riku.voipio@linaro.org>

> Signed-off-by: Chris J Arges <chris.j.arges@canonical.com>
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
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

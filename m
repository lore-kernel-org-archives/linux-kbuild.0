Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:34810 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752219AbbGHSWZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jul 2015 14:22:25 -0400
Received: by wifm2 with SMTP id m2so97541529wif.1
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Jul 2015 11:22:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1434631938-12681-1-git-send-email-riku.voipio@linaro.org>
References: <1434631938-12681-1-git-send-email-riku.voipio@linaro.org>
Date: Wed, 8 Jul 2015 21:22:23 +0300
Message-ID: <CAAqcGHnT5kCapivn+mTZws2gJX0gwnLA2owzdguZsefsAdQ1fg@mail.gmail.com>
Subject: Re: [PATCH] tools/lib: improve clean target
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, a.p.zijlstra@chello.nl, Riku Voipio <riku.voipio@linaro.org>, acme@redhat.com

On 18 June 2015 at 15:52,  <riku.voipio@linaro.org> wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> The clean targets miss some .cmd and .d files.

Is this patch slipping through cracks?

> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  tools/lib/api/Makefile        | 2 +-
>  tools/lib/traceevent/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
> index 8bd9606..fe1b02c 100644
> --- a/tools/lib/api/Makefile
> +++ b/tools/lib/api/Makefile
> @@ -36,7 +36,7 @@ $(LIBFILE): $(API_IN)
>
>  clean:
>         $(call QUIET_CLEAN, libapi) $(RM) $(LIBFILE); \
> -       find $(if $(OUTPUT),$(OUTPUT),.) -name \*.o | xargs $(RM)
> +       find $(if $(OUTPUT),$(OUTPUT),.) -name \*.o -or -name \*.o.cmd -or -name \*.o.d | xargs $(RM)
>
>  FORCE:
>
> diff --git a/tools/lib/traceevent/Makefile b/tools/lib/traceevent/Makefile
> index 6daaff6..7851df1 100644
> --- a/tools/lib/traceevent/Makefile
> +++ b/tools/lib/traceevent/Makefile
> @@ -268,7 +268,7 @@ install: install_lib
>
>  clean:
>         $(call QUIET_CLEAN, libtraceevent) \
> -               $(RM) *.o *~ $(TARGETS) *.a *.so $(VERSION_FILES) .*.d \
> +               $(RM) *.o *~ $(TARGETS) *.a *.so $(VERSION_FILES) .*.d .*.cmd \
>                 $(RM) TRACEEVENT-CFLAGS tags TAGS
>
>  PHONY += force plugins
> --
> 2.1.4
>

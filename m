Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:27322 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfCQCve (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Mar 2019 22:51:34 -0400
MIME-Version: 1.0
References: <20190315162503.131510-1-dianders@chromium.org>
In-Reply-To: <20190315162503.131510-1-dianders@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 17 Mar 2019 11:50:29 +0900
Message-ID: <CAK7LNAQUfyoUSaAVLhrT+N9w7AH81y6-gqkUcTYOeFJM8Dv1AQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "modsign: Abort modules_install when signing fails"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Mar 16, 2019 at 1:25 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> This reverts commit caf6fe91ddf62a96401e21e9b7a07227440f4185.
>
> The commit was fine but is no longer needed as of commit 3a2429e1faf4
> ("kbuild: change if_changed_rule for multi-line recipe").  Let's go
> back to using ";" to be consistent.
>
> For some discussion, see:
>
> https://lkml.kernel.org/r/CAK7LNASde0Q9S5GKeQiWhArfER4S4wL1=R_FW8q0++_X3T5=hQ@mail.gmail.com
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---


Applied to linux-kbuild. Thanks.




>  scripts/Makefile.modinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index ff5ca9817a85..0dae402661f3 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -23,7 +23,7 @@ quiet_cmd_modules_install = INSTALL $@
>      mkdir -p $(2) ; \
>      cp $@ $(2) ; \
>      $(mod_strip_cmd) $(2)/$(notdir $@) ; \
> -    $(mod_sign_cmd) $(2)/$(notdir $@) $(patsubst %,|| true,$(KBUILD_EXTMOD)) && \
> +    $(mod_sign_cmd) $(2)/$(notdir $@) $(patsubst %,|| true,$(KBUILD_EXTMOD)) ; \
>      $(mod_compress_cmd) $(2)/$(notdir $@)
>
>  # Modules built outside the kernel source tree go into extra by default
> --
> 2.21.0.360.g471c308f928-goog
>


-- 
Best Regards
Masahiro Yamada

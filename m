Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:24555 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729162AbfCOOLe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Mar 2019 10:11:34 -0400
MIME-Version: 1.0
References: <20190314175705.11671-1-dianders@chromium.org>
In-Reply-To: <20190314175705.11671-1-dianders@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 15 Mar 2019 23:10:39 +0900
Message-ID: <CAK7LNATvfVD8RfZN37fXGKJeEuawM_7BuVrJ4xw1pZmuz5f_aw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: If the module stripping command fails the build
 should abort
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Mar 15, 2019 at 2:59 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> If the call to strip returns an error code then it makes sense for the
> build to fail.  Currently we'll just chug along and ship unstripped
> modules.
>
> Fixes: e2a666d52b48 ("kbuild: sign the modules at install time")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>


Did you see this problem in the latest kernel?

Since commit 3a2429e1faf40b2aaa481aa4b001a74d222c7e8b,
$(call cmd,...) is run with 'set -e'.

Any failure in a series of commands will let the build fail.


If you have the problem in old versions ( < 4.20),
I do not mind this patch for linux-stable.





> ---
>
>  scripts/Makefile.modinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index ff5ca9817a85..5d05c43c6f31 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -22,7 +22,7 @@ quiet_cmd_modules_install = INSTALL $@
>        cmd_modules_install = \
>      mkdir -p $(2) ; \
>      cp $@ $(2) ; \
> -    $(mod_strip_cmd) $(2)/$(notdir $@) ; \
> +    $(mod_strip_cmd) $(2)/$(notdir $@) && \
>      $(mod_sign_cmd) $(2)/$(notdir $@) $(patsubst %,|| true,$(KBUILD_EXTMOD)) && \
>      $(mod_compress_cmd) $(2)/$(notdir $@)
>
> --
> 2.21.0.360.g471c308f928-goog
>


--
Best Regards
Masahiro Yamada

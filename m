Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:56538 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751012AbdKIR7K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 12:59:10 -0500
Received: by mail-vk0-f66.google.com with SMTP id g11so4510023vkd.13
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Nov 2017 09:59:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1510242077-8122-2-git-send-email-yamada.masahiro@socionext.com>
References: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com> <1510242077-8122-2-git-send-email-yamada.masahiro@socionext.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Nov 2017 09:59:08 -0800
Message-ID: <CAD=FV=VQ2YoWd0ARSk6z03zFzKmem6VbJ4r5T0aoGh7kGhwaDw@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: create directory for make cache only when necessary
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>

Hi,

On Thu, Nov 9, 2017 at 7:41 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Currently, the existence of $(dir $(make-cache)) is always checked,
> and created if it is missing.
>
> We can avoid unnecessary system calls by some tricks.
>
> [1] If KBUILD_SRC is unset, we are building in the source tree.
>     The output directory checks can be entirely skipped.
> [2] If at least one cache data is found, it means the cache file
>     was included.  Obiously its directory exists.  Skip "mkdir -p".
> [3] If Makefile does not contain any call of __run-and-store, it will
>     not create a cache file.  No need to create its directory.
> [4] The "mkdir -p" should be only invoked by the first call of
>     __run-and-store
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/Kbuild.include | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index be1c9d6..4fb1be1 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -99,18 +99,19 @@ cc-cross-prefix =  \
>
>  # Include values from last time
>  make-cache := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/,$(if $(obj),$(obj)/)).cache.mk
> -ifeq ($(wildcard $(dir $(make-cache))),)
> -$(shell mkdir -p '$(dir $(make-cache))')
> -endif
>  $(make-cache): ;
>  -include $(make-cache)
>
> +cached-data := $(filter __cached_%, $(.VARIABLES))
> +
>  # If cache exceeds 1000 lines, shrink it down to 500.
> -ifneq ($(word 1000,$(filter __cached_%, $(.VARIABLES))),)
> +ifneq ($(word 1000,$(cached-data)),)
>  $(shell tail -n 500 $(make-cache) > $(make-cache).tmp; \
>         mv $(make-cache).tmp $(make-cache))
>  endif
>
> +cache-dir := $(if $(KBUILD_SRC),$(if $(cache-data),,$(dir $(make-cache))))

It wouldn't hurt to add a comment that cache-dir will be blank if we
don't need to make the cache dir and will contain a directory path
only if the dir doesn't exist.  Without a comment it could take
someone quite a while to realize that...

> +
>  # Usage: $(call __sanitize-opt,Hello=Hola$(comma)Goodbye Adios)
>  #
>  # Convert all '$', ')', '(', '\', '=', ' ', ',', ':' to '_'
> @@ -136,6 +137,10 @@ __sanitize-opt = $(subst $$,_,$(subst $(right_paren),_,$(subst $(left_paren),_,$
>  define __run-and-store
>  ifeq ($(origin $(1)),undefined)
>    $$(eval $(1) := $$(shell $$(2)))
> +ifneq ($(cache-dir),)
> +  $$(shell mkdir -p $(cache-dir))

I _think_ you want some single quotes in there.  AKA:

$$(shell mkdir -p '$(cache-dir)')

That at least matches what the "old" code used to do.  Specifically if
'cache-dir' happens to have a space in it then it won't work right
without the single quotes.  There may be other symbols that your shell
might interpret in interesting ways, too.

NOTE: I have no idea if the kernel Makefiles work if paths like
KBUILD_SRC have spaces in them to begin with, but it seems wise to add
the quotes here anyway.

ALSO NOTE: I think you could still confuse the kernel Makefiles if
somehow you had a single quote in your path somehow.  I assume we
don't care?


> +  $$(eval cache-dir :=)
> +endif
>    $$(shell echo '$(1) := $$($(1))' >> $(make-cache))
>  endif
>  endef

Other than the single quote problem and the suggested comment, this
seems like a sane optimization to me.  Feel free to add my Reviewed-by
once those fixes are in place.

-Doug

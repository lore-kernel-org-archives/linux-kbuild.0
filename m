Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:46483 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751156AbdJIWED (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 18:04:03 -0400
Received: by mail-wm0-f47.google.com with SMTP id m72so185377wmc.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Oct 2017 15:04:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1507089367-10402-4-git-send-email-yamada.masahiro@socionext.com>
References: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com> <1507089367-10402-4-git-send-email-yamada.masahiro@socionext.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Oct 2017 15:04:01 -0700
Message-ID: <CAD=FV=Um_MOaTT=kEvYSA=rTq8w9w39iuKaDgHedSo5ck9JPqw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] kbuild: evaluate cc-option and friends only when
 building kernel
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On Tue, Oct 3, 2017 at 8:56 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 9ffd3dd..222d0a2 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -96,6 +96,13 @@ try-run = $(shell set -e;            \
>         fi;                             \
>         rm -f "$$TMP" "$$TMPO")
>
> +# hostcc-option
> +# Usage: cflags-y += $(call hostcc-option,-march=winchip-c6,-march=i586)
> +hostcc-option = $(call __cc-option, $(HOSTCC),\
> +       $(HOSTCFLAGS) $(HOST_EXTRACFLAGS),$(1),$(2))

I believe you've got a bug here.  You're calling "__cc-option" which
isn't defined if "need-compiler" is not 1, right?

> +
> +ifeq ($(need-compiler),1)

The way this patch works is a bit non-obvious I think.  I wonder if
anyone else will be confused like I am...

Basically if "need-compiler" is not 1 then things like "cc-option"
won't be defined at all.  ...but we'll still _call_ them in other
Makefiles.  This call of an undefined variable will just evaluate to
an empty string.  Thus, for instance:

CFLAGS_KCOV := $(call cc-option,-fsanitize-coverage=trace-pc,)

...will just set CFLAGS_KCOV to the empty string if "need-compiler"
isn't 1, right?


I guess that's fine, but maybe at least document it somewhere?  IMHO
it would be even better if somehow you still defined each of these to
something bogus in an else clause, like:

as-option = --err_noncompile_target
as-instr = --err_noncompile_target
cc-option = --err_noncompile_target
...
...

The idea being that if someone accidentally invoked the C compiler (or
if there was some other conditional code in the Makefile based on the
result of one of these functions) it would be obvious what was going
on.


-Doug

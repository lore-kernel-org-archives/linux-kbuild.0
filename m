Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:57905 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751947AbaBTVdM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Feb 2014 16:33:12 -0500
Received: by mail-oa0-f49.google.com with SMTP id i4so624119oah.36
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Feb 2014 13:33:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <53061D88020000780011DFD2@nat28.tlf.novell.com>
References: <53061D88020000780011DFD2@nat28.tlf.novell.com>
Date: Thu, 20 Feb 2014 13:33:11 -0800
Message-ID: <CAGXu5j+e0j7iFsjXrK8s2irgEjUxJgCJe1S8vU7UumnkNf2P3A@mail.gmail.com>
Subject: Re: [PATCH] fix build with make 3.80 again
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, Ingo Molnar <mingo@kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, Feb 20, 2014 at 6:21 AM, Jan Beulich <JBeulich@suse.com> wrote:
> According to Documentation/Changes, make 3.80 is still being supported
> for building the kernel, hence make files must not make (unconditional)
> use of features introduced only in newer versions. Commit 8779657d
> ("stackprotector: Introduce CONFIG_CC_STACKPROTECTOR_STRONG") however
> introduced an "else ifdef" construct which make 3.80 doesn't understand.

Sounds fine to me; there is no third block to use a final "else", so
ditching the "else ifdef" is okay by me. Thanks for the fix!

>
> Also correct a warning message still referencing the old config option
> name.
>
> Apart from that I question the use of "ifdef" here (but it was used
> that way already prior to said commit): ifeq (,y) would seem more to
> the point.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Ingo Molnar <mingo@kernel.org>

Acked-by: Kees Cook <keescook@chromium.org>

> ---
>  Makefile |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> --- 3.14-rc3/Makefile
> +++ 3.14-rc3-make-3.80/Makefile
> @@ -605,10 +605,11 @@ endif
>  ifdef CONFIG_CC_STACKPROTECTOR_REGULAR
>    stackp-flag := -fstack-protector
>    ifeq ($(call cc-option, $(stackp-flag)),)
> -    $(warning Cannot use CONFIG_CC_STACKPROTECTOR: \
> +    $(warning Cannot use CONFIG_CC_STACKPROTECTOR_REGULAR: \
>               -fstack-protector not supported by compiler))

merge note: this line got the double-closing-paren fixed in a separate
patch. There must be a version of "make" that doesn't mind it, since
it seems neither you nor I tripped over it. :)

>    endif
> -else ifdef CONFIG_CC_STACKPROTECTOR_STRONG
> +else
> +ifdef CONFIG_CC_STACKPROTECTOR_STRONG
>    stackp-flag := -fstack-protector-strong
>    ifeq ($(call cc-option, $(stackp-flag)),)
>      $(warning Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: \
> @@ -618,6 +619,7 @@ else
>    # Force off for distro compilers that enable stack protector by default.
>    stackp-flag := $(call cc-option, -fno-stack-protector)
>  endif
> +endif
>  KBUILD_CFLAGS += $(stackp-flag)
>
>  # This warning generated too much noise in a regular build.

Thanks!

-Kees

-- 
Kees Cook
Chrome OS Security

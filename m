Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:47854 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751758AbdFMHto (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 03:49:44 -0400
Subject: Re: [PATCH 1/3] kbuild: Add cc-option-no-kbuild macro
References: <20170613005531.77656-1-mka@chromium.org>
 <20170613005531.77656-2-mka@chromium.org>
From: Michal Marek <mmarek@suse.com>
Message-ID: <638b79cf-a0e8-7986-d8b4-26d3a3808ec4@suse.com>
Date: Tue, 13 Jun 2017 09:49:40 +0200
MIME-Version: 1.0
In-Reply-To: <20170613005531.77656-2-mka@chromium.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

On 2017-06-13 02:55, Matthias Kaehlcke wrote:
> cc-option uses KBUILD_CFLAGS and KBUILD_CPPFLAGS when it determines
> whether an option is supported or not. This is fine for options used to
> build the kernel itself, however some components like the x86 boot code
> use a different set of flags.
> 
> Add the new macro cc-option-no-kbuild which does the same as cc-option
> except that it has an additional parameter with the compiler options
> which are used instead of KBUILD_CFLAGS and KBUILD_CPPFLAGS.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  scripts/Kbuild.include | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 61f87a99bf0a..d9fdc740105f 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -128,6 +128,11 @@ cc-option-yn = $(call try-run,\
>  cc-option-align = $(subst -functions=0,,\
>  	$(call cc-option,-falign-functions=0,-malign-functions=0))
>  
> +# cc-option-no-kbuild
> +# Usage: cflags-no-kbuild-y += $(call cc-option-no-kbuild,<other flags>,-march=winchip-c6,-march=i586)
> +cc-option-no-kbuild = $(call try-run,\
> +	$(CC) -Werror $(filter-out $(GCC_PLUGINS_CFLAGS),$(1)) $(2) -c -x c /dev/null -o "$$TMP",$(2),$(3))

As this is a version of cc-option with an extrra argument, how about
implementing cc-option as a shorthand for cc-option-no-kbuild? It would
make it more obvious what cc-option-no-kbuild does differently (it's
probably just me, but I was unable to infer the semantics from its name).

Michal

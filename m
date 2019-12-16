Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:36044 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbfLPEuA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 15 Dec 2019 23:50:00 -0500
MIME-Version: 1.0
References: <cover.1575879069.git.tommyhebb@gmail.com> <1eaa4143fdb000563cde114bb7e0166b1fc229bf.1575879069.git.tommyhebb@gmail.com>
In-Reply-To: <1eaa4143fdb000563cde114bb7e0166b1fc229bf.1575879069.git.tommyhebb@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 16 Dec 2019 13:49:17 +0900
Message-ID: <CAK7LNARHuMaKUtsX8qJx2XiH+OciNFo+w_WBqZHKHV+ZQSvAwg@mail.gmail.com>
Subject: Re: [PATCH 1/4] kconfig: list all definitions of a symbol in help text
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Hebb <tommyhebb@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>

On Mon, Dec 9, 2019 at 5:19 PM Thomas Hebb <tommyhebb@gmail.com> wrote:
>
> In Kconfig, each symbol (representing a config option) can be defined in
> multiple places. Each definition may or may not have a prompt, which
> allows the option to be set via an interface like menuconfig. Each
> definition has a set of dependencies, which determine whether its prompt
> is visible and whether other pieces of the definition, like a default
> value, take effect.
>
> Historically, a symbol's help text (i.e. what's shown when a user
> presses '?' in menuconfig) contained some symbol-wide information not
> tied to any particular definition (e.g. what other symbols it selects)
> as well as the location (file name and line number) and dependencies of
> each prompt. Notably, the help text did not show the location or
> dependencies of definitions without prompts.
>
> Because this made it hard to reason about symbols that had no prompts,
> bcdedcc1afd6 ("menuconfig: print more info for symbol without prompts")
> changed the help text so that, instead of containing the location and
> dependencies of each prompt, it contained the location and dependencies
> of the symbol's first definition, regardless of whether or not that
> definition had a prompt.
>
> For symbols with only one definition, that change makes sense. However,
> it breaks down for symbols with multiple definitions: each definition
> has its own set of dependencies (the `dep` field of `struct menu`), and
> those dependencies are ORed together to get the symbol's dependency list
> (the `dir_dep` field of `struct symbol`). By printing only the
> dependencies of the first definition, the help text misleads users into
> believing that an option is more narrowly-applicable than it actually
> is.
>
> For an extreme example of this, we can look at the SYS_TEXT_BASE symbol
> in the Das U-Boot project, which also uses Kconfig. (I could not find an

"Das U-Boot" is a moving reference.

Could you explicitly say the release version (e.g. v2019.10)
from which you took the example?


> illustrative example in the Linux source, unfortunately). This config
> option specifies the load address of the built binary and, as such, is
> applicable to basically every configuration possible. And yet, without
> this patch, its help text is as follows:
>
>   Symbol: SYS_TEXT_BASE [=0x00200000]
>   Type  : hex
>   Prompt: Text Base
>     Location:
>       -> Boot images
>     Defined at arch/arm/mach-aspeed/Kconfig:9
>     Depends on: ARM [=y] && ARCH_ASPEED [=n]
>
> The help text indicates that the option only applicable for a specific
> unselected architecture (aspeed), because that architecture's promptless
> definition (which just sets a default value), happens to be the first
> one seen.
>
> Because source locations and dependencies are fundamentally properties
> of definitions and not of symbols, we should treat them as such. This
> patch brings back the pre-bcdedcc1afd6 behavior for definitions with
> prompts but also separately prints the location and dependencies of
> those without prompts, solving the original problem in a different way.
> With this change, our SYS_TEXT_BASE example becomes
>
>   Symbol: SYS_TEXT_BASE [=0x00200000]
>   Type  : hex
>   Defined with prompt at Kconfig:548
>     Prompt: Text Base
>     Depends on: !NIOS2 [=n] && !XTENSA [=n] && !EFI_APP [=n]
>     Location:
>       -> Boot images
>   Defined without prompt at arch/arm/mach-aspeed/Kconfig:9
>     Depends on: ARM [=y] && ARCH_ASPEED [=n]
>   Defined without prompt at arch/arm/mach-socfpga/Kconfig:28
>     Depends on: ARM [=y] && ARCH_SOCFPGA [=n]
>   <snip>
>   Defined without prompt at board/sifive/fu540/Kconfig:15
>     Depends on: RISCV [=n] && TARGET_SIFIVE_FU540 [=n]
>
> which is a much more accurate representation.

This is nice improvement (fix).

Just a nit about the help format.
I think "with prompt" / "without prompt" is redundant information,
and a bit annoying.

For the definition "with prompt",
the next line is always " Prompt: ... ".

For the definition "without prompt",
the " Prompt: ... " line is missing.

So, we can know the presence of the prompt, anyway.


To simplify the for-loop, how about the code like this?

        /* Print the definitions with prompts before the ones without */
        for_all_properties(sym, prop, P_SYMBOL) {
                str_printf(r, "Defined at %s:%d\n",
                                prop->menu->file->name, prop->menu->lineno);

                if (prop->menu->prompt)
                        get_prompt_str(r, prop->menu->prompt, head);
                else
                        get_dep_str(r, prop->menu->dep, "  Depends on: ");
        }




--
Best Regards
Masahiro Yamada

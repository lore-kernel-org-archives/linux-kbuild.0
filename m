Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:25661 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753258AbdFSCAz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Jun 2017 22:00:55 -0400
MIME-Version: 1.0
In-Reply-To: <201706181420.ojaPWgL6%fengguang.wu@intel.com>
References: <20170615173715.40882-2-mka@chromium.org> <201706181420.ojaPWgL6%fengguang.wu@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 19 Jun 2017 11:00:42 +0900
Message-ID: <CAK7LNAT2Aiz=k09N6AtE6pNvKh8yx=vaJBu49xzjEmv3JCiEBg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] kbuild: Add __cc-option macro
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: kbuild-all@01.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Michal Marek <mmarek@suse.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <Bernhard.Rosenkranzer@linaro.org>, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>, kbuild test robot <lkp@intel.com>

Hi Matthias,


Sorry, the code I suggested introduced a slight behavior change.

With this patch, cc-option adds a space before the returned option.


Please see line 46 of arch/sh/Makefile.

ifeq ($(cflags-y),)


Now cflags-y contains a space, so
this conditional is now evaluated as false,
which was actually true without the patch.
This is the cause of the build error.


Could you remove whitespaces before $(1) and $(2) in cc-option?

Also, please fix hostcc-option as well.

Thanks!






2017-06-18 15:58 GMT+09:00 kbuild test robot <lkp@intel.com>:
> Hi Matthias,
>
> [auto build test ERROR on tip/auto-latest]
> [also build test ERROR on v4.12-rc5 next-20170616]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Matthias-Kaehlcke/kbuild-Add-__cc-option-macro/20170616-082252
> config: sh-sh7710voipgw_defconfig (attached as .config)
> compiler: sh4-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=sh
>
> All errors (new ones prefixed by >>):
>
>    {standard input}: Assembler messages:
>>> {standard input}:672: Error: invalid operands for opcode
>    {standard input}:673: Error: opcode not valid for this cpu variant
>    {standard input}:674: Error: opcode not valid for this cpu variant
>    {standard input}:675: Error: invalid operands for opcode
>    {standard input}:1900: Error: invalid operands for opcode
>    {standard input}:1901: Error: opcode not valid for this cpu variant
>    {standard input}:1902: Error: opcode not valid for this cpu variant
>    {standard input}:1903: Error: invalid operands for opcode
>    {standard input}:2067: Error: invalid operands for opcode
>    {standard input}:2068: Error: opcode not valid for this cpu variant
>    {standard input}:2069: Error: opcode not valid for this cpu variant
>    {standard input}:2070: Error: invalid operands for opcode
>    {standard input}:2570: Error: invalid operands for opcode
>    {standard input}:2571: Error: opcode not valid for this cpu variant
>    {standard input}:2572: Error: opcode not valid for this cpu variant
>    {standard input}:2573: Error: invalid operands for opcode
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Best Regards
Masahiro Yamada

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33587 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750797AbcCBVUk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Mar 2016 16:20:40 -0500
Received: by mail-wm0-f65.google.com with SMTP id n186so866892wmn.0
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Mar 2016 13:20:39 -0800 (PST)
Date: Wed, 2 Mar 2016 22:18:45 +0100
From: Emese Revfy <re.emese@gmail.com>
Subject: Re: [PATCH v4 1/3] GCC plugin infrastructure
Message-Id: <20160302221845.1025c8ca6a5039cb2d7dbb84@gmail.com>
In-Reply-To: <CAGXu5j+tUDi0zhYq4gdnLmX8EXyERX8+YaiTyTCqdP37je=O8w@mail.gmail.com>
References: <20160301181400.9c623ee9230381da90b89b2a@gmail.com>
	<20160301181514.dc3dadeb7e18b77a09dddb7f@gmail.com>
	<CAGXu5jKQUiZ0RQyMAKprWf30wMCXX7NvyfDLDgDz2zBqk-Xw6Q@mail.gmail.com>
	<CAGXu5j+tUDi0zhYq4gdnLmX8EXyERX8+YaiTyTCqdP37je=O8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Michal Marek <mmarek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Fengguang Wu <fengguang.wu@intel.com>

On Tue, 1 Mar 2016 13:34:04 -0800
Kees Cook <keescook@chromium.org> wrote:

> On Tue, Mar 1, 2016 at 1:19 PM, Kees Cook <keescook@chromium.org> wrote:
> > On Tue, Mar 1, 2016 at 9:15 AM, Emese Revfy <re.emese@gmail.com> wrote:
> >> diff --git a/arch/Kconfig b/arch/Kconfig
> >> index 155e6cd..4c54ef0 100644
> >> --- a/arch/Kconfig
> >> +++ b/arch/Kconfig
> >> @@ -357,6 +357,19 @@ config SECCOMP_FILTER
> >>
> >>           See Documentation/prctl/seccomp_filter.txt for details.
> >>
> >> +config HAVE_GCC_PLUGINS
> >> +       bool
> >> +       help
> >> +         An arch should select this symbol if it supports building with
> >> +         GCC plugins.
> >> +
> >> +menuconfig GCC_PLUGINS
> >> +       bool "GCC plugins"
> >> +       depends on HAVE_GCC_PLUGINS
> >> +       help
> >> +         GCC plugins are loadable modules that provide extra features to the
> >> +         compiler. They are useful for runtime instrumentation and static analysis.
> >> +
> >>  config HAVE_CC_STACKPROTECTOR
> >>         bool
> >>         help
> >
> > endmenu is missing?
> 
> Sorry, ignore my noise. However, my confusion does point on that maybe
> gcc plugin config should live in tools/gcc/Kconfig and be included
> here?

I don't know, there is no Kconfig under the tools subdirectory yet.
Michal Marek, could you please tell me how you would like it?

-- 
Emese

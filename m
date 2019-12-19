Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:27492 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbfLSE3Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 23:29:16 -0500
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id xBJ4T8VN026696
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2019 13:29:09 +0900
Received: by mail-vk1-f176.google.com with SMTP id s142so1279866vkd.9
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Dec 2019 20:29:08 -0800 (PST)
MIME-Version: 1.0
References: <7e0f4a74-63c5-ad62-c619-c6277c4bc791@oracle.com>
 <20191210174826.5433-1-eugene.loh@oracle.com> <2a535000-e71e-fab9-cf6a-e7e5fb8053d8@oracle.com>
 <20191218222931.76131c6a@rorschach.local.home>
In-Reply-To: <20191218222931.76131c6a@rorschach.local.home>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 19 Dec 2019 13:28:31 +0900
Message-ID: <CAK7LNATJZCekCoj0ruPUGRv7sH_hcJP-dFPd-3_EOR5hFNW-Xg@mail.gmail.com>
Subject: Re: [PATCH v4] kallsyms: add names of built-in modules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Eugene Loh <eugene.loh@oracle.com>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, Jessica Yu <jeyu@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Song Liu <songliubraving@fb.com>, Thomas Gleixner <tglx@linutronix.de>, "Keller, Jacob E" <jacob.e.keller@intel.com>, Kris Van Hees <kris.van.hees@oracle.com>, Nick Alcock <nick.alcock@oracle.com>

On Thu, Dec 19, 2019 at 12:29 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed, 18 Dec 2019 15:55:18 -0800
> Eugene Loh <eugene.loh@oracle.com> wrote:
>
> > Ping.
>
> Couple of notes:
>
> 1) this affects code that doesn't really have a maintainer. I could
> take it in my tree, but I would like to have acks from other
> maintainers. Perhaps Jessica Yu (Module maintainer), and probably one
> from Linus himself.
>
> 2) Do not send new versions of a patch as a reply to the old version. I
> and many other maintainers sort our inbox by threads, and I look at the
> top of the thread for patches. That is, if there's another version of a
> patch that is a reply to a previous version, it is basically off my
> radar, unless I happen to notice it by chance (which I did with this
> email).
>
> You can send your v4 patch again, but please send it as its own thread,
> that way it will be on the radar of other maintainers. Hopefully we can
> get some acks on this as well.
>
> -- Steve


I do not like this patch.

scripts/Makefile.modbuiltin is really ugly.
It traverses all the directories once again.

This patch makes it even worse,
Kbuild would traverse the
whole directories three times.

I was thinking to remove scripts/Makefile.modbuiltin
and Kconfig's tristate.conf entirely
because it is possible to generate modules.builtin more simply.


As I said, the name of builtin module is not fixed info.
And, this makes kallsyms fat just for less important info.


Masahiro Yamada

> >

> >
> > On 12/10/2019 09:48 AM, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > >
> > > /proc/kallsyms is very useful for tracers and other tools that need
> > > to map kernel symbols to addresses.
> > >
> > > It would be useful if there were a mapping between kernel symbol and
> > > module name that only changed when the kernel source code is changed.
> > > This mapping should not vanish simply because a module becomes built
> > > into the kernel.
> > >



-- 
Best Regards
Masahiro Yamada

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:36595 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfFDAVb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jun 2019 20:21:31 -0400
MIME-Version: 1.0
References: <20190516194818.29230-1-jani.nikula@intel.com> <20190524174011.GA23737@ravnborg.org>
 <CAK7LNARY_L3Oyi7hhCZXVwNRAsf6ceSarTNDrzdfXQGj1tDFJw@mail.gmail.com> <20190603173328.GA11045@ravnborg.org>
In-Reply-To: <20190603173328.GA11045@ravnborg.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 4 Jun 2019 09:20:43 +0900
Message-ID: <CAK7LNASWsd-MSUtD69O05EZsVhcJTj7dh92MASzUoYR_it66AQ@mail.gmail.com>
Subject: Re: [RFC 1/3] kbuild: add support for ensuring headers are self-contained
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Michal Marek <michal.lkml@markovi.net>

Hi Sam, Jani,

On Tue, Jun 4, 2019 at 2:33 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Masahiro/Jani.
>
> >
> > Following the obj-y pattern,
> > I want to make header-test-y relative to $(obj).
>
> I also considered this and agree this is better.
>
> Otherwise we end up with a spaghetti of dependencies across the tree.
>
> What I made just fit the purpose I had that day,
> which is no excuse for bad design.
>
> > I prefer this:
> >
> > quiet_cmd_header_test = HDRTEST $@
> >       cmd_header_test = echo "\#include \"$*.h\"" > $@
> >
> > $(obj)/%.header_test.c:
> >         $(call cmd,header_test)
>
> Even better - good.
>
> We call it HDRTEST - so why not just go for that name:
>
>     hdrtest-y += headerfile.h
>
> ??
>
> The current proposal with "header-test-y" hurts the eye a little with
> two '-', and all other variables uses only one '-' as is today.
> (generic-y, obj-y etc).
>
> This is bikeshedding but is was itcing me a little.

I do not have a strong opinion.
I leave it to Jani. Either is fine with me.


There are variables that contain two '-'.
'no-clean-files', 'subdir-ccflags-y', etc.


--
Best Regards
Masahiro Yamada

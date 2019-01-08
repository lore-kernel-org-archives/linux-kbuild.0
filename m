Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43452 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbfAHAnF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jan 2019 19:43:05 -0500
Date: Tue, 8 Jan 2019 08:42:57 +0800
From: Changbin Du <changbin.du@gmail.com>
Subject: Re: [GIT PULL 2/4] Kbuild updates for v4.21 part2
Message-ID: <20190108004255.tq2fffkbxffrzsv3@mail.google.com>
References: <CAK7LNARQggM3aKEPRKJqa4tunFAfmfErMZuS-rrnRv6UB1VpPQ@mail.gmail.com>
 <CAHk-=wiLt3rgeyM3BWAd5VJrKcnxxuHybwoQiDGMgyspo6oXDg@mail.gmail.com>
 <CAK7LNASpO86yNe4BWBYnfd+r82=d_ofxYybLi_aM+4+dgf46+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASpO86yNe4BWBYnfd+r82=d_ofxYybLi_aM+4+dgf46+A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@gmail.com>, Arnd Bergmann <arnd@arndb.de>

On Mon, Jan 07, 2019 at 01:32:56PM +0900, Masahiro Yamada wrote:
> (+CC Changbin Du, Arnd Bergmann)
> 
> 
> 
[...]
> > This branch already added a couple of extra inline markers just to
> > make code work reasonably. How many tens (or hundreds) got missed just
> > because the build still works, but the lack of inlining means that we
> > generate completely garbage code?
> 
> 
> I do not have the exact number, but
> my impression was "not so many".
> 
> Changbin and Arnd might have better insight.
> They were trying to eliminate potential problems beforehand.
> 
> For example,
> 7e17916b
> 412dd15c
> 08813e0e
> 
Yes, the case is not so many. At the beginning, I also thought this could
require incredible change. But after trying, just found it is not so bad. I have
a couple of patches to fix the remaing warnings which adds 'inline' or '_init'
markers for related functions.

I promise that all warnings get fixed with new version. And since I only have
coressponding setup to fully test x86 and ARM platform, I think we could make
this new option depend on x86 or arm temparaly so untested platforms will
not complain anymore.

Linus, is this good for you? Thank you for revewing.

> 
> 
> 
> > I'm going to skip this pull request.
> >
> > We have basically always required a certain level of competence from
> > the compiler, and this basically says that the compiler can do stupid
> > things and we'd have to fix those stupidities by hand.
> >
> >              Linus
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

-- 
Cheers,
Changbin Du

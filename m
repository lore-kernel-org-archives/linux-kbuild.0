Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33494 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750718AbdGMCwT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Jul 2017 22:52:19 -0400
Date: Thu, 13 Jul 2017 12:51:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] x86: enable dead code and data elimination (LTO)
Message-ID: <20170713125157.7f418fa6@roar.ozlabs.ibm.com>
In-Reply-To: <87a849aaa3.fsf@firstfloor.org>
References: <20170709031333.29443-1-npiggin@gmail.com>
        <20170709090551.bm2c55ctt3togim7@gmail.com>
        <CAK7LNAR-VF2o3-qcCXnkath_B74KQodh_vezPRErGPhZSao2VA@mail.gmail.com>
        <alpine.LFD.2.20.1707090946090.1959@knanqh.ubzr>
        <20170710121329.77dd3364@roar.ozlabs.ibm.com>
        <87a849aaa3.fsf@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wed, 12 Jul 2017 09:29:40 -0700
Andi Kleen <andi@firstfloor.org> wrote:

> Nicholas Piggin <npiggin@gmail.com> writes:
> >> 
> >> I think we should aim for gc-sections to be used by default and have LTO 
> >> as a possible option only.  
> >
> > I agree after it starts getting implemented and debugged by small
> > system users, we could make it default in the interest of sharing
> > testing and reducing combinations.  
> 
> From what i understand the main drawback in the past was
> is that various linker versions become very slow with thousands of
> sections.
> 
> So it may cost you built time. For a special small build it's probably
> ok, but you wouldn't want to make it default.

For --gc-sections, I have found it costs almost nothing (full LTO
is a different story).

We will have to do more testing and get numbers before it's made
default of course.

> 
> Also usually it's only useful without modules because if you
> use modules EXPORT_SYMBOL pulls in a lot of unused functions.

Yes that and several other things that cause references from live
code/data does reduce effectiveness. Nicolas has been working on
several improvements to these (including EXPORT trimming he
mentioned).

> 
> BTW I'm still maintaining a "real LTO" patchkit here, which
> has some users (mainly for binary size), but also gives some
> performance. Should probably resubmit it again. The main
> issue was that the old single link patch is still not forward
> ported.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ak/linux-misc.git/log/?h=lto-411-2

Yeah we should start looking at full LTO again after --gc-sections.
I've been looking at your patches but actually before I saw your
single link patch I did another approach. Never quite got it working
exactly right, but it would be nice to avoid linking 3 extra times
every build regardless of LTO!

Thanks,
Nick

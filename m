Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:45732 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbfBGAZS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Feb 2019 19:25:18 -0500
MIME-Version: 1.0
References: <20190201210853.244043-1-jflat@chromium.org> <CAK7LNAS5j6+o+wb8WL=8WP4r4fgqY1MDSGe0_u9Nri81_Eb3xw@mail.gmail.com>
 <20190206164528.GA8925@archlinux-ryzen> <CACJJ=pyLqhrxka2jXtby9CUqsAr=-_oQUraH5ua3PZpgXHgdOQ@mail.gmail.com>
 <CAKwvOdm=dqScCDVTgQ71i0wtBSqezEzLr69Pxp3bZJFs+_mXsQ@mail.gmail.com> <20190206174339.GA19743@archlinux-ryzen>
In-Reply-To: <20190206174339.GA19743@archlinux-ryzen>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 7 Feb 2019 09:24:16 +0900
Message-ID: <CAK7LNAQ97h3RjKNy8f2abb7fnCaQS3TOoF2LFeGgNxeoCy0GwA@mail.gmail.com>
Subject: Re: [PATCH] kbuild, LLVMLinux: Don't suppress format warnings
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Jon Flatley <jflat@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Thu, Feb 7, 2019 at 3:03 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Wed, Feb 06, 2019 at 09:36:55AM -0800, Nick Desaulniers wrote:
> > On Wed, Feb 6, 2019 at 9:32 AM Jon Flatley <jflat@chromium.org> wrote:
> > >
> > > On Wed, Feb 6, 2019 at 8:45 AM Nathan Chancellor
> > > <natechancellor@gmail.com> wrote:
> > > >
> > > > On Tue, Feb 05, 2019 at 05:26:05PM +0900, Masahiro Yamada wrote:
> > > > > On Sat, Feb 2, 2019 at 6:10 AM <jflat@chromium.org> wrote:
> > > > > >
> > > > > > From: Jon Flatley <jflat@chromium.org>
> > > > > >
> > > > > > gcc produces format warnings that clang suppresses. To keep behavior
> > > > > > consistent between gcc and clang, don't suppress format warnings in
> > > > > > clang.
> > > > > >
> > > > > > Signed-off-by: Jon Flatley <jflat@chromium.org>
> > > > > > ---
> > > > >
> > > > > Applied to linux-kbuild.
> > > > > Thanks.
> > > > >
> > > > >
> > > >
> > > > Hi Jon and Masahiro,
> > > >
> > > > Just as a heads up, this introduces a ton of warnings (duh). Isn't the
> > > > typical plan behind turning on warnings that were disabled to build with
> > > > 'W=', fix them all, then turn them on so as not to pollute the build?
> > > >
> > > > Log file: https://gist.github.com/443db156e56cd3c0f6b21d9d77728d80
> >
> > Oh boy, that's a lot.  Too many to fix quickly IMO.
> >
> > > >
> > > > Note a big chunk of them come from one scnprintf call in
> > > > include/linux/usb/wusb.h but still, there are many other warnings that
> > > > make quite a bit of noise. Some seem relatively easy to fix, which I
> > > > suppose I will try to tackle soon.
> > > >
> > > > Thanks,
> > > > Nathan
> > > >
> > >
> > > Hi Nathan,
> > >
> > > This was definitely not my intention.
> > > I noticed the added warnings this morning and was considering calling
> > > for a revert on this patch.
> > >
> > > The intent was to match the behavior of gcc, as it has -Wformat enabled.
> > > It was rather naive of me to assume the behavior of -Wformat would be
> > > the same in both gcc and clang.
> > > Indeed, it seems gcc is more permissive about what format
> > > substitutions it allows.
> > >
>
> My guess is that it has something to do with how the compilers
> internally handle certain specifier promotions (GCC probably just
> silently ignores the 'h' part of the specifier whereas Clang warns) but
> I didn't do any actual research into the matter. Probably should before
> looking into all of the warnings :)
>
> > > For example passing int to the "%hu" format specifier is fine in gcc
> > > under -Wformat but produces a warning in clang.
> > > Maybe this was the motivation for adding -Wno-format to clang in the
> > > first place.
> >
> > Sorry, I'm late to this thread.  What is it reverting; who authored
> > the original patch? Was it mka@chromium.org?
> >
>
> This patch is turning on '-Wformat' for Clang, which was disabled in
> commit 3d3d6b847420 ("kbuild: LLVMLinux: Adapt warnings for compilation
> with clang").
>
> > > This difference is puzzling to me, and I wonder if it's by design.
> >
> > Probably; internally let's sync up with the Clang devs to understand
> > this difference more.
> >
>
> Yes, I do think it would be a good idea to turn this on eventually but
> it'd be wise to understand why Clang emits a warning but GCC doesn't.
>
> > >
> > > Considering the whole point of this patch was to sync up this behavior
> > > between gcc and clang I am OK with reverting this.
> >
> > Is this patch in -next, or has it already hit mainline?  I think it's
> > better to revert, then start upstreaming fixes, then re-land it once
> > we're warning free.
> >
>
> It's in linux-kbuild/kbuild, it hasn't hit -next yet.


Right, it is just staying in my branch.
I will drop it.


I should have tested this carefully. Sorry.





-- 
Best Regards
Masahiro Yamada

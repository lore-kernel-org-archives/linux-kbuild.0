Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:21222 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbfCOQOq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Mar 2019 12:14:46 -0400
MIME-Version: 1.0
References: <20190314175705.11671-1-dianders@chromium.org> <CAK7LNATvfVD8RfZN37fXGKJeEuawM_7BuVrJ4xw1pZmuz5f_aw@mail.gmail.com>
 <CAD=FV=V=s8e12W7XiMGxwzi9gqkvAqRfKqYBv_ePhh4y77ZkUQ@mail.gmail.com>
In-Reply-To: <CAD=FV=V=s8e12W7XiMGxwzi9gqkvAqRfKqYBv_ePhh4y77ZkUQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 16 Mar 2019 01:13:55 +0900
Message-ID: <CAK7LNASde0Q9S5GKeQiWhArfER4S4wL1=R_FW8q0++_X3T5=hQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: If the module stripping command fails the build
 should abort
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi.


On Sat, Mar 16, 2019 at 12:19 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Mar 15, 2019 at 7:11 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > On Fri, Mar 15, 2019 at 2:59 AM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > If the call to strip returns an error code then it makes sense for the
> > > build to fail.  Currently we'll just chug along and ship unstripped
> > > modules.
> > >
> > > Fixes: e2a666d52b48 ("kbuild: sign the modules at install time")
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> >
> > Did you see this problem in the latest kernel?
> >
> > Since commit q,
> > $(call cmd,...) is run with 'set -e'.
> >
> > Any failure in a series of commands will let the build fail.
> >
> >
> > If you have the problem in old versions ( < 4.20),
>
> Ah!  I was in 4.19 when I saw the problem.  I then confirmed that the
> code in mainline was the same and that the new version built fine with
> my patch, but I didn't go back and confirm the problem there.
>
> OK, I just checked linux/master and can confirm there's no problem
> there.  Sorry for the noise then...
>
> I wonder if perhaps we should revert commit caf6fe91ddf6 ("modsign:
> Abort modules_install when signing fails") then to be consistent?


Right.

If you send a patch, I will take it.




> > I do not mind this patch for linux-stable.
>
> It's probably not worth it.  In general I prefer linux-stable to be as
> just cherry-picks of mainline as much as possible.  When it starts
> forking then future picks get harder.  Sure in this case it's unlikely
> that someone will get tripped up by an "&&" vs a ";" when picking
> future changes, but given that it's not super urgent I guess I'd vote
> that we skip it.


Agree.




-- 
Best Regards
Masahiro Yamada

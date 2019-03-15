Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:42719 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfCOPTi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Mar 2019 11:19:38 -0400
Received: by mail-vs1-f66.google.com with SMTP id c189so5586341vsd.9
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2019 08:19:37 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id r23sm1474103vke.36.2019.03.15.08.19.35
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Mar 2019 08:19:35 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id l17so2287327vke.7
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2019 08:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190314175705.11671-1-dianders@chromium.org> <CAK7LNATvfVD8RfZN37fXGKJeEuawM_7BuVrJ4xw1pZmuz5f_aw@mail.gmail.com>
In-Reply-To: <CAK7LNATvfVD8RfZN37fXGKJeEuawM_7BuVrJ4xw1pZmuz5f_aw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 Mar 2019 08:19:24 -0700
Message-ID: <CAD=FV=V=s8e12W7XiMGxwzi9gqkvAqRfKqYBv_ePhh4y77ZkUQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: If the module stripping command fails the build
 should abort
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi,

On Fri, Mar 15, 2019 at 7:11 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Fri, Mar 15, 2019 at 2:59 AM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > If the call to strip returns an error code then it makes sense for the
> > build to fail.  Currently we'll just chug along and ship unstripped
> > modules.
> >
> > Fixes: e2a666d52b48 ("kbuild: sign the modules at install time")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>
> Did you see this problem in the latest kernel?
>
> Since commit q,
> $(call cmd,...) is run with 'set -e'.
>
> Any failure in a series of commands will let the build fail.
>
>
> If you have the problem in old versions ( < 4.20),

Ah!  I was in 4.19 when I saw the problem.  I then confirmed that the
code in mainline was the same and that the new version built fine with
my patch, but I didn't go back and confirm the problem there.

OK, I just checked linux/master and can confirm there's no problem
there.  Sorry for the noise then...

I wonder if perhaps we should revert commit caf6fe91ddf6 ("modsign:
Abort modules_install when signing fails") then to be consistent?

> I do not mind this patch for linux-stable.

It's probably not worth it.  In general I prefer linux-stable to be as
just cherry-picks of mainline as much as possible.  When it starts
forking then future picks get harder.  Sure in this case it's unlikely
that someone will get tripped up by an "&&" vs a ";" when picking
future changes, but given that it's not super urgent I guess I'd vote
that we skip it.


-Doug
-Doug

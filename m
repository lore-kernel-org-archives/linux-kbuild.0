Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:44927 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgDXDAK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 23:00:10 -0400
MIME-Version: 1.0
References: <20200423073929.127521-1-masahiroy@kernel.org> <20200423073929.127521-15-masahiroy@kernel.org>
 <CANiq72nUa8uoXtSThqq7t9oAmZnGSE9a1_d+ZoRAagpKDo4DRg@mail.gmail.com>
In-Reply-To: <CANiq72nUa8uoXtSThqq7t9oAmZnGSE9a1_d+ZoRAagpKDo4DRg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 24 Apr 2020 11:59:14 +0900
Message-ID: <CAK7LNASo=R2uoNPzof_FppFUp=sMAZG62C3PLAMm9jZix9z3Rw@mail.gmail.com>
Subject: Re: [PATCH 14/16] samples: auxdisplay: use 'userprogs' syntax
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Miguel,

On Thu, Apr 23, 2020 at 8:50 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Masahiro,
>
> On Thu, Apr 23, 2020 at 9:41 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Kbuild now supports the 'userprogs' syntax to describe the build rules
> > of userspace programs for the target architecture (i.e. the same
> > architecture as the kernel).
> >
> > Add the entry to samples/Makefile to put this into the build bot
> > coverage.
> >
> > I also added the CONFIG option guarded by 'depends on CC_CAN_LINK'
> > because $(CC) may not necessarily provide libc.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks for this! Looks nice. I guess you take all patches for the
> samples/ changes through your tree?

Yes, I will take all to my tree
since this series is mostly Makefile changes.



> Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>
> Cheers,
> Miguel



-- 
Best Regards
Masahiro Yamada

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:46861 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbfEGMaK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 May 2019 08:30:10 -0400
MIME-Version: 1.0
References: <1556107369-7655-1-git-send-email-alex.popov@linux.com> <ce9c3689-86f3-eda7-8c3d-4af834ee750d@linux.com>
In-Reply-To: <ce9c3689-86f3-eda7-8c3d-4af834ee750d@linux.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 7 May 2019 21:29:26 +0900
Message-ID: <CAK7LNAQUMZ4QHeYin16P-NJq77CgxuR96R46wgbf5jkpYhYP8Q@mail.gmail.com>
Subject: Re: [v2 1/1] kconfig: Terminate menu blocks with a comment in the
 generated config
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Popov <alex.popov@linux.com>
Cc: Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, May 1, 2019 at 10:01 PM Alexander Popov <alex.popov@linux.com> wrote:
>
> On 24.04.2019 15:02, Alexander Popov wrote:
> > Currently menu blocks start with a pretty header but end with nothing in
> > the generated config. So next config options stick together with the
> > options from the menu block.
> >
> > Let's terminate menu blocks in the generated config with a comment and
> > a newline if needed. Example:
> >
> > ...
> > CONFIG_BPF_STREAM_PARSER=y
> > CONFIG_NET_FLOW_LIMIT=y
> >
> > #
> > # Network testing
> > #
> > CONFIG_NET_PKTGEN=y
> > CONFIG_NET_DROP_MONITOR=y
> > # end of Network testing
> > # end of Networking options
> >
> > CONFIG_HAMRADIO=y
> > ...
> >
> > Signed-off-by: Alexander Popov <alex.popov@linux.com>
>
> Hello!
>
> Just a friendly ping.
>
> Would you like to take this patch?
> Can I improve anything?


This patch breaks "make testconfig".

Please get rid of the "endof" for the rootmenu
at the end of the .config file.

Thanks.




> Best regards,
> Alexander



-- 
Best Regards
Masahiro Yamada

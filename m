Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:27299 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403940AbfGYLSX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 07:18:23 -0400
MIME-Version: 1.0
References: <20190725080513.4071-1-yamada.masahiro@socionext.com> <20190725111256.GA30958@kroah.com>
In-Reply-To: <20190725111256.GA30958@kroah.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 25 Jul 2019 20:17:21 +0900
Message-ID: <CAK7LNATcRXT8ptGpPhc4kods65AQsRbz2wmnq5=df35S2aWn7w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: detect missing "WITH Linux-syscall-note" for uapi headers
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jul 25, 2019 at 8:13 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 25, 2019 at 05:05:13PM +0900, Masahiro Yamada wrote:
> > UAPI headers licensed under GPL are supposed to have exception
> > "WITH Linux-syscall-note" so that they can be included into non-GPL
> > user space application code.
> >
> > Unfortunately, people often miss to add it. Break 'make headers'
> > when any of exported headers lacks the exception note so that the
> > 0-day bot can easily catch it.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> > This patch depends on the following:
> >
> > https://lore.kernel.org/patchwork/patch/1105289/
> >
> > I will turn on the error after all headers are fixed.
>
> I've taken the dependancy here in the spdx tree and will send it to
> Linus for 5.3-rc2.

Thanks!

>  I can also take this now through that tree, or you
> can add it to yours afterward, which ever is easier for you.

I will create a branch on top 5.3-rc2
and queue this patch by myself.

Thank you.


-- 
Best Regards
Masahiro Yamada

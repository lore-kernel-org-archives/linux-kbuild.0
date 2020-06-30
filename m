Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:43326 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgF3Dyd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 23:54:33 -0400
MIME-Version: 1.0
References: <20200625154226.25692cd1@coco.lan> <371f4815f6daac50e90057520d5f2b40a6ca3a74.1593096720.git.mchehab+huawei@kernel.org>
 <c3c58115168c983eb1d441daa7cc84378cf33f39.camel@redhat.com> <CAK7LNAT5meMz0LF3C-2FnA6S8dettg4uJO-=FvsnCZ3H6+CVng@mail.gmail.com>
In-Reply-To: <CAK7LNAT5meMz0LF3C-2FnA6S8dettg4uJO-=FvsnCZ3H6+CVng@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 30 Jun 2020 12:53:28 +0900
Message-ID: <CAK7LNAR55e+7KOULho2smK82Z0LxSg0UC8V9R8GTvfZOhg4i0A@mail.gmail.com>
Subject: Re: [PATCH] kconfig: qconf: Fix find on split mode
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Jun 28, 2020 at 11:42 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sun, Jun 28, 2020 at 5:40 PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
> >
> > On Thu, 2020-06-25 at 16:52 +0200, Mauro Carvalho Chehab wrote:
> > > The logic handling find on split mode is currently broken.
> > > Fix it, making it work again as expected.
> >
> > I tested this patch and it works well.
> > There is one really small cosmetic issue:
> >
> > If you select search result, and then select another search result
> > which happens not to update the 'menu', then both the results are
> > selected (that is the old one doesn't clear its selection)
>
> I see this too.
> So, this can be improved somehow...



I dropped this one
because it was superseded by the new version.


-- 
Best Regards
Masahiro Yamada

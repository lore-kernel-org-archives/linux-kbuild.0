Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728630AbgF2Sk6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 14:40:58 -0400
Date: Mon, 29 Jun 2020 16:46:43 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 0/5] Fix split view search and debug info navigation
Message-ID: <20200629164643.5e087da0@coco.lan>
In-Reply-To: <649f4c040c2f6dd2d83e984a88343917d498b4ad.camel@redhat.com>
References: <cover.1593423060.git.mchehab+huawei@kernel.org>
        <649f4c040c2f6dd2d83e984a88343917d498b4ad.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

Em Mon, 29 Jun 2020 15:23:49 +0300
Maxim Levitsky <mlevitsk@redhat.com> escreveu:

> On Mon, 2020-06-29 at 11:35 +0200, Mauro Carvalho Chehab wrote:
> > This series fixes some issues with search while on split view and fix the
> > broken hyperlink navigation.
> > 
> > The first patches restore the pre-Qt5 conversion behavior. The last
> > one implements navigation on a different way. I opted to keep this one
> > in separate, as this one is a new feature.
> > 
> > Mauro Carvalho Chehab (5):
> >   kconfig: qconf: cleanup includes
> >   kconfig: qconf: ensure that only one item will be highlighted
> >   kconfig: qconf: make search fully work again on split mode
> >   kconfig: qconf: make debug links work again
> >   kconfig: qconf: navigate menus on hyperlinks
> > 
> >  scripts/kconfig/qconf.cc | 120 +++++++++++++++++++++++++++++----------
> >  scripts/kconfig/qconf.h  |  15 ++---
> >  2 files changed, 98 insertions(+), 37 deletions(-)
> >   
> I tested the series, and it works really well here.
> Thanks a lot for the patch 5, I indeed noted that 
> I am not sure it ever worked like that but it does now, 
> and it is a very good improvement in terms of usability.
> 
> There is still a tiny issue in patch 5 - sometimes already
> selected items remain selected like it was in the search (now fixed).

Yeah, I noticed that it was keeping something selected sometimes.
that's why I sent a followup patch:

	Date: Mon, 29 Jun 2020 12:57:45 +0200
	Subject: [PATCH] kconfig: qconf: re-implement setSelected()

Not sure why, but this one is not on lore yet.

> 
> Also I found another bug - clicking on '..' menu doesn't work:

I don't think that this is a bug. See below.

> For example select 'input device support', then 'keyboards' on the right,
> then you can't get back. It also might be something that never worked,
> and it doesn't bother me, I just note this for reference.

The logic at:

	void ConfigList::mouseReleaseEvent(QMouseEvent* e)

Which calls:

	emit parentSelected();

event when the "<-" button is pressed. This is used for the
configList when on singleMode, which makes sense:

	connect(configList, SIGNAL(parentSelected()),
		SLOT(goBack()));

There's no connect for menuList. So, this event is silently
ignored on split mode.

I guess the main question here is: what kind of action this were
supposed to do?

I mean, the "menuView" should always contain the leaf nodes,
as the rest of the menu hierarchy is at the configView.

So, what kind of action could be done in this case?

That's said, when looking into it, I noticed some dead code,
and some things that could be simplified.

I'll likely send a cleanup patch removing the dead code.

Thanks,
Mauro

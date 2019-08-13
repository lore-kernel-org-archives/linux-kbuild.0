Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:52583 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfHMBHN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 21:07:13 -0400
MIME-Version: 1.0
References: <20190809002104.18599-1-stancheff@cray.com> <20190809002104.18599-2-stancheff@cray.com>
 <CAK7LNAScm9P+QMZiqqSQnOoPsN54OTcTGpaDgxTbjJ_knoeGhA@mail.gmail.com> <CAJ48U8Xp40is+R1dMW8sXq77ZS5D_h+hHte5Mq5eOrtpb41Qxw@mail.gmail.com>
In-Reply-To: <CAJ48U8Xp40is+R1dMW8sXq77ZS5D_h+hHte5Mq5eOrtpb41Qxw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 13 Aug 2019 10:06:29 +0900
Message-ID: <CAK7LNAT5OVcw9tJtaR8VE_JEemAzkqV6FeSHPEy38wotxjhkZg@mail.gmail.com>
Subject: Re: [PATCH 1/1] kbuild: recursive build of external kernel modules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shaun Tancheff <shaun@tancheff.com>
Cc: Shaun Tancheff <stancheff@cray.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, "Martin K . Petersen" <martin.petersen@oracle.com>, Michal Marek <michal.lkml@markovi.net>, Shuah Khan <shuah@kernel.org>, Thomas Renninger <trenn@suse.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM mailing list <linux-pm@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>

On Tue, Aug 13, 2019 at 2:34 AM Shaun Tancheff <shaun@tancheff.com> wrote:
>
> On Mon, Aug 12, 2019 at 10:24 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > On Fri, Aug 9, 2019 at 9:21 AM Shaun Tancheff <shaun@tancheff.com> wrote:
> > >
> > > When building a tree of external modules stage 2 fails
> > > silently as the root modules.order is empty.
> > >
> > > Modify the modules.order location to be fixed to the
> > > root when KBUILD_EXTMOD is specified and write all
> > > module paths to the single modules.order file.
> >
> > Could you try v5.3-rc4 please?
>
> So it seems we are using 'subdir-m' but that is now gone?
>
> Is there a recommend pattern for backward compatibility?
>
> Thanks!


Please convert

subdir-m += dir1
subdir-m += dir2

into

obj-m += dir1/
obj-m += dir2/


Thanks.

-- 
Best Regards
Masahiro Yamada

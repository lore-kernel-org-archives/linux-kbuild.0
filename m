Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55227 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfGQPod (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 11:44:33 -0400
MIME-Version: 1.0
References: <20190717142922.214d54ec@canb.auug.org.au> <CA+icZUUhnSGkLQcCZBzYXCRxExiZ1F=KnzdeiNSbojHRfxRjOA@mail.gmail.com>
 <20190717153329.GC7116@magnolia>
In-Reply-To: <20190717153329.GC7116@magnolia>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 17 Jul 2019 17:44:18 +0200
Message-ID: <CA+icZUUKk0DfhyA881bSc=huHCo5VaMy2oXYV7hE+HAjV09+tQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 17
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

On Wed, Jul 17, 2019 at 5:33 PM Darrick J. Wong <darrick.wong@oracle.com> wrote:
>
> On Wed, Jul 17, 2019 at 05:30:47PM +0200, Sedat Dilek wrote:
> > Hi Steven, Hi Darrick,
> >
> > Unfortunately, my build-script is not working anymore.
> >
> > I am using builddeb/mkdebian scripts.
>
> Yeah, I accidentally uploaded an internal build patch yesterday which
> got sucked into for-next.  It's been fixed in the iomap-for-next tree
> and should disappear in Thursday's for-next tree.  Sorry about that. :(
>
> --D

Shit happens.

- sed@ -

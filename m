Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:52618 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfGSAbQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jul 2019 20:31:16 -0400
Date: Thu, 18 Jul 2019 17:30:45 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: linux-next: Tree for Jul 18 (header build error)
Message-ID: <20190719003045.GF692234@magnolia>
References: <20190718133751.3cf036be@canb.auug.org.au>
 <127d228c-322d-6349-382b-d304974df148@infradead.org>
 <20190719100557.3ead3285@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190719100557.3ead3285@canb.auug.org.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>

On Fri, Jul 19, 2019 at 10:05:57AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 18 Jul 2019 10:00:22 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > on x86_64, when CONFIG_BLOCK is not set:
> > 
> >   CC      include/linux/iomap.h.s
> > In file included from <command-line>:0:0:
> > ./../include/linux/iomap.h: In function ‘iomap_sector’:
> > ./../include/linux/iomap.h:76:48: error: ‘SECTOR_SHIFT’ undeclared (first use in this function); did you mean ‘SECTIONS_SHIFT’?
> >   return (iomap->addr + pos - iomap->offset) >> SECTOR_SHIFT;
> >                                                 ^~~~~~~~~~~~
> 
> include/linux/iomap.h should only be used when CONFIG_BLOCK is set (if
> you follow the Kconfig trail).  So maybe this header should only be
> compile tested if CONFIG_BLOCK is set.

Yeah, that's basically what Christoph said earlier today.

Granted, nobody replied to my question about where in the kernel would
someone be using iomap to map file offsets to disk locations without
block devices, but ...

... oh, this is some weird "mash all the kernel headers together and see
if they compile" thing, isn't it?  Um, yes, iomap.h should only be
tested if CONFIG_IOMAP=y (which in turn requires CONFIG_BLOCK=y).

--D

> -- 
> Cheers,
> Stephen Rothwell

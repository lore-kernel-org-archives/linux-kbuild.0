Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from TPCH01.via.com.tw ([61.66.243.61]:27832 "EHLO tpch01.via.com.tw"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751161AbbHTMEr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 08:04:47 -0400
From: <RaphaelWu@viatech.com.cn>
Subject: Re: how to echo $(KBUILD_CFLAGS)
Date: Thu, 20 Aug 2015 12:04:44 +0000
Message-ID: <848BD1798F19584EADB3CD55379CFD64665E5B20@SHMX01.s3graphics.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org

Thanks Michal for correcting the concept. :)
And I get to understand your point.
It's an out-of-tree module makefile, I'll still try to figure out how -pg removed.

Best regards,
Raphael

> -----origin-----
> sender: Michal Marek [mailto:mmarek@suse.com]
>
> On 2015-08-20 13:03, RaphaelWu@viatech.com.cn wrote:
> > Let me show the simplified piece.
> >
> > obj-m += test.o
> > KBUILD_CFLAGS := $(subst -pg,,$(KBUILD_CFLAGS))
> >
> > all:
> >         @echo $(KBUILD_CFLAGS)
> >         $(MAKE) -C /lib/modules/`uname`/build M=$(PWD) modules
> >
> > So if it's not a kbuild makefile, why the -pg flag can be successful removed
> through KBUILD_CFLAGS.
>
> There are no all: rules in kbuild files.
>
> Michal

The information transmitted in this e-mail is intended only for the addressee and may contain confidential and/or privileged material. Any review, retransmission, dissemination or other use of this information by persons or entities other than the intended recipient is prohibited. If you received this e-mail in error, please notify the sender immediately, and delete this e-mail and any attachments. Thank you.

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from TPCH01.via.com.tw ([61.66.243.61]:59460 "EHLO tpch01.via.com.tw"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751094AbbHTLDP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 07:03:15 -0400
From: <RaphaelWu@viatech.com.cn>
Subject: Re: how to echo $(KBUILD_CFLAGS)
Date: Thu, 20 Aug 2015 11:03:11 +0000
Message-ID: <848BD1798F19584EADB3CD55379CFD64665E5A2C@SHMX01.s3graphics.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org

Let me show the simplified piece.

obj-m += test.o
KBUILD_CFLAGS := $(subst -pg,,$(KBUILD_CFLAGS))

all:
        @echo $(KBUILD_CFLAGS)
        $(MAKE) -C /lib/modules/`uname`/build M=$(PWD) modules

So if it's not a kbuild makefile, why the -pg flag can be successful removed through KBUILD_CFLAGS.
I objdump my test.o, there is not mcount inside. Opposite, with -pg every function inside test.o will be insert
a ftrace point.

Best regards,
Raphael

> On 2015-08-20 12:45, RaphaelWu@viatech.com.cn wrote:
> > Hi,
> >
> > I have seen this VAR used in some kernel module which also forbid ftrace.
> > but I was curious about whenever I echo $(KBUILD_CFLAGS), it's always
> empty.
> >
> > all:
> > @echo $(KBUILD_CFLAGS)
> > $(MAKE) -C /path-of-kernel/ M=$(PWD) modules
>
> This does not look like a kbuild makefile, so it does not see any
> KBUILD_* variables.
>
> Michal
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in the
> body of a message to majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
The information transmitted in this e-mail is intended only for the addressee and may contain confidential and/or privileged material. Any review, retransmission, dissemination or other use of this information by persons or entities other than the intended recipient is prohibited. If you received this e-mail in error, please notify the sender immediately, and delete this e-mail and any attachments. Thank you.

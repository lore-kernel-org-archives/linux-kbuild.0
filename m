Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from TPCH01.via.com.tw ([61.66.243.61]:16344 "EHLO tpch01.via.com.tw"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750981AbbHTKpt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 06:45:49 -0400
From: <RaphaelWu@viatech.com.cn>
Subject: Re: how to echo $(KBUILD_CFLAGS)
Date: Thu, 20 Aug 2015 10:45:45 +0000
Message-ID: <848BD1798F19584EADB3CD55379CFD64665E59C7@SHMX01.s3graphics.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org

Hi,

I have seen this VAR used in some kernel module which also forbid ftrace.
but I was curious about whenever I echo $(KBUILD_CFLAGS), it's always empty.

all:
@echo $(KBUILD_CFLAGS)
$(MAKE) -C /path-of-kernel/ M=$(PWD) modules

The modification of the option did works, but in the scope of the deferred truly building
out-of-tree modules process, the VAR's value seems gone.

Thanks for your time.

Raphael

> ----------original
> sender: linux-kbuild-owner@vger.kernel.org
> [mailto:linux-kbuild-owner@vger.kernel.org] on behave Michal Marek
> On: 2015-08-20 16:58
> receiver: Raphael Wu
> cc: daniel.baluta@intel.com; linux-kbuild@vger.kernel.org;
> octavian.purdila@intel.com; bogdan.m.davidoaia@intel.com
> Title: Re: how to echo $(KBUILD_CFLAGS)
>
> On 2015-08-20 04:03, RaphaelWu@viatech.com.cn wrote:
> > Hi,
> >         Recently I wrote a test module, within my module I need remove
> > -pg flag which is defined by host Makefile (which enable -pg, ftrace function).
> >         I used a trick in my module makefile KBUILD_CFLAGS := $(subst
> > -pg,,$(KBUILD_CFLAGS)),
>
> You are probably looking for CLFAGS_REMOVE_<file.o>.
>
> Michal
> --

The information transmitted in this e-mail is intended only for the addressee and may contain confidential and/or privileged material. Any review, retransmission, dissemination or other use of this information by persons or entities other than the intended recipient is prohibited. If you received this e-mail in error, please notify the sender immediately, and delete this e-mail and any attachments. Thank you.

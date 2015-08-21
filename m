Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from TPCH01.via.com.tw ([61.66.243.61]:34703 "EHLO tpch01.via.com.tw"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752089AbbHUBIY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 21:08:24 -0400
From: <RaphaelWu@viatech.com.cn>
Subject: Re: how to echo $(KBUILD_CFLAGS)
Date: Fri, 21 Aug 2015 01:08:21 +0000
Message-ID: <848BD1798F19584EADB3CD55379CFD64665E625F@SHMX01.s3graphics.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org

Hi Sam

That exactly hits what I need. I'll dig more about kbuild makefile hooking out-of-tree
makefile. As marked by Michal before, it's not a completely kbuild makefile.

Again, thank you very much for your spare time.

Best regards
Raphael


>
> Hi RaphaelWu
>
> Try this:
>
> obj-m += test.o
>
> $(warning Before-KBUILD_CFLAGS=$(KBUILD_CFLAGS))
>
> KBUILD_CFLAGS := $(subst -pg,,$(KBUILD_CFLAGS))
>
> $(warning After-KBUILD_CFLAGS=$(KBUILD_CFLAGS))
>
>       Sam
The information transmitted in this e-mail is intended only for the addressee and may contain confidential and/or privileged material. Any review, retransmission, dissemination or other use of this information by persons or entities other than the intended recipient is prohibited. If you received this e-mail in error, please notify the sender immediately, and delete this e-mail and any attachments. Thank you.

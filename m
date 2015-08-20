Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from TPCH01.via.com.tw ([61.66.243.61]:51973 "EHLO tpch01.via.com.tw"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751308AbbHTCJP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Aug 2015 22:09:15 -0400
From: <RaphaelWu@viatech.com.cn>
Subject: how to echo $(KBUILD_CFLAGS)
Date: Thu, 20 Aug 2015 02:03:41 +0000
Message-ID: <848BD1798F19584EADB3CD55379CFD64665E4D3B@SHMX01.s3graphics.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, daniel.baluta@intel.com
Cc: linux-kbuild@vger.kernel.org, octavian.purdila@intel.com, bogdan.m.davidoaia@intel.com

Hi,
        Recently I wrote a test module, within my module I need remove -pg flag
which is defined by host Makefile (which enable -pg, ftrace function).
        I used a trick in my module makefile KBUILD_CFLAGS := $(subst -pg,,$(KBUILD_CFLAGS)),
and it works well.
        The point that I can not echo out $(KBUILD_CFLAGS) in my module makefile to verify immediately is confusing me.
        So is there a proper or hack way how I can echo out system's KBUILD_CFLAGS.
        Looking for your tips, and thanks very much.

Best regards,
Raphael
The information transmitted in this e-mail is intended only for the addressee and may contain confidential and/or privileged material. Any review, retransmission, dissemination or other use of this information by persons or entities other than the intended recipient is prohibited. If you received this e-mail in error, please notify the sender immediately, and delete this e-mail and any attachments. Thank you.

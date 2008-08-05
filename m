Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mexforward.lss.emc.com ([128.222.32.20]:41887 "EHLO
	mexforward.lss.emc.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753254AbYHEIrv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Aug 2008 04:47:51 -0400
Received: from mailhub.lss.emc.com (uraeus.lss.emc.com [10.254.144.14])
	by mexforward.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id m758lnBn014907
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-kbuild@vger.kernel.org>; Tue, 5 Aug 2008 04:47:49 -0400 (EDT)
Received: from corpussmtp2.corp.emc.com (corpussmtp2.corp.emc.com [128.221.14.146])
	by mailhub.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id m758lieY028265
	for <linux-kbuild@vger.kernel.org>; Tue, 5 Aug 2008 04:47:48 -0400 (EDT)
From: Qian_Riny@emc.com
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: How to separate obj and src for external module build?
Date: Tue, 5 Aug 2008 04:47:44 -0400
Message-ID: <74FD445BA9418847A54455595122B4B43F7F4F@CORPUSMX70C.corp.emc.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

I want to put all obj files (*.o, *.ko etc) into a different directory
(e.g. obj/) 
rather than the same src (*.c, Makefile) directory while building an
external module:
$(MAKE) -C $(KERNELDIR) M=$(SRC) modules
How to do it?

I tried to use O (KBUILD_OUTPUT), but still no luck. It seems that
O (KBUILD_OUTPUT) is just used for kernel build output.

$(MAKE) -C $(KERNELDIR) M=$(SRC) O=$(OBJ) modules
It doesn't work.

Thanks. 

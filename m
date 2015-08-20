Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38530 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752049AbbHTNSH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 09:18:07 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NTD00G5GUA59170@mailout3.w1.samsung.com> for
 linux-kbuild@vger.kernel.org; Thu, 20 Aug 2015 14:18:05 +0100 (BST)
From: Pavel Fedin <p.fedin@samsung.com>
References: <1439549533-8716-1-git-send-email-p.fedin@samsung.com>
 <55D5BAA4.5050003@suse.com> <018a01d0db44$35ed5630$a1c80290$@samsung.com>
 <55D5CA31.8090401@suse.com>
In-reply-to: <55D5CA31.8090401@suse.com>
Subject: RE: [PATCH TRIVIAL v2] Avoid conflict with host definitions when
 cross-compiling
Date: Thu, 20 Aug 2015 16:18:04 +0300
Message-id: <019301d0db4a$a60a7370$f21f5a50$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ru
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Michal Marek' <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org

 Hi!

> If you already have the patches, it won't hurt to send them.

 I have one of them, need to make more.

> Although I
> was under the impression that the .exe suffix is somehow automagically
> handled by Cygwin..?

 In 99% of cases - yes. But at least there is a problem with implicit rules in GNU Make.
 Actually, here i am talking about patch 0002 from this set:
https://www.cygwin.com/ml/cygwin/2012-06/msg00221.html. This HOWTO was created when the kernel was
really old, and now some more tools face a similar problem, like certificate generator for security
subsystem. I will check this.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia



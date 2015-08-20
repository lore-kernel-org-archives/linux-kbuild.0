Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35620 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751511AbbHTMcD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 08:32:03 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NTD00GZAS5C9150@mailout3.w1.samsung.com> for
 linux-kbuild@vger.kernel.org; Thu, 20 Aug 2015 13:32:00 +0100 (BST)
From: Pavel Fedin <p.fedin@samsung.com>
References: <1439549533-8716-1-git-send-email-p.fedin@samsung.com>
 <55D5BAA4.5050003@suse.com>
In-reply-to: <55D5BAA4.5050003@suse.com>
Subject: RE: [PATCH TRIVIAL v2] Avoid conflict with host definitions when
 cross-compiling
Date: Thu, 20 Aug 2015 15:31:59 +0300
Message-id: <018a01d0db44$35ed5630$a1c80290$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ru
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Michal Marek' <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, trivial@kernel.org

 Hello!

> Thanks, applied to kbuild.git#kbuild. But it seems that
> arch/x86/tools/relocs needs the same fix.

 Perhaps. I tried to compile only ARM kernels, no x86.

 By the way, i have several more fixes which could increase kbuild portability. For example, there
are several issues on Cygwin with .exe extensions of some tools. Could we upstream them also?

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia



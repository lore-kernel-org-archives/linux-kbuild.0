Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from poutre.nerim.net ([62.4.16.124]:50192 "EHLO poutre.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754293AbZHCMFB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 3 Aug 2009 08:05:01 -0400
Date: Mon, 3 Aug 2009 14:04:59 +0200
From: Jean Delvare <khali@linux-fr.org>
Subject: ld:arch/x86/kernel/vmlinux.lds:678: parse error
Message-ID: <20090803140459.02cea700@hyperion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

Hi Sam,

I am not able to build Linus' latest kernel on my oldest test system. I
get the following linking error at the end:

  LD      .tmp_vmlinux1
ld:arch/x86/kernel/vmlinux.lds:678: parse error

Which is:

ASSERT((_end - 0xC0000000 <= (512 * 1024 * 1024)),
        "kernel image bigger than KERNEL_IMAGE_SIZE")

Apparently this assertion is relatively new, as I was able to build
kernel 2.6.29 on the same system. The system has binutils 2.14.90.0.6,
which is more recent than what is listed in Documentation/Changes
(2.12).

Any idea?

Thanks,
-- 
Jean Delvare

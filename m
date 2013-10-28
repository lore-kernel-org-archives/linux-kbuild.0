Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:51133 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754649Ab3J1CQb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 27 Oct 2013 22:16:31 -0400
Received: from tacticalops.localnet ([95.112.250.113]) by smtp.web.de
 (mrweb002) with ESMTPSA (Nemesis) id 0Lzrwh-1VnwK71dMB-0151eI for
 <linux-kbuild@vger.kernel.org>; Mon, 28 Oct 2013 03:16:29 +0100
From: Martin Walch <walch.martin@web.de>
Subject: Segmentation Fault with 'm' Dependencies
Date: Mon, 28 Oct 2013 03:16:27 +0100
Message-ID: <4647748.CU0TquGsxA@tacticalops>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Dirk Gouders <dirk@gouders.net>, Andrew Morton <akpm@linux-foundation.org>, Libo Chen <libo.chen@huawei.com>

Hello,

this test case leads to a segmentation fault:

config A
	tristate "A" if m

config MODULES
	boolean "MODULES"
	option modules

As you can see, the MODULES symbol with the option modules is declared after
the first occurrence of an 'm' dependency. (Actually you can drop the MODULES
section or use a different symbol name. It does not matter.) Internally 'm' gets
converted into (symbol_mod && modules_sym), which adds a dependency on a
bad symbol, finally leading to dereferencing a null pointer.

If you move the declaration of the MODULES symbol to the top, everything
works fine.

The crash has been introduced last month with

> 6902dccfda005fa4c42410fa064fdd331ab42479
> kconfig: do not special-case 'MODULES' symbol

However, things were probably broken before. The problem has only
become visible.

The reason that configuring a Linux kernel does not crash the
configuration system is that there is currently no architecture that has a
symbol with a dependency on 'm' anywhere before the MODULES symbol.

Regards
Martin Walch
-- 


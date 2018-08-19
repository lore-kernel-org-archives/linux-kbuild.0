Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp2.it.da.ut.ee ([193.40.5.67]:58972 "EHLO smtp2.it.da.ut.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbeHSO5t (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Aug 2018 10:57:49 -0400
Date: Sun, 19 Aug 2018 14:15:19 +0300 (EEST)
From: Meelis Roos <mroos@linux.ee>
Subject: make *config regression: pkg-build
Message-ID: <alpine.LRH.2.21.1808191406030.12334@math.ut.ee>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>

Just tried to run 'make menuconfig' on v4.18-10568-g08b5fa819970 and 
found a bad surprise:

'make *config' requires 'pkg-config'. Please install it.
make[1]: *** [scripts/kconfig/Makefile:219: scripts/kconfig/.mconf-cfg] Error 1

This is clearly a regression - I have libncurses devele pakcage 
installed in the default system location (as do 99%+ on actuall 
develeopers proobably) and in this case, pkg-config is useless. 
pkg-config is needed only when libraries and headers are installed in 
non-default locations but it is bad to require installation of 
pkg-config on all the machines where make menuconfig would be possibly 
run (for example, I have a aboult 100 machine kernel testbed with 
self-hosted kernel compilation and machine-specific kernel 
configurations that ocassionally need tweaking).

I notice 4.18 complained it can not find pkg-config but still worked. 
This is clearly better than now.

If we want to support developers with libraries in non-default 
locations, why not - but the common case of system include path should 
work without any trouble or warnings. For exaple, test if compilation 
against ncurses works, and if not retry it with pkg-config (and error 
out if it does not give working result).

-- 
Meelis Roos (mroos@linux.ee)

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725848AbgDSWE0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Apr 2020 18:04:26 -0400
Received: from eidolon.nox.tf (eidolon.nox.tf [IPv6:2a07:2ec0:2185::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B116AC061A0C
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Apr 2020 15:04:25 -0700 (PDT)
Date: Sun, 19 Apr 2020 23:55:58 +0200
From: David Lamparter <equinox@diac24.net>
Subject: gcc extended format checking plugin
Message-ID: <20200419215558.GU30496@eidolon.nox.tf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello kernel build hackers,


in case it is of interest to anyone, we've recently added an extended
format string checking plugin in the FRRouting project.  We took
inspiration from the Linux kernel and modified a printf (funnily enough,
the one from FreeBSD) to support things like %pI4, and we wanted better
warnings for this.  Since the scheme is the same as in the Linux kernel,
it may or may not be worth someone's time to take a look.

The plugin is found here:
https://github.com/FRRouting/frr/tree/master/tools/gcc-plugins

It's derived from gcc's "c-format.c", as such it may make sense to look
at the diff instead of the straight source.  The original GCC code is in
the git history there.  It's tested against gcc 9.3.0, YMMV on other
versions.

Note that the plugin needs a single-line GCC source code modification:
https://github.com/FRRouting/frr/blob/master/tools/gcc-plugins/gcc-retain-typeinfo.patch
this is to stop GCC from prematurely stripping information, specifically
from casts in function parameters.  It does work without the change, but
it may produce false-positive/negative warnings.

Aside from %pXX suffix support, the plugin also contains two other
changes that are probably irrelevant to kernel land:
- it makes some typedefs "final" types since these are not guaranteed to
  be consistent in size across platforms and therefore can't be
  printf'd without a cast (e.g. pid_t, uid_t, time_t, etc.)
- it reserves %Lu for uint64_t

Please don't expect too much on its code quality, I'm not a GCC
developer and essentially wrote this by trial and error ;)

Cheers,


-David

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:64803 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726313AbfAWJZy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Jan 2019 04:25:54 -0500
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: minimal version requirement for ld
Message-ID: <4bec5d62-6033-b3be-d4b2-30d72d381c34@cn.fujitsu.com>
Date: Wed, 23 Jan 2019 17:23:11 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nicholas Piggin <npiggin@gmail.com>

Hi,
(Not sure I am sending the right place)

Documentation/process/changes.rst says the minimal version for binutils
is 2.20. I am trying the binutils-2.20.51.0.2-5.48.el6.x86_64.rpm of
Centos6 on Fedora28, and it give me:

  HOSTCC  scripts/basic/fixdep
/usr/bin/ld: unrecognized option '-plugin'
/usr/bin/ld: use the --help option for usage information
collect2: error: ld returned 1 exit status
make[2]: *** [scripts/Makefile.host:90: scripts/basic/fixdep] Error 1
make[1]: *** [Makefile:464: scripts_basic] Error 2
make: *** No rule to make target 'include/config/auto.conf', needed by
'include/config/kernel.release'.  Stop.
make: *** Waiting for unfinished jobs....
  HOSTCC  scripts/basic/fixdep
/usr/bin/ld: unrecognized option '-plugin'
/usr/bin/ld: use the --help option for usage information
collect2: error: ld returned 1 exit status
make[1]: *** [scripts/Makefile.host:90: scripts/basic/fixdep] Error 1
make: *** [Makefile:464: scripts_basic] Error 2

Then I tried adding:

    HOSTCFLAGS_fixdep.o := -fno-use-linker-plugin

in scripts/basic/Makefile, and it give me:

  HOSTCC  scripts/basic/fixdep
/usr/bin/ld: BFD version 2.20.51.0.2-5.48.el6 20100205 internal error,
aborting at reloc.c line 443 in bfd_get_reloc_size

/usr/bin/ld: Please report this bug.

collect2: error: ld returned 1 exit status
make[2]: *** [scripts/Makefile.host:90: scripts/basic/fixdep] Error 1
make[1]: *** [Makefile:464: scripts_basic] Error 2
make: *** No rule to make target 'include/config/auto.conf', needed by
'include/config/kernel.release'.  Stop.

Any idea on this problem? Or anyone has ever tried ld 2.20 successfully?
-- 
Sincerely,
Cao jin

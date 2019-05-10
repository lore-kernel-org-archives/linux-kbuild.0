Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:39517 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726983AbfEJHcy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 03:32:54 -0400
Date: Fri, 10 May 2019 15:32:05 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [kbuild:kunit 6/17] kunit/kunit-stream.c:14:12: sparse: sparse:
 symbol 'kunit_stream_get_level' was not declared. Should it be static?
Message-ID: <201905101508.nymn1QP2%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: kbuild-all@01.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kunit
head:   c505c0b2e6237c729634327c178f5b0094f1c958
commit: 7ab313d288d1c686ae39c7052f6ed6426ed38b54 [6/17] kbuild: enable building KUnit
reproduce:
        # apt-get install sparse
        git checkout 7ab313d288d1c686ae39c7052f6ed6426ed38b54
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> kunit/kunit-stream.c:14:12: sparse: sparse: symbol 'kunit_stream_get_level' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

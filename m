Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:57312 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754146AbcJ1IaZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2016 04:30:25 -0400
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 00/10] scripts/basic: Fine-tuning for seven function
 implementations
Message-ID: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
Date: Fri, 28 Oct 2016 10:30:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Oct 2016 10:18:10 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (10):
  bin2c: Complete error handling in main()
  fixdep: Complete error handling in print_deps()
  fixdep: Use the symbol "MAP_FAILED" in print_deps()
  fixdep: Fix error log output in print_deps()
  fixdep: Complete error handling in parse_dep_file()
  fixdep: Complete error handling in do_config_file()
  fixdep: Fix error log output in do_config_file()
  fixdep: Complete error handling in print_config()
  fixdep: Complete error handling in print_cmdline()
  fixdep: Combine two fprintf() calls into one fputs() call in usage()

 scripts/basic/bin2c.c  |  26 ++++++----
 scripts/basic/fixdep.c | 131 +++++++++++++++++++++++++++++++++----------------
 2 files changed, 105 insertions(+), 52 deletions(-)

-- 
2.10.1


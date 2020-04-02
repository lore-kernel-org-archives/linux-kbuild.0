Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387722AbgDBJ2I (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 05:28:08 -0400
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 0/6] Fix several issues at qconf.cc
Date: Thu,  2 Apr 2020 11:27:57 +0200
Message-Id: <cover.1585819250.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

Since its conversion to support Qt5, back on Kernel 3.14, the qconf.cc tool
has been having some issues.  With Kernel 5.6 (and Qt 5.13) it doesn't
work at all, on any of its modes.

This patch series restore its functionality to what it had before Kernel 3.14.

Now, all three modes should work as expected, and the layout will be shown
with a vertical split, with the help messages at the botton, for both Single and
Full modes.

The Split mode should also work properly, with its horizontal split showing
the main config items at the left and a per-items view at the right.

Mauro Carvalho Chehab (6):
  kconfig: qconf: clean deprecated warnings
  kconfig: qconf: Change title for the item window
  kconfig: qconf: fix the content of the main widget
  kconfig: qconf: fix support for the split view mode
  kconfig: qconf: remove some old bogus TODOs
  kconfig: qconf: Fix a few alignment issues

 scripts/kconfig/qconf.cc | 90 ++++++++++++++++++++++++++++------------
 scripts/kconfig/qconf.h  |  2 +
 2 files changed, 66 insertions(+), 26 deletions(-)

-- 
2.25.1

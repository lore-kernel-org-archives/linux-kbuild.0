Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgF3G0q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 02:26:46 -0400
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 0/7] Fix split view search and debug info navigation
Date: Tue, 30 Jun 2020 08:26:34 +0200
Message-Id: <cover.1593498345.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

This series fixes some issues with search while on split view and fix the
broken hyperlink navigation.

The first patches restore the pre-Qt5 conversion behavior. The last
one implements navigation on a different way. I opted to keep this one
in separate, as this one is a new feature.

-

v3:

- dropped a patch that it is not needed anymore;
- hyperlinks should now work for non-visible items;
- fixed a description at patch 3.

Mauro Carvalho Chehab (7):
  kconfig: qconf: cleanup includes
  kconfig: qconf: make search fully work again on split mode
  kconfig: qconf: make debug links work again
  kconfig: qconf: re-implement setSelected()
  kconfig: qconf: simplify the goBack() logic
  kconfig: qconf: don't show goback button on splitMode
  kconfig: qconf: navigate menus on hyperlinks

 scripts/kconfig/qconf.cc | 169 +++++++++++++++++++++++----------------
 scripts/kconfig/qconf.h  |  29 ++++---
 2 files changed, 119 insertions(+), 79 deletions(-)

-- 
2.26.2

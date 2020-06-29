Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728428AbgF2Skj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 14:40:39 -0400
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 0/5] Fix split view search and debug info navigation
Date: Mon, 29 Jun 2020 11:35:34 +0200
Message-Id: <cover.1593423060.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

This series fixes some issues with search while on split view and fix the
broken hyperlink navigation.

The first patches restore the pre-Qt5 conversion behavior. The last
one implements navigation on a different way. I opted to keep this one
in separate, as this one is a new feature.

Mauro Carvalho Chehab (5):
  kconfig: qconf: cleanup includes
  kconfig: qconf: ensure that only one item will be highlighted
  kconfig: qconf: make search fully work again on split mode
  kconfig: qconf: make debug links work again
  kconfig: qconf: navigate menus on hyperlinks

 scripts/kconfig/qconf.cc | 120 +++++++++++++++++++++++++++++----------
 scripts/kconfig/qconf.h  |  15 ++---
 2 files changed, 98 insertions(+), 37 deletions(-)

-- 
2.26.2

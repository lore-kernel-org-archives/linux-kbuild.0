Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:59231 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbfJCH7Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 03:59:16 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 5/6] nsdeps: fix hashbang of scripts/nsdeps
Date: Thu,  3 Oct 2019 16:58:25 +0900
Message-Id: <20191003075826.7478-6-yamada.masahiro@socionext.com>
In-Reply-To: <20191003075826.7478-1-yamada.masahiro@socionext.com>
References: <20191003075826.7478-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: Matthias Maennich <maennich@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shaun Ruffell <sruffell@sruffell.net>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This script does not use bash-extension. I am guessing this hashbang
was copied from scripts/coccicheck, which really uses bash-extension.

/bin/sh is enough for this script.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Matthias Maennich <maennich@google.com>
---

Changes in v2: None

 scripts/nsdeps | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/nsdeps b/scripts/nsdeps
index ac2b6031dd13..964b7fb8c546 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 # Linux kernel symbol namespace import generator
 #
-- 
2.17.1

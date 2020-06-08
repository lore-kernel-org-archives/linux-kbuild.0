Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729594AbgFHXQV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 19:16:21 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.6 206/606] Linux 5.6.15
Date: Mon,  8 Jun 2020 19:05:31 -0400
Message-Id: <20200608231211.3363633-206-sashal@kernel.org>
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d00e14219e27..3eca0c523098 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 VERSION = 5
 PATCHLEVEL = 6
-SUBLEVEL = 14
+SUBLEVEL = 15
 EXTRAVERSION =
 NAME = Kleptomaniac Octopus
 
-- 
2.25.1

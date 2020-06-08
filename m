Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729593AbgFHXNr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 19:13:47 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.6 079/606] Linux 5.6.14
Date: Mon,  8 Jun 2020 19:03:24 -0400
Message-Id: <20200608231211.3363633-79-sashal@kernel.org>
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
index 7afb6942d3f7..713f93cceffe 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 VERSION = 5
 PATCHLEVEL = 6
-SUBLEVEL = 13
+SUBLEVEL = 14
 EXTRAVERSION =
 NAME = Kleptomaniac Octopus
 
-- 
2.25.1

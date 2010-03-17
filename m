Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.gmx.net ([213.165.64.20]:54554 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751595Ab0CQSwS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Mar 2010 14:52:18 -0400
Message-ID: <4BA124DC.2070701@gmx.de>
Date: Wed, 17 Mar 2010 19:52:12 +0100
From: Philipp Kohlbecher <xt28@gmx.de>
MIME-Version: 1.0
Subject: [PATCH] .gitignore: ignore *.lzo files
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Ignore files compressed with lzop.

Signed-off-by: Philipp Kohlbecher <xt28@gmx.de>
---
 .gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index a2939fc..8faa6c0 100644
--- a/.gitignore
+++ b/.gitignore
@@ -28,6 +28,7 @@ modules.builtin
 *.gz
 *.bz2
 *.lzma
+*.lzo
 *.patch
 *.gcno

-- 
1.7.0.2

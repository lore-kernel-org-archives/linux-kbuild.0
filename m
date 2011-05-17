Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outmail008.snc4.facebook.com ([66.220.144.140]:57024 "EHLO
	mx-out.facebook.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755897Ab1EQRht (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 May 2011 13:37:49 -0400
From: Arun Sharma <asharma@fb.com>
Subject: [PATCH 6/6] kbuild: cleanup the rpm buildroot
Date: Tue, 17 May 2011 10:36:19 -0700
Message-Id: <1305653779-3445-6-git-send-email-asharma@fb.com>
In-Reply-To: <1305653779-3445-1-git-send-email-asharma@fb.com>
References: <1305653779-3445-1-git-send-email-asharma@fb.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arun Sharma <asharma@fb.com>

Signed-off-by: Arun Sharma <asharma@fb.com>
---
 scripts/package/mkspec |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 9a8c2fa..79dbe5c 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -81,6 +81,7 @@ echo ""
 fi
 
 echo "%build"
+echo 'rm -rf $RPM_BUILD_ROOT'
 
 if ! $PREBUILT; then
 echo "make clean && make %{?_smp_mflags}"
-- 
1.7.4


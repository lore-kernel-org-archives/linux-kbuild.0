Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-by2nam01on0055.outbound.protection.outlook.com ([104.47.34.55]:51705
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750723AbdAWOcl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Jan 2017 09:32:41 -0500
From: Vadim Lomovtsev <Vadim.Lomovtsev@caviumnetworks.com>
Subject: [PATCH v2] scripts: rpm: build: add INSTALL_MOD_STRIP=1 to rpm mkspec
Date: Mon, 23 Jan 2017 06:32:24 -0800
Message-ID: <1485181944-31882-1-git-send-email-Vadim.Lomovtsev@caviumnetworks.com>
In-Reply-To: <1484921558-26181-1-git-send-email-Vadim.Lomovtsev@caviumnetworks.com>
References: <1484921558-26181-1-git-send-email-Vadim.Lomovtsev@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, Vadim.Lomovtsev@caviumnetworks.com

Having kernel modules with debug sections consumes a lot of
hdd space, increases size of kernel rpm, initrd image grows
and in some cases kernel even can't be installed due to
insufficient hdd space for modules.

Set INSTALL_MOD_STRIP=1 to enable debug info strip at rpm modules
install phase.

Signed-off-by: Vadim Lomovtsev <Vadim.Lomovtsev@caviumnetworks.com>
---
 scripts/package/mkspec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index bb43f15..252d74c 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -90,7 +90,7 @@ echo 'mkdir -p $RPM_BUILD_ROOT/boot $RPM_BUILD_ROOT/lib/modules'
 echo "%endif"
 echo 'mkdir -p $RPM_BUILD_ROOT'"/lib/firmware/$KERNELRELEASE"
 
-echo 'INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} KBUILD_SRC= mod-fw= modules_install'
+echo 'INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} INSTALL_MOD_STRIP=1 KBUILD_SRC= mod-fw= modules_install'
 echo 'INSTALL_FW_PATH=$RPM_BUILD_ROOT'"/lib/firmware/$KERNELRELEASE"
 echo 'make INSTALL_FW_PATH=$INSTALL_FW_PATH' firmware_install
 echo "%ifarch ia64"
-- 
2.4.11


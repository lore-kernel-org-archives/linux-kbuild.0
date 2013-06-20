Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:27107 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965372Ab3FTMDX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Jun 2013 08:03:23 -0400
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/7] metag: add <dt-bindings/> symlink
Date: Thu, 20 Jun 2013 13:02:32 +0100
Message-ID: <1371729758-10196-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1371729758-10196-1-git-send-email-james.hogan@imgtec.com>
References: <1371729758-10196-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Stephen Warren <swarren@nvidia.com>, Michal Marek <mmarek@suse.cz>, Shawn Guo <shawn.guo@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kbuild@vger.kernel.org, devicetree-discuss@lists.ozlabs.org

Add symlink to include/dt-bindings from arch/metag/boot/dts/include/ to
match the one in arch/arm/... (see the commit below) so that
preprocessed device tree files can include various useful constant
definitions.

Commit c58299aa87544a590c62bda0bf52b69fa56cb8d5 ("kbuild: create an
"include chroot" for DT bindings") merged in v3.10-rc1.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Stephen Warren <swarren@nvidia.com>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: linux-kbuild@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org
---
 arch/metag/boot/dts/include/dt-bindings | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 arch/metag/boot/dts/include/dt-bindings

diff --git a/arch/metag/boot/dts/include/dt-bindings b/arch/metag/boot/dts/include/dt-bindings
new file mode 120000
index 0000000..08c00e4
--- /dev/null
+++ b/arch/metag/boot/dts/include/dt-bindings
@@ -0,0 +1 @@
+../../../../../include/dt-bindings
\ No newline at end of file
-- 
1.8.1.2



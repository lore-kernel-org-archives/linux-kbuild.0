Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:33531 "EHLO
        mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751091AbcINCpX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Sep 2016 22:45:23 -0400
Received: by mail-pa0-f65.google.com with SMTP id oz2so34871pac.0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Sep 2016 19:45:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/64: whitelist unresolved modversions CRCs
Date: Wed, 14 Sep 2016 12:45:07 +1000
Message-Id: <20160914024507.8759-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>

These are a symptom of CRC generation failure in generic
build code, and not powerpc specific.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

Hi Michal,

Please merge this via your trees with Al's patches. I have
a patch that can catch crc generation failure generically,
and both Arnd and I have some ideas to fix crc generation
for .S exports. This should get powerpc building again with
your tree.

Thanks,
Nick


 arch/powerpc/relocs_check.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/relocs_check.sh b/arch/powerpc/relocs_check.sh
index 2e4ebd0..ec2d5c8 100755
--- a/arch/powerpc/relocs_check.sh
+++ b/arch/powerpc/relocs_check.sh
@@ -30,6 +30,7 @@ bad_relocs=$(
 	# On PPC64:
 	#	R_PPC64_RELATIVE, R_PPC64_NONE
 	#	R_PPC64_ADDR64 mach_<name>
+	#	R_PPC64_ADDR64 __crc_<name>
 	# On PPC:
 	#	R_PPC_RELATIVE, R_PPC_ADDR16_HI,
 	#	R_PPC_ADDR16_HA,R_PPC_ADDR16_LO,
@@ -41,7 +42,8 @@ R_PPC_ADDR16_HI
 R_PPC_ADDR16_HA
 R_PPC_RELATIVE
 R_PPC_NONE' |
-	grep -E -v '\<R_PPC64_ADDR64[[:space:]]+mach_'
+	grep -E -v '\<R_PPC64_ADDR64[[:space:]]+mach_' |
+	grep -E -v '\<R_PPC64_ADDR64[[:space:]]+__crc_'
 )
 
 if [ -z "$bad_relocs" ]; then
-- 
2.9.3


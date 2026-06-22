Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8828370D69;
	Mon, 22 Jun 2026 13:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134831; cv=none; b=WL8ZKBOQ0BTUa0EcRWUH/BA/HL5IuNWJQSRH3JKDPJaFnXbfm1MXYgJcOSz+klktUL4cRgXAsdRwLzs87aLbJtNoj+rA0PkNIO7yo/84Vy6gAoQ2a8NyqgoUpygfLvb7cu3t7jcxWUmc9AckPtNNy2sjIIjicbbrIVIKM2Xg4M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134831; c=relaxed/simple;
	bh=6bGvez7PUoxOmd51ZM0M6Pz0i+ipgFsAkKRMQLAC4xs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bhWgj1bUnO1sv4jaedpNfCU+ypNVWMpbgnHTc0aXsHlkuiUHNg3CX/gGLqbN1quu6DZCF+4CUQXKCLjUbuyAhSwRaoVUeu8Ba3sOr9dhNFM5MNSVa5WgNGPqs7AsJeKSfkLFdgw7xnW5LxPYwxYuvGzRXAUd0Wg9xp6oW4h+Lhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=nXlZjlP2; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="nXlZjlP2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=Fr9IBk8YUm81/aPZbfquOnUxYpmSd26C8BFIU7IIWOI=; b=nXlZjlP293fxIH
	CLTkjxmD66+L35M1HTt3Ji5x/3/1Ls6tKkFASFPmhJIstCZTPwZqazjqRIqhxiaNGPVvdvFsJhxss
	pe6Bisbekd8apYg9G8d551Kdbaul0C+qp+R8fqBx/oTsbHV8C03+gRjwsVbrEgJpCeUQvHZYnrzgG
	JBMtQsT5KlVhPUvx6DO7JPJXM7A144TIw/1fCoTj5hc+6+GfMbwmhX+c7a02Q9ptxjMQu/0DlJci7
	6RBDAjcA6mTsIWe/hRsKclcdRaGfAoAcFJ83pmlYu7L5iZ12kh2IB/fn7Hb8psLvdfvC+3uMW00ee
	ba0mIDYNkPqjUbFN2oxw==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wbefz-00Elr5-EU; Mon, 22 Jun 2026 14:26:59 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wbefx-00000001sFl-1Uh7;
	Mon, 22 Jun 2026 14:26:57 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] kbuild: remove srctreie path from CHECK output
Date: Mon, 22 Jun 2026 14:26:53 +0100
Message-Id: <20260622132653.446868-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

The build does not put the full kernel path in when
building outputs, so do the same when the check is
run to make the output more consistent.

turn the following:
  CC      arch/riscv/lib/delay.o
  CHECK   /home/ben/linux/arch/riscv/lib/delay.c

into:
  CC      arch/riscv/lib/delay.o
  CHECK   arch/riscv/lib/delay.c

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 scripts/Makefile.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 911745743246..d432693e5367 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -159,10 +159,10 @@ targets += $(targets-for-builtin) $(targets-for-modules)
 
 # Linus' kernel sanity checking tool
 ifeq ($(KBUILD_CHECKSRC),1)
-  quiet_cmd_checksrc       = CHECK   $<
+  quiet_cmd_checksrc       = CHECK   $(patsubst $(srctree)/%,%,$<)
         cmd_checksrc       = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
 else ifeq ($(KBUILD_CHECKSRC),2)
-  quiet_cmd_force_checksrc = CHECK   $<
+  quiet_cmd_force_checksrc = CHECK   $(patsubst $(srctree)/%,%,$<)
         cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
 endif
 
-- 
2.37.2.352.g3c44437643


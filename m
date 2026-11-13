Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592639;
	b=35gldRrDk8MXwfLT+e/+8ArhkcQGVbJj5azb4844DBkzNkedVqEsgRc5wa9LON7nit/Q
	 +Wyb7kvCdpQDr9l+ZoqZZtzgB9T0YJc0dNGgx2+z9xW3KzHwJ0uZJ06FkUNXvcUrQfqq8
	 MgMN6gSYGW9FvFkMVHWY1zU4my86y+1gW3HvzGuIdNbuTrO/ha4br1qZd22pntY4n992y
	 xbhF4yiGYaAB+tSHuLlJJyIEsHDdUV9fLJBBIqtCPgc+9+s2Am2bCv1Rf5pQaaEi5WoTq
	 HktBQ4jwMcf+nlpD+ZXgyeLkpz//iTrzgPWK6eqqgxVU7nKvNM+hMx6DLDF5ZWRf4LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592639;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=CWLTIs+hni+fvoY6mrigTluRycmFyDv/vZwkFpYXWa8=;
	b=mAAJ+jL47tsml9opoE0zr5py3ZPG4sm2jDm1ErMd6OOc/3nL+2PUqvKd6scacEarYFhM
	 DgIwWapLbAF8mO3esc8Rw1a2rtotiFvmRDk1RvI2kO/GBBSR23wH2b1DxQiErUXMi0SIz
	 ox+6yYAxOGP+iBy7yDpkmBPNgIhFxUvdd2nelVJkl3nvuNThBaHMRT9CO6IF7fp6FRSWQ
	 n7/k+bwy7h/NmRR9y7jvq8ZPBsuhdEL3jqA0qovQvq+S9Iq21Ec4mQzu1U4J6siGT1Oh0
	 ujwxBqa1h62+xO+kC/cgOYePmZRJeMKguCAeLiBJv0twikSD05d9u71CO6raotUus8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXoVJPpe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F315606B238;
	Fri, 13 Nov 2026 17:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXoVJPpe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA1A1F000C6;
	Fri, 13 Nov 2026 17:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592639;
	bh=CWLTIs+hni+fvoY6mrigTluRycmFyDv/vZwkFpYXWa8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OXoVJPpeLFUY9zikYziGNn5JoJehTjRrdX0oDKZ2SjDgLSJURkzzdb/mVesYxqbpZ
	 7C6404t/x7yCd9qEmlor9Q26foKjjAAmeIlzZe8sjnejqkXMesH9AKRJzNlQYGiKlQ
	 +GLDRbBdqpDksVl9CIhL8LzMCGTw8t9WDzZcIO61Wkeu2iNc+kEdq4y8Z4/XqBF8l+
	 AJ+850iA0cJnJBThFrMmz39tuMWwSRkuWsaJH4AQr/3yci/yuZuso9dTVUdAa8CFTP
	 UaegIFpP5C9s2rLF+E4c8xqec6P97DldFGZlCLxLfwthds00cS43wo8fodM+p4uCC+
	 EOqc9mU5OdViw==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Fri, 13 Nov 2026 18:57:06 +0100
Subject: [PATCH v2 2/3] kbuild: move preparation checks out of single-build
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-reduce-single-build-dependencies-v2-2-93ba1f6c4e46@kernel.org>
References: <20261113-reduce-single-build-dependencies-v2-0-93ba1f6c4e46@kernel.org>
In-Reply-To: <20261113-reduce-single-build-dependencies-v2-0-93ba1f6c4e46@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=J60Bfg5rnG38+O4wzyuXYBV9jjEM5OMi/wZayVk+IsQ=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFnf/asYvB1vta7xn/LQ5g5rzLm5kSGmytFsM7y+Fgmov
 vUV+P28YyILgxgXg6WYIsuyck5uhY5C77BDfy1h5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 IEPHiIGLUwCmWvcsI8Pagx9e/D/kfUm1OkFo1pPF67d39l3QCn+Rv6pjj4zcBYl5DP/Dbty7Xrr
 z9LyOW/NUlUW2PPvgKf2ve5/xomeu3z8rtyZwAQA=
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

The missing-syscalls check and the atomic-checks are currently set as
preparation dependencies. However, these are not needed to compile, for
example, a single object.

Add a new prepare_checks target to group those checks and call it
conditionally only if we are not doing a single-build so that the
prepare target does not trigger that dependency anymore.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 Kbuild   | 7 +++++--
 Makefile | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Kbuild b/Kbuild
index 5a65be2d51b0..5151e32985c6 100644
--- a/Kbuild
+++ b/Kbuild
@@ -86,8 +86,11 @@ $(atomic-checks): $(obj)/.checked-%: include/linux/atomic/%  FORCE
 
 # A phony target that depends on all the preparation targets
 
-PHONY += prepare
-prepare: $(rq-offsets-file) missing-syscalls $(atomic-checks)
+PHONY += prepare prepare_checks
+prepare: $(rq-offsets-file)
+	@:
+
+prepare_checks: missing-syscalls $(atomic-checks)
 	@:
 
 # Ordinary directory descending
diff --git a/Makefile b/Makefile
index f895752d4b05..2c1289a44c56 100644
--- a/Makefile
+++ b/Makefile
@@ -1413,8 +1413,8 @@ archprepare: outputmakefile archheaders archscripts scripts include/config/kerne
 	include/generated/rustc_cfg remove-stale-files
 
 prepare0: archprepare
+	$(Q)$(MAKE) $(build)=. prepare $(if $(single-build),,prepare_checks)
 	$(Q)$(MAKE) $(build)=scripts/mod
-	$(Q)$(MAKE) $(build)=. prepare
 
 # All the preparing..
 prepare: prepare0

-- 
2.56.1


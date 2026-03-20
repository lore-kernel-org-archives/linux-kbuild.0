Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F212F1FEA;
	Fri, 20 Mar 2026 16:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024634; cv=none; b=W526/SXSPnLOe0731XTa/hi1dz399Kz1UrOEHTmTHgKp5bjOJuN5lRjFDauSXP647JN4XzoAgJGXME20ufVfWTxFgoLIdY5UVe3VMWIJIyV69sNPeZeASt6wInsCVF24HhnEgBBoMNLDrSFMCIWxuooDD+4v94EEGpYzmCHxXME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024634; c=relaxed/simple;
	bh=XtwtkGbVIAviSBKNzPZARNv+oD8o41cZX5mjNU+jOg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qzG0Yf7yeuD7/TmQIo3FNnEaDBkPq3w80xZFjh1+HjgKH50tLsCDPz+Zx0ombBcO2ax7Oxux3d38vEkOheoATBAZ7QUICL/EmyGt/70J1w3bgzu5Z5D8MnyTA4ABBxRR2d4i5zwpE0C+dexHj2amtULtymmORsAzwO4llGO4Jms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=NZbGJJRW; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="NZbGJJRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774024624;
	bh=XtwtkGbVIAviSBKNzPZARNv+oD8o41cZX5mjNU+jOg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NZbGJJRWf1eo7mbVnC93Y4M1/zVfj7tDvdhQ2sX6uxmLApBrMDrk6VLhO1wVO8mOk
	 icmPHPQohMAwNrT50M5dfBmeAVM1ToQAntgUCZqAFflou1YAiNPiV02psnJTC9VfJh
	 IQKkVlqq6c0mywvzGY4NxDpObmyKVz2M3+11ucno=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 20 Mar 2026 17:36:53 +0100
Subject: [PATCH 1/4] kbuild: vdso_install: split out the readelf invocation
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-kbuild-vdso-install-v1-1-e2e8a0970889@weissschuh.net>
References: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
In-Reply-To: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774024622; l=899;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=XtwtkGbVIAviSBKNzPZARNv+oD8o41cZX5mjNU+jOg0=;
 b=7pvGbhCSp8sWMj3g3dt5lLDO/8pYOyMz9wn3Nm95uqE/2hPB1UFyabz5qWzxj/ikXIZrWdArC
 BBnRZyyf5kRCRWmuYqT18P9zoJ4LRzqrmZwKPElu85p54rl14Yszidx
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Some upcoming changes to the readelf invocation would create a
very long line otherwise.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 scripts/Makefile.vdsoinst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.vdsoinst b/scripts/Makefile.vdsoinst
index ac85f9a4a569..214c561651cf 100644
--- a/scripts/Makefile.vdsoinst
+++ b/scripts/Makefile.vdsoinst
@@ -21,7 +21,8 @@ $$(dest): $(1) FORCE
 
 # Some architectures create .build-id symlinks
 ifneq ($(filter arm s390 sparc x86, $(SRCARCH)),)
-link := $(install-dir)/.build-id/$$(shell $(READELF) -n $(1) | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p').debug
+build-id-file := $$(shell $(READELF) -n $(1) | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
+link := $(install-dir)/.build-id/$$(build-id-file).debug
 
 __default: $$(link)
 $$(link): $$(dest) FORCE

-- 
2.53.0


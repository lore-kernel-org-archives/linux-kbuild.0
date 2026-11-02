Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598971;
	b=klGqV/5wVlShOELQZAblrzN4XKsMoW0GT2hLxPVLBVboaXKH7CD3QgaFGdXfmHvt29ra
	 CVMtD/4ed2suaUrnpLEcA5wWtbVcn0IrxyTVt+wtsCsWXERmUocNkIv2Q8HVcAP6uF6uK
	 NJhQekk9aCx99b+cyxlNHPW3VTwvzs4n359K2g1vTchfkW0X3FWcTfP1Jx0TXTxvQIEIB
	 Qk8TdOCyZ0JufW66pkBoag7EZJhPvBDrmCaoieC0vQqAZGpC6RSBLSqj+ZrdG4KCoNRln
	 Hs0In/PGKUkrXnQu/z4n5ese9ej99PlBFtt0ZQ5Os1Zsve2wSkAIx4vam3v7VgOFB2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598971;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=r+LdBIHCx3xFpmmXmfjQ7dIttrGlXH189zCxedD97ds=;
	b=KD/mWJzndQ9T27ewHE4CEfqDXXu1WhkHfjk6fjxxp99W1Gij14Tutw6bowjIZ+sb5O+9
	 jBoem2xt1RvRP1+zr6BxovKCsKTEPtAmpQZNUQfRA+zMrJ7Lv57Lnkwl596reYVWbhYPm
	 gpT5ZAVdC0ueDON4NefI2D7kzUuNMWtrRP6g2LGUS9cOqIUwJH1tgAE9WYHShIUEEENJo
	 fN6ktcy3/OfQwkWR8ug8v3vPJl90h/j5C2wyBJ/WsR8K5dQIwxAnebMhX3Cwq0n1b2BZu
	 ypcGQjLg60kek+YMhEBoZAEGXhp0n7kcfRk6byvo2fGBKoL2wQrnmtsCrh2jOVI96gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=UMGOGZ8x;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD250606A32D;
	Mon,  2 Nov 2026 05:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD250606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=UMGOGZ8x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793598969;
	bh=OTJpLPCmzjTmOMJFVx8CmZ3zTYbaVKxIVqjlCu9jqoY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UMGOGZ8xezOlEO2UP5GToUiRshdD2dkWlNAm7Lyo5tfUArAUx1P28NpTnjNPKWmXs
	 UszUzJxy57ASoRl1A3gwW0m+GTK+Us/sPjkGvytYghm4POP1K7dEP5LoJ5bvP1fGvZ
	 OS0g1sF3gEt8NDcUtNzb0/YzRCwqU3SpwMKCf8nc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Nov 2026 03:14:16 +0000
Subject: [PATCH 1/3] tools/build: Deduplicate the descend commands
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-kbuild-descend-spam-v1-1-caff4f840cb7@weissschuh.net>
References: <20261102-kbuild-descend-spam-v1-0-caff4f840cb7@weissschuh.net>
In-Reply-To: <20261102-kbuild-descend-spam-v1-0-caff4f840cb7@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793589258; l=1455;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=OTJpLPCmzjTmOMJFVx8CmZ3zTYbaVKxIVqjlCu9jqoY=;
 b=eeu8I6/uK2WaoO6ZRqTctDWHR0UC2uqdSy86G8eLFZqOIH1nGtH4N5OtbuzKgs9CbSmdHV5tl
 A71INdIE4i5BCXRBdt9a+kuuXf85wny34HwuIl8hWIShCe6c141SCW7
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The verbose and non-verbose variants of the descend command are nearly
identical. Only the 'echo DESCEND' is different.

Simplify the variable definitions to be more similar to the other QUIET
commands.

This will also simplify some other changes down the line.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/scripts/Makefile.include | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 378387f62960..db989830bbac 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -206,7 +206,7 @@ export quiet Q
 # Call by doing: $(call descend,directory[,target])
 #
 descend = \
-	+mkdir -p $(OUTPUT)$(1) && \
+	+$(QUIET_DESCEND)mkdir -p $(OUTPUT)$(1) && \
 	$(MAKE) $(COMMAND_O) subdir=$(if $(subdir),$(subdir)/$(1),$(1)) $(PRINT_DIR) -C $(1) $(2)
 
 QUIET_SUBDIR0  = +$(MAKE) $(COMMAND_O) -C # space to separate -C and subdir
@@ -229,10 +229,7 @@ ifneq ($(silent),1)
 	QUIET_BISON    = @echo '  BISON   '$@;
 	QUIET_GENSKEL  = @echo '  GENSKEL '$@;
 
-	descend = \
-		+@echo	       '  DESCEND '$(1); \
-		mkdir -p $(OUTPUT)$(1) && \
-		$(MAKE) $(COMMAND_O) subdir=$(if $(subdir),$(subdir)/$(1),$(1)) $(PRINT_DIR) -C $(1) $(2)
+	QUIET_DESCEND  = @echo '  DESCEND '$(1);
 
 	QUIET_CLEAN    = @printf '  CLEAN   %s\n' $1;
 	QUIET_INSTALL  = @printf '  INSTALL %s\n' $1;

-- 
2.56.0


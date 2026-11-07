Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794020580;
	b=gv5oetg5lePhdcrE7TDtOpuYF9alAIvJ/cwnSRFUKrWSZrKZEaNqhFyIKtkxa4MMu5Vu
	 Npbs9/F1bYzQ0h3jAecVrqAYzbZyqcsF5hIu992jg/14Efqa3wL4Lv0JiF9TjMI3s4DoZ
	 tkgtDejdz+YeckRvs3MmMH0WuJVurT9lQUX56hMAl7fpMyGxJnW1RwcZ8cBmEe2hQgf/T
	 /66eeyUHwy1JPmhvdNewB1P+jFY5zcUFQ7foDKBJuJxsXcsryKBe79lLGe/JRmprGtHPi
	 AJNuoSf4EjPqf7Iw1pQe5qS6ZqdkT13UXtTOiHvwYreoAByt14IiRTHm0kevwwIblhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794020580;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IyaTerL6SIF13flTtdJdgsGi9Rvs4gARRqflhHbGjjo=;
	b=aBSHmEawQTIgHI/B5MAcTETP0Eq7quto1xBC2toOxdpWl/nKFO+/Otbwra86M4eVZjqA
	 W1NxScNz9zb30WYfmMgV+nlRgApgYJY54DdVl0W0tRl7IacUov4iho7XyBgPy8apAhNHQ
	 DZ0YcESdqiSE6Jxpy6nTRoMAzBAIN/1ijTASM1rJBaqGU5W/boYOPYu9PpRE7rfr0Bdx6
	 b2PBUPW5/g+CiQKYYxXfJo3ZSuGkX0sN/Xm9QSnxdJIhtC8/3ZmRLb9TYa8EjnMSWEaet
	 fZ8K0DvoJZdjOt9oR8Z+fAmzKg4NHbid9WzwHcMGXyLPAuuPpg+SmMByV/u+pg4H24w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Sk5FrLGl;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC772606A32E;
	Sat,  7 Nov 2026 03:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC772606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Sk5FrLGl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1794020576;
	bh=2s1wXcfqtZ1wiVSdOmQG6qdtEhMMmBn8eLlezshVNC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Sk5FrLGlwdi7Eng42dbyXbSaNUfz6fjv/eIhOU08P8mSv9LSzsi+wngcLb0r6B+PP
	 X7y/B+hPuxMO32l/Nd9UJ1+kDGa6zGqtETQN8xUuoi7QWnHBz6OiaTU5scTC/eXnI4
	 UtpPa+iZSEJx3fMg0NtA3z5Sh/V1TMJk9T7W+mFo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 07 Nov 2026 03:02:42 +0000
Subject: [PATCH v2 2/3] tools/build: Deduplicate the descend commands
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
Message-Id: <20261107-kbuild-descend-spam-v2-2-3bb0a7c4781c@weissschuh.net>
References: <20261107-kbuild-descend-spam-v2-0-3bb0a7c4781c@weissschuh.net>
In-Reply-To: <20261107-kbuild-descend-spam-v2-0-3bb0a7c4781c@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794020572; l=1507;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=2s1wXcfqtZ1wiVSdOmQG6qdtEhMMmBn8eLlezshVNC0=;
 b=smpAJcsUioL9YStjfI2Ihb5Z6md0B3tLt9vIAlmYODfr/HqMbFpJsDi2ImYkgYcXRFXwLMobW
 L1F/819qnXTB+j+yQ7+wiAn9NF7BvzCAOC2dow/JUhedjGodAFBhmax
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The verbose and non-verbose variants of the descend command are nearly
identical. Only the 'echo DESCEND' is different.

Simplify the variable definitions to be more similar to the other QUIET
commands.

This will also simplify some other changes down the line.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
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


Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F96144104A;
	Tue, 31 Mar 2026 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979428; cv=none; b=kzb/jbabi5Oqu+aR5zjcr4YFzBaqRURYQ6OuFs6pK8KREV0h/dn/00v4neFyDS1dGUNFZGCWQ6kyv4qhv7eBcXYGZhWQjhaipRDbOCYz4ZZMgnIO6DdmClBXu6+YKYUH7c/bnre0yVEDsABUJsvcqEEH9L3dvHU6YgxW+Y5CUD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979428; c=relaxed/simple;
	bh=XTirIw7OA61K/pbNm/EBjxlIXQQ7QLwfVEKluNH8ph8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oHreDs3XGfqM8beDYRoHKMF7SOEkCCImL5Enu9HkrmV2yhATAVCHxpMAbAESbsvFqYhxW3m9rinFCXgJhcXcp9lVe8ot3IDH/RD6Wn8tg7KGKsIrmsPyXnMDBCXA2a7bduC5eiZVLHnqLiQcXS/8bBaYmcTB2G/57/FhDeJksTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=pW50rJoU; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="pW50rJoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774979424;
	bh=XTirIw7OA61K/pbNm/EBjxlIXQQ7QLwfVEKluNH8ph8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pW50rJoU8Xi8TSHEDQHGLcfdT6TtmGyp7p5yXiQ7lbPioVWoiyqmcEGeFFp4kQwEi
	 m2s2gJdhXMT+7D47kGqQzEIjnlA1AMO4AeziBEFwhRivJkmd0sv4XXMBxsQOZUUQIa
	 NAX1fL6eIC7earB/Ij/rz4cj7i1A9czFmkQQka20=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 31 Mar 2026 19:50:20 +0200
Subject: [PATCH v2 2/4] kbuild: vdso_install: hide readelf warnings
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260331-kbuild-vdso-install-v2-2-606d0dc6beca@weissschuh.net>
References: <20260331-kbuild-vdso-install-v2-0-606d0dc6beca@weissschuh.net>
In-Reply-To: <20260331-kbuild-vdso-install-v2-0-606d0dc6beca@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774979424; l=1188;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=XTirIw7OA61K/pbNm/EBjxlIXQQ7QLwfVEKluNH8ph8=;
 b=hxqP7wHXnv2iV/2tiMBULn/aCpu5wcwkT5lwnH6zfBoeXLSFIjvtJ2NvpyVbkkiO8hqjrMevI
 RqADFn8rkmgCOA1XTjO1kkHcwowtR4PVF2UriftD2wXB2U+9jZN33Fb
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

If 'readelf -n' encounters a note it does not recognize it emits a
warning. This for example happens when inspecting a compat vDSO for
which the main kernel toolchain was not used.
However the relevant build ID note is always readable, so the
warnings are pointless.

Hide the warnings to make it possible to extract build IDs for more
architectures in the future.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---
 scripts/Makefile.vdsoinst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.vdsoinst b/scripts/Makefile.vdsoinst
index 214c561651cf..aed153b3120b 100644
--- a/scripts/Makefile.vdsoinst
+++ b/scripts/Makefile.vdsoinst
@@ -21,7 +21,7 @@ $$(dest): $(1) FORCE
 
 # Some architectures create .build-id symlinks
 ifneq ($(filter arm s390 sparc x86, $(SRCARCH)),)
-build-id-file := $$(shell $(READELF) -n $(1) | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
+build-id-file := $$(shell $(READELF) -n $(1) 2>/dev/null | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
 link := $(install-dir)/.build-id/$$(build-id-file).debug
 
 __default: $$(link)

-- 
2.53.0


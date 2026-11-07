Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794020580;
	b=Vcbo0kUwEAOZOch57hz6uqOt5APvoT6eypzaTo/z2bnNMLw8jM+b35y8OvaF1sopyVP6
	 mpWN6pWU/dxpFQX2kwKPNfISd4mB3OsQCSfA2ZdmpI5rV1CUbdcR/jFQ5mKPGJMFs2HKI
	 OQWdqoXxrGLOPak2s0oyLByNQ0AP5Xs+hO/QgRYNeGti2/4qXiK5kaq6rxHR+1pzAogcT
	 GzSI5wyfcSwhYSnCRslZiI2M4GHKYhJl9/kDKhRgmIq3Bjey7moye0Iq4qXogTcNv6n3I
	 RvupY5ZE4o01cxsxWhur+4sfbds5owMUoDMYwrEEC6r4t0k6hIGYbSpe1FFo1jji5oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794020580;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wy+EDNei9XsqCsduTUUsrguwCA7sl6+LEMlfZfHGE7Q=;
	b=bzWGh2OPt7M4oCMNv+vMZm/9n7jafQQ9BNDxNdeeDPLaUTKM6XVxcXHJyQKQkRcewOXw
	 lb5E579vY+Hd4T2O5BsWXGjTvy4RiAZjDxWCX9D2iHEzllKekgYq3ZPQQHNlqwh7t8Xix
	 P5MM2dr3E/y4ylpyETBtl4O8jChnDZepoEzLTqKCm93D0ioz0gUNQ5NI5J4vYAzm3U9+2
	 Jh4i6eE7Uqv7WIpEIzxcLm17gPtRFm6o9lIrphldcORqh6Qbxv2T8DaVZhVJqpAM+XfzP
	 m7GkZwrsb8kWtyWguBrvFRE9iRX+iGlTj8WvGycOTvCRO6FRJI8OT5Pcml7JGrckwJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=oligjS7l;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC599606A326;
	Sat,  7 Nov 2026 03:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC599606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=oligjS7l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1794020576;
	bh=jpllCCCk7eP+N4wSvJm7MHZQtvtUacXCDBmehYx0NdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oligjS7ldjOBICy5J/T1xLSkAiQqSiiZc5yEuKp2+DD0dO0cbtTYmpcRMRpczOI5h
	 Q87bbxzqAhq0rCEVvOEFsPSACOMVyaaN/YvqUYDGkS6gb+ZAXcMLIYJGNcOmvliSQ1
	 qhrBUlI606SyhF1IqjuplckzXty+yBno62WOFsnk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 07 Nov 2026 03:02:41 +0000
Subject: [PATCH v2 1/3] kbuild: drop the tools/ target
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
Message-Id: <20261107-kbuild-descend-spam-v2-1-3bb0a7c4781c@weissschuh.net>
References: <20261107-kbuild-descend-spam-v2-0-3bb0a7c4781c@weissschuh.net>
In-Reply-To: <20261107-kbuild-descend-spam-v2-0-3bb0a7c4781c@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794020572; l=987;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=jpllCCCk7eP+N4wSvJm7MHZQtvtUacXCDBmehYx0NdI=;
 b=hp9vwju7d/8a+oQ1vBPbyoPJeIIXH82nRIEgTL9NM2IcBuFHlrjLXmD+bSVmi30mL6zVtrDKg
 lj1rqrIN6rgArpFlR1uyw4aW1rhAJ7v4hETo1kt5vS0P6My8sGlXE42
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The target is unusable as it gets overridden by the $(single-no-ko)
target. The only thing it would do is to print the help message.

$ make tools/
Makefile:2218: warning: overriding recipe for target 'tools/'
Makefile:1639: warning: ignoring old recipe for target 'tools/'

Drop the target.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Makefile b/Makefile
index f895752d4b05..d73f2bbd3b93 100644
--- a/Makefile
+++ b/Makefile
@@ -1635,10 +1635,6 @@ ifneq ($(wildcard $(bootconfig_O)),)
 	$(Q)$(MAKE) -sC $(srctree)/tools/bootconfig O=$(bootconfig_O) clean
 endif
 
-tools/: FORCE
-	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/
-
 tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
 	$(Q)$(MAKE) O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ $*

-- 
2.56.0


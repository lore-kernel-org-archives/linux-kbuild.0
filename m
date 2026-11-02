Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598952;
	b=2ARHwtZIDUoWjaLHj9YoBOdh5+z3XToyG5CYWAMq+3PVrVcgot8CM9z6gVUmqhXG41re
	 pzndtaykuCtFb1q1PpOc45cAUozumLVqwcMIsawBC+FIn0XNREFzry1EdqX0Vaanzn8/K
	 a0J+B9Vhl+3XoyBsvFwUlX+uOGE9Hwu7ij0H6azvIj4ZOE58qmN/fpzZPibpAAMRoYyfn
	 5BGYDDrEu015Jzujt5ALkaE3956GDFI5Z1pvmS0Q8XkmPHfaYFvN/MgXk3R4NoVq+nN3w
	 yvZzZgsLHg1BXth45vn2ipmKQFsHsDUURAS7VNpMN/jEH3Io0cumu7v3lDVtLT0RShg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598952;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ofZITKnZHt6OhmIp+/NDLoD0PCymmafa2UY40Z9KkC0=;
	b=yDgWCxIFFYdPD7WFQedMetkqlRuTclGZ2iHZcOdnYhfxiPPSXPpDs+gMFzQKk7pWgxOP
	 gY15QwvGwDefTjuIV/AwS/mupK98TaY7pzH9V+QytnhA5K8jbCJcF2rQjEDj3ROGhe6kZ
	 1rzzC7pxRp/OEmNzg2LtWq+uH8Hqk8J3zJ6q1p17BYs+6WmWG8t99UCtVAEVv7Epawu0T
	 Mwdn190c94Iu7zcR4U6pDCvLcED3razvl5KWkL/0K2U/gLdSoAitt601HV5+mdPkAmnRe
	 +oyTVc3rWaXFRmJNR3Kyu0QxddtqWlC3e+ubCqEIpFgJXWcRX0ZdQ2twQp9oohzb2LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=pOeKWCiu;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57723606A326;
	Mon,  2 Nov 2026 05:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57723606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=pOeKWCiu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793598949;
	bh=lm6TXqySjpg6QXUXbUCr8WoZ9qfbbbmvbkIXwpTBuc0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pOeKWCiuL1g0y9ROHgljmbpHqwbcbzXDTxexbhpCRds/mEi5mxMfUIYlSuqVdYLm3
	 YUKt7X0NQitwIjqV79Rj1yzZccHMs+W0JeWSA/k5Izyh08QwKxZpjv2IRau6oE/S2j
	 pFvzORdC8hXafT2/XP400bqt9FzibbmBSxX3zXgM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Nov 2026 03:14:17 +0000
Subject: [PATCH 2/3] kbuild: drop the tools/ target
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
Message-Id: <20261102-kbuild-descend-spam-v1-2-caff4f840cb7@weissschuh.net>
References: <20261102-kbuild-descend-spam-v1-0-caff4f840cb7@weissschuh.net>
In-Reply-To: <20261102-kbuild-descend-spam-v1-0-caff4f840cb7@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793589258; l=935;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=lm6TXqySjpg6QXUXbUCr8WoZ9qfbbbmvbkIXwpTBuc0=;
 b=UUnO48NSZOkEfMVcWZk+NRniGzwKDJtdQsCuTa+/LC9O5yW+yqMxZfy8pdqXWRNJl27bTvYYv
 ldIsZS9jmFrC5LiFnXCANtfe2uxQQGPCjOZK2aCPFDmpg9DlCpYXOn0
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The target is unusable as it gets overridden by the $(single-no-ko)
target. The only thing it would do is to print the help message.

$ make tools/
Makefile:2218: warning: overriding recipe for target 'tools/'
Makefile:1639: warning: ignoring old recipe for target 'tools/'

Drop the target.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
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


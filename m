Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598952;
	b=ENHGCKuAZXi9lT4+ns9m218EYnqCtwD/gmT0nVCc8g9Aq5cCUo0INg28stAKww/aclcS
	 3R8B/FCDJV/l8L0Jbexl80KzddtAerIHnf4328NpQyDvI3OB6bZlV89d/ga3++twXThRl
	 IYMMT4ViEAx5QYaQ3f3p+vKX1WNs2P5BstoYcGjmNF3esqkiwSw12sIrQTizybgHUQNki
	 xTa/5X73l9hwmmlT7qzY6UcwmE9F22CmQoU3DAfATFFLTOtmIPFnNdszkSZvRCwQXn8SM
	 GuG/zimbipB/gqmwc+csTjHRqIbBezGwDHLRTdS4FMra092P4964gz+6nl/XuSDx43A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598952;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JHByF96EKSIoVsdQi8G5q09GiPqqurL2ib80bTej1h8=;
	b=DcDMggNH0Fu7U0t67nTHETaWV/YCMVqtd5NywKDUKMHyOzrWZ+ai/SWAwyGjkF44OtCs
	 GTRRBQIzPyz9zMUyJNmYDLCFYn75Oy4KXmZJsDPYAqKboYiIMRTDNIA2sViTscZ/LwvaJ
	 IH6oLwLKV+niue60sKGZt+5372HyXkOPX4UqCDLWmXHeKbbOY9P2cyNnLQCFfS7voRp+a
	 mXv5fVwnyzLo0ZR6s36Zr5Yu642HcldG7VBy6H46fh3YmwVRcsv52RIwjnHwPkt4/yKA+
	 exq9E4QGsipI15vF/oQN9ZCOQobGiuIsu9W/VYTJ+TtrmilxDgcvwR0AQ9tx1zcSXJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=pZ279vfU;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5769A606A324;
	Mon,  2 Nov 2026 05:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5769A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=pZ279vfU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793598949;
	bh=Z5rxD5BAOexdrIzNN47Xa8R3Y5mZeKms2ski/bU8UJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pZ279vfUa2B9JdgFEQvOoEFgr8Z1gAKDMzSTCcgnhPr4/le47MB7XsLs/MSZA3O02
	 7XTvtjKR7dwwVJSZRQlPIxIwAcoRPhWW/PtzLjx5n5i+9dDiZocLjtiaFGBNvgJhOO
	 uDHhff0lfVtijfTwG8kVs4s1iEHMUET8ZLcET++0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Nov 2026 03:14:18 +0000
Subject: [PATCH 3/3] kbuild: don't print DESCEND messages from tools/ build
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
Message-Id: <20261102-kbuild-descend-spam-v1-3-caff4f840cb7@weissschuh.net>
References: <20261102-kbuild-descend-spam-v1-0-caff4f840cb7@weissschuh.net>
In-Reply-To: <20261102-kbuild-descend-spam-v1-0-caff4f840cb7@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793589258; l=901;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Z5rxD5BAOexdrIzNN47Xa8R3Y5mZeKms2ski/bU8UJk=;
 b=DtW7RdjZhDkdpGKJP9ZYYxI7gkLLdDZdD8LTZDRRuDTjZ6gEN8WXmZJ1dXyyth2owk3/KZfQr
 a2spkCBNpiiBVAvZAnZU8Rln4Z0JGY/AcsArMvmq7OtHxm2BM88wOaM
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

kbuild itself does not print the directories it descends into, the
tools/ build however does so. When kbuild executes the tools/ build
these messages are out of place.

Forward kbuild's behavior to the tools/ build:
Nothing is printed by default, the full command is printed with V=1.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d73f2bbd3b93..2bfe786bc284 100644
--- a/Makefile
+++ b/Makefile
@@ -1637,7 +1637,7 @@ endif
 
 tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ $*
+	$(Q)$(MAKE) O=$(abspath $(objtree)) QUIET_DESCEND=$(Q) subdir=tools -C $(srctree)/tools/ $*
 
 # ---------------------------------------------------------------------------
 # Kernel selftest

-- 
2.56.0


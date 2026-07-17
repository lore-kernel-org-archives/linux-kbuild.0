Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB94D2773C3;
	Fri, 17 Jul 2026 20:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318425; cv=none; b=GgaVvx/XQYO9Qvbe36f3IMd5gVRcsuz45qxbfw9yifK4WP83HdsD6twGPqbnTQbVTNoj9MVJTdF+U+L8IA7uxpBPxZq9DUJFfSRxORmzxN9fTlIqm1ZmeWey9UCPwD7TXwCCeRBSq6qwI6DaHdML5CHr4v56tCIistGL4AZEAPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318425; c=relaxed/simple;
	bh=Sj1D/q8Ne/UveYsM48w+ga6aEv5JTRSOvBNW2QlwS3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OldDpxn6xoLLGtsnL+06LIKfV0RC5+tCT0oiwsUMjhFDfKqoKAhqCAzxZdB74U3r92Z08lvV2DIbjKbm7dKlGgmQqpuHJdT+hXarLfF/63/PcqeJ1YaglzWedE6THc/yqLvSAeL5/SiN07jP9jOPMpBtxpNTlhshGkbqqWjTW5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=elc.moe; spf=pass smtp.mailfrom=elc.moe; dkim=pass (2048-bit key) header.d=elc.moe header.i=@elc.moe header.b=GJ8y04xs; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=elc.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=elc.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=elc.moe header.i=@elc.moe header.b="GJ8y04xs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elc.moe;
	s=protonmail; t=1784318418; x=1784577618;
	bh=2lC8cAkV3puOxL86BXLZW1BX5KpevTFyAdcIBPWl2p0=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GJ8y04xsv0lGqgWN4ywDG6Tnhsb5oNGap+eGvDm17w8TV0ItpWON1MXJxRfAQ+2Y9
	 RXwv3s+O9szLL2GDTaEwMK1GrVfwGIPHd4utgn0IK7vSxBtfNvedZsx44sGPWgM0mX
	 aA//IIO8DQaSoa8ppHUqfs4tV0D11O5QKPRJu/sJQi6k6WvdOqtGHud6jXcN2DNOoO
	 eeyKfoEQEkF8kf6v8lCe+aWDpyxXz2c0IoBUNI8sOJGiKkIjcMxo4B6S35G2bNt/jP
	 OPjl0f1gb+xAwwPtrcA23iHdGnRduOdrWrRuRSRCjW1ATbECwXv3c70VAEYijP2Nfj
	 fHpGNNsbseHiw==
X-Pm-Submission-Id: 4h213g5ZhCz1DFFL
From: Elsie Heck <its@elc.moe>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elsie Heck <its@elc.moe>
Subject: [PATCH] fixdep: make gendered language gender-neutral
Date: Fri, 17 Jul 2026 13:59:39 -0600
Message-ID: <20260717195939.25130-1-its@elc.moe>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix awkward phrasing and change instances of gendered language
to gender-neutral in code comments to improve consistency and clarity.

Signed-off-by: Elsie Heck <its@elc.moe>
---
 scripts/basic/fixdep.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index cdd5da7e009b..54063d980442 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -15,13 +15,13 @@
  * gcc produces a very nice and correct list of dependencies which
  * tells make when to remake a file.
  *
- * To use this list as-is however has the drawback that virtually
+ * However, to use this list as-is has the drawback that virtually
  * every file in the kernel includes autoconf.h.
  *
  * If the user re-runs make *config, autoconf.h will be
  * regenerated.  make notices that and will rebuild every file which
  * includes autoconf.h, i.e. basically all files. This is extremely
- * annoying if the user just changed CONFIG_HIS_DRIVER from n to m.
+ * annoying if the user just changed CONFIG_USER_DRIVER from n to m.
  *
  * So we play the same trick that "mkdep" played before. We replace
  * the dependency on autoconf.h by a dependency on every config
@@ -33,9 +33,9 @@
  * which then let make pick up the changes and the files that use
  * the config symbols are rebuilt.
  *
- * So if the user changes his CONFIG_HIS_DRIVER option, only the objects
- * which depend on "include/config/HIS_DRIVER" will be rebuilt,
- * so most likely only his driver ;-)
+ * So if the user changes their CONFIG_USER_DRIVER option, only the objects
+ * which depend on "include/config/USER_DRIVER" will be rebuilt,
+ * so most likely only the user's driver ;-)
  *
  * The idea above dates, by the way, back to Michael E Chastain, AFAIK.
  *
-- 
2.55.0


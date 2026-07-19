Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7946727CB02
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Jul 2026 21:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495143; cv=none; b=lyIXiwqK3v9Uk3TkUaYjhgvmD5C6ELBkqaiHGL5jOZd2Zg83UuWnf+4OveATwsNUfb2GfiQL1ingMHHu0nMOTJxAr5eo6B+6QAeh1ou3rjmNAZBVYVhjy/XtSBoFpGoeLECZmQRyLHUwBYgI5VjPqldMbmUzT46aqNDtirwTGGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495143; c=relaxed/simple;
	bh=1P9Hd6ezEBl9WQsiNqmriFpwaDrqjSs1dESUUVgFAD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=omC6tSV15A0/E+pBXk0XItmGRFh/vKJDXGeAK9XfDX+4kPInAFQlMlgWGTOaknUT6jPjdzKWidbbvkvdVazzMFlCi1nWJPGZ8LRiP1mNq/YOi7iBTXblEG3dmHK4C34RgiYYEZ9KXqGmwk8lIBtY0uPnVaKrlAq4I5Kk84ngFmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWIIg1lz; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWIIg1lz"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5218927884fso31378291cf.3
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Jul 2026 14:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495140; x=1785099940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRaWfs2WFc9cpQSmahMDD6lM02smJGJe06JS/ZAZPC8=;
        b=lWIIg1lzivOX0odXHrngVDvffPrXvifiLuWNMQ1ynIeaMLOWkEyy0xJbZGkLS5ThAl
         bgH4X4nd0tOmCEGozxK2KoNuN1PXw1AuD/s87apMBHsP7LQzhWSJ2EWX4QmimI8OcuB4
         YgG41myzBgGcHatmFH8bGYcpH8jH6cwFaqh0Yt/9soPOrvEng0ay73o2N37OjBCHq+lC
         EPHJODE3CLDHpTJY02fpMT+F4VlDvqpIHjTVbfewyMYgfZkUx/u4UbMngbALQ4DZ2Ym9
         JO7116g36xbeHXCgsSCC7YBIjgRV7asYID5md9/tGVFO94egrv0XydFPS3+fYpopiK/X
         SQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495140; x=1785099940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fRaWfs2WFc9cpQSmahMDD6lM02smJGJe06JS/ZAZPC8=;
        b=BapAFbkuOk+m6Qz40pXmu1clD1aLSn9A4dx3k8rO1btCH4TX+15WwFojSMxdXcqrDV
         /nzApwdCegSOrvaQPL1X69SzQ1hTiaeDvNm/MLZdzntCs4foMl0SFQCNGCxRmzwzI0+N
         LkfpQ1jjl+Re+FlhLnqHiHuDJpDaOhnoEB6K0YBf3elrCgJFcrHGHeTJPOI1gfWs84/e
         nbhzyhEiYLbbhW8MYdUG+0MuB0EY97w/3VXiow67kv/VQWvthDKAh89o88Z2whE6pNn/
         BgnjgX84HcgmvMc7oakkRREC8OnH8e4y8ZUJ7OXcCSIlNoYQZ/Co51jm3uLA+ZgZcUwq
         U2Hw==
X-Forwarded-Encrypted: i=1; AHgh+RpOkuSksfY87BhfUXdwXxgegoZToSj4EdFC1llloMCGegCUgp7FQIycp8DVFcDTq6xUon3+N48AHwfdMzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgR+ZuAQ1NIJnxCy0c9p2EiefOX2Gye6TqKtva90yZDzQpaZeS
	1BBwo0VoyX3nrd7V2/vmk6BOrm1B0OryOsI9jCw5FX1e9QtJBix17RFe
X-Gm-Gg: AfdE7ck0YxY1c1UQ1J8UuY5mNWYIaTcUh81euqIw4Ktgn/sBrjNj8DSDd/U8lgqN/r4
	zAExET93L7EkQua9goX/23hfKsaXcyG5dzH/xE83pYgnkT+PMmMwLn6sIrV8vi6fgrBzECx4q+s
	uVPFsjFKVfe+WtcRm5yISgSv4wnr53bDGpkQiaz1XA3l5KSsKuOH8vQWvOk2iq2/w1AyE0pnM73
	PpIVxfR4by+2+oe/kRwwsz+G74dlSDCLkyDuGj7FJs7hch5Ojx7fN2Z/sP2ATNGtB1Ourih56f5
	3Rk7D3+94HO9INkFulmmkVBA0vuRqHTFGCTms4XowAPuxLM/xEuk8p1X/I8XSvnvfePK2qsp23a
	NlrDIJMk4jc0MMlVP9TNlYrTiWM7MtGw89BtQY6VqnIv3gfneZl2eOQKc4GdFnePJ6cvCM0R/GS
	U5mYFrVNUOaIaK7CJ9KfYvTnuBeGm5mig1jJNk8t2B7Q==
X-Received: by 2002:ac8:5981:0:b0:51c:1a46:9148 with SMTP id d75a77b69052e-5213ae5518amr101580221cf.34.1784495140287;
        Sun, 19 Jul 2026 14:05:40 -0700 (PDT)
Received: from nixos-office ([2607:fb91:1cc6:2a6c:d187:51f2:53b0:1c0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm59695051cf.0.2026.07.19.14.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:05:39 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: vegard.nossum@oracle.com,
	kees@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] kconfig: fix minor typos in comments
Date: Sun, 19 Jul 2026 22:05:36 +0100
Message-ID: <20260719210536.9577-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some typos I noticed:
1. expressoin -> expression
2. A property represent -> A property represents

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/expr.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 5f900d18dae0..fa3823a97d72 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -38,7 +38,7 @@ union expr_data {
  * struct expr - expression
  *
  * @node:  link node for the hash table
- * @type:  expressoin type
+ * @type:  expression type
  * @val: calculated tristate value
  * @val_is_valid: indicate whether the value is valid
  * @left:  left node
@@ -160,7 +160,7 @@ struct symbol {
 
 #define SYMBOL_MAXLENGTH	256
 
-/* A property represent the config options that can be associated
+/* A property represents the config options that can be associated
  * with a config "symbol".
  * Sample:
  * config FOO
-- 
2.54.0


Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29EB4A43EC
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 21:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506921; cv=none; b=IbToyzfl8Le1QOImWeTd6952vK3GvcyTrGYLSW/tGW0Uyv0suzppi9hkQEdU4wZ464sENx6thTY+yZ4471gRGaF/UCRSGbt3ffH1Op2xPNiU1n1kOHjPS3AkXZIWc4akegNMmvfomVQINdgwkP8Ozcmc6rgz3UFdr4PRA0ZHNd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506921; c=relaxed/simple;
	bh=R9MpoArkbHIg3SaeDJtk9ZD6FPf22CQrSgvl16eoetE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sK2R7d99BhmcP+d12rOOwZaobwc8C7Lghb9euJexa+tFdnldY40cWFlG9U+MoEwZNza7nlT6LJJnOGfDm4uWqy3abLSVCtdekUbwT2jg6qxbSzmamG++46uj0rg5ARFVBQtf7ccKE3DWBdZj3RXc3M3Ij5CuXDd2I45IhbkenAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJJG6y4f; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJJG6y4f"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso738915e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 14:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506918; x=1790111718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7p1LDWrlveId4m1yDuiZZyPI5rbWZo/B9PJF7MZPH1U=;
        b=PJJG6y4fB8XLSEZtepYT+qMXiC+5qehbjZskCsb/DaNZVGbSlXBN4rT6AoZ39Fyy+F
         ro1vw9vDw/iHWcIt8FEF3qYAwP/lEPGxfUQjVkC8Cx7PKVqDx/jKpJkzwW3pl6CgPkBZ
         ZO/smA/DH39qJRpxeDWCdnd6jMeSPeYuafXCi8fj2mNXdufcOj4cM3llgDm82XoXjM39
         KhDx7gF+dPXsJUd/8XOWsAQjK7UIMmOnZbX5EABKKUPYppOSK6Pr5D1itXU/lD0T1wU0
         /iGfFZRP+PYElhU+u/zd4QW+E8L3tW1PABiK+/GVqFlnkosaDO4nutn+FdnzKsUpzHwC
         TIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506918; x=1790111718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7p1LDWrlveId4m1yDuiZZyPI5rbWZo/B9PJF7MZPH1U=;
        b=DiSpVwIDnfqO2etuhN2lzDXZQXAzB0dF066n/3mBnfq1+ONKWIod149EuHq/kziJ2F
         PeC96nQa/3g/xuDuz1EEusww4sADTDoWMmvR/0i9c+sJbX/aMc4Dr3A4bC2cb9SQjeJH
         YSgpdmdhRh9qPFMVRaz824SIuUdMHqe72511/eKecFafcg98/ArSqQwEcvSDLJUd32jT
         OaLUCJhnuATnqQPZ0bHqxGgwBtuIqX8TP5mYHLQP7OQfEWfIRZYNyBRJUSng8a4nXysO
         AmJm4YOP97JaDZQIv+jL/f10l3YUm17su2RqOQ5XannbymQwwWKnfryNscey0sTFFJbG
         FFaA==
X-Forwarded-Encrypted: i=1; AKwUvBwpkw/1wXkjgcjPcSjfNCyj7K20/R9w+yfm5CkjhcK1oqml1fBaCxO2HrGRbtLmvUMqtXRc+XNzmgPMAKA=@vger.kernel.org
X-Gm-Message-State: AFuF++lX/1TLK/VkFZRKx4q7jWkOTVbcJLg3jWut7PuHiTNRvpqLp6Wc
	9oazsC0T0DIvrqjrmQS1KfxYJQxNpb6SGcN7w+yUEUGIC/fQRA1Zx42V
X-Gm-Gg: AYBFou23rTroGP4QSXM+b9I/kXpHOLQAG1u7lEeEzbmK+Jbh2IhOQa6NII6a0S6EqwR
	qpcTgVLABnl0DhjJydR+23pwwxkf09saudYx8O1CDJl7XdUdT8n5dGV3IG6cMmeGtZxn7p5l5LH
	e3/TmIUcoU+SYJMGjJ6/uMr+H19GTr2h2BCLxJ98hBC+S0psHZgtLlYC5NCjmZIlQFnmo/s02oU
	PADPCcSKJu4h/u26BxmANgmTBdoiA2ciP0VKkwFDThPaTBpPckykHhGKVqNzPwCqPIVw51h7vQV
	KWp2o0Vn4fRzDbUh34Jw5zhcwKGlb62eoknj3Encs31Db2LTl9lJARP3rOuHCJnqZwLKDHQDZ7p
	Db3oQuFF7TUqaB9y6ngoBwEUy3hxHLaXdspfZ8B1w9rLck4C59qmgUvLeaUc0PwFwdvqNteeBYg
	4kq1boSM+6fbzBQfVBdSCJ+xyK9lmSEjoI+yg5exM5B6M0tYe29jpeVZxlzVoMFIZKM552FLVvO
	0vOPUmv73g1O3wxhNFg9qSIRVfyEtDAg7JU
X-Received: by 2002:a05:600c:4f08:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-49e9666ba5emr59375e9.6.1789506917972;
        Tue, 15 Sep 2026 14:15:17 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e962:d100:b3c:e4b2:2d5f:e949])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b1ba9bsm24804695e9.15.2026.09.15.14.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:15:17 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	kees@kernel.org,
	pengpeng@iscas.ac.cn,
	vegard.nossum@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 3/5] kconfig: check for hex and int mismatches
Date: Tue, 15 Sep 2026 22:15:06 +0100
Message-ID: <20260915211508.291790-4-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915211508.291790-1-julianbraha@gmail.com>
References: <20260915211508.291790-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using a numeric option of one type (e.g. 'int') to determine the value of
a different numeric type (e.g. 'hex') currently fails silently in various
ways if attempted, because the underlying string representation is naively
reused.

Example 1:

  config I
    int
    default -1

  config HEX_DEFAULT_INT
    hex
    default I

Here, HEX_DEFAULT_INT actually gets set to '0x-1', which is of course not
a valid hex value.

Example 2:

  config H
    hex
    default A

  config INT_DEFAULT_HEX
    int
    default H

Here, INT_DEFAULT_HEX actually gets set to 'A', without even converting
into the base-10 equivalent of 10. This value, 'A', is otherwise a
rejected int value if entered in the frontend, or read in from an existing
.config file.

These int-hex mismatches currently do not appear anywhere in the tree, so
it is already safe to make these error out.

Assisted-by: LLM
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/menu.c                        |  2 +-
 .../kconfig/tests/err_num_mismatch/Kconfig    | 38 +++++++++++++++++++
 .../tests/err_num_mismatch/__init__.py        |  9 +++++
 .../tests/err_num_mismatch/expected_stderr    |  4 ++
 4 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/expected_stderr

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index ede791a2fe1b..2d8b0c65ce1e 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -244,7 +244,7 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
 	if (sym->type != S_INT && sym->type != S_HEX)
 		return 0;
 
-	if (sym2->type == S_INT || sym2->type == S_HEX)
+	if (sym2->type == sym->type)
 		return 0;
 
 	if (sym2->type != S_UNKNOWN ||
diff --git a/scripts/kconfig/tests/err_num_mismatch/Kconfig b/scripts/kconfig/tests/err_num_mismatch/Kconfig
new file mode 100644
index 000000000000..8406f3bb6419
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_mismatch/Kconfig
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+# Test 'int' and 'hex' symbols that reference each other
+
+config INT_SOURCE
+	int
+
+config HEX_SOURCE
+	hex
+
+# 'hex' reference from 'int'
+
+config INT_DEFAULT_HEX
+	int
+	default HEX_SOURCE
+
+config INT_RANGE_HEX
+	int
+	range HEX_SOURCE 1
+
+# A hex symbol must not reference an int symbol
+
+config HEX_DEFAULT_INT
+	hex
+	default INT_SOURCE
+
+config HEX_RANGE_INT
+	hex
+	range INT_SOURCE 0x1
+
+# Referencing the same type is valid
+
+config INT_FROM_INT
+	int
+	default INT_SOURCE
+
+config HEX_FROM_HEX
+	hex
+	range 0 HEX_SOURCE
diff --git a/scripts/kconfig/tests/err_num_mismatch/__init__.py b/scripts/kconfig/tests/err_num_mismatch/__init__.py
new file mode 100644
index 000000000000..275f2a6e9a5b
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_mismatch/__init__.py
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Reject direct references ('default' or 'range') between int and hex options.
+"""
+
+
+def test(conf):
+    assert conf.olddefconfig() == 1
+    assert conf.stderr_matches('expected_stderr')
diff --git a/scripts/kconfig/tests/err_num_mismatch/expected_stderr b/scripts/kconfig/tests/err_num_mismatch/expected_stderr
new file mode 100644
index 000000000000..587c34467ae6
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_mismatch/expected_stderr
@@ -0,0 +1,4 @@
+Kconfig:14: error: 'HEX_SOURCE' is an invalid value for 'integer'
+Kconfig:18: error: 'HEX_SOURCE' is an invalid value for 'integer'
+Kconfig:24: error: 'INT_SOURCE' is an invalid value for 'hex'
+Kconfig:28: error: 'INT_SOURCE' is an invalid value for 'hex'
-- 
2.55.0


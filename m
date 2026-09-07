Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5603370EC
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Sep 2026 19:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810342; cv=none; b=PlxDJ0cY8VPwYCjSHTO/UCuh2q1c1H1LFnWWDLuUrOZCuW0Z90G6ck2ttXRrkHk+EGhCEnedpywldxPLWfTSFq6ahFx6CijPPBcMWRZoHpV5yMaQ/GK57cQ2mlh0wW1KTDarugAJ6ETJtgcr5KjldbHl1+qvNuN5n6hD08ph9ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810342; c=relaxed/simple;
	bh=D59uN3hb6OUrfBWQTzVc/dvluWreypRiHCj9LLgk/mk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DhnO2/1+AItjuohfBY29TRS5U5bC6d1mWes+qtrpUKHEr/3NQzZb6/dkTHNXREOK0oNMKApMSimYXFGIqusL+wNRVvAvVEpVuS9zPTVzrwRM6hphn1UIOidmwBwXVBG/ASX7EMA+g9z6okCKLva/90tH3xo7Wy/gO6EgmLkoiVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzUFgM7l; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzUFgM7l"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so4416756e87.1
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Sep 2026 12:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788810339; x=1789415139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ll4ggulsNvB7I0J5QtGC1K6MCslpOv0W/EO5Nph+pQc=;
        b=XzUFgM7l33PWVEI2ARFjbFeR6ad4w6T2eELthgMl3LhKxUZsEeC9HUWV6Bo0rQC7Lm
         In65ITnG0p8vFwUJ6a+0ObNnFh4yHznQFgnHLdJ/DYhi3dOtP+0kWcuuwOXj8M6lDX3e
         ZkgiZ7xo3BbNpyjSwTVqHm63218dsLwO1a8XbNxsh6RUaVfdxeO8hi5uA8VgDZKtZz2b
         aEnnIh2r7rhlQ2Ot02LStcXGmVkQI8+7kMv5BR59U/0a0x8yyQ2nihDoo69IQl+vXxFt
         OeuYoYLfKt7g8RJ/MezkQxoZlteKIlz4+alX7yAcieUWgUSNm/ODh7LTYgt5pjsSJEA9
         X5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788810339; x=1789415139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll4ggulsNvB7I0J5QtGC1K6MCslpOv0W/EO5Nph+pQc=;
        b=KyJ14ee6e1nTclRDKQMEpP0H8YhDTKWrpTt4eRi/Dq5kBOriKRUUEJ7ZbuicHmWtFB
         SBTwXTTthlZLIjBIEG1UhvYNfCn45QsD5xZ4/sxt/REivxJ135CNXBFJFKrxwc4VqNF3
         +sTTrgK5+/bImg0kw9Q5hi5tP+JNebdJwQzKl28oTFdWyQwnvlJWYhyNlhbrAQHttmIr
         NA2NxU416Gww1g78JfdjRh9h/At5IH5XNSm4bY8NBUU73DlFKK1Ad6oDRupG4ETkJuGw
         ha0P+3HXgiq+xyYrkQj5WVlYBFeWfORB+BW/uc7kLfFFOaIzOcnGhAXRjg9zrWz2DWap
         VPag==
X-Forwarded-Encrypted: i=1; AKwUvBxr8HAbiQdY2QbgLpFcvI9V529S2tpbuCC+aHroVmw5DKIXUPAVYKUOlDQ6ghXFfGVczZAbLO7QkHHzfQA=@vger.kernel.org
X-Gm-Message-State: AFuF++miA9uHHj03LhLlqkIl4jbEcoMYv3Wkkzzw0QbULO3Ok+SeXzpF
	eLnUhYFYG4Io5xil2qfjY4Ted7ZK+ENF/KKeVKoSyeSj/uoDfk/msNU=
X-Gm-Gg: AYBFou38KGraoR9ATq/MfC3BiEI/wrVkKXbe9VvzsJn/DP9nAA3LJA7SvKnI6dh8QEr
	ngztOfAcW2jotDYtKSTf+qOuhQTna2ul2s/g2b9+rw2sZU3Ma6OqgKZ2oP0q8urKgFyNXZKqiTi
	SP4tbbE6zAJmzUiWjmlvY5J/Sce4cT+RxFdzxlhyiEGmcDpfupec5udij71ngdHlOXO1y1AHeYS
	ZlJz+HBddaM6UymzbsExx7hh8Hnl+bxir9uu/fI4z9DclsuAcvZPQDIaLWfC2CQC+ovSQz38UNf
	oqh3LiiEZpNznNY/mUQ+RrvGbdORNLurMn+ba1U0NvbjbGyiBp1T4pHuv4qmBYn02DpLxc01q+2
	yri57K2O831fBWqJZzlpBJCwFrNYP8bR+SUv69o8POrOGKlxLRc5EO1IOJ5gRo7Ic8UVOW+gNLB
	jYYZbh8mEhSiSDuKI9SlsGsShoiUHyiAyWoJsTUOFIHuKFvmWfq7OTO9LTKoYiBhmgn7Nqlc4P2
	QtRNm/FR8A0ZY0st2pQRN5YH9bnCAp9VUT7wvLkekvAJVB/G6fWXSsl4cmjQJ7XAdvgCw==
X-Received: by 2002:a05:6512:3c83:b0:5b6:10bc:dc42 with SMTP id 2adb3069b0e04-5b610bcdcd4mr5324008e87.25.1788810338748;
        Mon, 07 Sep 2026 12:45:38 -0700 (PDT)
Received: from insciwin.localdomain (224.105.88.34.bc.googleusercontent.com. [34.88.105.224])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74d55a4absm1946114e87.50.2026.09.07.12.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:45:38 -0700 (PDT)
From: Dmitrii Tulnov <tulnov.dl@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	Peter Korsgaard <jacmet@uclibc.org>,
	"Yann E. MORIN" <yann.morin.1998@free.fr>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: reject malformed KCONFIG_PROBABILITY values
Date: Mon,  7 Sep 2026 22:45:36 +0300
Message-ID: <20260907194536.37-1-tulnov.dl@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

randconfig checks the numeric range of each probability but does not
validate where strtol() stops. For example, KCONFIG_PROBABILITY=50% is
accepted as 50:0:0: the '%' is parsed twice as zero. This silently sets
both tristate y/m probabilities to zero, reducing the coverage of random
configuration builds. Empty fields and extra fields are also accepted.

Require each field to contain an integer followed by the end of the
string or a colon introducing another field, with at most three fields.
Preserve the leading whitespace and optional sign accepted by strtol().
Keep the strtol() result as long until the range check so that narrowing
to int cannot turn an out-of-range value into a valid probability.

Add regression tests for malformed and out-of-range values, the supported
probability formats, and the documented empty-value default.

Fixes: e43956e60769 ("kconfig: implement KCONFIG_PROBABILITY for randconfig")
Assisted-by: LLM
Signed-off-by: Dmitrii Tulnov <tulnov.dl@gmail.com>
---
Validation on kbuild-next, x86_64, GCC 13.3.0:
- make testconfig with HOSTCFLAGS=-Werror: 58 passed. With the original
  conf binary: 18 failed, 40 passed; all failures are new regression tests.
- ASan/UBSan at -O1, with leak detection disabled: the same 58 tests passed.
- Both builds passed 1,635 input cases and 440 comparisons with the original
  conf using valid inputs and fixed seeds. Malformed inputs preserved an
  existing .config, including when KCONFIG_ALLCONFIG was set.
- make defconfig, allnoconfig, allmodconfig and valid randconfig passed.
  KCONFIG_PROBABILITY=50% changed from success to the expected error.
- No vmlinux build or boot test; this changes the host configuration tool.
  A 32-bit host build was unavailable because multilib headers were missing.

An AI coding assistant helped find the issue, prepare the fix, description
and tests, and run validation. The requested task was to find and fix a
useful, reproducible Linux bug suitable for a first contribution.

 scripts/kconfig/conf.c                        |  9 +++-
 .../tests/randconfig_probability/Kconfig      | 12 +++++
 .../tests/randconfig_probability/__init__.py  | 54 +++++++++++++++++++
 3 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 scripts/kconfig/tests/randconfig_probability/Kconfig
 create mode 100644 scripts/kconfig/tests/randconfig_probability/__init__.py

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index fe8ba09b0..fa5dae74e 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -191,7 +191,14 @@ static void conf_set_all_new_symbols(enum conf_def_mode mode)
 		n = 0;
 		while (env && *env) {
 			char *endp;
-			int tmp = strtol(env, &endp, 10);
+			long tmp = strtol(env, &endp, 10);
+
+			if (endp == env || (*endp && *endp != ':') ||
+			    (*endp == ':' && (!endp[1] || n == 2))) {
+				errno = EINVAL;
+				perror("KCONFIG_PROBABILITY");
+				exit(1);
+			}
 
 			if (tmp >= 0 && tmp <= 100) {
 				p[n++] = tmp;
diff --git a/scripts/kconfig/tests/randconfig_probability/Kconfig b/scripts/kconfig/tests/randconfig_probability/Kconfig
new file mode 100644
index 000000000..84f4e5fcc
--- /dev/null
+++ b/scripts/kconfig/tests/randconfig_probability/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config MODULES
+	bool
+	default y
+	modules
+
+config BOOL
+	bool "Bool"
+
+config TRI
+	tristate "Tristate"
diff --git a/scripts/kconfig/tests/randconfig_probability/__init__.py b/scripts/kconfig/tests/randconfig_probability/__init__.py
new file mode 100644
index 000000000..022c7eaf2
--- /dev/null
+++ b/scripts/kconfig/tests/randconfig_probability/__init__.py
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Validate KCONFIG_PROBABILITY without changing the supported distributions."""
+
+import pytest
+
+
+@pytest.mark.parametrize('probability', [
+    'invalid', ' ', '50%', '50 ', '0x32', '10 20', '10:20x',
+    '10:20:invalid', '10:20:30x',
+    ':50', '50:', '10::20', '10:20:', '10:20:30:', '10:20:30:40',
+    '-1', '101', '0:101', '0:0:101', '60:41', '0:60:41',
+    '4294967296', '-4294967296',
+    '999999999999999999999999', '-999999999999999999999999',
+])
+def test_invalid(conf, monkeypatch, probability):
+    monkeypatch.setenv('KCONFIG_PROBABILITY', probability)
+
+    assert conf.randconfig(seed=0) == 1
+    assert 'KCONFIG_PROBABILITY:' in conf.stderr
+
+
+@pytest.mark.parametrize('probability, boolean, tristate', [
+    ('0', 'n', 'n'),
+    ('0:0', 'n', 'n'),
+    ('100:0', 'y', 'y'),
+    ('0:100', 'y', 'm'),
+    ('100:0:0', 'y', 'n'),
+    ('0:100:0', 'n', 'y'),
+    ('0:0:100', 'n', 'm'),
+    ('000:000:100', 'n', 'm'),
+    ('+100:0', 'y', 'y'),
+    (' \t100:0', 'y', 'y'),
+    ('0: \t100:0', 'n', 'y'),
+])
+def test_valid(conf, monkeypatch, probability, boolean, tristate):
+    monkeypatch.setenv('KCONFIG_PROBABILITY', probability)
+
+    assert conf.randconfig(seed=0) == 0
+    for symbol, value in [('BOOL', boolean), ('TRI', tristate)]:
+        if value == 'n':
+            expected = '# CONFIG_{} is not set'.format(symbol)
+        else:
+            expected = 'CONFIG_{}={}'.format(symbol, value)
+        assert expected in conf.config.splitlines()
+
+
+def test_empty(conf, monkeypatch):
+    monkeypatch.delenv('KCONFIG_PROBABILITY', raising=False)
+    assert conf.randconfig(seed=0) == 0
+    default_config = conf.config
+
+    monkeypatch.setenv('KCONFIG_PROBABILITY', '')
+    assert conf.randconfig(seed=0) == 0
+    assert conf.config == default_config

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935

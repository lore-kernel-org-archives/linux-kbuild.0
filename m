Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA0F47D460
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2026 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041888; cv=none; b=pxA04FXsncDQFTQM2ySg1bKdM9tuVXRqYPWLO1sRkOoEKZEsKUUTuMEG9Wl91TcUoghNmTzdSC6/fSUSejPsC2GcKmiIfzKGEL6tYDN7UqNNRFjhyznA6/V8CnRjbsH/yj2VG0ZHvuvJ9W8vJBi2eYHzxwteVNKOeArIbR92xbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041888; c=relaxed/simple;
	bh=5BCJaCn7lj4Dda5KpsB/Sy2eIiDD5btvJPiyOMpRLc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LqEbtlgp5kAtE94MTRAoD1s7+KeBtifZgj+fn/ZOhO2G3BwK35XDy0lUu8BAiDgBGQNdoRvOHJC+p3E+xIhnGIbgzbF172DFNQTtrgT8rRl/8y32cRo4YNvngkxJusO+nCdOrUYkYwk5g0zsO2ZG70mox64nbQ9IKhpTHWh9Dw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilsFd+py; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilsFd+py"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a4a82aa383so14533241fa.3
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2026 05:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789041884; x=1789646684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IWnclB4BlHw6+LzClpO+RunqN8yE6ZL5SAlCXOJwinA=;
        b=ilsFd+pyYWGZUlRooQEfgkiQWJ51CCLv+OjC+STkjsbYZLViK0hUDzwhRici5H65JB
         4zY8H1i3wFXlkZxoet2/pet0c4yn0WC36Wteon/GTvM+7xNJyArNRokPf36fTXJ558uO
         sUML17rPLYktBIW95xGtd/i+uXTI/Rpj4hJqVMC+SJkwdaJKYpNrhkoaPlw8Lup0Al5Z
         TonkmT81UJaLyUnzdrZfjBPGFA4F2hO2rotHruKbQxx/HUpFLezj0pbgdYpcDK+1rXwE
         fiWGnQlO12ZMb1w78I0vI3cKcYJokbqFeEgc6+YnUnra5HGMuT9iYBOU34Xiphv2TVlw
         HJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041884; x=1789646684;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IWnclB4BlHw6+LzClpO+RunqN8yE6ZL5SAlCXOJwinA=;
        b=Abrc2qTSoy5vq7/1kfrJWfbVyvuHRtS+B56OzpAPEsbrtxLSgxtHiAJS1ujqE65FSx
         tGiO3eQ8OZEfMBA52n0FYzrRvGkXGvout3V+XaVeMveOj5Edzk9svWnqPPQf9cJlfphU
         9C7Q0XK96E9Qdqsh755yduf0/WQ6BeeusdYoZuRtyy8FjV0DU600ridqlF/IQWxacMl2
         IVC1gwKNzRSklmnWBQmBfwI3OZ80C9XBKwexDTpq8hzRUT4e1D4ysVCEL7av68qZC9Ma
         9FhWPufZeGuw361FS/02XHKjPGL0nz+q+jilsatG71Qfe5fC42jVWa9HcSbXhhk9N7Ad
         CkgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxELz9LDvMt7i+iqJFFtyAtyfevUGk0eaG8+P+P+3VspGoKZKXVX5/3I5F5n4Shj/YmfIZHiUPewgXrUD0=@vger.kernel.org
X-Gm-Message-State: AFuF++mET8h6DcqqsOYcuBF0wxiEL3j2rXPTk5Z4vx/KcyLsH44FfrDM
	bg63Fq5RQbU4ug8ZdeJZwqm8NWP1BMG0mWJ3cJQJFUpzLzrZ98Kua//8gnob+PXHdpft
X-Gm-Gg: AYBFou0NKOu3W/jCy49iifEKSjGsUDjTImaS7kEawidzcfNcI/93gXxbhhVc0nzxFSw
	Q7QKezTHVo5spU50trD4h+H7GlPE0o6dLRCSbZIr8LzqWpSMkxhxc4b/KgcHLcravSedjP19MjZ
	lgg+P0zz5fWzvVmMIpIomHVFfqaPir4/nxwqlyg3LVAPe1tomdPJKDX3NR+ZbKbgreDJ2L1yd1b
	NMUtGt1iCfR2kbdAdyHGsYzavKl3TvzNXti+rcgzF7kRo8KgXzvRzDrXCsuEs30BFQhVBObmOxF
	MeoxGcGin6w6Z0ECbXLdG+qCpvzx3bJmBUXK19YDxm/o0rypbdFQxs/O4NSE7P3H0A3JhBnJriy
	oHMSepJxW86ZPGp0RnwcnLaABMiI8RKozMsN4905g7yUU2oBO6J3IBsCI/x5IyJYgD/G0GJxd10
	9sT0pAQWWWXrgwIK+/oXfl2Rbd6e2K6OnLFkcEPCKE8CRcUv6FJ61F9m/F3OGNKYwPy/hd0RPPh
	F1kAc+bdtTvP85sQT+0Hm1ef8at2zwuFYPQOHrGIExlaqxtuFxA19M6YQRg7aEWjtJJyrygWWfG
	P13DKA==
X-Received: by 2002:a05:6512:3092:b0:5ae:ba7a:1789 with SMTP id 2adb3069b0e04-5b616ef5eebmr8287632e87.13.1789041883800;
        Thu, 10 Sep 2026 05:04:43 -0700 (PDT)
Received: from insciwin.localdomain (224.105.88.34.bc.googleusercontent.com. [34.88.105.224])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166384aasm4511395e87.0.2026.09.10.05.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:04:43 -0700 (PDT)
From: Dmitrii Tulnov <tulnov.dl@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: julianbraha@gmail.com,
	jacmet@uclibc.org,
	yann.morin.1998@free.fr,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] kconfig: warn about malformed KCONFIG_PROBABILITY values
Date: Thu, 10 Sep 2026 15:04:42 +0300
Message-ID: <20260910120442.26-1-tulnov.dl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <71d40a5d-21a7-47ae-aa18-34f640a08779@gmail.com>
References: <71d40a5d-21a7-47ae-aa18-34f640a08779@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

randconfig checks the numeric range of each probability but does not
validate where strtol() stops. For example, KCONFIG_PROBABILITY=50% is
accepted as 50:0:0: the '%' is parsed repeatedly as zero. For the
documented value 50, tristate y/m/n probabilities are 25%/25%/50%.
With 50%, both y/m probabilities silently become zero, reducing the
coverage of random configuration builds. Empty fields and extra fields
are also accepted.

Warn when the value does not follow the documented decimal format. For
malformed inputs whose parsed probabilities are in range, preserve the
existing interpretation unless KCONFIG_WERROR is set. In that case, exit
with an error before writing the configuration. Leading whitespace and
signs are accepted by strtol(), but also trigger the warning because they
are outside the documented format.

Keep the strtol() result as long until the range check. This rejects
out-of-range values that narrowing to int previously made valid, such as
4294967296 becoming zero on a 64-bit host, regardless of KCONFIG_WERROR.

Add regression tests for one warning per malformed input, preserved
configurations, KCONFIG_WERROR, out-of-range values, the supported
probability formats, and the documented empty-value default.

Fixes: e43956e60769 ("kconfig: implement KCONFIG_PROBABILITY for randconfig")
Assisted-by: LLM
Signed-off-by: Dmitrii Tulnov <tulnov.dl@gmail.com>
---
Changes since v2:
- Move the expected tristate distribution into the problem description.
- Simplify the initial format check to !isdigit((unsigned char)*env).
- Pass probability values and seeds through conf._run_conf(extra_env=...).
  Use monkeypatch.delenv only to remove inherited variables.
- Add -0, +0, bare + and - warning cases, and the +101 range-error case.
- Honor KCONFIG_WERROR for malformed format warnings, as discussed with
  Julian. Check unset, empty, 0 and 1 flag behavior.
- Compare 50% with 50:0:0 and -0 with 0 across 20 fixed seeds and check
  that each malformed input produces exactly one warning.
- Clarify that compatibility applies to malformed in-range inputs with
  KCONFIG_WERROR unset; values previously accepted by narrowing now fail.

Changes since v1:
- Warn about malformed in-range values while retaining their previous
  interpretation by default.
- Warn about leading whitespace and signs as undocumented input.
- Clarify that 50 gives tristate y/m/n probabilities of 25%/25%/50%, and
  compare it with the equivalent input 50:25:25 across 20 fixed seeds.

Validation on kbuild-next, x86_64, GCC 13.3.0:
- make testconfig with HOSTCFLAGS=-Werror: 138 passed. With the unpatched
  conf: 74 failed, 64 passed; failures cover missing format warnings,
  unchecked narrowing and ignored KCONFIG_WERROR. The previous v3 draft
  fails only the nine strict-mode regression cases; 129 tests pass.
- ASan/UBSan at -O1, with leak detection disabled: the same 138 tests passed.
- Both v3 builds matched the submitted v2 on 1,635 inputs: 916 accepted
  values and 719 range errors, with KCONFIG_WERROR unset. Each also matched
  the original on 380 documented-input comparisons with fixed seeds.
- Each build passed 120 strict format-error checks: no output created in
  a fresh directory; existing .config, .config.old and input files stayed
  unchanged, including with KCONFIG_ALLCONFIG and KCONFIG_OVERWRITECONFIG.
  Valid inputs, range diagnostics and other configuration modes were also
  checked with KCONFIG_WERROR set.
- The probability tests also passed with conflicting probability and seed
  values and KCONFIG_WERROR=1 inherited from the test runner's environment.
- make defconfig, allnoconfig, allmodconfig and valid randconfig passed.
  KCONFIG_PROBABILITY=50% now produces a warning and remains compatible.
- No vmlinux build or boot test; this changes the host configuration tool.
  32-bit hosts and other libc implementations were not tested.

 scripts/kconfig/conf.c                        |  16 +-
 .../tests/randconfig_probability/Kconfig      |  12 ++
 .../tests/randconfig_probability/__init__.py  | 137 ++++++++++++++++++
 3 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 scripts/kconfig/tests/randconfig_probability/Kconfig
 create mode 100644 scripts/kconfig/tests/randconfig_probability/__init__.py

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index fe8ba09b0..ca6d9d735 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -186,12 +186,23 @@ static void conf_set_all_new_symbols(enum conf_def_mode mode)
 
 	if (mode == def_random) {
 		int n, p[3];
+		bool warned = false;
 		char *env = getenv("KCONFIG_PROBABILITY");
 
 		n = 0;
 		while (env && *env) {
 			char *endp;
-			int tmp = strtol(env, &endp, 10);
+			long tmp = strtol(env, &endp, 10);
+
+			if (!isdigit((unsigned char)*env) ||
+			    (*endp && *endp != ':') ||
+			    (*endp == ':' && (!endp[1] || n == 2))) {
+				if (!warned) {
+					fprintf(stderr,
+						"warning: KCONFIG_PROBABILITY has malformed format\n");
+					warned = true;
+				}
+			}
 
 			if (tmp >= 0 && tmp <= 100) {
 				p[n++] = tmp;
@@ -227,6 +238,9 @@ static void conf_set_all_new_symbols(enum conf_def_mode mode)
 			perror("KCONFIG_PROBABILITY");
 			exit(1);
 		}
+
+		if (warned && getenv("KCONFIG_WERROR"))
+			exit(1);
 	}
 
 	menu_for_each_entry(menu) {
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
index 000000000..76fc39c94
--- /dev/null
+++ b/scripts/kconfig/tests/randconfig_probability/__init__.py
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Validate KCONFIG_PROBABILITY without changing the supported distributions."""
+
+import pytest
+
+
+@pytest.fixture(autouse=True)
+def clear_werror(monkeypatch):
+    # extra_env can set strict mode, but cannot remove an inherited flag.
+    monkeypatch.delenv('KCONFIG_WERROR', raising=False)
+
+
+@pytest.mark.parametrize('probability', [
+    'invalid', ' ', '50%', '50 ', '0x32', '10 20', '10:20x',
+    '10:20:invalid', '10:20:30x',
+    ':50', '50:', '10::20', '10:20:', '10:20:30:', '10:20:30:40',
+    '-0', '+0', '+', '-', '+100:0', ' \t100:0', '0: \t100:0',
+])
+def test_malformed_warns(conf, probability):
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': probability,
+        'KCONFIG_SEED': '0',
+    }) == 0
+    assert 'warning: KCONFIG_PROBABILITY has malformed format' in conf.stderr
+    assert conf.stderr.count('warning:') == 1
+    assert conf.config is not None
+
+
+@pytest.mark.parametrize('probability, equivalent', [
+    ('50%', '50:0:0'),
+    ('-0', '0'),
+])
+@pytest.mark.parametrize('seed', range(20))
+def test_malformed_preserves_config(conf, probability, equivalent, seed):
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': probability,
+        'KCONFIG_SEED': hex(seed),
+    }) == 0
+    assert 'warning: KCONFIG_PROBABILITY has malformed format' in conf.stderr
+    assert conf.stderr.count('warning:') == 1
+    malformed = conf.config
+
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': equivalent,
+        'KCONFIG_SEED': hex(seed),
+    }) == 0
+    assert 'warning:' not in conf.stderr
+    assert conf.config == malformed
+
+
+@pytest.mark.parametrize('werror', ['', '0', '1'])
+@pytest.mark.parametrize('probability, status', [
+    ('', 0), ('50', 0), ('50%', 1), ('-0', 1), ('10:20:30:40', 1),
+])
+def test_werror(conf, probability, status, werror):
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': probability,
+        'KCONFIG_SEED': '0',
+        'KCONFIG_WERROR': werror,
+    }) == status
+    if status:
+        assert 'warning: KCONFIG_PROBABILITY has malformed format' in conf.stderr
+        assert conf.stderr.count('warning:') == 1
+    else:
+        assert 'warning:' not in conf.stderr
+
+
+@pytest.mark.parametrize('probability', [
+    '-1', '101', '+101', '0:101', '0:0:101', '60:41', '0:60:41',
+    '4294967296', '-4294967296',
+    '999999999999999999999999', '-999999999999999999999999',
+])
+def test_out_of_range(conf, probability):
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': probability,
+        'KCONFIG_SEED': '0',
+    }) == 1
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
+])
+def test_valid(conf, probability, boolean, tristate):
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': probability,
+        'KCONFIG_SEED': '0',
+    }) == 0
+    assert 'warning:' not in conf.stderr
+    for symbol, value in [('BOOL', boolean), ('TRI', tristate)]:
+        if value == 'n':
+            expected = '# CONFIG_{} is not set'.format(symbol)
+        else:
+            expected = 'CONFIG_{}={}'.format(symbol, value)
+        assert expected in conf.config.splitlines()
+
+
+@pytest.mark.parametrize('seed', range(20))
+def test_single_probability_matches_tristate_split(conf, seed):
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': '50',
+        'KCONFIG_SEED': hex(seed),
+    }) == 0
+    assert 'warning:' not in conf.stderr
+    single = conf.config
+
+    # 50% boolean y; 25% tristate y, 25% m, and 50% n.
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': '50:25:25',
+        'KCONFIG_SEED': hex(seed),
+    }) == 0
+    assert 'warning:' not in conf.stderr
+    assert conf.config == single
+
+
+def test_empty(conf, monkeypatch):
+    # extra_env overrides inherited variables, but cannot remove them.
+    monkeypatch.delenv('KCONFIG_PROBABILITY', raising=False)
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_SEED': '0',
+    }) == 0
+    assert 'warning:' not in conf.stderr
+    default_config = conf.config
+
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': '',
+        'KCONFIG_SEED': '0',
+    }) == 0
+    assert 'warning:' not in conf.stderr
+    assert conf.config == default_config

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935

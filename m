Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10B638AC6A
	for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2026 21:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789767277; cv=none; b=jUrAMfIoLlszZHRLls/OWTdVHhHNj+lvr0f2QzAzNfvtJHqxrSedfLXdwDD4eD2ypXbUGXrouo0U/q+vwaUjVtO5KfrEshBTohA3Ig3FuwkvW2xuwek88qP9t4US7VuXTVPPN1BoYcJaxEcWe+hgV29WHR3V4BsbPbHV9Eb4lCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789767277; c=relaxed/simple;
	bh=SoHvbMBw6bBxIBtk7y9rmWd+iJntaNIJab7RD19k7ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D0NJuC7ktqpDQ8IVmv6v2eChj0SpHKxLceFQU1Q0ZCMshxOmYFH06QUdX/wIz0bwTZZev6BomXdUWRfWBso3EWr0bNQJcggJv4qJtjLSyYFJliD2v3sI6zNbWfsEFi+kmA+SnWNf+njASF5bTLXZdh5xuF4rpyN5Xhh3ZiK2Az4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hC4Px4qP; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hC4Px4qP"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so1392446e87.0
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2026 14:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789767274; x=1790372074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AvrJ6Wib2YFGRX92JeMPAgnpAd+TXCrj9r0r9Zxh240=;
        b=hC4Px4qP8BGPOUQ2r8zKYy26G5852D9CXcccbTIVx0mLL2Mt8s5KPO6ZdRuz/Kon+A
         rLc+VGMdgNLFJDdz7yrHhf2mLuMDCcdo2pAWSGcmeuLhAb3vSjbc3yRa4ElwN3fLE3Wn
         bfoE0HZstRiAHHL3S5obVg0/beTetchChpJRJ4Xc0UAeEAfvOdIHV7THEsDEtuqH4Nv4
         LVxXOtDVQ2JmfVJivxgHAHEXuoYKBMGPN3Qyhpt7uY2235kib8+ZT0b2key788E//VQU
         6r74CCsUsVEf/y4ZxeehQSuT/LtFCigCT28R7l5k0IgT+EXJCfDhWq9ROoCrEf60oV3T
         VuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789767274; x=1790372074;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvrJ6Wib2YFGRX92JeMPAgnpAd+TXCrj9r0r9Zxh240=;
        b=KCQJrkno0i42gzdsd6Suz05Gj2VnLG1oGAqQRZua5eNQ11vSEx8w+H+dyzR+eQSMcO
         nPlx1LYrpseoxW3F8OvItGXdBZzp3QheIKf2PHzKs/RD4Hqej1zC0mWEJDva7pLWVBdE
         0Opb5rgajmIHblk3TlwZcyfFaX/xlZktbCJd2vNQI0GUusL9wt5aRbxCSgVg1HRgL3Vm
         MFCmulhjW6bZO7mIPHNjCuznmVAXsHxNRlPE3sa1H7esk05tbNXDVV3Np5ysUwLeYGZa
         XaQbfn2aXGS5z4wXTLRG2BVxwEXGQ06dd6BzYtWZkgVjdTDDCLcFnhRU1nFuEt1xczUk
         reBg==
X-Forwarded-Encrypted: i=1; AKwUvBx4XMKKCBeHdMhjjOVgSKk8MJyoEOB7hTGeA8FR3uy141l6FOR5Jhn1EondseCqHOSLxFqOxBW5U+uHqHA=@vger.kernel.org
X-Gm-Message-State: AFuF++nvwwYudyEQLPgek59LE4EJ5IdBERMIqJAoSVxB+nGGnmZbrwMe
	lpY3uAd5843bLJ3zekZWZ+RAJeDQxTwPvPThewhmLgh5uigVHLOPWJQ=
X-Gm-Gg: AYBFou3AvrrlkMIQsMpqlFnQifPjRmxU83j6NUqSXX3oHTauPdZP7zcwG7ESbhOS8Ib
	HhaED35uga7fvmS/WcJAy3kNC1/UYi0Dwbl6OJJxi86a2nE/E1Gv0/s5SyfQyK+5k/RCZLOy2kF
	L9AOedM6xesSj2X6KrxXNG1QU6mT3OeadIvdAx4/BsGbQvp2m0zz8aHntdysgCacwdYndiQ5zl3
	F8hqKzBydo4aBP5nQmRUOnT1mZcw2nWfCUAJ8FzdiidR2hQQ0svAiaDgbYG9YXBvCFCQLPS2xkX
	5JzIuNQ8iASCIr8kCgwJ79yE9+Mf0fcRm34kiuvLM7oh5dhXNkd9U6tGVMMXcxwBOfU+OjT2y5L
	K++yvPWO/LayFPWcmORSKQL9I5PutbSUw6FnI57G9wPYeFZ9BCBXmAR1zTZWNlv+HFI1D3j7UTV
	3rfKVVdB5HoZQO8TZZF86oOP7aoCylX+4iy1KoiKYOwrhhGqapf0umyh/TvnMQM1fdMyaC/QB1z
	3KfEF3ZAXcRX403+B9GtkBCqFAGDzzS+1JmoxZg2jtIz7lMcO0zNhKguua4Y/Qht6uhzw39lesV
	0NLO
X-Received: by 2002:a05:6512:3d08:b0:5b8:b3d3:2bb3 with SMTP id 2adb3069b0e04-5b8c1961323mr1315524e87.60.1789767273596;
        Fri, 18 Sep 2026 14:34:33 -0700 (PDT)
Received: from insciwin.localdomain (224.105.88.34.bc.googleusercontent.com. [34.88.105.224])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c78c11d6sm110354e87.2.2026.09.18.14.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:34:33 -0700 (PDT)
From: Dmitrii Tulnov <tulnov.dl@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	Peter Korsgaard <jacmet@uclibc.org>,
	"Yann E. MORIN" <yann.morin.1998@free.fr>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] kconfig: warn about malformed KCONFIG_PROBABILITY values
Date: Sat, 19 Sep 2026 00:34:30 +0300
Message-ID: <20260918213430.3-1-tulnov.dl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9ceb2ab6-f532-49a2-b30b-ecdb4eb4b7b0@gmail.com>
References: <9ceb2ab6-f532-49a2-b30b-ecdb4eb4b7b0@gmail.com>
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
Thanks, Julian. I kept monkeypatch.delenv() to compare the unset and empty
cases. I've dropped that comparison and removed the call; test_empty now just
checks the empty value through extra_env.

Changes since v5:
- Remove the local monkeypatch fixture argument and the unset-variable
  comparison from test_empty.
- Keep the documented empty KCONFIG_PROBABILITY check explicit through
  extra_env, so the test does not depend on inherited environment.

Changes since v4:
- Replace pytest.mark.parametrize with loops and remove the unused pytest
  import from the probability test module, as requested by Julian.
- Include the probability and, where applicable, seed and WERROR value in
  assertion messages. Preserve all input combinations and checks.

Changes since v3:
- Move the KCONFIG_WERROR cleanup fixture to the shared conftest.py,
  as requested by Julian. Explicit extra_env settings still enable WERROR.

Changes since v2:
- Move the expected tristate distribution into the problem description.
- Simplify the initial format check to !isdigit((unsigned char)*env).
- Pass probability values and seeds through conf._run_conf(extra_env=...).
  The shared fixture clears inherited KCONFIG_WERROR before each test.
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
- make testconfig with HOSTCFLAGS=-Werror: 28 passed, both normally and
  with KCONFIG_WERROR=1 inherited from the test runner. Explicit strict
  cases for empty, 0 and 1 flag values still pass.
- The same suite passed on the existing ASan/UBSan build at -O1, with
  leak detection disabled: 28 passed in each environment.
- The probability module reports 7 tests. Native and ASan/UBSan runs with
  inherited KCONFIG_PROBABILITY=101, KCONFIG_SEED=not-a-seed and each of
  KCONFIG_WERROR='', '0' and '1' all pass, including reverse test order.
- test_empty makes one explicit run with KCONFIG_PROBABILITY='' through
  extra_env; no local monkeypatch fixture is needed.
- The new suite gives 4 expected failures and 24 passes on the original
  binary; the version before WERROR gives 1 expected failure and 27
  passes. Loops stop at their first failure, so these counts differ
  from the earlier parametrized regression results.
- C code, test Kconfig and shared fixtures are unchanged from v5. Earlier
  C compatibility and file-preservation checks were not rerun.
- No vmlinux build or boot test; this changes the host configuration tool.
  32-bit hosts and other libc implementations were not tested.

 scripts/kconfig/conf.c                        |  16 ++-
 scripts/kconfig/tests/conftest.py             |   6 +
 .../tests/randconfig_probability/Kconfig      |  12 ++
 .../tests/randconfig_probability/__init__.py  | 130 ++++++++++++++++++
 4 files changed, 163 insertions(+), 1 deletion(-)
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
diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
index 66f95e4ed..2263bd2a3 100644
--- a/scripts/kconfig/tests/conftest.py
+++ b/scripts/kconfig/tests/conftest.py
@@ -312,6 +312,12 @@ class Conf:
         return self._matches('stderr', expected)
 
 
+@pytest.fixture(autouse=True)
+def clear_werror(monkeypatch):
+    # extra_env can set strict mode, but cannot remove an inherited flag.
+    monkeypatch.delenv('KCONFIG_WERROR', raising=False)
+
+
 @pytest.fixture(scope="module")
 def conf(request):
     """Create a Conf instance and provide it to test functions."""
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
index 000000000..e6e5dda10
--- /dev/null
+++ b/scripts/kconfig/tests/randconfig_probability/__init__.py
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Validate KCONFIG_PROBABILITY without changing the supported distributions."""
+
+
+def test_malformed_warns(conf):
+    probabilities = [
+        'invalid', ' ', '50%', '50 ', '0x32', '10 20', '10:20x',
+        '10:20:invalid', '10:20:30x',
+        ':50', '50:', '10::20', '10:20:', '10:20:30:', '10:20:30:40',
+        '-0', '+0', '+', '-', '+100:0', ' \t100:0', '0: \t100:0',
+    ]
+    for probability in probabilities:
+        assert conf._run_conf('--randconfig', extra_env={
+            'KCONFIG_PROBABILITY': probability,
+            'KCONFIG_SEED': '0',
+        }) == 0, repr(probability)
+        assert ('warning: KCONFIG_PROBABILITY has malformed format' in
+                conf.stderr), repr(probability)
+        assert conf.stderr.count('warning:') == 1, repr(probability)
+        assert conf.config is not None, repr(probability)
+
+
+def test_malformed_preserves_config(conf):
+    probabilities = [('50%', '50:0:0'), ('-0', '0')]
+    for seed in range(20):
+        for probability, equivalent in probabilities:
+            context = 'probability={!r}, equivalent={!r}, seed={}'.format(
+                probability, equivalent, seed)
+            assert conf._run_conf('--randconfig', extra_env={
+                'KCONFIG_PROBABILITY': probability,
+                'KCONFIG_SEED': hex(seed),
+            }) == 0, context
+            assert ('warning: KCONFIG_PROBABILITY has malformed format' in
+                    conf.stderr), context
+            assert conf.stderr.count('warning:') == 1, context
+            malformed = conf.config
+
+            assert conf._run_conf('--randconfig', extra_env={
+                'KCONFIG_PROBABILITY': equivalent,
+                'KCONFIG_SEED': hex(seed),
+            }) == 0, context
+            assert 'warning:' not in conf.stderr, context
+            assert conf.config == malformed, context
+
+
+def test_werror(conf):
+    probabilities = [
+        ('', 0), ('50', 0), ('50%', 1), ('-0', 1), ('10:20:30:40', 1),
+    ]
+    for probability, status in probabilities:
+        for werror in ['', '0', '1']:
+            context = 'probability={!r}, werror={!r}'.format(
+                probability, werror)
+            assert conf._run_conf('--randconfig', extra_env={
+                'KCONFIG_PROBABILITY': probability,
+                'KCONFIG_SEED': '0',
+                'KCONFIG_WERROR': werror,
+            }) == status, context
+            if status:
+                assert ('warning: KCONFIG_PROBABILITY has malformed format' in
+                        conf.stderr), context
+                assert conf.stderr.count('warning:') == 1, context
+            else:
+                assert 'warning:' not in conf.stderr, context
+
+
+def test_out_of_range(conf):
+    probabilities = [
+        '-1', '101', '+101', '0:101', '0:0:101', '60:41', '0:60:41',
+        '4294967296', '-4294967296',
+        '999999999999999999999999', '-999999999999999999999999',
+    ]
+    for probability in probabilities:
+        assert conf._run_conf('--randconfig', extra_env={
+            'KCONFIG_PROBABILITY': probability,
+            'KCONFIG_SEED': '0',
+        }) == 1, repr(probability)
+        assert 'KCONFIG_PROBABILITY:' in conf.stderr, repr(probability)
+
+
+def test_valid(conf):
+    probabilities = [
+        ('0', 'n', 'n'),
+        ('0:0', 'n', 'n'),
+        ('100:0', 'y', 'y'),
+        ('0:100', 'y', 'm'),
+        ('100:0:0', 'y', 'n'),
+        ('0:100:0', 'n', 'y'),
+        ('0:0:100', 'n', 'm'),
+        ('000:000:100', 'n', 'm'),
+    ]
+    for probability, boolean, tristate in probabilities:
+        assert conf._run_conf('--randconfig', extra_env={
+            'KCONFIG_PROBABILITY': probability,
+            'KCONFIG_SEED': '0',
+        }) == 0, repr(probability)
+        assert 'warning:' not in conf.stderr, repr(probability)
+        for symbol, value in [('BOOL', boolean), ('TRI', tristate)]:
+            if value == 'n':
+                expected = '# CONFIG_{} is not set'.format(symbol)
+            else:
+                expected = 'CONFIG_{}={}'.format(symbol, value)
+            assert expected in conf.config.splitlines(), repr(probability)
+
+
+def test_single_probability_matches_tristate_split(conf):
+    for seed in range(20):
+        context = 'seed={}'.format(seed)
+        assert conf._run_conf('--randconfig', extra_env={
+            'KCONFIG_PROBABILITY': '50',
+            'KCONFIG_SEED': hex(seed),
+        }) == 0, context
+        assert 'warning:' not in conf.stderr, context
+        single = conf.config
+
+        # 50% boolean y; 25% tristate y, 25% m, and 50% n.
+        assert conf._run_conf('--randconfig', extra_env={
+            'KCONFIG_PROBABILITY': '50:25:25',
+            'KCONFIG_SEED': hex(seed),
+        }) == 0, context
+        assert 'warning:' not in conf.stderr, context
+        assert conf.config == single, context
+
+
+def test_empty(conf):
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': '',
+        'KCONFIG_SEED': '0',
+    }) == 0
+    assert 'warning:' not in conf.stderr

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935

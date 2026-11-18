Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986200;
	b=y21mS20JZxxEqfoAG1NVcs4K7DENEyLrS/B6FaVWMbRgCjbHrP0jxgHugmnPMPbpIwVN
	 uHEIkHy0reogJUGYLBPtrj5RGyKS26IvDP+IfgTFP4CX/whxGie9WEv+nD7SN44bBHQAD
	 NzzC7LzAUM3DNlOTRjd7AQqsTB//kkMM2Ta1pXyHK5wgRLiHXHNtWA9kkj64fQ7q8g/k0
	 9/xH3FQh9Tswm648X73ydYNBeUsOK7pZCkm6ZxFkm8bjvN/VpGWBnlk3UHYmHlXmUk2HE
	 hmRV+y5t8jfaJeLTzDL+xXfjfLsJduXAvUKLrIZZS8ZFnMeDp44Gr9zlHturryE6IFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bXRfep9ii60xjZWxRvZixwkuF31snfOPXcPr6rJucR4=;
	b=myBEFNoxfg3QU0x53JVzR4DSDnrcGHgemRPzGZ+zqNLaWLZ3S5N9f+K2DaAG2aAYAy8Y
	 bm2NEIT3KzGnu4Ou0WGdkJd/CqR+JFVMt1aFpBqW+6ysIAgDsik2Pvyayz5ISCZbEJiay
	 x+2JOrJKaB+LZGr1wxVjUf/faxFke97NyEG0bCW6B0TuI3UdhDKb3O7E0Cmh5yZOGgA7O
	 apGsZHdBShelPs4BElsU3xlR/wbeJdrzly9B93nRbQHkS4WPCcYc7JS/ajAPyIo9YHWtm
	 ObBLM+uY/l94vwky92XlsFI57ZXA+MtNUg7uB61YOr79p6RkL4nSCQykprWb08sGtsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u0MKK6xC;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEA3606A325
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 07:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDEA3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u0MKK6xC
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso390930a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 23:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794986199; x=1795590999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bXRfep9ii60xjZWxRvZixwkuF31snfOPXcPr6rJucR4=;
        b=u0MKK6xCdB9Xtg+RHpB9d5vpdp3Bv+ny+2fsq0I2S37zOY27Q/KCJEZMjXeFFXSRgS
         QdlVkAhQZ/WzCSQYvAbdl8N5maQydawGymR7bi59ZQ4yei4osXMTVcXAaBckWMqPosNh
         1c8InnmKwfw4M4YVnPFlfi+17Ihj/CDjv8NQ+VDk5/OCmpwTA+oZhOTwPLGuab0zBV64
         wGPSDq4lj5+4/7s7GPNiJgplgD/lu0usp0rZSmTQqRmN12ql2Q8YO6l0oPlFhigvQjMo
         pAtQt0Qaa07qdea4eXRhxiBZnU0JRG9/rr0qUpPHo9ju8R/QdiClBhUMsQS4IsWrL6PQ
         6M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986199; x=1795590999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXRfep9ii60xjZWxRvZixwkuF31snfOPXcPr6rJucR4=;
        b=04be1fbZHFLQPtO1CJ2zihVcvFy3JRYm7UvBx1/yg39s/L2S/IsjyhODnT20Y+ovLf
         lxEVhZuyQNBa9ndn91yoWETgzPR+8CISQ7u2oriUyS1o7hoRXKIRH36MTkKngj89QONp
         Lm8hTpD7e0u3mpstFz5gRZSny2tBu0Uxr7cWptWung9Dky9t58UZ5g0SJZbGYvPiWRdr
         cHLD/Zk1OuPSb0bLoJ2Pv7t+TAVVcEHb661fN+GnfyqauAgYyuM76ejvrhsaWwQTNdjg
         c/WSo1YyZfUTd7gcc/ZoMUGkAESCmcmMgLX98DJpZGeeZ/hWmzRbw8G3DacMBxl7Wlbo
         JMgg==
X-Forwarded-Encrypted: i=1; AL+hErEx/HG97tOkrMEPLeVWP3H5OiMurUSpnwM/1vIpQb39rtIZKbWf+gzDwkXmSZvbEQqxBK5MiZ+ybaHKoEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yJWd0mFByXMjjIFFodeXfVb2m+h/mrNQkaKtQ4txplGkME9iO
	GZ2+vQH/bPXjcBG/UesqveWMmNRKOmerU6opS5DyLbrGxNgYdkQ/IViC
X-Gm-Gg: AZFdTZfJd/GzLCfXU2FL3Futb0ijQgjU5GnbVKOSaMhcOGDUiflQsa+hBSv9HyO6af0
	8V2Ts/ua65lDV2llOvesWKQaetJpAsiqf2DsQp8xS/L77bPSItDLTKXC1N3vTRmMiHK0AoA+FAg
	SG2R6X+FKw5Srg72u1kg1b05edEb6T1b8R/YaVG3YZ5y49aWuW0QGkORCExzBWLLX4/8jFrk306
	2sdVvxSEBqqVpjfb/NjrOHB9i0HUveKSq6ib58LYw4AyqcN3q50AIUjZyVuot0L0xC+v5XZD7FU
	8s7XrYVBZIHOZcJD9QF8rEX2TWg/qPIr6kzPp5vqW7jRYyaiymTlgx3LqrsiC3HTor9YuryEz1b
	IfBu0rw6CYkBMagMiMTWOU+7Yuc7TJjtHFB/W4KD39rEHltbGlkgrrBP4k5uJIEtrfS7RyizTLV
	B6bklHwFttjNY91O7Ni4NMT970dRV2keCMe8+lIjR416RSTaeg3dkZsPq0ImV4MP3GG+7ew6a7C
	9G3KN97E+Ho375Td3pugVMt6LSup04vUybjm8/Uim8NGabaUrsmSzEmHd/ScXdyStrbdceHq99U
	cEyFM6gMhGtWtj/nryvFPuzVyaRgQJw2fac1sN/hTnAIVHMO
X-Received: by 2002:a17:90b:4410:b0:3b3:ba43:54c0 with SMTP id 98e67ed59e1d1-3b3d07a2075mr1795121a91.15.1794986198705;
        Tue, 17 Nov 2026 23:16:38 -0800 (PST)
Received: from lenoq.localdomain ([49.43.112.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm3143928a91.6.2026.11.17.23.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:16:38 -0800 (PST)
From: Priyanshu Singh <singhpriyanshu9838@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	"Yann E . MORIN" <yann.morin.1998@free.fr>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Priyanshu Singh <singhpriyanshu9838@gmail.com>
Subject: [PATCH] kconfig: warn about malformed KCONFIG_SEED values
Date: Wed, 18 Nov 2026 07:15:57 +0000
Message-ID: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

randconfig parses KCONFIG_SEED with signed strtol(), causing several
validation and cross-architecture bugs:

- Artificial constraints and portability issues:
  32-bit seeds in [0x80000000, 0xFFFFFFFF] and values > UINT_MAX
  are capped to LONG_MAX (0x7FFFFFFF) on 32-bit hosts instead of
  matching 64-bit host behavior.
- Whitespace handling asymmetry: Trailing whitespace leaves
  *endp != '\0', discarding the seed in favor of gettimeofday()
  while leading whitespace is accepted.
- Garbage handling: Invalid strings (e.g., "xyz", "42_foo") fall back
  to the clock seed and exit with status 0, ignoring KCONFIG_WERROR.

Switch to strtoull(..., 0) and consume trailing whitespace so
whitespace-padded seeds are not discarded. Reject 0b/0B prefixes
explicitly so C11 and C23 builds behave identically.

Emit a warning whenever KCONFIG_SEED deviates from a canonical unsigned
32-bit integer, and exit(1) if KCONFIG_WERROR is set. Otherwise, retain
modulo 2^32 truncation for parseable 64-bit integers and fall back to
the clock seed on unparseable inputs or ERANGE overflow.

Add regression tests in scripts/kconfig/tests/randconfig_seed/.

Fixes: 0d8024c6ebad ("kconfig: allow specifying the seed for randconfig")
Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
---
Notes for reviewers:
- 0b/0B guard: Under glibc 2.38+ with -std=gnu2x/-std=c23, strtoull()
  maps to __isoc23_strtoull() which accepts 0b/0B binary prefixes in
  base 0, whereas C11 stops at 'b'. Rejecting 0b/0B prior to strtoull()
  keeps behavior identical across toolchains.
- Backward compatibility (KCONFIG_WERROR unset): Non-canonical but
  parseable 64-bit integers (whitespace, signs, -1, or > UINT_MAX
  timestamps like `date +%s%N`) emit a warning and truncate modulo 2^32
  across both 32-bit and 64-bit hosts, while unparseable strings or
  > 64-bit ERANGE overflows fall back to gettimeofday().

Input                   Pre-Patch (64-bit)    Pre-Patch (32-bit)    Post-Patch (32 & 64-bit)
----------------------  --------------------  --------------------  ------------------------------------
"42" / "0x2a"           0x2A (quiet)          0x2A (quiet)          0x2A (quiet)
"0x80000000"            0x80000000 (quiet)    0x7FFFFFFF (clamp)    0x80000000 (quiet)
" 42"                   0x2A (quiet)          0x2A (quiet)          0x2A + warn (WERROR -> exit 1)
"42 "                   Clock fallback        Clock fallback        0x2A + warn (WERROR -> exit 1)
"-1"                    0xFFFFFFFF (quiet)    0xFFFFFFFF (quiet)    0xFFFFFFFF + warn (WERROR -> exit 1)
"4294967296" (2^32)     0x0 (quiet)           0x7FFFFFFF (clamp)    0x0 + warn (WERROR -> exit 1)
"18446744073709551616"  0xFFFFFFFF (clamp)    0x7FFFFFFF (clamp)    Clock fallback + warn (WERROR -> 1)
"0b1010"                Clock (C11)/10 (C23)  Clock (C11)/10 (C23)  Clock fallback + warn (WERROR -> 1)
"xyz" / "42_foo"        Clock (ignores WERR)  Clock (ignores WERR)  Clock fallback + warn (WERROR -> 1)

Tested via `make testconfig` (40 passed).

 scripts/kconfig/conf.c                        |  40 +++-
 scripts/kconfig/tests/randconfig_seed/Kconfig |  44 ++++
 .../kconfig/tests/randconfig_seed/__init__.py | 222 ++++++++++++++++++
 3 files changed, 303 insertions(+), 3 deletions(-)
 create mode 100644 scripts/kconfig/tests/randconfig_seed/Kconfig
 create mode 100644 scripts/kconfig/tests/randconfig_seed/__init__.py

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 31c6fd25e6ec..bccf1d591990 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -92,11 +92,45 @@ static void set_randconfig_seed(void)
 
 	env = getenv("KCONFIG_SEED");
 	if (env && *env) {
+		const char *p = env;
+		const char *digits;
 		char *endp;
+		unsigned long long val = 0;
+		bool has_bin_prefix;
+		bool warned = false;
+
+		while (isspace((unsigned char)*p))
+			p++;
+
+		digits = (*p == '+' || *p == '-') ? p + 1 : p;
+		has_bin_prefix = digits[0] == '0' &&
+				 (digits[1] == 'b' || digits[1] == 'B');
+
+		errno = 0;
+		if (!has_bin_prefix)
+			val = strtoull(p, &endp, 0);
+		else
+			endp = (char *)p;
+
+		if (p != env || !isdigit((unsigned char)*p) || *endp != '\0' ||
+		    errno == ERANGE || val > UINT_MAX) {
+			fprintf(stderr,
+				"warning: KCONFIG_SEED has malformed format\n");
+			warned = true;
+		}
 
-		seed = strtol(env, &endp, 0);
-		if (*endp == '\0')
-			seed_set = true;
+		if (endp != p && errno != ERANGE) {
+			while (isspace((unsigned char)*endp))
+				endp++;
+
+			if (*endp == '\0') {
+				seed = (unsigned int)val;
+				seed_set = true;
+			}
+		}
+
+		if (warned && getenv("KCONFIG_WERROR"))
+			exit(1);
 	}
 
 	if (!seed_set) {
diff --git a/scripts/kconfig/tests/randconfig_seed/Kconfig b/scripts/kconfig/tests/randconfig_seed/Kconfig
new file mode 100644
index 000000000000..28d5cb225b04
--- /dev/null
+++ b/scripts/kconfig/tests/randconfig_seed/Kconfig
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config MODULES
+	bool
+	default y
+	modules
+
+config BOOL1
+	bool "Bool 1"
+
+config BOOL2
+	bool "Bool 2"
+
+config BOOL3
+	bool "Bool 3"
+
+config BOOL4
+	bool "Bool 4"
+
+config TRI1
+	tristate "Tristate 1"
+
+config TRI2
+	tristate "Tristate 2"
+
+config TRI3
+	tristate "Tristate 3"
+
+config TRI4
+	tristate "Tristate 4"
+
+choice
+	prompt "Choice"
+
+config CHOICE_A
+	bool "Choice A"
+
+config CHOICE_B
+	bool "Choice B"
+
+config CHOICE_C
+	bool "Choice C"
+
+endchoice
diff --git a/scripts/kconfig/tests/randconfig_seed/__init__.py b/scripts/kconfig/tests/randconfig_seed/__init__.py
new file mode 100644
index 000000000000..7f9e1e5e7ef4
--- /dev/null
+++ b/scripts/kconfig/tests/randconfig_seed/__init__.py
@@ -0,0 +1,222 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Validate KCONFIG_SEED handling in randconfig."""
+
+import time
+
+
+def test_malformed_warns(conf):
+    seeds = [
+        'invalid', ' ', '\t', '\n', '+', '-',
+        '0x', '0X', '0xg', '0x-1', '0x+1', '0x1g', '0b', '0b1010', '0B1010',
+        '+0b1010', ' 0b1010 ', '08',
+        '123foo', '10 20', '-1_junk', '-1 junk', '-1xyz',
+        '4294967296_junk', '4294967296 junk', '4294967296xyz',
+        '0x100000000xyz', '-0x100000000xyz',
+        '--0', '+-0', '-+0', '++0', '++42', '+ 42', '- 0', '- 42',
+        '42 ', '0x2a ', ' 42 ', '0 ', ' 0', ' 0 ', '+0x0', ' 0x2a', ' 0x2a ',
+        '-0', '-0x0', '+0', '+42', '+0x2a', ' 42', ' \t0x2a',
+        '-1', '-42', '-0x1', ' -1', ' -42 ', '-42 ', '-0x80000000',
+        '-2147483648', '-4294967295', '-4294967296', '-18446744073709551615',
+        '4294967296', '+4294967296', '4294967296 ', ' 4294967296 ',
+        '0x100000000', '040000000000', '1763362020123456789',
+        '18446744073709551615', '18446744073709551616', '-18446744073709551616',
+        '0x10000000000000000', '-0x10000000000000000',
+        '999999999999999999999999', '-999999999999999999999999',
+        '999999999999999999999999xyz', '-999999999999999999999999xyz',
+    ]
+    for seed in seeds:
+        context = 'seed={!r}'.format(seed)
+        assert conf._run_conf('--randconfig', extra_env={
+            'KCONFIG_SEED': seed,
+        }) == 0, context
+        assert ('warning: KCONFIG_SEED has malformed format' in
+                conf.stderr), context
+        assert conf.stderr.count('warning:') == 1, context
+        assert 'KCONFIG_SEED=0x' in conf.stdout, context
+        assert conf.config is not None, context
+
+
+def test_malformed_preserves_config(conf):
+    pairs = [
+        # In-range whitespace & signs
+        (' 0', '0'),
+        (' +0', '0'),
+        (' -0', '0'),
+        ('-0', '0'),
+        ('-0x0', '0'),
+        ('+0', '0'),
+        ('+0x0', '0'),
+        ('+42', '42'),
+        ('+0x2a', '0x2a'),
+        (' 42', '42'),
+        ('42 ', '42'),
+        (' 42 ', '42'),
+        ('0 ', '0'),
+        (' 0 ', '0'),
+        (' 0x2a', '0x2a'),
+        ('0x2a ', '0x2a'),
+        (' 0x2a ', '0x2a'),
+        (' \t0xdeadbeef', '0xdeadbeef'),
+        ('0xdeadbeef ', '0xdeadbeef'),
+        (' 0xdeadbeef ', '0xdeadbeef'),
+
+        # Negative integers (modulo 2^32 backward compatibility)
+        ('-1', '0xffffffff'),
+        (' -1 ', '0xffffffff'),
+        ('-0x1', '0xffffffff'),
+        ('-42', '0xffffffd6'),
+        (' -42 ', '0xffffffd6'),
+        ('-42 ', '0xffffffd6'),
+        ('-2147483648', '0x80000000'),
+        ('-0x80000000', '0x80000000'),
+        ('-4294967295', '0x1'),
+        ('-4294967296', '0x0'),
+        ('-0x100000000', '0x0'),
+        ('-18446744073709551615', '0x1'),
+
+        # 64-bit > UINT_MAX integers (modulo 2^32 backward compatibility)
+        ('4294967296', '0x0'),
+        ('+4294967296', '0x0'),
+        ('4294967296 ', '0x0'),
+        (' 4294967296 ', '0x0'),
+        ('0x100000000', '0x0'),
+        ('040000000000', '0x0'),
+        ('4294967338', '0x2a'),
+        ('0x10000002a', '0x2a'),
+        ('1763362020123456789', '0x23dfb515'),
+        ('18446744073709551615', '0xffffffff'),
+    ]
+    for malformed_seed, canonical_seed in pairs:
+        context = 'malformed={!r}, canonical={!r}'.format(
+            malformed_seed, canonical_seed)
+        assert conf._run_conf('--randconfig', extra_env={
+            'KCONFIG_SEED': malformed_seed,
+        }) == 0, context
+        assert ('warning: KCONFIG_SEED has malformed format' in
+                conf.stderr), context
+        assert conf.stderr.count('warning:') == 1, context
+        malformed_stdout = conf.stdout
+        malformed_config = conf.config
+
+        assert conf._run_conf('--randconfig', extra_env={
+            'KCONFIG_SEED': canonical_seed,
+        }) == 0, context
+        assert 'warning:' not in conf.stderr, context
+        assert conf.stdout == malformed_stdout, context
+        assert conf.config == malformed_config, context
+
+
+def test_unparseable_falls_back_to_clock(conf):
+    forbidden_targets = [
+        ('999999999999999999999999', '0xFFFFFFFF'),
+        ('-999999999999999999999999', '0xFFFFFFFF'),
+        ('18446744073709551616', '0xFFFFFFFF'),
+        ('0b1010', '0xA'),
+        ('42foo', '0x2A'),
+    ]
+    for seed, forbidden_hex in forbidden_targets:
+        target_forbidden = 'KCONFIG_SEED={}\n'.format(forbidden_hex)
+        matched_forbidden = True
+        for _ in range(3):
+            assert conf._run_conf('--randconfig', extra_env={
+                'KCONFIG_SEED': seed,
+            }) == 0, 'seed={!r}'.format(seed)
+            assert ('warning: KCONFIG_SEED has malformed format' in
+                    conf.stderr), 'seed={!r}'.format(seed)
+            if target_forbidden not in conf.stdout:
+                matched_forbidden = False
+                break
+            time.sleep(0.002)
+        assert not matched_forbidden, (
+            'seed={!r} unexpectedly matched forbidden static seed {!r}'.format(
+                seed, forbidden_hex))
+
+
+def test_werror(conf):
+    seeds = [
+        ('', 0), ('0', 0), ('42', 0), ('052', 0), ('0x2a', 0),
+        ('0x80000000', 0), ('0xffffffff', 0),
+        ('invalid', 1), ('123foo', 1), ('0x', 1), ('0b1010', 1),
+        ('42 ', 1), (' 42', 1), (' 42 ', 1), ('0 ', 1), (' 0', 1),
+        ('-0', 1), ('+42', 1), ('+0x0', 1), (' 0x2a', 1),
+        ('--0', 1), ('+-0', 1), ('++42', 1), ('+ 42', 1), ('- 0', 1),
+        ('-1', 1), ('-42', 1), (' -42 ', 1),
+        ('4294967296', 1), ('4294967296 ', 1), ('1763362020123456789', 1),
+        ('18446744073709551616', 1), ('999999999999999999999999', 1),
+        ('-999999999999999999999999', 1),
+    ]
+    for seed, status in seeds:
+        # Test with KCONFIG_WERROR unset: all seeds succeed (malformed warn)
+        context = 'seed={!r}, werror=unset'.format(seed)
+        assert conf._run_conf('--randconfig', extra_env={
+            'KCONFIG_SEED': seed,
+        }) == 0, context
+        if status:
+            assert ('warning: KCONFIG_SEED has malformed format' in
+                    conf.stderr), context
+            assert conf.stderr.count('warning:') == 1, context
+        else:
+            assert 'warning:' not in conf.stderr, context
+        assert conf.config is not None, context
+
+        # Test with KCONFIG_WERROR set
+        for werror in ['', '0', '1']:
+            context = 'seed={!r}, werror={!r}'.format(seed, werror)
+            assert conf._run_conf('--randconfig', extra_env={
+                'KCONFIG_SEED': seed,
+                'KCONFIG_WERROR': werror,
+            }) == status, context
+            if status:
+                assert ('warning: KCONFIG_SEED has malformed format' in
+                        conf.stderr), context
+                assert conf.stderr.count('warning:') == 1, context
+                assert conf.config is None, context
+            else:
+                assert 'warning:' not in conf.stderr, context
+                assert conf.config is not None, context
+
+    # Verify unset KCONFIG_SEED succeeds under KCONFIG_WERROR
+    for werror in ['', '0', '1']:
+        context = 'unset seed, werror={!r}'.format(werror)
+        assert conf._run_conf('--randconfig', extra_env={
+            'KCONFIG_WERROR': werror,
+        }) == 0, context
+        assert 'warning:' not in conf.stderr, context
+        assert 'KCONFIG_SEED=0x' in conf.stdout, context
+        assert conf.config is not None, context
+
+
+def test_valid(conf):
+    groups = [
+        ('0x0', ['0', '00', '0x0', '0X0', '0x00000000']),
+        ('0x2A', ['42', '052', '0x2a', '0X2A']),
+        ('0x80000000', ['2147483648', '020000000000', '0x80000000', '0X80000000']),
+        ('0xFFFFFFFF', ['4294967295', '037777777777', '0xffffffff', '0XFFFFFFFF']),
+    ]
+    for expected_hex, representations in groups:
+        expected_config = None
+        for seed in representations:
+            context = 'seed={!r}, expected_hex={!r}'.format(seed, expected_hex)
+            assert conf._run_conf('--randconfig', extra_env={
+                'KCONFIG_SEED': seed,
+            }) == 0, context
+            assert conf.stderr == '', context
+            assert 'KCONFIG_SEED={}\n'.format(expected_hex) in conf.stdout, context
+            assert conf.config is not None, context
+            if expected_config is None:
+                expected_config = conf.config
+            else:
+                assert conf.config == expected_config, context
+
+
+def test_unset_and_empty(conf):
+    for base_env in [{}, {'KCONFIG_SEED': ''}]:
+        for werror in [None, '', '0', '1']:
+            extra_env = dict(base_env)
+            if werror is not None:
+                extra_env['KCONFIG_WERROR'] = werror
+            context = 'extra_env={!r}'.format(extra_env)
+            assert conf._run_conf('--randconfig', extra_env=extra_env) == 0, context
+            assert 'warning:' not in conf.stderr, context
+            assert 'KCONFIG_SEED=0x' in conf.stdout, context
+            assert conf.config is not None, context
-- 
2.53.0


Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5654466AE1
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Sep 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777486; cv=none; b=sBB3ux+iBO4coG3cxUvrv4Q46vPJLKPA30U1Nxe8IP9lK+fNCQ8Pu+rsRPjYl9wuOiSc8v0S82nfz3D1ZQVDqRszeqXnZog1ghzeaVLb+vQyb+1XVMC439jJZy0NRb2FoMBvLbpstPgOzetAJzZlBKL2u/Rn8LJjb6I2sQlV9hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777486; c=relaxed/simple;
	bh=ZP0v0FbC59/0C24ZWn/MoBhMdBld/zG+x2hSIlkc6M0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gcVl0gG8Ie2GQog6n7WnvslQf60w+xv8GYmG/pqUmbKE7k5pqNApkKduoKG+MUrProBfDbVbPwvclblEOvXCukTFPGf8Bqj9nE76hVrvqWL7bikfaZ3sask8ydD07ax7f9Ix5INv9sVREUYTORY44kJqXplhVlt3FDT/CS6iJl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeRxMWsK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeRxMWsK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49954b88fffso25470005e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Sep 2026 03:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788777483; x=1789382283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LfFVHzcpV0I36UPxeD3SH8L9Tgicjr0WOI5DBup3i1c=;
        b=YeRxMWsKlyhDC0i464VVvJZnatrt3H+V9dIe3s1UAF4WG0dSvMORcoxJ4QOdm89lBj
         TZai8Pix7AbnUPHxfB+Nfk4gFVZTN0mef3jR0340BMIgLyB/8llyuPgeljp+Iimy2EOJ
         tmbum3O4ubQG729dDzM3U0A7gcLAwlVUDlkygTNdjnepzrc0iwXLQn0pyRCF47Un+to8
         2KM43EHm0jUeB+z58DW6iJVrBliV0mCCMnvtvOZgEGSLdODPIpgZVXcaiapoqLNOqU+M
         x6+fFIWmXZDNKrgOXNSz0bmIeptjSPLpt2jk8rXmJIdiGWRIG317BlTxXOv1SBZOb4Rc
         etkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777483; x=1789382283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfFVHzcpV0I36UPxeD3SH8L9Tgicjr0WOI5DBup3i1c=;
        b=hZIDBFEeemAfVepHWhigBTVbcObQ0RxM7jsOjNJP+qQJ+Q13E53D9FsK0bmdto0XL3
         gDGL2XXwRsvEnkj++kG3nWX76qWnEwmTUu4FcQFnuot3KKQocL6SmLVxtwQCuNxIUcgP
         059n4/CfB/8HUd9IGN3iLwZURNDwErq4IxfKvsKkdMyMPn8xzwD+L9G38U1FoB2PRCLX
         Uhc2k9nNM6Lu5bxnmIQfaQwPZrf/N2niYkr9yybzCc6fMkuXuXL2hXvmDlw7GG1bRuuk
         TxTyX7faPqNPXpN8Fs3HgG1Eea5du2K58/iAPGhtqPm2TmCqQuskNNO2zKQSfwKLuxvV
         /0FA==
X-Forwarded-Encrypted: i=1; AKwUvBzgZsSoHvBTL/Kp74tow0NEmLWPK9ZbnJyU4Lp4YosSvljJ0JYxDel965KULGOtk6Miyi2gbPvtT/t4cr0=@vger.kernel.org
X-Gm-Message-State: AFuF++mMcSMACEXQOdqvQqG4tkIGsryNVAeM9JDF9QIkOI7w4uClvuZ4
	flNKBSoG1Oz9hJmRhuRoO24ZoBq3qchwm8EQ5Q76G4dJjgXv+W0UZp25
X-Gm-Gg: AYBFou3bsvoUbTTxzI5N6YxXhhgWj2a1V1XY54bhYr0u4q/t9qPT51RMkiYtVQTvz7B
	YEJPckdvmPXsUXakYp1G3PY4q/G09/KfUOGkKoBSirH0bvAa4O3Q0vYRFCLDWJTrNCkbjWm2/wW
	mDd0QD9Li4Rcr3vp2+Hk49d0qhLbvPQdYmsa5cq2hs/zAnqFcpg29cV4lK3wfP9WUbXlSua9T9d
	wZ4ONxdn7xi6PlYzD6ig5H8p96GYSRBPXdtXBjLvwalCuWMbtbHABd0TgQtCzBF4JcUq1J3vaqU
	8mSoLZjmBRG3OWE2mQpjpu8i8l9Z7JjOKuIOHYqrbDzXyGzEfN/fXPAlItobsNB8eHoTw1Pzrcg
	KhGlZA5TrZUYXmWfuC4QG6P8XCv/F0FhPbzemlTIg+p2c513fkns9jBjnmouKn+iNrBUBcS4MV8
	wr5GdQqwErlC/RUFs/Jz/tIeLyGa7D33sDDKkW9XVKKpbm0YEB0X004TRbUeMUQIUb4rQK7Akw4
	mVWhfhYBuH94gfo56jo73g+ZY5OpDeT45SqZdAwpPtoSPG/VhojMwXbxKqSYw==
X-Received: by 2002:a05:600c:3e1a:b0:49c:fc6c:bdff with SMTP id 5b1f17b1804b1-49cfc6cc078mr168749475e9.22.1788777482725;
        Mon, 07 Sep 2026 03:38:02 -0700 (PDT)
Received: from localhost.localdomain ([95.3.12.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm311944285e9.3.2026.09.07.03.38.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 03:38:02 -0700 (PDT)
From: Erkan Erdem <hexvalid@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Erkan Erdem <hexvalid@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH v2] kconfig: preserve the final answer when input has no newline
Date: Mon,  7 Sep 2026 13:37:38 +0300
Message-ID: <20260907103739.23212-2-hexvalid@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

conf_string() unconditionally removes the last character returned by
fgets(), assuming that it is a newline. When redirected input ends
without a newline, the last character is part of the answer instead.
For example, feeding 42 to an integer prompt stores 4, and feeding
0xff to a hexadecimal prompt stores 0xf. Both commands succeed despite
silently changing the supplied value.

Strip the newline with strcspn() so that a complete answer at EOF is
preserved. Keep the existing handling of newline-terminated and empty
answers unchanged.

Add regression tests for string, int and hex answers, with and without
a final newline, in oldaskconfig and oldconfig.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
---

Changes in v2, addressing Julian Braha's review:
- Add an in-tree regression test under scripts/kconfig/tests for string,
  int and hex answers, with and without a final newline, in oldconfig
  and oldaskconfig. The shared test harness is unchanged.
- Submit this fix independently of the checkkconfigsymbols.py change.
- Refresh Cc from scripts/get_maintainer.pl, including the LLVM contacts.

v1: https://lore.kernel.org/all/20260905123237.40670-1-hexvalid@gmail.com/

An AI coding assistant found the issue, prepared the fix and changelog,
and ran the original verification. The assistant also prepared the new
regression test and this v2 revision.

Validation:
- Built original and fixed conf with Clang on macOS and GCC in an
  x86_64 Linux container, using -Wall -Wmissing-prototypes
  -Wstrict-prototypes -Werror.
- On both platforms, the original conf fails all six unterminated-input
  cases and passes all six newline-terminated controls.
- The fixed conf passes the complete 33-test Kconfig suite on both
  platforms, including all 12 new cases.
- This tests the host configuration tool; a complete kernel was not built.

 scripts/kconfig/conf.c                        |  2 +-
 .../kconfig/tests/conf_no_newline/__init__.py | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 scripts/kconfig/tests/conf_no_newline/__init__.py

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index fe8ba09b0..46c9ca646 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -343,7 +343,7 @@ static int conf_string(struct menu *menu)
 			}
 			/* fall through */
 		default:
-			line[strlen(line)-1] = 0;
+			line[strcspn(line, "\n")] = 0;
 			def = line;
 		}
 		if (def && sym_set_string_value(sym, def))
diff --git a/scripts/kconfig/tests/conf_no_newline/__init__.py b/scripts/kconfig/tests/conf_no_newline/__init__.py
new file mode 100644
index 000000000..0fca696d2
--- /dev/null
+++ b/scripts/kconfig/tests/conf_no_newline/__init__.py
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Preserve complete string, int and hex answers at end of input.
+"""
+
+import subprocess
+
+import pytest
+
+from conftest import CONF_PATH
+
+
+@pytest.mark.parametrize('mode', ['--oldaskconfig', '--oldconfig'])
+@pytest.mark.parametrize('newline', ['', '\n'], ids=['eof', 'newline'])
+@pytest.mark.parametrize('symbol_type, value, expected', [
+    ('string', 'abcdef', '"abcdef"'),
+    ('int', '42', '42'),
+    ('hex', '0xff', '0xff'),
+])
+def test(mode, newline, symbol_type, value, expected, tmp_path, monkeypatch):
+    (tmp_path / 'Kconfig').write_text(
+        'config TEST\n\t{} "Test value"\n'.format(symbol_type))
+    monkeypatch.setenv('srctree', str(tmp_path))
+    monkeypatch.setenv('KCONFIG_DEFCONFIG_LIST', '')
+
+    result = subprocess.run([CONF_PATH, mode, 'Kconfig'],
+                            input=value + newline, text=True,
+                            stdout=subprocess.PIPE, stderr=subprocess.PIPE,
+                            cwd=tmp_path, timeout=10)
+
+    assert result.returncode == 0, result.stderr
+    assert 'CONFIG_TEST={}\n'.format(expected) in (tmp_path / '.config').read_text()

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
-- 
2.50.1 (Apple Git-155)


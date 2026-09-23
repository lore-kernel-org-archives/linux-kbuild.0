Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1239D52188F
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Sep 2026 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173389; cv=none; b=qGP0epn5mZUu+AnnQdNwzZMjl4XMKgK1Tn4kl862Guz3W6qTc18dqvoV6adr0smVEAZMmYTum2ysfBh0iKvmVxa1Wyotj4KHIzEiIK89OCbByqRYD0Sdd7ZOfOy6F+CO22YWv/Tm5Og0AJ2s0j7aZvXj7RJea0cFhYoOOihyVtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173389; c=relaxed/simple;
	bh=vHF/4Rebpf1RbmlVp0v2ZLMX/ypaFMtdvlrlz1+PRak=;
	h=From:Date:Subject:To:Cc:Message-ID:MIME-Version:Content-Type; b=WFNj8g/iUf4WgM3IpGwDU8XzmtkYTVz+fJMAy6bm/EE41tEAHVD6opoN7dhz5WLtiU/pvuh3cv4d3m6czNJ0BAvsxottcPLMruPRyIv/NxlPpW1p5eDSeLhMbaRPvfxZHTV2YGbHsEwOnRFFUDvpeh4W+noRJWUQ3TAltPMA53U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhANkH8E; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhANkH8E"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86b90133ae8so559532b3a.1
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Sep 2026 07:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790173387; x=1790778187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOAfnEJCG2dfje1lhj2D/yy4s3DfFqXgRx5oeJiylnY=;
        b=HhANkH8ExC9SpT5qyZKbCVFKMQTPmeA6RwWOndDgqRo2FdugEAaaH4db14sRmuknPG
         WolZLi7LchG9y+mJqxX2EUD8GsxA1MP0fUEHwezmMczkhEh3XCMaRPvrpLy/h/m1Fs/Q
         8mokFu/0Y5dcRrorrRhBCrAVhqJlxxjabNJnI/YBQvwDV7Yi+7I5h+xG8Wh/R2Fky0Mg
         CJkly68JyDdxmO2HDalF9Pv7inCLm7tXuxjw0TIzkqUjVcq6eK19Bj5y33DNskuTjIn3
         n7OT+Lxtzn2nuECnkf1WlJgKBMl99MYTkhI8Ug9x3uLuYxyMR/sgS2KkstnbNsuTJs6u
         P9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173387; x=1790778187;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hOAfnEJCG2dfje1lhj2D/yy4s3DfFqXgRx5oeJiylnY=;
        b=a8MsouNugSr9O55006EQME/8xAVQ/YoF0wrBLNZKcxrsQliN8SEfEkV8qR+Wrsz+l2
         UhpgeyI6FdNq6fGkvmxXIIyoFF6k4TLd6hxNB+xmkEdQH27yXKgu+b6BFFR9F1Wo5wCz
         PyVv2P5blHLLwL2/Y0Gd9mwvu88Z1kV0IHc+8kOIgTWA0krZ1pyj1sZHOHH8Y9AjQAqm
         Xx3ZNNIhDbO5ZoNYNhqfJ2k6VCiKWH7LC+dUnuqi4QrFLXLH6xN5bJGJX0yDLgMntDdb
         ugmgCUjOeF1ShdG66ltQe2GFpBbAB2x3GROKnYe37bYGc5abOmpfSCeI8xzWlHpuZalV
         U2Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwCcn34GX9GZxz4QF2w4U7UDUcBLHjP7qvjRED5kSqF1yEW6/WAnAeuPUW+JpVQg8qGqxY26tBE+A/oKfE=@vger.kernel.org
X-Gm-Message-State: AFuF++mYOQN/jOB6AbQVP6BvbTE7t965p1yQ0BJ3WFAzfle8fCvxBot3
	/4hzzZSUlkI18sCWg5V0rO5MZ0NwSdgh2zr25pQhVozb9EBfX8TsszDp
X-Gm-Gg: AYBFou3sBjILkn8NedzqgUPelRZVImZ7+TjgOX1jrOoRA6zu4ICjATKd42OEdvHjGu/
	DqDo/mg3Ww1Gb/phSzglPIg4MaaktAR5yxKWNKsIJ06dYvjxCAoJ5QEtO4CESESKwB2Z7IFe3Zc
	cAtTAjnYKeC0BNn79bC6Wr1wE0km3Qqe7etvLoZbxvkGFWx3O658Ev6+NnAmnUOx/1l30az41pU
	KwmFFkqC8E42w7D17kG5ZdSVz1EtGeg6l3jAl/3NQDrRwC4CXExzJCTxFZe88aI8JeINvLiD6gc
	U4Pg01OJDs1W/U+4gxEFu4u1iCOaqxfeFaYB03EojUIoNlbLMzsO6Rb8Gxaek80tsQEUjX6vtEK
	hTRWmffNQ100elz9duE6idNE2xp1/uLkEs73/C0/USpHUSY0AlscdRzfnesoZGeY2jw3lmTM4W4
	RWA7kS7fDn6bDOuq1X5zm9eaYsbKeR7Yo1eJc6LTENMutgIblRgIxkODEdOmeKwBuYi/xqnYhR5
	FWth6DbyERG3gM5D/xPAsIcfqTUZs1mI5/xTkKqehwjLMovadfMRD9XbG5CsYJ3/lGl4Yvdgveb
	FhEdh09wqpRpvmvm2B8edvXGD36yw/kqFsE/W20ZPf98hw==
X-Received: by 2002:a05:6a00:3912:b0:874:705d:f63b with SMTP id d2e1a72fcca58-87d1c1c833dmr2392179b3a.29.1790173387247;
        Wed, 23 Sep 2026 07:23:07 -0700 (PDT)
Received: from [172.16.0.2] ([2a09:bac5:d58e:323::50:1d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e0f4fbbsm1403313b3a.52.2026.09.23.07.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:23:06 -0700 (PDT)
From: houtinghang <ue081723@gmail.com>
Date: Wed, 23 Sep 2026 22:22:59 +0800
Subject: [PATCH] clang-tools: Import os for broken pipe handling
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Message-ID: <179017337986.52388.7943687183785012868@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The BrokenPipeError handler in run-clang-tools.py calls os.open() and
os.dup2() without importing os. When the analysis pool raises this
exception, the handler raises NameError instead of redirecting stdout
and exiting with status 1.

Import os and add a regression test that injects BrokenPipeError from
Pool.map(), then checks the redirection and exit status.

Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python scripts")
Assisted-by: LLM
Signed-off-by: houtinghang <ue081723@gmail.com>
---
Testing: python scripts/clang-tools/run-clang-tools_test.py -v
The test fails before the import with NameError and passes after it.
Tested with Python 3.13 on Windows using exception injection; no complete
kernel build or real clang-tidy pipeline test was performed.

AI disclosure: Codex found the missing import, wrote the fix and test,
ran the test, reviewed the diff, and drafted this message in response to
a request to find, fix, review and submit a Linux kernel bug.

 scripts/clang-tools/run-clang-tools.py      |  1 +
 scripts/clang-tools/run-clang-tools_test.py | 41 +++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 scripts/clang-tools/run-clang-tools_test.py

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index e78be82..79d58b3 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -12,6 +12,7 @@ compile_commands.json.
 import argparse
 import json
 import multiprocessing
+import os
 import subprocess
 import sys
 
diff --git a/scripts/clang-tools/run-clang-tools_test.py b/scripts/clang-tools/run-clang-tools_test.py
new file mode 100644
index 0000000..207b866
--- /dev/null
+++ b/scripts/clang-tools/run-clang-tools_test.py
@@ -0,0 +1,41 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Tests for run-clang-tools.py."""
+
+import importlib.util
+import os
+from pathlib import Path
+import unittest
+from unittest import mock
+
+
+spec = importlib.util.spec_from_file_location(
+    "run_clang_tools", Path(__file__).with_name("run-clang-tools.py"))
+run_clang_tools = importlib.util.module_from_spec(spec)
+spec.loader.exec_module(run_clang_tools)
+
+
+class TestRunClangTools(unittest.TestCase):
+    def test_broken_pipe_redirects_stdout_and_exits(self):
+        args = mock.Mock(path="compile_commands.json")
+        with mock.patch.object(run_clang_tools, "parse_arguments", return_value=args), \
+             mock.patch("builtins.open", mock.mock_open(read_data="[]")), \
+             mock.patch.object(run_clang_tools.multiprocessing, "Lock"), \
+             mock.patch.object(run_clang_tools.multiprocessing, "Pool") as pool, \
+             mock.patch("os.open", return_value=42) as open_devnull, \
+             mock.patch("os.dup2") as dup2, \
+             mock.patch.object(run_clang_tools.sys, "stdout") as stdout:
+            pool.return_value.__enter__.return_value.map.side_effect = BrokenPipeError
+            stdout.fileno.return_value = 1
+
+            with self.assertRaises(SystemExit) as raised:
+                run_clang_tools.main()
+
+            self.assertEqual(raised.exception.code, 1)
+            open_devnull.assert_called_once_with(os.devnull, os.O_WRONLY)
+            dup2.assert_called_once_with(42, 1)
+
+
+if __name__ == "__main__":
+    unittest.main()

base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.52.0.windows.1


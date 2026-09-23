Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3824F48D872
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Sep 2026 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177231; cv=none; b=gTpQfIdG6lJnlr6KXovJRwKG66rNkmZj0LQ3BvFqKe3OERUpmBIi1cFKzF6Wjh+AVxnkmRsOpGervcp40IyVr0GTe8KO4/HhWMJREgEpB2gtL9HOEJsv92CwOAK1E+O5tAcrbjZcx25QvT3kcvqK+kicqwCp3sB0GJCh/eW1v3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177231; c=relaxed/simple;
	bh=ZE1AO8NjDCDoum7rwOUEcxpDlgjbbiQ4+FdSK7ehaHY=;
	h=From:Date:Subject:To:Cc:Message-ID:MIME-Version:Content-Type; b=DEIP8LKqerxdw7T38rVWoUG3kHcuveZeg/SWlGb71ris9HCG+BF8JiUk8FSFxXwacknsaBnkbTb7vWquBMQHzD55NNCpYWKV3mpMnx7MThp6IV9NuEHW2+8NNZ0dRQ6GmFVqgn7yHcneRcdtUDdjLAwFXmO0h5+3EdB2VC/u6bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoUzrBbq; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoUzrBbq"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso634897a91.1
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Sep 2026 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177224; x=1790782024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=grLXnCQQweMhLmDpYBV4MKF8n4Dw3i39obyyBfGlpSw=;
        b=WoUzrBbqpmNvQNEOszOB7R4++o8jZTHoB224jcVC8NGZ8RzEZFnbx3M7x+NnbG3Eoc
         aUwUGbWUDkfhTYVedEge8X8nPQphfDdZvwg6OIj43cCSZGtjdFQcbo1sYTEs6YvIOc3E
         wDhdT+5Igqq9xivTNu7MbDARvUbVGk5/m4g/ovVQDGLGjAG9RRHXKCUUGHZriI2gyaOb
         iKnHR17bxz87XMleEqE3TiiaKexZi4+7wK423OkZa+t+jz+ZeIxPFlTHFFq+T7vZ0gb8
         iStALiq/ubDiqc562L1A/HByAtpRfEOtWKK+v356Cvl7OiEVeLDIUt+axMiICSmARE9q
         GnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177224; x=1790782024;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=grLXnCQQweMhLmDpYBV4MKF8n4Dw3i39obyyBfGlpSw=;
        b=mNbNRx7+bUR/CoMb2vztnhfcG1xlbsg5jtWsllHsAGpgpxS2CEIICtfD6x1ELhASGr
         dRK966iasp1SUOtZOLlQdJh05z/s/NANkO21DmiJTqYXYly48OLWjbSbXD3ey4LSD6eZ
         qrzwH0+0FPM+4vnyn0hPlkBKUHbYXygmhl0ywIgUg+Vp/0j4STbaMB4M/freJwtfq/SY
         xVx9DyXbwJ4O34VaOKIKNndKAGbVDSWtsSbpvyJsONGFI9AU9u1lvnp++szmABEIRSag
         pKbIgpCh/P3hT5688qowM2SXS3gP3feOeMBnj15lRPue1u1AGpgzqUlziSs1G3Kejbva
         Ag9A==
X-Forwarded-Encrypted: i=1; AKwUvBzOiMXwLzzfQjev1/Kpo9/A/JsQw+BleaF4qLBnumIfmm5kZCJyezyGMXdwRSFINTJAITukrovpHcYgNQs=@vger.kernel.org
X-Gm-Message-State: AFuF++nfCVOg3W0P3I/arW9cJftVg07MrimuIB+daHkkBGOuLOPbQcGX
	9wrWobZXwzimQVpLQ2YuL1GYjs0ioDmq8ds2ARTi4Jk4RFMx9uaelkRc
X-Gm-Gg: AYBFou1eAJwtXCNA4YvqEzPTK2I8uKMROiKAxh6nSsl1q7N+sVL/m2lzQvKGxv2kBS2
	sCwzmThwLzKNOJYUDNiRtWSLPEsg1CEHXKJ64ETY7Qv5tnDGC9GnWjZNofwLH+H37+0M41OR91Y
	p6CL9jQavWnKSLHxIMuqeL6sDZI0GAc5DO9eJseX02z74qML7S0+Zq0sC7vf2pgrAu0s0JcOZrQ
	trxARtYcNdcitLOEGRz0+OBIbcnlUXWJu87a/A6AYIxp0iouZ57y1UB7ON97+nJGIdZ4INeUhmv
	rvvW0DsijyaNGUAlJg1rwo3w36xcLlrTfca1BJ43W6XI1L9E713ClCPEgbmERcqeMmf5n4v3eZb
	Fv6xyrlB2cXL4fiOzJfKdqQTv2F+OJ1EcCq2pJvYKxgJAlTkBnrSmzcv2pW9GhhNP4xYzx97XaW
	7oPXwUGcGMf5JORsY/QnLShAXY8hP1kHY2lUkX1yXujJJ46z2GKMLK61sHe4G8nCcfFsBILPAaZ
	gy5724hfu4frMDBxEc/6tOCc2/+kDaQ+GLyN0rUmmea1aCWMtwpCRDcNJRgFdQq09g2xbjWR2kP
	BqM9H7B4edfc0tXByAieNmQQltBvxF83VyQ=
X-Received: by 2002:a17:90b:1344:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3a07e51cf13mr2310705a91.6.1790177223646;
        Wed, 23 Sep 2026 08:27:03 -0700 (PDT)
Received: from [172.16.0.2] ([2a09:bac5:d58e:323::50:1d4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0812c87e9sm1822061a91.3.2026.09.23.08.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:27:03 -0700 (PDT)
From: houtinghang <ue081723@gmail.com>
Date: Wed, 23 Sep 2026 23:26:33 +0800
Subject: [PATCH] clang-tools: Resolve compilation database paths before
 changing directory
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Message-ID: <179017719332.59156.6125068848526895246@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

run-clang-tools.py opens the compilation database relative to the caller,
but passes the same path to clang-tidy while running it in each entry's
build directory. If these directories differ, a relative database path
no longer points to the selected database. clang-tidy then falls back to
running without flags, or can pick up a different database.

For example, invoking the script with database/compile_commands.json
from the parent of the build directory makes clang-tidy look under
build/database/compile_commands.json. A source file that requires a
macro defined in the selected database then reports a compiler error.

Convert the database argument to an absolute path when parsing it, before
starting the worker pool. This preserves the caller's selected database
when subprocess.run() changes the working directory.

Add a regression test using real clang-tidy with C and C++ inputs. Cover
both analysis modes and absolute, relative, dot-prefixed and parent
component paths, including a database directory containing spaces.

Fixes: 6ad7cbc01527 ("Makefile: Add clang-tidy and static analyzer support to makefile")
Assisted-by: LLM
Signed-off-by: houtinghang <ue081723@gmail.com>
---
Testing with Python 3.12.3 and clang-tidy 18.1.3 on Ubuntu:
- Eight CLI invocations cover both analysis modes and four path forms,
  each processing C and C++ inputs. Six fail before the fix; all pass
  after it.
- Real x86 and ARM64 Clang init/main.c analyses match the output from
  the original script with an absolute database path, with no compiler
  errors. Existing analyzer warnings remain identical.
- GCC database diagnostics also match, but clang-tidy cannot fully
  process the GCC configuration; this is not a clean analysis result.

AI disclosure: Codex found and reproduced the path bug, wrote the fix
and regression test, reviewed the changes, ran the tests and drafted
this patch in response to a request to find another kernel issue.

 .../clang-tools/run-clang-tools-path-test.py  | 56 +++++++++++++++++++
 scripts/clang-tools/run-clang-tools.py        |  3 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 scripts/clang-tools/run-clang-tools-path-test.py

diff --git a/scripts/clang-tools/run-clang-tools-path-test.py b/scripts/clang-tools/run-clang-tools-path-test.py
new file mode 100644
index 0000000..87baba5
--- /dev/null
+++ b/scripts/clang-tools/run-clang-tools-path-test.py
@@ -0,0 +1,56 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Exercise compilation database paths with the real clang-tidy executable."""
+
+import json
+from pathlib import Path
+import shutil
+import subprocess
+import sys
+import tempfile
+import unittest
+
+
+SCRIPT = Path(__file__).with_name("run-clang-tools.py")
+
+
+@unittest.skipUnless(shutil.which("clang-tidy"), "clang-tidy is required")
+class TestDatabasePath(unittest.TestCase):
+    def test_database_path(self):
+        with tempfile.TemporaryDirectory() as directory:
+            root = Path(directory)
+            build = root / "build"
+            database = root / "database with spaces"
+            build.mkdir()
+            database.mkdir()
+            entries = []
+            for suffix in ("c", "cpp"):
+                source = build / ("test." + suffix)
+                source.write_text(
+                    "#ifndef REQUIRED\n#error compilation flags lost\n"
+                    "#endif\nint test;\n", encoding="utf-8")
+                entries.append({
+                    "directory": str(build), "file": str(source),
+                    "arguments": ["clang", "-DREQUIRED", "-c", str(source)],
+                })
+            path = database / "compile_commands.json"
+            path.write_text(json.dumps(entries), encoding="utf-8")
+            paths = [str(path), str(path.relative_to(root)),
+                     "./" + str(path.relative_to(root)),
+                     "build/../" + str(path.relative_to(root))]
+            for analysis in ("clang-tidy", "clang-analyzer"):
+                for value in paths:
+                    with self.subTest(analysis=analysis, path=value):
+                        result = subprocess.run(
+                            [sys.executable, str(SCRIPT.resolve()), analysis,
+                             value], cwd=root, capture_output=True, text=True)
+                        self.assertEqual(result.returncode, 0, result.stderr)
+                        self.assertNotIn("compilation flags lost", result.stderr)
+                        self.assertNotIn("Running without flags", result.stderr)
+                        self.assertNotIn("Error while trying to load",
+                                         result.stderr)
+
+
+if __name__ == "__main__":
+    unittest.main()
diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index e78be82..230db50 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -12,6 +12,7 @@ compile_commands.json.
 import argparse
 import json
 import multiprocessing
+import os
 import subprocess
 import sys
 
@@ -31,7 +32,7 @@ def parse_arguments():
                         choices=["clang-tidy", "clang-analyzer"],
                         help=type_help)
     path_help = "Path to the compilation database to parse"
-    parser.add_argument("path", type=str, help=path_help)
+    parser.add_argument("path", type=os.path.abspath, help=path_help)
 
     checks_help = "Checks to pass to the analysis"
     parser.add_argument("-checks", type=str, default=None, help=checks_help)
-- 
2.52.0.windows.1


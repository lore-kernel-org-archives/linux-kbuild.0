Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927CA1DDC2B
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Jul 2026 00:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111400; cv=none; b=OoHkdQWW6RCpHscLDE/Mf2sfvVFKxUm9o09Bwacd+iVrJA6tRJ7ipRyhLTIrCATBkp254rfZEM0tvzcS9H4wa8puCoucv2Q0HOwyzt7NdFit088kLMj9aUr+nxroZW9x5eLm+x+VIt2sv7KmxW8jcrYJ/JOLMwkLbKddY2scGEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111400; c=relaxed/simple;
	bh=jTzPryTH2CVEZgemHn8cADl5fR/QakT2FfYvWO5YPIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aUl88Z15X5s5vvRPdCpXgW+924ICq6gXpycLVE9//zVmC9HZtehLaTYPhKmVlKtxAU5sFUcPY774+mc5mICJg7+Nz0qvS8DVORoZHDP3km7lNE+W6ZvZOhLgNQklCDlHvZ/tKymsSpX8hXQeUJHS8+drgYnDwOzrRtpF2viLPu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwBcDpko; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwBcDpko"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4956242332dso18917735e9.2
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Jul 2026 17:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785111395; x=1785716195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=imb6/XH0fKYXI04n1Ki2zc81WcuhhBpNWae+C/ggjgA=;
        b=YwBcDpkobu0SLp7Kdgl34dPOWF07agrh6Gr/VHQZEcOuB5yS1ss4dABsAN7QFYW6qT
         4vupYTGyWXGnTSNrahlbLg0mbWJ5DTg1rVquU/SygCzGJZam+1YjM/D2Oc4wml7dNyjx
         B9Ne1Il2fKNdmXxx7sZbA9YRsmYtE76nag1DS2eFsMqe8ginpxXIvECbXHSJ2ioWxV+Q
         Zmq8VXkBvK/EbFph1Qb7EW5kEoftT3Bo76wYsnQhY801QNhbInFCL1P3xVrskpR0dfxt
         BVmLgqQwlrg2XU7hlAavcIHsg3aRTcH6Eq4Rti+4JmKGMV+mwPCg+FvRhyTuiNabhCzF
         OAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111395; x=1785716195;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imb6/XH0fKYXI04n1Ki2zc81WcuhhBpNWae+C/ggjgA=;
        b=X/BYYJoWSl3a4sKobOMIsB+MY/IDBdl9Fj9d1Mf57JZ9fktG/SGUneRHFrYnoZLWTy
         AbMGVc5ygcDC46csIflJGtlRhxrGWmwVCFocO5voHSRqrUTg8pxmlGIzNhIgioRVslQj
         Hq+5PMT9eTjb/KW8JL6qNrRQWzBhgjOj//9EWK1APzUnQpIg8bo0Sm/vp8evJmN0vVqi
         EwMEzrMQa9bZhkQFi2p0lSh+Mac2dQGxo8SZXORgJ1EXoBzWIHCK5CK/5hCWTeUcoSxS
         C8tbN+WMJdZssawzCKe2OeU5wnuHe2HZEJ3owfsPb1NR4kOvRYMYiVMat9M4CkHm2wGJ
         r7Yw==
X-Forwarded-Encrypted: i=1; AHgh+RplddAhfX72UvZFPn3bsLlvCPfYiLc3+80XyDlS39lOPqVFMLspb59CinXhRgV2kJB9TQejYjAaP19SHUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR+IUxLlVHFWMXKgZEsUTURdBG8IRZBooKOnDio6Tu7B0arUpG
	hynyKQUomOdtQhbJoNDtHMYVJeTHS1Jci4L2Tat4YsbAhTEi1Ft3bi9N
X-Gm-Gg: AR+sD12kc/8uVech1tiHA2CvWKP5Hq1HUMoGcnyu9q3GGI913+AvvIRdyL1vwOHtppp
	dApQ37QRP1tiAPx9bKxGrfsVkuAY0nomfjMuWtGQ6Z8somcH+iZrqY5HIdySyp6nkACuJvyAK8S
	yDXebJgC1JAOHH8RtvY5Z5AmE1sAF09X7o0vH6V99TJTaX9YJJtFzRHvmhSHEOBptilmuoXxCf9
	Gxzfxl+6jWBQSF67zmU0OvjnYjzRpwEIndTip2ZQbhKbey9wTpWEAZ8oSlBE7XFLVRwuxm6c+Bs
	wJEtY44YBCk5wlvvFsMgyD4cd3FrwdvNA8NGXO4jlf9grSpjUbLMnNvv/bZbIJUrrY+mWQPW9qv
	o44X/KN/LRYBx7v73bSbPu0dow2SHgGGlp4ydbSvhqahh/GL0iQ7IDVthMPOXfd0GlZWe9FoZ/H
	3GgkkKinN7IF9OPSWnIOqiXRLO1STySzuHPDI7T3PTCaknRZRI4+Xk42PNWvoKnHtIUg==
X-Received: by 2002:a05:600c:c87:b0:495:4a34:16d9 with SMTP id 5b1f17b1804b1-496b570148amr82282755e9.31.1785111395275;
        Sun, 26 Jul 2026 17:16:35 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b485f65csm176403555e9.5.2026.07.26.17.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:16:34 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	akpm@linux-foundation.org,
	jani.nikula@linux.intel.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	ljs@kernel.org,
	andrew.jones@linux.dev,
	masahiroy@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v4 3/5] kconfirm: add tests
Date: Mon, 27 Jul 2026 01:16:21 +0100
Message-ID: <20260727001623.2794156-4-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727001623.2794156-1-julianbraha@gmail.com>
References: <20260727001623.2794156-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add tests for kconfirm using pytest, as Kconfig does. The tests cover all
of kconfirm’s checks, and any additional, future checks need to add tests
as well.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 .../kconfig/kconfirm/tests/arch/arm/Kconfig   |   9 +
 .../kconfirm/tests/arch/powerpc/Kconfig       |   4 +
 .../kconfig/kconfirm/tests/arch/riscv/Kconfig |   9 +
 .../kconfig/kconfirm/tests/arch/sh/Kconfig    |   4 +
 .../kconfirm/tests/arch/testarch/Kconfig      |   4 +
 .../kconfig/kconfirm/tests/arch/um/Kconfig    |   4 +
 .../kconfig/kconfirm/tests/arch/x86/Kconfig   |   4 +
 .../kconfirm/tests/architecture.Kconfig       |   4 +
 .../tests/architecture_common.Kconfig         |  19 +
 .../kconfirm/tests/conditional_prompt.Kconfig |  17 +
 scripts/kconfig/kconfirm/tests/conftest.py    |  93 +++++
 ...nt_condition_negative_expression_1.Kconfig |  13 +
 ...nt_condition_negative_expression_2.Kconfig |  13 +
 ...nstant_condition_negative_symbol_1.Kconfig |  13 +
 ...nstant_condition_negative_symbol_2.Kconfig |  13 +
 .../kconfig/kconfirm/tests/dead_link.Kconfig  |  12 +
 .../tests/default_categorization.Kconfig      |  20 +
 scripts/kconfig/kconfirm/tests/pytest.ini     |   2 +
 scripts/kconfig/kconfirm/tests/ranges.Kconfig |  39 ++
 .../kconfirm/tests/select_imply.Kconfig       |  28 ++
 .../kconfig/kconfirm/tests/test_kconfirm.py   | 358 ++++++++++++++++++
 21 files changed, 682 insertions(+)
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/arm/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/powerpc/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/riscv/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/sh/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/testarch/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/um/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/x86/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/architecture.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/architecture_common.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/conditional_prompt.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/conftest.py
 create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_1.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_2.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_1.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_2.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/dead_link.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/default_categorization.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/pytest.ini
 create mode 100644 scripts/kconfig/kconfirm/tests/ranges.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/select_imply.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/test_kconfirm.py

diff --git a/scripts/kconfig/kconfirm/tests/arch/arm/Kconfig b/scripts/kconfig/kconfirm/tests/arch/arm/Kconfig
new file mode 100644
index 000000000000..5922782a5f4d
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/arch/arm/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+source "architecture_common.Kconfig"
+
+config ARM_ONLY
+	bool
+	depends on ARM_PREREQUISITE
+	depends on ARM_PREREQUISITE
diff --git a/scripts/kconfig/kconfirm/tests/arch/powerpc/Kconfig b/scripts/kconfig/kconfirm/tests/arch/powerpc/Kconfig
new file mode 100644
index 000000000000..45e94dc6cec6
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/arch/powerpc/Kconfig
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+source "architecture_common.Kconfig"
diff --git a/scripts/kconfig/kconfirm/tests/arch/riscv/Kconfig b/scripts/kconfig/kconfirm/tests/arch/riscv/Kconfig
new file mode 100644
index 000000000000..9f760f673064
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/arch/riscv/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+source "architecture_common.Kconfig"
+
+config RISCV_ONLY
+	bool
+	depends on RISCV_PREREQUISITE
+	depends on RISCV_PREREQUISITE
diff --git a/scripts/kconfig/kconfirm/tests/arch/sh/Kconfig b/scripts/kconfig/kconfirm/tests/arch/sh/Kconfig
new file mode 100644
index 000000000000..45e94dc6cec6
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/arch/sh/Kconfig
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+source "architecture_common.Kconfig"
diff --git a/scripts/kconfig/kconfirm/tests/arch/testarch/Kconfig b/scripts/kconfig/kconfirm/tests/arch/testarch/Kconfig
new file mode 100644
index 000000000000..bb5c0e4b3829
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/arch/testarch/Kconfig
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+# Dynamically discovered test architecture.
diff --git a/scripts/kconfig/kconfirm/tests/arch/um/Kconfig b/scripts/kconfig/kconfirm/tests/arch/um/Kconfig
new file mode 100644
index 000000000000..45e94dc6cec6
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/arch/um/Kconfig
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+source "architecture_common.Kconfig"
diff --git a/scripts/kconfig/kconfirm/tests/arch/x86/Kconfig b/scripts/kconfig/kconfirm/tests/arch/x86/Kconfig
new file mode 100644
index 000000000000..45e94dc6cec6
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/arch/x86/Kconfig
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+source "architecture_common.Kconfig"
diff --git a/scripts/kconfig/kconfirm/tests/architecture.Kconfig b/scripts/kconfig/kconfirm/tests/architecture.Kconfig
new file mode 100644
index 000000000000..a4f1c68548b4
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/architecture.Kconfig
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+source "arch/$(SRCARCH)/Kconfig"
diff --git a/scripts/kconfig/kconfirm/tests/architecture_common.Kconfig b/scripts/kconfig/kconfirm/tests/architecture_common.Kconfig
new file mode 100644
index 000000000000..3205d0d59071
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/architecture_common.Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+config SHARED_SELECTEE
+	bool "Shared target"
+	help
+	  This is a test-only symbol with a visible prompt.
+	  Kconfirm uses it as the target of a select statement.
+	  The architecture tests verify that selecting this symbol
+	  produces the expected select-visible diagnostic.
+
+config SHARED_SELECTOR
+	bool
+	select SHARED_SELECTEE
+
+config SHARED_DEPENDENCY
+	bool
+	depends on SHARED_PREREQUISITE
+	depends on SHARED_PREREQUISITE
diff --git a/scripts/kconfig/kconfirm/tests/conditional_prompt.Kconfig b/scripts/kconfig/kconfirm/tests/conditional_prompt.Kconfig
new file mode 100644
index 000000000000..f2fef6ea874b
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/conditional_prompt.Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+config SELECTEE
+	bool "Target" if PROMPT_CONDITION
+	help
+	  This is a test-only symbol with a conditional prompt.
+	  Kconfirm uses it as the target of a select statement.
+	  The test verifies that the prompt condition is included
+	  when deciding whether the target is visible.
+
+config SELECTOR
+	bool
+	select SELECTEE
+
+config PROMPT_CONDITION
+	bool
diff --git a/scripts/kconfig/kconfirm/tests/conftest.py b/scripts/kconfig/kconfirm/tests/conftest.py
new file mode 100644
index 000000000000..005681e7e337
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/conftest.py
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+"""Fixtures for kconfirm regression tests."""
+
+import os
+import subprocess
+from pathlib import Path
+
+import pytest
+
+
+class Kconfirm:
+    """Test kconfirm against Kconfig fixtures."""
+
+    def __init__(self, binary):
+        self._binary = Path(binary).resolve()
+        self._test_dir = Path(__file__).resolve().parent
+
+    def run_cli(self, arguments, *, arch="x86", environment=None,
+                should_succeed=True):
+        """Run kconfirm with an explicit argument list."""
+        command = [str(self._binary), *arguments]
+
+        process_environment = os.environ.copy()
+        process_environment.pop("SRCARCH", None)
+        process_environment.pop("HEADER_ARCH", None)
+        if arch is None:
+            process_environment.pop("ARCH", None)
+        else:
+            process_environment["ARCH"] = arch
+        if environment:
+            process_environment.update(environment)
+
+        process = subprocess.run(
+            command,
+            capture_output=True,
+            cwd=self._test_dir,
+            env=process_environment,
+            check=False,
+            text=True,
+        )
+
+        print("[command]\n{}\n".format(" ".join(command)))
+        print("[retcode]\n{}\n".format(process.returncode))
+        print("[stdout]\n{}".format(process.stdout))
+        print("[stderr]\n{}".format(process.stderr))
+
+        if should_succeed:
+            assert process.returncode == 0
+        else:
+            assert process.returncode != 0
+
+        return process
+
+    def run(self, kconfig, *, arch="x86", enable_check=None,
+            disable_check=None, environment=None, should_succeed=True):
+        """Run kconfirm against one Kconfig fixture."""
+        arguments = [
+            "--linux-path",
+            str(self._test_dir),
+            "--kconfig",
+            kconfig,
+        ]
+
+        if enable_check:
+            arguments.extend(["--enable-check", enable_check])
+        if disable_check:
+            arguments.extend(["--disable-check", disable_check])
+
+        return self.run_cli(
+            arguments,
+            arch=arch,
+            environment=environment,
+            should_succeed=should_succeed,
+        )
+
+
+def pytest_addoption(parser):
+    parser.addoption(
+        "--kconfirm",
+        metavar="PATH",
+        help="path to the kconfirm executable",
+    )
+
+
+@pytest.fixture(scope="session")
+def kconfirm(request):
+    binary = request.config.getoption("--kconfirm")
+    if not binary:
+        raise pytest.UsageError("--kconfirm is required")
+
+    return Kconfirm(binary)
diff --git a/scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_1.Kconfig b/scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_1.Kconfig
new file mode 100644
index 000000000000..3e3cc1c72ecf
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_1.Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+config A
+	tristate
+	depends on !(B || C)
+	default y if B || C
+
+config B
+	bool
+
+config C
+	tristate
diff --git a/scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_2.Kconfig b/scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_2.Kconfig
new file mode 100644
index 000000000000..64a1778b2981
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_2.Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+config A
+	tristate
+	depends on B || C
+	default y if !(B || C)
+
+config B
+	bool
+
+config C
+	tristate
diff --git a/scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_1.Kconfig b/scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_1.Kconfig
new file mode 100644
index 000000000000..34afd2a48396
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_1.Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+config A
+	tristate
+	depends on B
+	default y if !B
+
+config B
+	bool
+
+config C
+	tristate
diff --git a/scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_2.Kconfig b/scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_2.Kconfig
new file mode 100644
index 000000000000..d578b130faab
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_2.Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+config A
+	tristate
+	depends on !B
+	default y if B
+
+config B
+	bool
+
+config C
+	tristate
diff --git a/scripts/kconfig/kconfirm/tests/dead_link.Kconfig b/scripts/kconfig/kconfirm/tests/dead_link.Kconfig
new file mode 100644
index 000000000000..29bce7aa30fc
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/dead_link.Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+config HAS_DEAD_LINK
+	bool
+	help
+	  The obsolete documentation was at https://example.invalid/obsolete.
+
+config HAS_DUPLICATE_DEAD_LINK
+	bool
+	help
+	  The same documentation was at https://example.invalid/obsolete.
diff --git a/scripts/kconfig/kconfirm/tests/default_categorization.Kconfig b/scripts/kconfig/kconfirm/tests/default_categorization.Kconfig
new file mode 100644
index 000000000000..45ff769ad1c8
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/default_categorization.Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+config DUPLICATE_UNCONDITIONAL
+	bool
+	default y
+	default y
+
+config DEAD_AFTER_UNCONDITIONAL
+	bool
+	default y
+	default n
+
+config DUPLICATE_CONDITIONAL
+	bool
+	default y if CONDITION
+	default y if CONDITION
+
+config CONDITION
+	bool
diff --git a/scripts/kconfig/kconfirm/tests/pytest.ini b/scripts/kconfig/kconfirm/tests/pytest.ini
new file mode 100644
index 000000000000..2e24f7bc9f2c
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/pytest.ini
@@ -0,0 +1,2 @@
+[pytest]
+addopts = --verbose
diff --git a/scripts/kconfig/kconfirm/tests/ranges.Kconfig b/scripts/kconfig/kconfirm/tests/ranges.Kconfig
new file mode 100644
index 000000000000..4ced953247e1
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/ranges.Kconfig
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+#
+# Fixture for toggling duplicate_range and dead_range independently of each
+# other, and for categorizing repeated ranges correctly.
+
+config GATE
+	bool
+
+config OTHER_GATE
+	bool
+
+config RANGED_DUP
+	int
+	range 1 5
+	range 1 5
+
+config RANGED_DEAD
+	int
+	range 1 5
+	range 2 6 if GATE
+
+config RANGED_CONDITIONAL_FIRST
+	int
+	range 1 5 if GATE
+	range 2 6
+
+config RANGED_DEAD_UNCONDITIONAL
+	int
+	range 1 5
+	range 2 6
+
+config RANGED_MULTIPLE
+	int
+	range 1 5 if GATE
+	range 2 6 if OTHER_GATE
+	range 3 7
+	range 4 8 if GATE
+	range 5 9
diff --git a/scripts/kconfig/kconfirm/tests/select_imply.Kconfig b/scripts/kconfig/kconfirm/tests/select_imply.Kconfig
new file mode 100644
index 000000000000..ac8f2aa1b66c
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/select_imply.Kconfig
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+#
+# Fixture for toggling duplicate_select/dead_select and
+# duplicate_imply/dead_imply independently of each other.
+
+config SELECTEE
+	bool
+
+config OTHER_SELECTEE
+	bool
+
+config GATE
+	bool
+
+config SELECTOR
+	bool
+	select SELECTEE
+	select SELECTEE if GATE
+	select OTHER_SELECTEE
+	select OTHER_SELECTEE
+
+config IMPLIER
+	bool
+	imply SELECTEE
+	imply SELECTEE if GATE
+	imply OTHER_SELECTEE
+	imply OTHER_SELECTEE
diff --git a/scripts/kconfig/kconfirm/tests/test_kconfirm.py b/scripts/kconfig/kconfirm/tests/test_kconfirm.py
new file mode 100644
index 000000000000..5e23f7d2b0cb
--- /dev/null
+++ b/scripts/kconfig/kconfirm/tests/test_kconfirm.py
@@ -0,0 +1,358 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+"""Regression tests for kconfirm."""
+
+import shutil
+from pathlib import Path
+
+import pytest
+
+
+TEST_DIR = Path(__file__).resolve().parent
+
+
+@pytest.mark.parametrize(
+    "fixture",
+    [
+        "default_constant_condition_negative_expression_1.Kconfig",
+        "default_constant_condition_negative_expression_2.Kconfig",
+        "default_constant_condition_negative_symbol_1.Kconfig",
+        "default_constant_condition_negative_symbol_2.Kconfig",
+    ],
+)
+def test_negative_constant_condition(kconfirm, fixture):
+    process = kconfirm.run("constant_condition/{}".format(fixture))
+
+    assert "[constant_condition] [X86] config A:" in process.stdout
+    assert "will always be false" in process.stdout
+
+
+def test_default_categorization(kconfirm):
+    process = kconfirm.run("default_categorization.Kconfig")
+
+    assert (
+        "[duplicate_default] [X86] config DUPLICATE_UNCONDITIONAL: "
+        "duplicate default of y"
+    ) in process.stdout
+    assert (
+        "[dead_default] [X86] config DUPLICATE_UNCONDITIONAL:"
+    ) not in process.stdout
+    assert (
+        "[dead_default] [X86] config DEAD_AFTER_UNCONDITIONAL: "
+        "dead default of n"
+    ) in process.stdout
+    assert (
+        "[duplicate_default] [X86] config DUPLICATE_CONDITIONAL: "
+        "duplicate default of y"
+    ) in process.stdout
+
+
+def test_select_and_imply_checks(kconfirm):
+    process = kconfirm.run("select_imply.Kconfig")
+
+    assert (
+        "[dead_select] [X86] config SELECTOR: dead select of SELECTEE"
+    ) in process.stdout
+    assert (
+        "[dead_imply] [X86] config IMPLIER: dead imply of SELECTEE"
+    ) in process.stdout
+
+
+def test_disable_dead_select_and_imply_checks(kconfirm):
+    process = kconfirm.run(
+        "select_imply.Kconfig",
+        disable_check="dead_select,dead_imply",
+    )
+
+    assert "[dead_select]" not in process.stdout
+    assert "[dead_imply]" not in process.stdout
+    assert (
+        "[duplicate_select] [X86] config SELECTOR: "
+        "duplicate select of OTHER_SELECTEE"
+    ) in process.stdout
+    assert (
+        "[duplicate_imply] [X86] config IMPLIER: "
+        "duplicate imply of OTHER_SELECTEE"
+    ) in process.stdout
+
+
+def test_disable_duplicate_select_and_imply_checks(kconfirm):
+    process = kconfirm.run(
+        "select_imply.Kconfig",
+        disable_check="duplicate_select,duplicate_imply",
+    )
+
+    assert "[duplicate_select]" not in process.stdout
+    assert "[duplicate_imply]" not in process.stdout
+    assert (
+        "[dead_select] [X86] config SELECTOR: dead select of SELECTEE"
+    ) in process.stdout
+    assert (
+        "[dead_imply] [X86] config IMPLIER: dead imply of SELECTEE"
+    ) in process.stdout
+
+
+def test_range_checks(kconfirm):
+    process = kconfirm.run("ranges.Kconfig")
+
+    assert (
+        "[duplicate_range] [X86] config RANGED_DUP: duplicate range 1 5"
+    ) in process.stdout
+    assert "[dead_range] [X86] config RANGED_DUP:" not in process.stdout
+    assert (
+        "[dead_range] [X86] config RANGED_DEAD: dead range of 2 6"
+    ) in process.stdout
+    assert (
+        "[dead_range] [X86] config RANGED_DEAD_UNCONDITIONAL: "
+        "dead range of 2 6"
+    ) in process.stdout
+    assert (
+        "[dead_range] [X86] config RANGED_CONDITIONAL_FIRST:"
+    ) not in process.stdout
+    assert process.stdout.count(
+        "[dead_range] [X86] config RANGED_MULTIPLE:"
+    ) == 2
+
+
+def test_disable_dead_range_check(kconfirm):
+    process = kconfirm.run(
+        "ranges.Kconfig",
+        disable_check="dead_range",
+    )
+
+    assert "[dead_range]" not in process.stdout
+    assert (
+        "[duplicate_range] [X86] config RANGED_DUP: duplicate range 1 5"
+    ) in process.stdout
+
+
+def test_disable_duplicate_range_check(kconfirm):
+    process = kconfirm.run(
+        "ranges.Kconfig",
+        disable_check="duplicate_range",
+    )
+
+    assert "[duplicate_range]" not in process.stdout
+    assert (
+        "[dead_range] [X86] config RANGED_DEAD: dead range of 2 6"
+    ) in process.stdout
+
+
+def test_architecture_directory_is_discovered(kconfirm):
+    process = kconfirm.run(
+        "default_categorization.Kconfig",
+        arch="testarch",
+    )
+
+    assert (
+        "[duplicate_default] [TESTARCH] config DUPLICATE_UNCONDITIONAL:"
+    ) in process.stdout
+
+
+def test_unknown_architecture_is_rejected(kconfirm):
+    process = kconfirm.run(
+        "conditional_prompt.Kconfig",
+        arch="missing",
+        should_succeed=False,
+    )
+    output = process.stdout + process.stderr
+
+    assert "unexpected architecture from ARCH" in output
+    for architecture in ["arm", "powerpc", "riscv", "sh", "testarch", "um", "x86"]:
+        assert architecture in output
+
+
+def test_missing_architecture_is_rejected(kconfirm):
+    process = kconfirm.run(
+        "conditional_prompt.Kconfig",
+        arch=None,
+        should_succeed=False,
+    )
+
+    assert "ARCH environment variable is required" in process.stderr
+
+
+def test_conditional_prompt_is_not_select_visible(kconfirm):
+    process = kconfirm.run(
+        "conditional_prompt.Kconfig",
+        enable_check="select_visible",
+    )
+
+    assert "[select_visible]" not in process.stdout
+
+
+@pytest.mark.parametrize(
+    ("arch", "arch_config", "specific_symbol", "specific_dependency"),
+    [
+        ("arm", "ARM", "ARM_ONLY", "ARM_PREREQUISITE"),
+        ("riscv", "RISCV", "RISCV_ONLY", "RISCV_PREREQUISITE"),
+    ],
+)
+def test_architecture_findings(
+    kconfirm,
+    arch,
+    arch_config,
+    specific_symbol,
+    specific_dependency,
+):
+    process = kconfirm.run(
+        "architecture.Kconfig",
+        arch=arch,
+        enable_check="select_visible",
+    )
+
+    assert (
+        f"[duplicate_dependency] [{arch_config}] config SHARED_DEPENDENCY: "
+        "duplicate dependency on SHARED_PREREQUISITE"
+    ) in process.stdout
+    assert (
+        f"[select_visible] [{arch_config}] config SHARED_SELECTOR: "
+        "selects the visible SHARED_SELECTEE"
+    ) in process.stdout
+    assert (
+        f"[duplicate_dependency] [{arch_config}] config {specific_symbol}: "
+        f"duplicate dependency on {specific_dependency}"
+    ) in process.stdout
+
+
+@pytest.mark.parametrize(
+    ("arch", "arch_config"),
+    [
+        ("x86_64", "X86"),
+        ("powerpc", "PPC"),
+        ("sh", "SUPERH"),
+        ("um", "UML"),
+    ],
+)
+def test_architecture_alias_selects_source_directory(kconfirm, arch, arch_config):
+    process = kconfirm.run(
+        "architecture.Kconfig",
+        arch=arch,
+        enable_check="select_visible",
+    )
+
+    assert (
+        f"[duplicate_dependency] [{arch_config}] config SHARED_DEPENDENCY: "
+        "duplicate dependency on SHARED_PREREQUISITE"
+    ) in process.stdout
+
+
+@pytest.mark.skipif(shutil.which("curl") is None, reason="requires curl")
+def test_dead_links_are_deduplicated(kconfirm):
+    # Both fixture config options point at the same example.invalid URL. That
+    # TLD is reserved and never resolves (RFC 6761), so curl should fail
+    # deterministically, and the link reported once. The second config option
+    # referencing it should be deduplicated.
+    process = kconfirm.run(
+        "dead_link.Kconfig",
+        enable_check="dead_link",
+    )
+
+    assert (
+        "[dead_link] [X86] config HAS_DEAD_LINK:"
+    ) in process.stdout
+    assert (
+        "[dead_link] [X86] config HAS_DUPLICATE_DEAD_LINK:"
+    ) not in process.stdout
+
+
+def test_dead_link_requires_curl(kconfirm):
+    process = kconfirm.run(
+        "dead_link.Kconfig",
+        enable_check="dead_link",
+        environment={"PATH": ""},
+        should_succeed=False,
+    )
+
+    assert "dead_link requires the `curl` command" in process.stderr
+
+
+@pytest.mark.parametrize(
+    "arguments",
+    [
+        [
+            f"--linux-path={TEST_DIR}",
+            "--kconfig=conditional_prompt.Kconfig",
+            "--enable-check=select_visible",
+            "--disable-check=dead_range",
+        ],
+        [
+            f"-l{TEST_DIR}",
+            "-kconditional_prompt.Kconfig",
+            "-eselect_visible",
+            "-ddead_range",
+        ],
+    ],
+)
+def test_attached_option_values(kconfirm, arguments):
+    process = kconfirm.run_cli(arguments)
+
+    assert "[select_visible]" not in process.stdout
+
+
+def test_repeated_check_options(kconfirm):
+    process = kconfirm.run_cli(
+        [
+            "--linux-path",
+            str(TEST_DIR),
+            "--kconfig",
+            "conditional_prompt.Kconfig",
+            "--enable-check",
+            "select_visible",
+            "--enable-check",
+            "duplicate_default_value",
+            "--disable-check",
+            "dead_range",
+            "--disable-check",
+            "reverse_range",
+        ],
+    )
+
+    assert process.stderr == ""
+
+
+def test_help(kconfirm):
+    process = kconfirm.run_cli(["--help"])
+
+    assert "Usage: kconfirm --linux-path PATH" in process.stdout
+
+
+@pytest.mark.parametrize(
+    ("arguments", "message"),
+    [
+        ([], "--linux-path is required"),
+        (["--unknown"], "unrecognized option '--unknown'"),
+        (
+            [
+                "--linux-path",
+                str(TEST_DIR),
+                "--enable-check",
+                "not_a_check",
+            ],
+            "check not_a_check does not exist",
+        ),
+        (
+            [
+                "--linux-path",
+                str(TEST_DIR),
+                "--enable-check",
+                "ungrouped_attribute",
+            ],
+            "check ungrouped_attribute does not exist",
+        ),
+    ],
+)
+def test_cli_errors(kconfirm, arguments, message):
+    process = kconfirm.run_cli(arguments, should_succeed=False)
+
+    assert message in process.stdout + process.stderr
+
+
+def test_invalid_linux_path(kconfirm):
+    process = kconfirm.run_cli(
+        ["--linux-path", str(TEST_DIR / "does-not-exist")],
+        should_succeed=False,
+    )
+
+    assert "No such file or directory" in process.stderr
-- 
2.54.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956792;
	b=0ZhnTJqwX7gL7sPiqqlGM4RkitFrF1XVBtbZY5m2yorwT+Bg/WHMYAfdqQ5+hrrkOzxP
	 4BT3fpjCJMQYcSavPs5Q1eoN1Lx7szyiycSTPw9km04wu3NdRa/yNB5YhSYdiERphniXN
	 boMxnlzed++1biv8XPX2BMMr2RpUWukKXmbwZI6sp4tvYcEw59e4eQ9AkQ1smh+lJ+UzO
	 na5V/5OXYXvAqRC+nm55eNarrH2PFcmM4ZDGPeaWczS4PjsMsubzOwYG9Dw9uI5TyDs7d
	 zjr9XfMH0mMkPIX22oCZPREj0RhI4hSHswEANYnf4sVI9utoNFLVW0S/xvKd3cxy4zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956792;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LgkTYIbNEu4h2CLjKP9sCMockS/sHgrH65SUWpK2ukA=;
	b=EKnUZVuD4lBdK6nhfPkXPPWBhS9cVhxZcbwXwG6xft2AAte96eDgdLFQjL2ePbxHOTsb
	 sD4uqk1FHDsZLEvCYuGam4ESdpVjir7QiqCXCdnRzmvonlzZErbo39McRGoPoUt+DoBgF
	 z9/CH86WJ3LhLlXcNuXS1olvI8Us0V86uQ1xRqk3LDanF8a5+JA8G5Gx1SOqWXHWa4CVt
	 suh8S4eorBGOBkCugC531+MhpFkXOsxXAcOBvYFfoJnXDdKQVZjdeoEvWwvZV28DNXF4S
	 wPymKsXD3kQMDf03+85G+xakq6eZ/PBNovs1jRKEU4S8EQ6FSAqfsrOnFmDAuKy8C4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EB3zBbz0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="oibvC/+W";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FE7606A331;
	Fri,  6 Nov 2026 09:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2FE7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EB3zBbz0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oibvC/+W
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793956790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LgkTYIbNEu4h2CLjKP9sCMockS/sHgrH65SUWpK2ukA=;
	b=EB3zBbz05E9GYFZMnjnzaMIY4OoY/1oF0E0FmmChWd8UzCshW8YWgDlZCT0PO/YIj/jdvX
	yBzr8DWCDVv8+TqUL5AT3vG9xQyQqRSMfE76ejM/zmjOKuG7rGDcb3LevxFFCdB7ztHD9c
	V1Hj8+WsS/M4KA4YErki0XQ3jCFiEO7gulKY6nXiBvFw4AdyxHTGf5k4Ltn6W6oMgMSw9g
	JL252QPPTZF0XnzcoWmCiauC2Q9544fNknLNInTgwXzm1AUdXuayDe2GfPyUSsqOWZMSQL
	RgO4KB5MdkOVTIuNQYH1UZUodZkn+k6HzRARSzgNf25Ql8butxWhDNOUctyTeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793956790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LgkTYIbNEu4h2CLjKP9sCMockS/sHgrH65SUWpK2ukA=;
	b=oibvC/+W8YAha42WctdZeLkQWkHPd298ut47NTADlZlrn/MOLrxR7NtnXhmdPlXJm6ySnL
	mJPOB+5TMY4m/3BA==
To: Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Ogness <john.ogness@linutronix.de>,
	Derek Barbosa <debarbos@redhat.com>,
	=?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
	Daan De Meyer <daan.j.demeyer@gmail.com>,
	Luca Boccassi <luca.boccassi@gmail.com>,
	linux-rt-devel@lists.linux.dev,
	debian-kernel@lists.debian.org,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 05/10] Documentation: Describe kconfig-checker usage and design
Date: Fri,  6 Nov 2026 10:19:17 +0100
Message-ID: <20261106091922.7560-6-darwi@linutronix.de>
In-Reply-To: <20261106091922.7560-1-darwi@linutronix.de>
References: <20261106091922.7560-1-darwi@linutronix.de>
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

Describe the kconfig-checker design, invocation, and external dependencies.

For PREEMPT_RT users, mention that the checker can now be used for
validating a kernel's .config against PREEMPT_RT requirements.

For the kconfig-checker external dependencies error handling code,
reference the newly added documentation as well.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 Documentation/admin-guide/README.rst          | 24 +++++++++
 .../real-time/kernel-configuration.rst        |  3 ++
 Documentation/tools/index.rst                 |  1 +
 Documentation/tools/kconfig_checker.rst       | 50 +++++++++++++++++++
 tools/kconfig-checker/check.py                |  7 ++-
 5 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/tools/kconfig_checker.rst

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 77fec1de6dc8..77ffe4dcb85b 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -256,6 +256,30 @@ Configuring the kernel
       should probably answer 'n' to the questions for "development",
       "experimental", or "debugging" features.
 
+Checking the kernel configuration
+---------------------------------
+
+The kconfig build system can validate the generated kernel ``.config``
+against a selected rules profile. Running ``make checkconfig`` prints
+usage information and the available profiles::
+
+  Usage: make RULES=<profile> checkconfig
+  Available RULES: preempt_rt
+
+For example, to validate the current configuration against the PREEMPT_RT
+profile, run::
+
+  make RULES=preempt_rt checkconfig
+
+``checkconfig`` reports kconfig options whose values do not match the
+selected rules profile. Each diagnostic includes a severity, such as
+``FATAL`` or ``INFO``, plus the suggested configuration change.
+
+Apply the reported changes as needed and run ``make checkconfig`` again,
+against the same rules, until no relevant diagnostics remain.
+
+For more information, see Documentation/tools/kconfig_checker.rst
+
 Compiling the kernel
 --------------------
 
diff --git a/Documentation/core-api/real-time/kernel-configuration.rst b/Documentation/core-api/real-time/kernel-configuration.rst
index d7f08e7b8760..15245c34a053 100644
--- a/Documentation/core-api/real-time/kernel-configuration.rst
+++ b/Documentation/core-api/real-time/kernel-configuration.rst
@@ -14,6 +14,9 @@ Introduction
 This document lists the kernel configuration options that might affect a
 real-time kernel's worst-case latency.  It is intended for system integrators.
 
+You can validate your kernel's ``.config`` against the guidelines below using
+the ``kconfig-checker`` tool.  See Documentation/tools/kconfig_checker.rst
+
 Configuration options
 =====================
 
diff --git a/Documentation/tools/index.rst b/Documentation/tools/index.rst
index 1adf4a6f909b..8912a627a7ac 100644
--- a/Documentation/tools/index.rst
+++ b/Documentation/tools/index.rst
@@ -10,6 +10,7 @@ more additions are needed here:
 .. toctree::
    :maxdepth: 1
 
+   kconfig_checker
    rtla/index
    rv/index
    python
diff --git a/Documentation/tools/kconfig_checker.rst b/Documentation/tools/kconfig_checker.rst
new file mode 100644
index 000000000000..73717ac56ea9
--- /dev/null
+++ b/Documentation/tools/kconfig_checker.rst
@@ -0,0 +1,50 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================
+Kernel configuration checker
+============================
+
+``kconfig-checker`` is a Python tool for checking a kernel ``.config`` file
+against a set of rules; e.g., PREEMPT_RT configuration requirements.  It
+gives users and system integrators a sanity report showing whether the
+passed kernel configuration satisfies a known profile.
+
+Invocation
+==========
+
+The checker can be invoked from anywhere in the file system::
+
+   check.py list-rules
+
+   check.py check -c path/to/.config -r preempt_rt
+
+As described in Documentation/admin-guide/README.rst, it is also used by
+``make checkconfig``.
+
+External dependencies
+=====================
+
+The checker requires the ``PyYAML`` and ``jsonschema`` python packages.
+Install them using your distribution's package manager, for example:
+
+.. table::
+   :align: left
+
+   ============ ================== ======================
+   Distribution       PyYAML             jsonschema
+   ============ ================== ======================
+   Debian       ``python3-yaml``   ``python3-jsonschema``
+   Red Hat      ``python3-pyyaml`` ``python3-jsonschema``
+   Arch Linux   ``python-yaml``    ``python-jsonschema``
+   ============ ================== ======================
+
+Rule files
+==========
+
+The checker's rule files are written in YAML, and are stored in::
+
+   tools/kconfig-checker/rules/
+
+The schema for these files is fully documented in::
+
+   tools/kconfig-checker/schema.yml
diff --git a/tools/kconfig-checker/check.py b/tools/kconfig-checker/check.py
index 476cd13e59eb..ef49c28b9dab 100755
--- a/tools/kconfig-checker/check.py
+++ b/tools/kconfig-checker/check.py
@@ -69,7 +69,12 @@ try:
     import jsonschema               # type: ignore
     import yaml as yaml_m           # type: ignore
 except ModuleNotFoundError as e:
-    error(f'Missing Python module: {e.name}', os.EX_UNAVAILABLE)
+    docs = 'Documentation/tools/kconfig_checker.rst'
+    error(
+        f'Missing Python module: {e.name}\n'
+        f'Check {docs} for how to install required dependencies',
+        os.EX_UNAVAILABLE
+    )
 
 #
 # Actual script:
-- 
2.56.0


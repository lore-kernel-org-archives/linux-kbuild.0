Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732920;
	b=Fg4R3SAVlOENoX+dHMgv4eTtd2Dtnr8EIpO7hamavqh5eqGH8XzYAxMIoTt9kMNV8Zm+
	 dZF6FwUdAs7eCQSspYLdfFqAll6BbF6JUUm2M/K50ytaR7ZULcwF7UABIt5KlYSt5ORpq
	 XR6Uun+4j3vPxRjmun5bYQ9t92oGyTsHv3PlQa3N5YZP+0fZauJ9v7Lpl1P3PYTuGC/Vt
	 VikjgrS/I43e5q7SRtex4ojRe+XpomXk9w5jTZKZFAkMb1/m7ITjUgBezAiFdp0qGTJNt
	 EkoW3YBRYkX4NOOlZ3ahDKfadJf9IC4FCPhll5+2t6UQINO081YG/AY0rUL5bfbI2xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XI5JVBtIzj63rnI4QNXSyb3wF3L/q64HxFOjLF8bNLo=;
	b=GfvvAiJp3qqmCuOTcxcDSPuSj9Kz+Te57wc3BiP/+UU0drN2Y8UKAEDKHlxB2C8sFSkG
	 GXBwdFShHIp204w9IGz4+verBit+CRd1YizB9os9ibpMbCURU6/gKZvQ3HZLRnPcr9DGF
	 xlL57kYYhos/jE64t5ZAQzOKXu3SafWenhsBpzAWRPWBdcQ4ATmb0qMf4aTaIS8QjIJrJ
	 Hqp58sf6HMMcBIo/fyc1dFsZ2pQ1i3Mxzc5SeF/RNYVwe8oBJBNUM5Rk1MWILEyFAzMOj
	 1cKuaRldR48o0XbOlUihwzOoFgqPgRSY7g5e5BtQ3ht0vgaz6bTRTmFrLeQg3WPxLWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vgQhIRWN;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFB0606D813
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 19:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFB0606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vgQhIRWN
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4f540ebso2210745f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2026 11:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732918; x=1794337718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XI5JVBtIzj63rnI4QNXSyb3wF3L/q64HxFOjLF8bNLo=;
        b=vgQhIRWNnC9X8VUzkuC8KiWF8fFnjV7Hg7u5WOFQ8ayZds/xNOAOF4RoSybtUbsLeI
         5FWB1Ei+Xivd7gxf/LmPhyDDqAhTFwan+62AZmOHAW/wXVvc1JLfLsbJqcfoNhSoD+jy
         tObcr19+edhMYrphod/dz8L1zjGLRtbaHKwGYhuLCtvBYqMCsv6Y5RoDng0UrJ+5arrn
         dfpOK6d1rS44Ka3SdJKbpFab/UTtXXZ1u6BV5khf/e0Sm9sJZkFQky4wH2oCm3oTvpCS
         s/w0pPfWhHp1JbY0ZPTEAjr8/AouAAYKem0sw5AH9EP5RuLrHazsBweDY26bODjr6im2
         +EXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732918; x=1794337718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XI5JVBtIzj63rnI4QNXSyb3wF3L/q64HxFOjLF8bNLo=;
        b=EO6E7byBXZNUAiBqwu0qxmVN73DSUM78zr6f6yO6aqOGRi3oW1aVk1sghfSfJo1UzA
         rL3R7EqUWhBPwjIPBrQto12bh1fSSpwNIFxQ8TxELFzh34EjQoRz7An3A08EBe1TsgEN
         uBlbzvYiizu4K+W4eecGPR4NY3gO1UlgIZ7HX9g/GxKRdhXVCV2/yIBjrpLf4GOIrDlG
         DRl6xqKRammuCY5rrIjk9VSfzexOoFhjutIMjNVPMts3n4lsik9d58yesS5Ekyuz2vlD
         s1C17sS8cD3P1Vrc/ImOrseJzNcnZTWF0vOYxxy4T3ML7KGLUY/+nh3BfkX3NHeTpmAa
         FlRg==
X-Forwarded-Encrypted: i=1; AKwUvBwznd7A56unkJROC1rJiIPUPkY7uharAmvm8DvOXSnM/mpS5WWZXS4xu88v80lUcY0nW8rQJfhWBXrZqLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8joVs0NOqvHW2JtmCFQRySDpxg6vQ8mMwEpfQK9GFuecAB6r0
	uSiTAJiTCb+Hx1pCdvUMkC3NAQ+yuvT6gJjizQ40PxqM7bfIeZP0BIwq
X-Gm-Gg: AYBFou1XZSvnGp8ZYvJ49LazEHl0HmriM5q5Tp2DOpdz+ONdZIhTvHXNttvboz6+JR1
	IDjz5l1OASZzJvt1Mm5wcasbpOZR/D/SEKDDMHL0NShndEq1yOE5Lmhu174avfLXhGKbhiH5y6A
	YkSZls1/kq+FyvvhcnjRbvbojmvXh3JG5GqJ9Kz48Kgud7OYcd4NkDfKRUyPq2NFfU8uja2DP04
	0yjSgHdT13B0x0/bpNeDltlccMAf2evgbJaxXEjS9KvUFZ4FnjUb30oF8Lv6kn74NCiCekeiTVi
	r8T+w8cJ+Gm+YAb96q4PkpuAEMQmq/FM8n24TO70E9NxpvJfEmmZQq1XBL3KVSjzvD247Vn1Z/P
	aptYT2qqEOnSfKwB2AbB/3wJcBgFxKE+gWa3B78NCH6Vji8D0z668pjqzgLj1odDFt8Y634UyIf
	GPUu+gkblglOYgaJ3mzEzWE5w+fazw6+JdhrHSbZUQTE2H7cQwmRwXSwhEVczrO89PUs5AZR/gR
	dmCPldYNTfJdky/ZLP/08RTRh1j0GY0ZiVsblfR9gsWYMuqbhCDyo4BwJCb7Oc1FQEVVQsbJsZI
	lp9NYA8TFXOIQzdoEDkwgo1ALyeV7VKhbqMPCQ30ePZ3jhZ5bQgl9tl7Qnp+rMaiRgzSttB9aeQ
	27tjwvSJYqfdGZ39Ryw==
X-Received: by 2002:a05:6000:25c3:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48e6e5182bemr29201930f8f.51.1793732917292;
        Tue, 03 Nov 2026 11:08:37 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fc9c76d52sm205351f8f.3.2026.11.03.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:08:36 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab+huawei@kernel.org,
	jani.nikula@intel.com,
	tj@kernel.org,
	grahamr@qti.qualcomm.com,
	officialnaumansabir@gmail.com,
	nico@fluxnic.net,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] Documentation: add a history of the Kconfig language
Date: Tue,  3 Nov 2026 19:08:32 +0000
Message-ID: <20261103190832.3861337-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.56.0
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

An ecosystem around the Kconfig language has been growing for years. There
is an alternative implementation [1], 3rd-party parsers [2], a grammar for
tree-sitter [3], language servers [4], tools built on SAT-solving [5], an
entire research platform [6], and many forks of the in-tree
implementation. There are at least 40 other projects besides the Linux
kernel using Kconfig [7], many of which copy the implementation out of the
Linux source tree. For example, U-Boot uses Kconfig from Linux v6.1 [8],
and coreboot uses Kconfig from Linux from release v6.8 [9]. Without a
language changelog, it is not clear how the Kconfig used across the kernel
history and Kconfig ecosystem differ, and most commits to scripts/kconfig/
do not affect the language itself.

Let's add a history of the Kconfig language to the documentation. Changes
are collected by Linux release with tags to classify the change as syntax,
semantics, macros, or error handling. The "syntax" classification is used
for changes to the grammar of the language (thus requiring an update to
any parsers). Changes are generally classified as "semantics" if they
affect what is considered a valid or invalid configuration. Error handling
is for changes to warnings and errors. Finally, references to the relevant
commits are provided with changes for readers that need more detail.

Note that not all commits to scripts/kconfig/ are included in this
changelog. In fact, only about 6% of all commits to that directory are
referenced in this documentation. Other non-language commits include
changes like code refactors, changes to tooling like localmodconfig,
mechanical fixes (e.g. preventing UB), or changes to input validation.

Link: https://github.com/zephyrproject-rtos/Kconfiglib [1]
Link: https://github.com/Mcdostone/nom-kconfig [2]
Link: https://github.com/tree-sitter-grammars/tree-sitter-kconfig [3]
Link: https://github.com/cccheng/kconfig-lsp [4]
Link: https://github.com/paulgazz/kmax [5]
Link: https://github.com/ekuiter/torte [6]
Link: https://ekuiter.github.io/torte-research/#systems [7]
Link: https://github.com/u-boot/u-boot/commit/bd3f9ee679b4d1456d0d3c261ab76788950e6096 [8]
Link: https://github.com/coreboot/coreboot/commit/7761237dfe0c509fa4cae255b20fa4b1278cbca1 [9]
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 Documentation/kbuild/index.rst            |   1 +
 Documentation/kbuild/kconfig-history.rst  | 615 ++++++++++++++++++++++
 Documentation/kbuild/kconfig-language.rst |   3 +
 3 files changed, 619 insertions(+)
 create mode 100644 Documentation/kbuild/kconfig-history.rst

diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
index f46233be82b9..a31af76050b6 100644
--- a/Documentation/kbuild/index.rst
+++ b/Documentation/kbuild/index.rst
@@ -9,6 +9,7 @@ Kernel Build System
 
     kconfig-language
     kconfig-macro-language
+    kconfig-history
 
     kbuild
     kconfig
diff --git a/Documentation/kbuild/kconfig-history.rst b/Documentation/kbuild/kconfig-history.rst
new file mode 100644
index 000000000000..e1a4cdb141f9
--- /dev/null
+++ b/Documentation/kbuild/kconfig-history.rst
@@ -0,0 +1,615 @@
+========================
+Kconfig Language History
+========================
+
+This document records changes to the Kconfig language, as implemented in the
+Kconfig interpreter. Changes are grouped by syntax, semantics, macro language
+and error handling (changes to warnings and errors). The changes within the
+release notes are grouped by type of change and thus not ordered by commit.
+
+Kconfig versions correspond to the Linux kernel's mainline releases.
+
+7.4
+---
+
+**Syntax**:
+
+- add ``def_string``, ``def_int``, and ``def_hex``; extending the syntactic
+  sugar for a combined ``default`` and type definition from the ``bool`` and
+  ``tristate`` types. (651fb291c4c8)
+
+**Semantics and error handling**:
+
+- extend the recursive dependency check to support ``range`` for ``int`` and
+  ``hex`` options. (f9f31f5f13b5)
+
+- remove support for numeric options of one type defaulting to the value of a
+  numeric option with a different type, or using its value as a range
+  bound. (d13bad83d89d)
+
+- check that numeric constants are within the bounds of the associated option
+  type. (a5e84d6f6df1)
+
+- escalate warning for invalid numeric reference to error. (95fde4bcc0b7)
+
+7.1
+---
+
+**Semantics and error handling**:
+
+- remove support for repeated import of the same Kconfig file with
+  ``source``. (102d712ded3e)
+
+- remove support for multiple options with the same name in a
+  ``choice``. (d13a089d823e)
+
+7.0
+---
+
+**Syntax**:
+
+- support conditional dependencies. Intended to replace the existing idiom
+  ``depends on X || !X``. (76df6815dab7)
+
+6.18
+----
+
+**Syntax and semantics**:
+
+- add ``transitional`` to specify that an option should no longer be written to
+  the output ``.config`` file. (f9afce4f32e9 and 0902b3cb23ce)
+
+6.13
+----
+
+**Syntax and error handling**:
+
+- remove support for the implicit prompt with ``choice``. (bea2c5ef789a)
+
+6.12
+----
+
+**Semantics**:
+
+- add support for multiple instances of the same option symbol in a
+  ``choice``. (4d46b5b623e0)
+
+6.11
+----
+
+**Semantics**:
+
+- adjust ``choice`` so that defaults are still evaluated when the ``choice`` is
+  not visible, and one member option is still enabled if its dependencies are
+  met. (d533828ef3ca)
+
+**Syntax, semantics and error handling**:
+
+- remove support for ``tristate`` options in ``choice``. (fde192511bdb)
+
+- remove support for specifying the type on the ``choice`` as it is now
+  implicit, except for ``bool`` with a prompt. (fde192511bdb)
+
+6.10
+----
+
+**Semantics**:
+
+- compare ``tristate`` values ``n``, ``m``, and ``y`` using their corresponding
+  numeric representations 0, 1, and 2, respectively instead of using a string
+  comparison. (aabdc960a283)
+
+- change the unequal operator so that a ``tristate`` option set to ``m`` used
+  with ``!=`` ``n`` is evaluated as ``y``, instead of transforming the
+  expression to ``m``. (77a92660d8fe)
+
+**Semantics and error handling**:
+
+- require any option redefinitions outside the ``choice`` to have no
+  ``prompt``. (8a22f867e330)
+
+- require that options in a ``choice`` have a ``prompt``. (700e7a8d05ea)
+
+- remove support for using ``default`` with an option in a
+  ``choice``. (8a22f867e330)
+
+**Syntax, semantics and error handling**:
+
+- remove support for using ``optional`` in ``choice``. (6a1215888e23)
+
+6.9
+---
+
+**Semantics**:
+
+- warn on options in a ``choice`` without a type, and stop using the type of
+  the ``choice`` itself. (7d5f52a4334c)
+
+**Semantics and error handling**:
+
+- disallow options in a ``choice`` depending on each other. (7e3465f63a0a)
+
+- require that each ``choice`` has a ``prompt``. (4957515b9c3a)
+
+**Syntax, semantics and error handling**:
+
+- remove named ``choice``, which allowed redefinitions of a
+  ``choice``. (c83f020973bc)
+
+6.8
+---
+
+**Semantics**:
+
+- allow numeric options to have an active value outside its ``range``, and
+  adjust the value to the nearest range bound. (ce1fc9345a59)
+
+- use values ``0`` and ``0x0`` as the implicit default for ``int`` and ``hex``
+  options without an explicit ``default``, instead of the empty
+  string. (6262afa10ef7)
+
+5.17
+----
+
+**Kconfig macro semantics**:
+
+- increase the output buffer size from 256 to 4096 bytes for shell
+  expansion. (8a4c5b2a6d8e)
+
+5.13
+----
+
+**Syntax and error handling**:
+
+- replace ``option modules`` with ``modules`` for specifying that an option
+  determines if module support is available. (6dd85ff178cd)
+
+**Syntax, semantics and error handling**:
+
+- remove ``defconfig_list`` for specifying backup files to ``.config``.
+  Replaced by an environment variable:
+  ``KCONFIG_DEFCONFIG_LIST``. (b75b0a819af9)
+
+- remove ``option allnoconfig_y`` for specifying that an option should be
+  enabled for the ``allnoconfig`` target. (ab838577aaae)
+
+5.9
+---
+
+**Syntax and error handling**:
+
+- remove the ``---help---`` alias of ``help``. (f70f74d15ca8)
+
+5.8
+---
+
+**Syntax and error handling**:
+
+- restrict the kinds of syntax allowed in a ``choice`` to ``config``,
+  ``comment``, and ``if``. (09d5873e4d1f)
+
+5.7
+---
+
+**Semantics**:
+
+- allow a ``tristate`` ``imply`` target to have value ``m`` when the implier
+  option has value ``y``. (def2fbffe62c)
+
+- prevent an ``imply`` with implier value ``y`` from overriding the target's
+  dependencies of ``m``. (3a9dd3ecb207)
+
+5.6
+---
+
+**Syntax and error handling**:
+
+- require that text is quoted for ``prompt``, ``menu``, ``comment``,
+  ``source``, and ``mainmenu``. (801b27db4638)
+
+5.0
+---
+
+**Syntax**:
+
+- allow ``visible if`` attributes to be listed after
+  ``depends on``. (1f31be9ec0a9)
+
+**Syntax and error handling**:
+
+- require a line terminator after ``visible`` attributes. (413cd19d81fd)
+
+- require that option attributes (``option modules``,
+  ``option defconfig_list``, and ``option allnoconfig_y``) specify exactly one
+  option per line. (ce2164ab5831)
+
+- escalate warning for unknown option names to error. (ce2164ab5831)
+
+- disallow ``=value`` arguments on option attributes. (ce2164ab5831)
+
+- disallow common filepath characters ``.`` and ``/`` in unquoted strings, and
+  require quotes around such filepaths in ``source`` entries. (f5451582c4e2)
+
+- disallow using keywords in the location of identifiers. (979f2b2f7936)
+
+4.19
+----
+
+**Semantics and error handling**:
+
+- escalate warning for recursive dependencies to error. (f1575595d156)
+
+4.18
+----
+
+**Semantics**:
+
+- remove support for evaluating config values in ``source`` and ``mainmenu``
+  strings that lack parentheses. (bb222ceeb327 and 96d8e48da55a)
+
+**Add the Kconfig macro language**:
+
+- add support for ``=`` textual assignment, with the right-hand side evaluated
+  when referenced. (9ced3bddec08)
+
+- add support for ``:=`` for simply-expanded variable assignment, which
+  evaluates the right-hand side immediately. (1175c02506ff)
+
+- add support for ``+=`` for append assignment to a variable, which evaluates
+  depending on the type of variable as originally defined. (ed2a22f277c6)
+
+- support evaluation of variables in the left-hand side of assignment
+  statements. (82bc8bd82e5c)
+
+- add support for direct reference of environment variables using
+  ``$(ENV)``. (104daea149c4)
+
+- remove ``option env=ENV``. (104daea149c4)
+
+- add support for function calls in the macro system. (e298f3b49def)
+
+- add support for user-defined functions. (9ced3bddec08)
+
+- add support for shell commands in the macro system. (2fd5b09c201e)
+
+- add the built-in variable ``filename`` to be expanded with ``$(filename)``
+  into the current Kconfig source file name. (a702a6176e2f)
+
+- add the built-in variable ``lineno`` to be expanded with ``$(lineno)`` into
+  the current Kconfig line number. (a702a6176e2f)
+
+- add the built-in function ``info`` to write to stdout. (1d6272e6fe43)
+
+- add the built-in function ``warning-if`` to conditionally write a
+  warning. (1d6272e6fe43)
+
+- add the built-in function ``error-if`` to conditionally write an error and
+  stop parsing. (1d6272e6fe43)
+
+- disallow recursive variable references when no arguments are
+  given. (915f64901eb3)
+
+- disallow recursive function expansion beyond the depth limit. (915f64901eb3)
+
+4.16
+----
+
+**Syntax and error handling**:
+
+- remove the ``boolean`` alias for ``bool``. (b92d804a5179)
+
+**Semantics**:
+
+- stop writing the ``DEFCONFIG_LIST`` option to the ``.config``
+  file. (f4bc1eefc160)
+
+4.15
+----
+
+**Semantics**:
+
+- when comparing ``bool`` and ``tristate`` values with inequalities, use their
+  numeric representations 0, 1, and 2 instead of comparing them as
+  strings. (9059a3493efe)
+
+4.10
+----
+
+**Syntax and semantics**:
+
+- add a "weak select" called ``imply``. Unlike ``select``, dependencies are not
+  overridden for ``imply`` targets, and the user may explicitly disable an
+  ``imply`` target. (237e3ad0f195)
+
+4.7
+---
+
+**Semantics**:
+
+- restrict ``tristate`` options in a ``choice`` to a value of ``n`` when their
+  visibility is ``m`` and the ``choice`` is set to ``y``. (fa64e5f6a35e)
+
+4.3
+---
+
+**Syntax**:
+
+- explicitly allow hyphen characters ``-``. Used with
+  ``---help---``. (c2264564df3d)
+
+**Error handling**:
+
+- warn on unexpected characters in config option definitions. (c2264564df3d)
+
+4.2
+---
+
+**Semantics**:
+
+- remove inference rules (De Morgan's law) that were evaluating ``tristate``
+  options with boolean logic. (e911503085ae)
+
+**Syntax and semantics**:
+
+- support integer inequalities. Uses C's ``strcmp`` function as a fallback for
+  non-numeric values. (31847b67bec0)
+
+3.15
+----
+
+**Syntax and semantics**:
+
+- add ``option allnoconfig_y`` to specify that a config option should be set to
+  ``y`` for the allnoconfig target. (5d2acfc7b974)
+
+3.12
+----
+
+**Semantics**:
+
+- store ``hex`` and ``range`` values using the C ``long long`` type, instead of
+  ``long``. (129784abc982)
+
+- remove the special handling of the option named ``MODULES``. (6902dccfda00)
+
+**Semantics and error handling**:
+
+- prevent multiple options from using the ``modules`` attribute, or one option
+  from using it more than once. (e062781397e5)
+
+3.11
+----
+
+**Semantics**:
+
+- store ``hex`` and ``range`` values using the C ``long`` type, instead of
+  ``int``. (b57caaaed2bd)
+
+3.0
+---
+
+**Semantics**:
+
+- support importing the same Kconfig file from multiple other files with
+  ``source``. (f094f8a1b273)
+
+2.6.37
+------
+
+**Semantics**:
+
+- references to config options in a ``source`` are now expanded using the
+  string representation of their value. (c7abe8630ae6)
+
+- references to other config options in the title are now expanded using the
+  string representation of their value. (f6ce00b8cca0)
+
+**Syntax and semantics**:
+
+- support conditional visibility for menus in
+  frontends. (86e187ff9bce and 7ad1227818f0)
+
+- ``mainmenu`` now determines the title, as rendered in
+  frontends. (8ea13e2c87c8)
+
+**Syntax and error handling**:
+
+- restrict ``mainmenu`` to the first entry in the Kconfig source
+  files. (8ea13e2c87c8)
+
+2.6.26
+------
+
+**Syntax and semantics**:
+
+- add support for a named ``choice``. With this, a ``choice`` can be partially
+  defined in multiple places, and merged. (5a1aa8a1aff6)
+
+**Semantics and error handling**:
+
+- improve the recursive dependency check to properly support ``choice``
+  options. (48981178869b)
+
+**Error handling**:
+
+- improve recursive dependency error messages to only include the
+  cycle. (48981178869b)
+
+2.6.25
+------
+
+**Syntax and error handling**:
+
+- remove ``enable``, but keep its alias: ``select``. (9649ef878d50)
+
+**Semantics**:
+
+- a ``select`` target whose default is ``y`` but whose selector is ``m`` is no
+  longer forced to a value of ``m``. (587c90616a5b)
+
+- support having both ``bool`` and ``tristate`` config options in a choice.
+  Previously, choice only allowed options of a single type. (f5eaa323eb68)
+
+- support reading values from environment variables using the ``env`` keyword.
+  Treated as a default value for that config option. (93449082e905)
+
+**Error handling**:
+
+- remove warning for a ``select`` whose target isn't defined, because it may be
+  defined in another architecture. (603d49885e02)
+
+2.6.24
+------
+
+**Syntax and error handling**:
+
+- remove ``requires`` and ``depends``, but keep their alias:
+  ``depends on``. (247537b9a270)
+
+- remove ``def_boolean``, but keep its alias: ``def_bool``. (247537b9a270)
+
+2.6.23
+------
+
+**Semantics**:
+
+- allow using ``--help--`` with menu. (03d29122738f)
+
+2.6.22
+------
+
+**Semantics and error handling**:
+
+- escalate warning to error for recursive dependencies. (5447d34b080a)
+
+2.6.18
+------
+
+**Syntax and semantics**:
+
+- add support for ``modules`` to specify which option determines module
+  support, instead of hardcoding an option named
+  ``MODULES``. (face4374e288 and f6a88aa86027)
+
+- add support for ``defconfig_list`` to specify files to try when ``.config``
+  is unavailable, using the defaults of a string
+  option. (face4374e288 and f6a88aa86027)
+
+**Error handling**:
+
+- warn on leading whitespace in menu prompts. (f001f7f89689)
+
+2.6.15
+------
+
+**Semantics**:
+
+- allow symbolic range bounds. (4cf3cbe2a968)
+
+2.6.5
+-----
+
+**Semantics**:
+
+- convert boolean choice options' dependencies from ``m`` to
+  ``y``. (5a87d187fce1)
+
+2.6.3
+-----
+
+**Error handling**:
+
+- remove a spurious warning about recursive dependencies. (1fd850c4cfdb)
+
+2.5.71
+------
+
+**Syntax**:
+
+- add ``def_bool`` and its alias ``def_boolean``, as well as ``def_tristate``.
+  This is syntactic sugar for a combined type definition and
+  default. (d4f8a4530eb0)
+
+**Semantics**:
+
+- convert boolean options' dependencies from ``m`` to ``y``. (cffbe99ee553)
+
+**Syntax and semantics**:
+
+- add ``select`` and its alias ``enable`` to allow an enabled option to enable
+  another option without checking the target's
+  dependencies. (d4f8a4530eb0 and f3b837df9e2b)
+
+- add ``range`` to specify lower and upper bounds for the values of ``int`` and
+  ``hex`` options. (d4f8a4530eb0 and e4922a0baa76)
+
+- for ``bool`` and ``tristate`` options, ``default`` now accepts an expression,
+  not just a single value. (386ebbf28c01)
+
+**Error handling**:
+
+- warn when options in a choice have a ``default``. (f3b837df9e2b)
+
+- warn when a choice doesn't have a prompt. (8a36b98fd0d8)
+
+- warn when options in a choice have a prompt. (8a36b98fd0d8)
+
+- warn on recursive dependencies. (f9f0d1c0da3a)
+
+- warn on type redefinitions. (f9f0d1c0da3a)
+
+- warn on options defined without a type declaration. (f9f0d1c0da3a)
+
+- warn on a ``choice`` without a prompt. (f9f0d1c0da3a)
+
+- warn on the ``default`` of an ``int``, ``hex``, or ``string`` option that
+  uses an expression. (f9f0d1c0da3a)
+
+- warn when ``select`` or its alias ``enable`` is used with an ``int``,
+  ``hex``, or ``string`` option (selector or selectee). (f9f0d1c0da3a)
+
+- warn on range bound values that do not match the type of the
+  option. (f9f0d1c0da3a)
+
+- warn on non-numeric options that have a ``range``. (f9f0d1c0da3a)
+
+2.5.65
+------
+
+**Semantics**:
+
+- revert semantics of a dependency on the literal ``m``. Now requires that the
+  option named ``MODULES`` is enabled. Partially reverts the original addition
+  of Kconfig in commit ae10cf681e70 to the way CML (the previous configuration
+  system) worked. (fb1e151835e6)
+
+**Syntax and semantics**:
+
+- add ``menuconfig`` for defining a config option that should be rendered in
+  the Kconfig frontends as a submenu. (bbc115e93ae7)
+
+2.5.52
+------
+
+**Syntax**:
+
+- add support for conditional choice defaults. (4cd4dbacc889)
+
+**Syntax and semantics**:
+
+- add support for line continuation with backslash. (3cc84419be47)
+
+- use the ``srctree`` Make variable as fallback when searching for the root
+  Kconfig file. (3cc84419be47)
+
+2.5.47
+------
+
+**Syntax**:
+
+- remove support for multiline strings. (dfeaca8c1450)
+
+2.5.45
+------
+
+Add Kconfig, replacing Configuration Menu Language. (ae10cf681e70)
diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 00402d43e0dc..3070fe7f1f83 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -2,6 +2,9 @@
 Kconfig Language
 ================
 
+Historical changelog available here:
+:doc:`Documentation/kbuild/kconfig-history.rst <./kconfig-history>`
+
 Introduction
 ------------
 
-- 
2.56.0


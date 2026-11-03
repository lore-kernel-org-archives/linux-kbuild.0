Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718541;
	b=LpxoxX9QPUIIPdXA3NXMm0r6z28bo8Cjs8ySmjKxuWBkPEwgGFJJaTDU8u2WdcCweuFe
	 YbMwo7t5A7oto/9IvHAT0gdEzW521RclF2LajhBnYIrQI3GbaKf8WHk+8vH8WTWcTmu8d
	 DwfL/w+Lypt6FhPpbVnlRhc7gBMgD27SAdnrp0vpio0iZaARY8cdCdFuKukQWQon9CprP
	 ykh4QhoqmP6cqZC40k7hhCx3XEdmBQcl/4CwLAhJ9Tbxaf/59tbphyhXkz8/jdoDXGae7
	 kKyQW5wgnueRkHpsk4/RD6sQXdRD5EtLnTRk0mu+2mce1j4y0zphkIGZtmTWg3JHwyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ePOUbkceNtSqEh9wWel01bm87z+stHSfuqbUYKl4uI0=;
	b=optEzLBCr8w08E9CZS6bCueaCj7msvxlbX3ljBVdQEv95lTxeT9BuCJOufv4VyyXeFNi
	 INfNg7h8PAyDcnwBOXxqFAWHGKI38mQEVwRlc/iWVSDEHbYq94aAfFnYMF/1DDS986oxA
	 U2aZgEcbs/eM8nzz6KfL+7kdsyvYHl3GrB2ndsOaVBFJU4o8CnGzhJL9/linR57vI8Yu/
	 e/rEU5Dc+swV25n5zF7p7KnlDAqbzb+SuOhzchzheiyd5vH4IMVhlCqXHCMKDyNGuHUlT
	 Z4I7lW4nzj+21xMYCjRYdkqBJwwYokgk8UnKrWU23RfyTB/caJBuYnJzSOs61RgEjDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C27ST6WJ;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E0C606B261
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 15:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0E0C606B261
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C27ST6WJ
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-47b47de8b4cso2363711fac.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2026 07:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718539; x=1794323339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePOUbkceNtSqEh9wWel01bm87z+stHSfuqbUYKl4uI0=;
        b=C27ST6WJZzvgWlkLtZry2zNJObMQ0mjwr3sQ2QXvUyFzRZWmF5uhPG48iJz7dllYYi
         Buf7Ljng3+fYiw7quUD83eVgi4nS7Y4vWIqpYO27QL2BjhcILHJ8WQU5hQzJzf54JpPu
         ClxeFbp4jDY9uFaTiZ7Nnea9bVUejJw60p38kQxKrs5sOoa8IuIrqecFkz7fN8HXBSNM
         qkGOdQcOkhMs1DAC1y6PXv31/wi7LTXSL2Ge81B/eCDP8JZNFFtPjnJbaL6vU7WM0I9+
         Jb6G/SxymG7uKUspKUIItj0hI7Ds2g1+unK7GTYFX3TEUNO8/Zt7X7hvOefWOo+exYZK
         BpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718539; x=1794323339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ePOUbkceNtSqEh9wWel01bm87z+stHSfuqbUYKl4uI0=;
        b=GeAvnyBzF86skUHzeJ37MQQBEvZaHPY8HXi5SKNxNGUZgusbfV/JwdetjXTqRum0dW
         b1FCXiKwIWDdnuyA/FTvEsMGFuLIVfhuXCwOjsudylzgRITy6gBKCFx+9AKQFs5ia88f
         tz/s6GJkzKa7I3qiw6qY/UoJL2InbjPorwUrUwHhWgxjAPp9zA4OiMmzfP1SehGac6fs
         fgcFYC75D561nd8xijCsoxzRVafTKxWxMXPpjx1EytbXHxJl4U/HqWKVxKUub+T1Nvp6
         07aaz3XL2PwOG4MqaUoQTjfkXasSwhAhYqkpDzHd9sLYOLa/Xy7bAm8HQuROrom5QYeZ
         DB4w==
X-Forwarded-Encrypted: i=1; AKwUvBwCseFAk9k92fRvB4xByupe2nyHlCoL2K9FGWe/t44J6qkHmv0LEV/3sS1Q5m/K7o+A7ZduOXzKu45UK4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G3ZxELX8xZ7gcD4xTvtgNFNdH3LVKw0lXXijt2Dft5v9xFWM5
	9CiaITfpV0mhW+vx+Em2bLa/aaiq0PVJ3kc5l9GWaht3seWjv4Rckowl
X-Gm-Gg: AYBFou0tX2bk2avmbx8Dqp4I7dkbNPEb3/8DpdvCjy8yfvJ0oOO5i1EthxR75HxTaQI
	9Pn+KdvIjCV7ZvGrENsZzVv+qb2B4OHrbkf2In30yq27Weqd7OaNzx9X5z1Ep3mrRfmOYK2xjkL
	bGNTodclGR2jfzkWtl2fra8f7og4dWW+kdWz5L0oRbxCuFG6jqO4uEZ8K/6MuU1bwz/p9JHDzWt
	TmDluSYUoV9eds+/O2siCinYf1YcioHT+earAB5Z6crT4EWtMSGSWWCi8Urqw4xB8dYJ6KpfrOe
	02leeCXnzUIWvrFm4UV16EIH/nXP9cqNOAomlKD8Iov4dCuQH+XMlKQ3SXEwVF7wqmaaFfwROGC
	WvYOMn8cMLicB+6SOEcmedvIZKeI/auBxtOBDJA2lB5lcDoE0vZ9uOyp1vA3WrXOqgvEWnf2U3e
	AuoDoOBCPtefJV1GO36AEkWvJsyK0XcDcfyZb+snLS/37FwdmsLFLIWI5jvofLaeW1lQg5WbvlS
	Pl4/26dXSAoRNP8iCLQQEdTvpayvBF82jZhuLtDFDDaOXAwJCyb87a9YPItt351y7zBf0rwohW6
	W4vlsO/Pd8DCsG3mLdyHlfeAM0/+iR8qLV0QMA==
X-Received: by 2002:a05:6870:7992:b0:48f:e290:252a with SMTP id 586e51a60fabf-4a90783e6dcmr8953080fac.55.1793718538604;
        Tue, 03 Nov 2026 07:08:58 -0800 (PST)
Received: from penguin.lxd ([2605:3f84:842:3300:216:3eff:fe58:9322])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a95d970b9bsm4730448fac.8.2026.11.03.07.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:08:57 -0800 (PST)
From: Matthew Weber <matthew.l.weber@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	kasan-dev@googlegroups.com,
	Matthew Weber <matthew.l.weber@gmail.com>
Subject: [PATCH] Documentation: admin-guide: Add kernel minimization guide
Date: Tue,  3 Nov 2026 09:08:44 -0600
Message-Id: <20261103150845.13008-4-matthew.l.weber@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261103150845.13008-1-matthew.l.weber@gmail.com>
References: <20261103150845.13008-1-matthew.l.weber@gmail.com>
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

Add kernel-minimization.rst to the Workload analysis section of the
admin-guide, for application developers and system integrators who need
to trim a Linux kernel for a single known workload, for example when
analyzing the kernel for safety critical applications.

The guide explains how to trim a kernel for a workload running directly
as PID 1, cross-compiled for QEMU arm64 with CONFIG_MODULES=n, and how
to measure the resulting build.

Signed-off-by: Matthew Weber <matthew.l.weber@gmail.com>
---
 Documentation/admin-guide/index.rst           |   1 +
 .../admin-guide/kernel-minimization.rst       | 413 ++++++++++++++++++
 .../quickly-build-trimmed-linux.rst           |   4 +
 MAINTAINERS                                   |   6 +
 4 files changed, 424 insertions(+)
 create mode 100644 Documentation/admin-guide/kernel-minimization.rst

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index b734f8a2a..e16ffcd1d 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -178,6 +178,7 @@ subsystems expectations will be found here.
    :maxdepth: 1
 
    workload-tracing
+   kernel-minimization
 
 Everything else
 ---------------
diff --git a/Documentation/admin-guide/kernel-minimization.rst b/Documentation/admin-guide/kernel-minimization.rst
new file mode 100644
index 000000000..f9bab60ac
--- /dev/null
+++ b/Documentation/admin-guide/kernel-minimization.rst
@@ -0,0 +1,413 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR CC-BY-4.0)
+
+=================================================
+Minimizing a Linux kernel for a single workload
+=================================================
+
+:Authors: - Matthew Weber <matthew.l.weber@gmail.com>
+          - ELISA Aerospace Working Group <https://lists.elisa.tech/g/aerospace>
+
+This document explains how to trim a Linux kernel for a single, known workload,
+check that it still runs, and measure the resulting build. The examples are
+starting points to adapt to your hardware and workload, not configurations to
+copy unchanged.
+
+A smaller kernel carries less code to build, boot, review, and maintain. How
+much that matters depends on the situation: a developer trimming a test kernel
+cares about build time, while an integrator preparing a kernel for analysis or
+for a safety- or security-critical deployment cares about how much code must be
+understood and justified. This guide stays with the mechanics of trimming and
+measuring; where a particular step is useful for one of those analyses, it is
+called out as an example, not as a requirement.
+
+This guide builds on, rather than repeats, several existing documents:
+
+* :doc:`quickly-build-trimmed-linux` for the mechanics of getting, building,
+  and installing a kernel. This guide assumes you have followed it at least
+  once and reuses its sections by name below -- in particular its "Download the
+  sources" and "Define the build configuration for your kernel" steps. Note
+  that guide targets a kernel built **natively for the machine you are on**; the
+  cross-compiled, boot-in-QEMU angle used here is the main thing this guide adds
+  on top of it (see `Building: native vs cross-compiled`_).
+* :doc:`workload-tracing` for discovering the subsystems a workload uses, and
+  :doc:`/trace/ftrace` for tracing the kernel functions it reaches.
+* :doc:`/dev-tools/kcov` and :doc:`/dev-tools/gcov` for coverage collection.
+* :doc:`/kbuild/kconfig` and :doc:`/kbuild/kconfig-language` for the
+  configuration mechanics, and :doc:`/kbuild/kbuild` for build variables such
+  as ``ARCH`` and ``CROSS_COMPILE``.
+
+Baseline scenario
+=================
+
+The walkthrough assumes the simplest possible launch model, which keeps the
+chain from "what the workload needs" to "what the kernel must provide" short:
+
+   **The kernel launches the workload directly as PID 1. There is no init
+   system, no service manager, and no general multi-user user space.**
+
+For the initramfs example below, the kernel runs ``/init`` by default; use
+``rdinit=<path>`` to select a different program in that archive. ``init=<path>``
+selects init after mounting a real root filesystem; it does not override a
+working initramfs ``/init``.
+
+With this baseline, the user space is essentially the application plus the C
+library it links against. The decision cascades into the configuration: no
+service management, no getty/login, only the library and kernel features the
+application itself exercises.
+
+The worked example boots an ``arm64`` kernel under QEMU with a static "hello
+world" program as PID 1. See `A minimal workload`_ below.
+
+This walkthrough assumes a monolithic build: ``CONFIG_MODULES=n`` and all
+required kernel features and drivers built in (``=y``). It does not build,
+load, measure, or account for loadable modules. With module support disabled,
+Kconfig treats tristate options as booleans, so existing ``=m`` selections
+become built-in (``=y``) rather than being dropped. A top-down build from
+``defconfig`` therefore links every ``defconfig`` module into the image; check
+the resolved configuration and disable unneeded features explicitly.
+
+Building and trimming
+=====================
+
+Change one feature group at a time, rebuild, and check that the workload still
+runs. The measurement examples below can help compare working configurations.
+
+Prerequisites
+-------------
+
+Follow "Install build requirements" in :doc:`quickly-build-trimmed-linux`
+for the native build tools. On a Debian/Ubuntu x86_64 host, this example adds::
+
+    sudo apt install gcc-aarch64-linux-gnu qemu-system-arm file
+
+The cross-compiler package brings in matching binutils and, with the normal
+recommended packages, the target libc headers and static library. ``qemu-system-arm`` provides
+``qemu-system-aarch64``; ``file`` checks the application binary. Other tools
+are introduced where they are used.
+
+Get the sources
+---------------
+
+Retrieve the kernel sources exactly as described in
+:doc:`quickly-build-trimmed-linux` ("Download the sources"). For a workload
+that must track a long-lived kernel, follow that guide's instructions for
+adding a stable/longterm branch rather than building bleeding-edge mainline, so
+you measure against a kernel with a long maintenance window. All commands below
+run from the resulting source tree.
+
+Building: native vs cross-compiled
+----------------------------------
+
+The trimmed-build guide builds a kernel **natively, for the machine you are
+running on**, and installs it there. This guide instead builds for a target
+architecture and boots the result under QEMU, so nothing is installed on your
+host. The mechanics of cross-building are not specific to minimization and are
+documented in :doc:`/kbuild/kbuild` (the ``ARCH`` and ``CROSS_COMPILE``
+variables); set them once for the worked example::
+
+    export ARCH=arm64
+    export CROSS_COMPILE=aarch64-linux-gnu-
+
+Every ``make`` below (``defconfig``, ``tinyconfig``, ``olddefconfig``,
+``Image``) then honours them. For a native arm64 build, omit ``CROSS_COMPILE`` and use the native tools.
+An x86 kernel or application cannot substitute for the arm64 images in the
+QEMU commands. Other architectures need their own image target, console,
+platform support, and emulator. The trimmed-build guide's "Install your kernel"
+and Secure Boot steps do not apply to this QEMU experiment.
+
+Build in the source tree, as in the trimmed-build guide. Save a working
+``.config`` before changing it so you can restore it if necessary. Keep the
+matching ``vmlinux`` when resolving debug information or coverage PCs.
+``make clean`` preserves ``.config`` but removes build artifacts; do not use
+``mrproper`` between changes.
+
+Iterate toward minimal
+----------------------
+
+Pick a direction. These mirror the two bases the trimmed-build guide's "Define
+the build configuration for your kernel" section describes -- starting from an
+existing (large) config versus starting from scratch:
+
+* **Top-down** -- start from a working configuration and remove features,
+  re-testing after each removal. For this arm64 QEMU example, build
+  ``defconfig`` as the baseline::
+
+      make defconfig
+      ./scripts/config -d MODULES
+      make olddefconfig
+      make clean
+      make -j"$(nproc)" Image
+
+  Follow `A minimal workload`_ to compile, pack, and boot the application.
+  Require ``hello world`` and no panic before treating this as a known-good
+  baseline (pass ``-m 512M`` or ``-m 1G`` to QEMU for defconfig images to avoid
+  exhausting the default 128 MB machine memory during driver initialization).
+  For a native target, the trimmed-build guide's
+  ``localmodconfig``/``olddefconfig`` approach is another starting point; do not
+  use the host's configuration for an unrelated cross-compiled target.
+  Save the working configuration, then change one group::
+
+      cp .config config.before
+      ./scripts/config -d IPV6
+      make olddefconfig
+      make clean
+      make -j"$(nproc)" Image
+
+* **Bottom-up** -- start from almost nothing and add only what the workload
+  needs::
+
+      make tinyconfig
+      ./scripts/config \
+          -e PRINTK -e TTY -e SERIAL_AMBA_PL011 -e SERIAL_AMBA_PL011_CONSOLE \
+          -e BINFMT_ELF -e BLK_DEV_INITRD -d MODULES
+      make olddefconfig
+      make clean
+      make -j"$(nproc)" Image
+
+  Beyond the serial options, this example needs ``PRINTK``, ``BLK_DEV_INITRD``,
+  and ``BINFMT_ELF`` for visible output, the external initramfs, and ELF
+  execution. Arm64 selects its device-tree, interrupt-controller, timer, and
+  AMBA support; those are not supplied by the
+  serial driver. This is a small bootable starting point for QEMU ``virt``,
+  not a universally minimal or production-ready configuration. Inspect the
+  resolved config: ``scripts/config`` edits requests, and unmet dependencies
+  can cause ``olddefconfig`` to discard them. Pack and boot the same PID 1
+  application as above; building ``defconfig`` first is not necessary for this
+  direction.
+
+To browse the configuration tree interactively with help text in view, use
+``make menuconfig`` (needs ``libncurses-dev``), as described in the
+trimmed-build guide's "Individual adjustments" section.
+
+After each change, repeat the boot command in `A minimal workload`_ with
+the rebuilt image and the same application archive. For this example, require
+``hello world`` and no panic. A QEMU timeout alone is not success: a failed
+boot can also hang. To inspect changes against the saved configuration::
+
+    scripts/diffconfig config.before .config > config.delta
+
+Do not assume that ``tinyconfig`` to ``defconfig`` measures one subsystem:
+optimization policy, platform drivers, and many unrelated settings change too.
+For a single-group comparison, save the last resolved config as
+``config.before``, change just that group, and clean/rebuild.
+
+Deciding what to remove
+=======================
+
+Follow :doc:`workload-tracing` for syscall and kernel-path collection. Use its
+"Tracing a minimal user space" section with the program from
+`A minimal workload`_, and its "Mapping observations to configuration" section
+for source and Kconfig analysis. Re-test each removal with the same PID 1
+workload.
+
+Measuring
+=========
+
+The following measurements can help compare builds:
+
+* **Source lines of code (SLOC)** -- a proxy for the amount of code to review.
+  Two complementary counts are available (see `Counting kernel SLOC`_): a DWARF-based
+  estimate of source lines represented in the linked image, and a ``cloc``
+  count of whole compiled source files. Neither measures runtime coverage.
+* **Image size** -- a sanity bound only, not a score; it depends on
+  compression, compiler version, and optimization level.
+* **Coverage** -- :doc:`/dev-tools/kcov` is intentionally task-scoped for
+  single-thread syscall tracing and coverage-guided fuzzing, capturing
+  only the code executed during calls on the thread that enabled tracing.
+  If the goal is structural code coverage across the entire kernel -- including
+  boot initialization, interrupt handlers, background kernel daemons, and
+  multi-process workloads -- use :doc:`/dev-tools/gcov`. GCOV provides
+  GCC/Clang compiler-level basic-block counters across the entire kernel
+  image and exports runtime coverage files through ``/sys/kernel/debug/gcov``.
+
+For meaningful comparisons, use consistent workload inputs, tool versions,
+build options, and instrumentation. These QEMU checks do not validate target
+hardware, timing, failure recovery, or a larger workload.
+
+Counting kernel SLOC
+--------------------
+
+Install ``cloc`` for compiled-source counts and ensure ``python3`` is available
+for generating the compilation database. On Debian/Ubuntu::
+
+    sudo apt install cloc python3
+
+Use ``scripts/kernel-sloc``; ``scripts/kernel-sloc --help`` lists its modes,
+requirements, and tool overrides. Successful runs print one integer on stdout
+and a human-readable summary on stderr. Errors exit non-zero without a count.
+It offers two kernel counts:
+
+* ``dwarf`` -- resolves DWARF line-table addresses in a ``vmlinux`` built with
+  ``CONFIG_DEBUG_INFO`` to distinct full-path ``file:line`` pairs using GNU
+  ``objdump`` and ``addr2line``. Optimization, inlining, and the quality of the
+  debug information affect this estimate; it is not an exact mapping of every
+  instruction to all contributing source lines.
+* ``kernel`` -- wraps ``cloc`` over the unique sources listed in
+  ``compile_commands.json``. It counts code lines in whole files, including
+  inactive preprocessor branches, but does not follow included headers. It is
+  therefore not a strict upper bound on the DWARF count.
+
+The DWARF SLOC metric needs a ``vmlinux`` built with debug information.
+Enable it before rebuilding and counting; this does not instrument execution.
+Follow the trimmed-build guide's "Debug symbols" section to enable it. Only the
+DWARF line table is needed here, so the symbol-table options that section also
+turns on (``KALLSYMS``, ``KALLSYMS_ALL``) are left out::
+
+    ./scripts/config -d DEBUG_INFO_NONE \
+        -e DEBUG_KERNEL -e DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
+        -d DEBUG_INFO_BTF -d DEBUG_INFO_SPLIT
+    make olddefconfig
+    make clean
+    make -j"$(nproc)" Image
+
+Check that ``CONFIG_DEBUG_INFO=y`` survives ``olddefconfig``. Reapply these
+settings after starting from ``tinyconfig``, which resets debug options, and
+rebuild before measuring. Keep this debug policy consistent across compared builds.
+
+With module support disabled, ``scripts/kernel-sloc dwarf vmlinux`` measures the
+linked kernel ELF. ``scripts/kernel-sloc kernel`` counts sources listed in its
+compilation database, including generated sources, assembly, and host helpers when
+present. The database is an inventory of compilations, not proof that every file
+is linked into the target image. Use ``make clean`` before each changed build
+and regenerate the database after building; stale ``.cmd`` files or a database
+can retain previous sources. Neither count here includes loadable modules.
+
+If the database is missing, ``scripts/kernel-sloc kernel`` runs the generator
+automatically. For an out-of-tree build, use the generator's ``-d`` option and
+pass the build directory to the counter.
+
+.. code-block:: sh
+
+    # debug-info estimate: distinct source lines represented in vmlinux
+    scripts/kernel-sloc --report linked.json dwarf vmlinux > sloc-dwarf.txt
+
+    # regenerate the database only after completing this clean build
+    python3 scripts/clang-tools/gen_compile_commands.py
+    scripts/kernel-sloc --report compiled.json kernel . > sloc-compiled.txt
+
+For a cross build, select matching tools with
+``CROSS_COMPILE=aarch64-linux-gnu- scripts/kernel-sloc dwarf vmlinux``.
+``OBJDUMP`` and ``ADDR2LINE`` override the individual tool names; if only
+``OBJDUMP`` is set to a conventional name ending in ``objdump``, the script
+uses the same prefix for ``addr2line``.
+
+The optional ``--report`` writes a JSON inventory without changing the integer
+count on stdout. ``kernel`` lists unique compiled files; ``dwarf`` lists the
+counted ``file:line`` pairs and function/file pairs resolved at those addresses.
+This is not a complete function-symbol listing; debug information, optimization,
+and inlining limit the mapping. Retain the reports to connect the built-code
+inventory to observations from :doc:`workload-tracing`.
+
+Note the SLOC and its inventories describe built code, not execution. Use
+:doc:`/dev-tools/gcov` for execution counts and :doc:`/dev-tools/kcov` for
+task-scoped kernel PCs.
+
+Measuring the image
+-------------------
+
+Image size can be tracked as a reference. It is not a minimization score on its
+own, because compression, compiler version, and optimization level all affect
+it::
+
+    make Image.gz
+    stat -c%s arch/arm64/boot/Image      # raw
+    stat -c%s arch/arm64/boot/Image.gz   # compressed
+
+Reducing the user space
+=======================
+
+For this small static program, the linked C library can dominate the user-space
+binary size. A different libc (for example musl) can change both size and
+syscall behavior; fewer library entry points do not automatically mean fewer
+required kernel features. Rebuild, trace, and re-test the same workload before
+accepting a library change.
+
+``scripts/kernel-sloc --help`` describes the optional application/file and
+source-tree counts, which can be used to compare user-space binaries and
+libraries.
+
+This guide focuses on the kernel and user-space components. On real systems,
+the hardware, firmware, and boot sequence can require additional kernel
+options that a QEMU run does not reveal.
+
+A minimal workload
+==================
+
+This is a "hello world" program booted as PID 1 (init). There is no init
+system, no shell, and no service manager -- the kernel execs it directly as
+``/init``.
+
+.. code-block:: c
+
+    #include <stdio.h>
+    #include <unistd.h>
+
+    int main(void)
+    {
+        printf("hello world\n");
+        fflush(stdout);
+
+        /* PID 1 must never return. Idle forever. */
+        for (;;)
+            pause();
+
+        return 0; /* not reached */
+    }
+
+Save it as ``hello_init.c`` and build it statically so the kernel can exec it
+with no dynamic loader or libraries present in the rootfs::
+
+    aarch64-linux-gnu-gcc -static -O2 -o hello_init hello_init.c
+    file hello_init     # -> ELF 64-bit ... ARM aarch64 ... statically linked ...
+
+Pack the application as ``/init`` in a gzip-compressed archive.
+Install ``cpio`` if needed; ``gzip`` is normally present on the build host::
+
+    sudo apt install cpio
+    mkdir -p rootfs
+    cp hello_init rootfs/init
+    chmod 0755 rootfs/init
+    ( cd rootfs && find . | cpio -o -H newc ) | gzip > initramfs.cpio.gz
+
+With ``CONFIG_INITRAMFS_SOURCE=""``, the default built-in initramfs supplies
+``/dev/console``, so this external archive only needs ``/init``.
+
+Check the resolved configuration for built-in ``PRINTK``, ``TTY``,
+``SERIAL_AMBA_PL011``, ``SERIAL_AMBA_PL011_CONSOLE``, ``BLK_DEV_INITRD``,
+``RD_GZIP``, and ``BINFMT_ELF`` as in the bottom-up recipe. Boot the
+rebuilt image with the same application archive::
+
+    qemu-system-aarch64 -machine virt -cpu cortex-a57 -nographic \
+        -kernel arch/arm64/boot/Image \
+        -initrd initramfs.cpio.gz \
+        -append 'console=ttyAMA0'
+
+When booting larger or monolithic ``defconfig`` images, pass ``-m 512M`` or
+``-m 1G`` to provide sufficient memory for driver initialization (the default
+128 MB on QEMU ``virt`` can trigger out-of-memory panics on full configurations).
+
+There is no ``root=`` and no disk image -- the initramfs is the root and the
+kernel runs ``/init`` from it by default. The program prints ``hello world`` and
+then parks in ``pause()`` forever, so it never triggers the ``Attempted to kill
+init!`` panic. Close QEMU with ``Ctrl-a x``.
+
+References
+==========
+
+* :doc:`quickly-build-trimmed-linux` -- building and installing a kernel.
+* :doc:`workload-tracing` -- discovering subsystems used by a workload.
+* :doc:`/trace/ftrace` -- in-kernel function tracing, for seeing which kernel
+  functions a workload reaches.
+* :doc:`/dev-tools/testing-overview` -- overview of kernel testing frameworks
+  and coverage tools.
+* :doc:`/dev-tools/kcov`, :doc:`/dev-tools/gcov` -- coverage collection.
+* :doc:`/dev-tools/kselftest`, :doc:`/dev-tools/kunit/index` -- in-kernel unit
+  testing and functional test suites.
+* :doc:`/kbuild/kconfig`, :doc:`/kbuild/kconfig-language` -- configuration;
+  :doc:`/kbuild/kbuild` -- ARCH / CROSS_COMPILE and other build variables.
+* ``scripts/kernel-sloc`` -- the SLOC counter used for the metrics above.
+* ``scripts/diffconfig``, ``scripts/bloat-o-meter`` -- related size/diff
+  helpers.
+* `Kernel Size Reduction Work <https://elinux.org/Kernel_Size_Reduction_Work>`_
+  -- a 2014 list of kernel size-reduction ideas and projects, for background
+  on which options dominate a small kernel.
diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
index cb4b78468..63c9b0f4d 100644
--- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
+++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
@@ -8,6 +8,10 @@ How to quickly build a trimmed Linux kernel
 This guide explains how to swiftly build Linux kernels that are ideal for
 testing purposes, but perfectly fine for day-to-day use, too.
 
+.. note:: To shrink a kernel down to only what one known workload needs, and
+   to measure the result, see :doc:`kernel-minimization`, which builds on this
+   guide.
+
 The essence of the process (aka 'TL;DR')
 ========================================
 
diff --git a/MAINTAINERS b/MAINTAINERS
index d83f37c3a..5beb8c43f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28154,6 +28154,12 @@ F:	sound/soc/codecs/arizona*
 F:	sound/soc/codecs/cs47l24*
 F:	sound/soc/codecs/wm*
 
+WORKLOAD ANALYSIS DOCUMENTATION
+M:	Matthew Weber <matthew.l.weber@gmail.com>
+L:	linux-doc@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/kernel-minimization.rst
+
 WORKQUEUE
 M:	Tejun Heo <tj@kernel.org>
 R:	Lai Jiangshan <jiangshanlai@gmail.com>
-- 
2.39.5


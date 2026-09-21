Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD833AEF2E
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2026 07:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974380; cv=none; b=qXty62hgG26ofDQDcQfwd/TnFTTbVjdw6wKg4fnZOeDeyD+hJl4zNy24wuuWAmTsF0likvTSXJOsb0YBEDfrIQBPKiCwszApRaVxdJXMs3yGUFomWbXeRA/Fe3Ybbp7q2QRnY4hvSpdFHzDFdu/lsBvdZkUC+5okmYNtTbJC6UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974380; c=relaxed/simple;
	bh=PGXKNJGV8MJCq5TfdRhmoMqrV5wj5z98tOVMmGAAc9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C3XCk9hGw3Ppuq65F2ZDlJaAoz0uhaJKGCHDztpX9nfHoIbqx4xtV7/yJe/CuiufIv8Flj8wp9CjuHiqCPFQLGQMjYOu33tmzRpGeiM7xFPIujPdJpwLdnbNd4tr9Fpli6Oc15DESu/QIRv3zP8yOEvPToK8wKqrDVY7YmBw2W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3V2LBu4; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3V2LBu4"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49b963f51f6so11826535e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2026 00:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789974376; x=1790579176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnc4LUOH3Pg+su+FetLY1fkeIBJPToCClVl8WwLBch4=;
        b=M3V2LBu4qj9c7wnD8ab5Zs/6b8dhRKTVs7Y5d5FXdEmbPU1w+XhOczD0macM4nTmBT
         pQISuFKgI3++a28gq5zB1Ox08zIUrBg1Xc2+hYfOqDQsAlNMUmqHCPwEUljwOGR8eEJk
         KltCIQa2SA9BV7M/qOpWey36eykiabZWPxYRGcddnMHr7B8+EKw/eiVIPQ/82wV7t/ax
         fI4i+4iZyxc12aORBNYBhVjMDzKJ+gw1HVjAJTbGc11nU2pu5M+rteWVp0JHGehvfndm
         4sFx2IwuZ7d+7w4MO+GwOGl52092MlBuJJpI81V/TYJOF2p1jyTbTLfsAo9IduSZqRCp
         SNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974376; x=1790579176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnc4LUOH3Pg+su+FetLY1fkeIBJPToCClVl8WwLBch4=;
        b=vPd+Zz0enx3AZiAQejGhB5ccHfCUw2BJEGUcuBLqlxqxdr1fk9o/9DVFnBgxN09zcv
         o32+XjlWizAo4pzeP8TBbPOIuZMGaDyo2OSYkHvbTyIVnjRK6SYq5nrIwcNqax1K6v+C
         ltUVRpAe3U/9iJB5M4aKW/yhLYnTXgeqOS9ZtFKEBptplLlvuzIM6yYVnq4yNbNgaChq
         WmbZoSnJw+YmaTQ0bnqQhkXfr5XPn/dkRKjupNdmPNpXzljVAo7TM8vioIUh2zRQyerf
         cq8YVqhCbYGdKSJEZrXjYKUV1xnUlNOHf3ix3hYQ0pKhYrC+9impcpg3VOB1jYvaG7da
         ek6w==
X-Forwarded-Encrypted: i=1; AKwUvBzLMt7OCKR0wrMLIS+FvGdqX1SnYyqW2Yqjr6aR4fNRlMkg01eS9MO3QiYbi26TNRGX3OpR0i4e/2GGNSo=@vger.kernel.org
X-Gm-Message-State: AFuF++mecetKaOcuF2vo6zv8UxhYBB4Ri0oA9+d5ud74Ry/2MoHgTzKZ
	4XtcPVGS5sYIqTZHWl5YmAGKybusjjaIkdqc7QAqx/hAOh1BkKLK3/eZ
X-Gm-Gg: AYBFou1cAynVc4ZiEELWM61lO1lWwnsRv7x3lUoQv2t5TaeLzB9iNuklQNoPhSG8B3M
	kFt+SFjGCAG9slTZUNv+IO8ht5TVwOFAMC5IModwNc8qcNrB00TiJhZv7RJcFU2t8tT2sN8HL04
	2Vwqltv/GPWn7Cyo8dWipf8uGE8+K7vO1cbTp1kQfDZiN/5kwNSt7xTKemU8+DZ9Sy4KzbzbfFO
	+hs7PYt4HKuNYdNYNpFBOitKCyDk6WZ0Fhd0+A7vWcl5LkGp8L8F/W0HbMfOVpJnI/tr6KN5btf
	d1gnh7tBEZ6KAepcSfHM+m7ejZwf0ief6CoEIjPgvNCFEf6b4jk3qxuvyuOS1N7/JYp6mqD+JPN
	BqX9Q5y5iowpd7aZLxJFlqk8saN92kwhl9BrzYeCvAX8RcE3yK1Pg7lZ2+tPwGNHCvwxPyc3wa+
	eymc8Kt1HAjoayyHUriLap/PKnJc9TUFEtL22YpVCmO5lHqvZKFz9Yezs/h9q85HJ73lRpAlwZr
	fKKA3KK1drhywt5OoQEi0a7++l6yDOb2gtnmCUXqEOp9nqgXyV7VYu7IxdIA+dnd9SRu0JJ02Ar
	Kz7RTnE=
X-Received: by 2002:a05:600c:3b05:b0:49c:fa21:e746 with SMTP id 5b1f17b1804b1-49fc57570c8mr123090825e9.28.1789974375638;
        Mon, 21 Sep 2026 00:06:15 -0700 (PDT)
Received: from localhost.localdomain (ip-185-191-117-140.009.ptr.cherryservers.net. [185.191.117.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd03fe55sm243356725e9.2.2026.09.21.00.06.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 00:06:13 -0700 (PDT)
From: Osman Ahmadzai <osmanahmadxai@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	apw@canonical.com,
	joe@perches.com,
	tglx@kernel.org,
	gregkh@linuxfoundation.org,
	linux-kbuild@vger.kernel.org,
	linux-spdx@vger.kernel.org,
	Osman Ahmadzai <osmanahmadxai@gmail.com>
Subject: [PATCH v2] README: rename to README.rst and make the doc references links
Date: Mon, 21 Sep 2026 11:35:56 +0430
Message-ID: <20260921070556.6909-1-osmanahmadxai@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921050038.76985-1-osmanahmadxai@gmail.com>
References: <20260921050038.76985-1-osmanahmadxai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The README points at some sixty files in the tree, but it has no
extension, so it shows up as plain text and none of those paths can be
followed.  You have to go and find each one by hand.

The content has always been reStructuredText - it uses reST section
syntax for its headings - so give it the extension to match, and wrap
each in-tree reference in an anonymous hyperlink whose link text is the
path itself.  The rendered text is byte-for-byte what it was before; only
the markup is new.  Anonymous because a handful of the paths are listed
twice and named targets would collide.

checkpatch.pl and get_maintainer.pl both test for a file called README to
find the top of the tree, and the Makefile points readers at ./README, so
those are updated in step.  scripts/spdxexclude lists the file as having
no copyrightable content; only its path changes there.

Signed-off-by: Osman Ahmadzai <osmanahmadxai@gmail.com>
---
v2: Dropped the second file - you are right, two copies would be out of
    sync within a release.  This renames instead, so there is one copy of
    the content, and updates the four places that referred to the old
    name.  I went with the rename rather than the symlink because it
    leaves nothing pointing at a name that no longer describes the file,
    and the fixups turned out to be one line each.

    I did look at folding it into Documentation/index.rst, and it looks
    like a bigger change than this one rather than an alternative to it.
    The README names 55 documents; only 12 of them appear in the
    index.rst toctrees today, the other 43 being reachable only by
    descending into process/index.rst, subsystem-apis.rst and the rest.
    So integrating means either pulling those 43 into index.rst or
    dropping them, and that is an editorial call about material that
    landed in b9a565b3e4d8 last November rather than a presentation fix.
    I would rather not make it as a side effect of this patch.

    If you do want it, what I had in mind is a short "where to start"
    section near the top of index.rst - one entry per kind of reader,
    pointing at the existing index documents (process/index.rst for new
    developers, subsystem-apis.rst for internals, admin-guide/index.rst
    for administrators, and so on) rather than repeating the individual
    paths.  Around forty lines, and automarkup turns every path in it
    into a link with no markup needed.  The README would then shrink to a
    pointer at the documentation.  Say the word and I will send it as its
    own patch.

 Makefile                  |   4 +-
 README                    | 168 -------------------------------------
 README.rst                | 170 ++++++++++++++++++++++++++++++++++++++
 scripts/checkpatch.pl     |   2 +-
 scripts/get_maintainer.pl |   2 +-
 scripts/spdxexclude       |   2 +-
 6 files changed, 175 insertions(+), 173 deletions(-)
 delete mode 100644 README
 create mode 100644 README.rst

diff --git a/Makefile b/Makefile
index 751a08643..4f97e8515 100644
--- a/Makefile
+++ b/Makefile
@@ -7,7 +7,7 @@ NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
 # To see a list of typical targets execute "make help"
-# More info can be located in ./README
+# More info can be located in ./README.rst
 # Comments in this file are targeted only to the developer, do not
 # expect to learn how to build the kernel reading this file.
 
@@ -1981,7 +1981,7 @@ help:
 		)
 	@echo  ''
 	@echo  'Execute "make" or "make all" to build all targets marked with [*] '
-	@echo  'For further info see the ./README file'
+	@echo  'For further info see the ./README.rst file'
 
 
 help-board-dirs := $(addprefix help-,$(board-dirs))
diff --git a/README b/README
deleted file mode 100644
index 010c58722..000000000
--- a/README
+++ /dev/null
@@ -1,168 +0,0 @@
-Linux kernel
-============
-
-The Linux kernel is the core of any Linux operating system. It manages hardware,
-system resources, and provides the fundamental services for all other software.
-
-Quick Start
------------
-
-* Report a bug: See Documentation/admin-guide/reporting-issues.rst
-* Get the latest kernel: https://kernel.org
-* Build the kernel: See Documentation/admin-guide/quickly-build-trimmed-linux.rst
-* Join the community: https://lore.kernel.org/
-
-Essential Documentation
------------------------
-
-All users should be familiar with:
-
-* Building requirements: Documentation/process/changes.rst
-* Code of Conduct: Documentation/process/code-of-conduct.rst
-* License: See COPYING
-
-Documentation can be built with make htmldocs or viewed online at:
-https://www.kernel.org/doc/html/latest/
-
-
-Who Are You?
-============
-
-Find your role below:
-
-* New Kernel Developer: Getting started with kernel development
-* Academic Researcher: Studying kernel internals and architecture
-* Security Expert: Hardening and vulnerability analysis
-* Backport/Maintenance Engineer: Maintaining stable kernels
-* System Administrator: Configuring and troubleshooting
-* Maintainer: Leading subsystems and reviewing patches
-* Hardware Vendor: Writing drivers for new hardware
-* Distribution Maintainer: Packaging kernels for distros
-* AI Coding Assistant: LLMs and AI-powered development tools
-
-
-For Specific Users
-==================
-
-New Kernel Developer
---------------------
-
-Welcome! Start your kernel development journey here:
-
-* Getting Started: Documentation/process/development-process.rst
-* Your First Patch: Documentation/process/submitting-patches.rst
-* Coding Style: Documentation/process/coding-style.rst
-* Build System: Documentation/kbuild/index.rst
-* Development Tools: Documentation/dev-tools/index.rst
-* Kernel Hacking Guide: Documentation/kernel-hacking/hacking.rst
-* Core APIs: Documentation/core-api/index.rst
-
-Academic Researcher
--------------------
-
-Explore the kernel's architecture and internals:
-
-* Researcher Guidelines: Documentation/process/researcher-guidelines.rst
-* Memory Management: Documentation/mm/index.rst
-* Scheduler: Documentation/scheduler/index.rst
-* Networking Stack: Documentation/networking/index.rst
-* Filesystems: Documentation/filesystems/index.rst
-* RCU (Read-Copy Update): Documentation/RCU/index.rst
-* Locking Primitives: Documentation/locking/index.rst
-* Power Management: Documentation/power/index.rst
-
-Security Expert
----------------
-
-Security documentation and hardening guides:
-
-* Security Documentation: Documentation/security/index.rst
-* LSM Development: Documentation/security/lsm-development.rst
-* Self Protection: Documentation/security/self-protection.rst
-* Reporting Vulnerabilities: Documentation/process/security-bugs.rst
-* CVE Procedures: Documentation/process/cve.rst
-* Embargoed Hardware Issues: Documentation/process/embargoed-hardware-issues.rst
-* Security Features: Documentation/userspace-api/seccomp_filter.rst
-
-Backport/Maintenance Engineer
------------------------------
-
-Maintain and stabilize kernel versions:
-
-* Stable Kernel Rules: Documentation/process/stable-kernel-rules.rst
-* Backporting Guide: Documentation/process/backporting.rst
-* Applying Patches: Documentation/process/applying-patches.rst
-* Subsystem Profile: Documentation/maintainer/maintainer-entry-profile.rst
-* Git for Maintainers: Documentation/maintainer/configure-git.rst
-
-System Administrator
---------------------
-
-Configure, tune, and troubleshoot Linux systems:
-
-* Admin Guide: Documentation/admin-guide/index.rst
-* Kernel Parameters: Documentation/admin-guide/kernel-parameters.rst
-* Sysctl Tuning: Documentation/admin-guide/sysctl/index.rst
-* Tracing/Debugging: Documentation/trace/index.rst
-* Performance Security: Documentation/admin-guide/perf-security.rst
-* Hardware Monitoring: Documentation/hwmon/index.rst
-
-Maintainer
-----------
-
-Lead kernel subsystems and manage contributions:
-
-* Maintainer Handbook: Documentation/maintainer/index.rst
-* Pull Requests: Documentation/maintainer/pull-requests.rst
-* Managing Patches: Documentation/maintainer/modifying-patches.rst
-* Rebasing and Merging: Documentation/maintainer/rebasing-and-merging.rst
-* Development Process: Documentation/process/maintainer-handbooks.rst
-* Maintainer Entry Profile: Documentation/maintainer/maintainer-entry-profile.rst
-* Git Configuration: Documentation/maintainer/configure-git.rst
-
-Hardware Vendor
----------------
-
-Write drivers and support new hardware:
-
-* Driver API Guide: Documentation/driver-api/index.rst
-* Driver Model: Documentation/driver-api/driver-model/driver.rst
-* Device Drivers: Documentation/driver-api/infrastructure.rst
-* Bus Types: Documentation/driver-api/driver-model/bus.rst
-* Device Tree Bindings: Documentation/devicetree/bindings/
-* Power Management: Documentation/driver-api/pm/index.rst
-* DMA API: Documentation/core-api/dma-api.rst
-
-Distribution Maintainer
------------------------
-
-Package and distribute the kernel:
-
-* Stable Kernel Rules: Documentation/process/stable-kernel-rules.rst
-* ABI Documentation: Documentation/ABI/README
-* Kernel Configuration: Documentation/kbuild/kconfig.rst
-* Module Signing: Documentation/admin-guide/module-signing.rst
-* Kernel Parameters: Documentation/admin-guide/kernel-parameters.rst
-* Tainted Kernels: Documentation/admin-guide/tainted-kernels.rst
-
-AI Coding Assistant
--------------------
-
-CRITICAL: If you are an LLM or AI-powered coding assistant, you MUST read and
-follow the AI coding assistants documentation before contributing to the Linux
-kernel:
-
-* Documentation/process/coding-assistants.rst
-
-This documentation contains essential requirements about licensing, attribution,
-and the Developer Certificate of Origin that all AI tools must comply with.
-
-
-Communication and Support
-=========================
-
-* Mailing Lists: https://lore.kernel.org/
-* IRC: #kernelnewbies on irc.oftc.net
-* Bugzilla: https://bugzilla.kernel.org/
-* MAINTAINERS file: Lists subsystem maintainers and mailing lists
-* Email Clients: Documentation/process/email-clients.rst
diff --git a/README.rst b/README.rst
new file mode 100644
index 000000000..27fc2b2ec
--- /dev/null
+++ b/README.rst
@@ -0,0 +1,170 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Linux kernel
+============
+
+The Linux kernel is the core of any Linux operating system. It manages hardware,
+system resources, and provides the fundamental services for all other software.
+
+Quick Start
+-----------
+
+* Report a bug: See `Documentation/admin-guide/reporting-issues.rst <Documentation/admin-guide/reporting-issues.rst>`__
+* Get the latest kernel: https://kernel.org
+* Build the kernel: See `Documentation/admin-guide/quickly-build-trimmed-linux.rst <Documentation/admin-guide/quickly-build-trimmed-linux.rst>`__
+* Join the community: https://lore.kernel.org/
+
+Essential Documentation
+-----------------------
+
+All users should be familiar with:
+
+* Building requirements: `Documentation/process/changes.rst <Documentation/process/changes.rst>`__
+* Code of Conduct: `Documentation/process/code-of-conduct.rst <Documentation/process/code-of-conduct.rst>`__
+* License: See `COPYING <COPYING>`__
+
+Documentation can be built with make htmldocs or viewed online at:
+https://www.kernel.org/doc/html/latest/
+
+
+Who Are You?
+============
+
+Find your role below:
+
+* New Kernel Developer: Getting started with kernel development
+* Academic Researcher: Studying kernel internals and architecture
+* Security Expert: Hardening and vulnerability analysis
+* Backport/Maintenance Engineer: Maintaining stable kernels
+* System Administrator: Configuring and troubleshooting
+* Maintainer: Leading subsystems and reviewing patches
+* Hardware Vendor: Writing drivers for new hardware
+* Distribution Maintainer: Packaging kernels for distros
+* AI Coding Assistant: LLMs and AI-powered development tools
+
+
+For Specific Users
+==================
+
+New Kernel Developer
+--------------------
+
+Welcome! Start your kernel development journey here:
+
+* Getting Started: `Documentation/process/development-process.rst <Documentation/process/development-process.rst>`__
+* Your First Patch: `Documentation/process/submitting-patches.rst <Documentation/process/submitting-patches.rst>`__
+* Coding Style: `Documentation/process/coding-style.rst <Documentation/process/coding-style.rst>`__
+* Build System: `Documentation/kbuild/index.rst <Documentation/kbuild/index.rst>`__
+* Development Tools: `Documentation/dev-tools/index.rst <Documentation/dev-tools/index.rst>`__
+* Kernel Hacking Guide: `Documentation/kernel-hacking/hacking.rst <Documentation/kernel-hacking/hacking.rst>`__
+* Core APIs: `Documentation/core-api/index.rst <Documentation/core-api/index.rst>`__
+
+Academic Researcher
+-------------------
+
+Explore the kernel's architecture and internals:
+
+* Researcher Guidelines: `Documentation/process/researcher-guidelines.rst <Documentation/process/researcher-guidelines.rst>`__
+* Memory Management: `Documentation/mm/index.rst <Documentation/mm/index.rst>`__
+* Scheduler: `Documentation/scheduler/index.rst <Documentation/scheduler/index.rst>`__
+* Networking Stack: `Documentation/networking/index.rst <Documentation/networking/index.rst>`__
+* Filesystems: `Documentation/filesystems/index.rst <Documentation/filesystems/index.rst>`__
+* RCU (Read-Copy Update): `Documentation/RCU/index.rst <Documentation/RCU/index.rst>`__
+* Locking Primitives: `Documentation/locking/index.rst <Documentation/locking/index.rst>`__
+* Power Management: `Documentation/power/index.rst <Documentation/power/index.rst>`__
+
+Security Expert
+---------------
+
+Security documentation and hardening guides:
+
+* Security Documentation: `Documentation/security/index.rst <Documentation/security/index.rst>`__
+* LSM Development: `Documentation/security/lsm-development.rst <Documentation/security/lsm-development.rst>`__
+* Self Protection: `Documentation/security/self-protection.rst <Documentation/security/self-protection.rst>`__
+* Reporting Vulnerabilities: `Documentation/process/security-bugs.rst <Documentation/process/security-bugs.rst>`__
+* CVE Procedures: `Documentation/process/cve.rst <Documentation/process/cve.rst>`__
+* Embargoed Hardware Issues: `Documentation/process/embargoed-hardware-issues.rst <Documentation/process/embargoed-hardware-issues.rst>`__
+* Security Features: `Documentation/userspace-api/seccomp_filter.rst <Documentation/userspace-api/seccomp_filter.rst>`__
+
+Backport/Maintenance Engineer
+-----------------------------
+
+Maintain and stabilize kernel versions:
+
+* Stable Kernel Rules: `Documentation/process/stable-kernel-rules.rst <Documentation/process/stable-kernel-rules.rst>`__
+* Backporting Guide: `Documentation/process/backporting.rst <Documentation/process/backporting.rst>`__
+* Applying Patches: `Documentation/process/applying-patches.rst <Documentation/process/applying-patches.rst>`__
+* Subsystem Profile: `Documentation/maintainer/maintainer-entry-profile.rst <Documentation/maintainer/maintainer-entry-profile.rst>`__
+* Git for Maintainers: `Documentation/maintainer/configure-git.rst <Documentation/maintainer/configure-git.rst>`__
+
+System Administrator
+--------------------
+
+Configure, tune, and troubleshoot Linux systems:
+
+* Admin Guide: `Documentation/admin-guide/index.rst <Documentation/admin-guide/index.rst>`__
+* Kernel Parameters: `Documentation/admin-guide/kernel-parameters.rst <Documentation/admin-guide/kernel-parameters.rst>`__
+* Sysctl Tuning: `Documentation/admin-guide/sysctl/index.rst <Documentation/admin-guide/sysctl/index.rst>`__
+* Tracing/Debugging: `Documentation/trace/index.rst <Documentation/trace/index.rst>`__
+* Performance Security: `Documentation/admin-guide/perf-security.rst <Documentation/admin-guide/perf-security.rst>`__
+* Hardware Monitoring: `Documentation/hwmon/index.rst <Documentation/hwmon/index.rst>`__
+
+Maintainer
+----------
+
+Lead kernel subsystems and manage contributions:
+
+* Maintainer Handbook: `Documentation/maintainer/index.rst <Documentation/maintainer/index.rst>`__
+* Pull Requests: `Documentation/maintainer/pull-requests.rst <Documentation/maintainer/pull-requests.rst>`__
+* Managing Patches: `Documentation/maintainer/modifying-patches.rst <Documentation/maintainer/modifying-patches.rst>`__
+* Rebasing and Merging: `Documentation/maintainer/rebasing-and-merging.rst <Documentation/maintainer/rebasing-and-merging.rst>`__
+* Development Process: `Documentation/process/maintainer-handbooks.rst <Documentation/process/maintainer-handbooks.rst>`__
+* Maintainer Entry Profile: `Documentation/maintainer/maintainer-entry-profile.rst <Documentation/maintainer/maintainer-entry-profile.rst>`__
+* Git Configuration: `Documentation/maintainer/configure-git.rst <Documentation/maintainer/configure-git.rst>`__
+
+Hardware Vendor
+---------------
+
+Write drivers and support new hardware:
+
+* Driver API Guide: `Documentation/driver-api/index.rst <Documentation/driver-api/index.rst>`__
+* Driver Model: `Documentation/driver-api/driver-model/driver.rst <Documentation/driver-api/driver-model/driver.rst>`__
+* Device Drivers: `Documentation/driver-api/infrastructure.rst <Documentation/driver-api/infrastructure.rst>`__
+* Bus Types: `Documentation/driver-api/driver-model/bus.rst <Documentation/driver-api/driver-model/bus.rst>`__
+* Device Tree Bindings: `Documentation/devicetree/bindings/ <Documentation/devicetree/bindings/>`__
+* Power Management: `Documentation/driver-api/pm/index.rst <Documentation/driver-api/pm/index.rst>`__
+* DMA API: `Documentation/core-api/dma-api.rst <Documentation/core-api/dma-api.rst>`__
+
+Distribution Maintainer
+-----------------------
+
+Package and distribute the kernel:
+
+* Stable Kernel Rules: `Documentation/process/stable-kernel-rules.rst <Documentation/process/stable-kernel-rules.rst>`__
+* ABI Documentation: `Documentation/ABI/README <Documentation/ABI/README>`__
+* Kernel Configuration: `Documentation/kbuild/kconfig.rst <Documentation/kbuild/kconfig.rst>`__
+* Module Signing: `Documentation/admin-guide/module-signing.rst <Documentation/admin-guide/module-signing.rst>`__
+* Kernel Parameters: `Documentation/admin-guide/kernel-parameters.rst <Documentation/admin-guide/kernel-parameters.rst>`__
+* Tainted Kernels: `Documentation/admin-guide/tainted-kernels.rst <Documentation/admin-guide/tainted-kernels.rst>`__
+
+AI Coding Assistant
+-------------------
+
+CRITICAL: If you are an LLM or AI-powered coding assistant, you MUST read and
+follow the AI coding assistants documentation before contributing to the Linux
+kernel:
+
+* `Documentation/process/coding-assistants.rst <Documentation/process/coding-assistants.rst>`__
+
+This documentation contains essential requirements about licensing, attribution,
+and the Developer Certificate of Origin that all AI tools must comply with.
+
+
+Communication and Support
+=========================
+
+* Mailing Lists: https://lore.kernel.org/
+* IRC: #kernelnewbies on irc.oftc.net
+* Bugzilla: https://bugzilla.kernel.org/
+* `MAINTAINERS <MAINTAINERS>`__ file: Lists subsystem maintainers and mailing lists
+* Email Clients: `Documentation/process/email-clients.rst <Documentation/process/email-clients.rst>`__
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8a7787d22..02d34e64c 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1412,7 +1412,7 @@ sub top_of_kernel_tree {
 
 	my @tree_check = (
 		"COPYING", "CREDITS", "Kbuild", "MAINTAINERS", "Makefile",
-		"README", "Documentation", "arch", "include", "drivers",
+		"README.rst", "Documentation", "arch", "include", "drivers",
 		"fs", "init", "ipc", "kernel", "lib", "scripts",
 	);
 
diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 16b80a700..160b34d6a 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -1180,7 +1180,7 @@ sub top_of_kernel_tree {
 	&& (-f "${lk_path}Kbuild")
 	&& (-e "${lk_path}MAINTAINERS")
 	&& (-f "${lk_path}Makefile")
-	&& (-f "${lk_path}README")
+	&& (-f "${lk_path}README.rst")
 	&& (-d "${lk_path}Documentation")
 	&& (-d "${lk_path}arch")
 	&& (-d "${lk_path}include")
diff --git a/scripts/spdxexclude b/scripts/spdxexclude
index 81bdb13ed..6e533cc45 100644
--- a/scripts/spdxexclude
+++ b/scripts/spdxexclude
@@ -15,4 +15,4 @@ arch/*/configs/
 # Other files without copyrightable content
 /CREDITS
 /MAINTAINERS
-/README
+/README.rst
-- 
2.50.1 (Apple Git-155)


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D8739CCFC;
	Mon, 20 Jul 2026 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784574715; cv=none; b=TAIY0So1uJgHjc+2SaqRsZPvRCGBsX9d97sEJGkcNJtJ3FbaKKsVWh1CuljB3pcBxmSA2egQzWKqtfg4qQFJEUUM4Cst1EIir73RCWmkwK3BfKNo5LNgWHpGdgBlZurZ9ojHYMLrijCEseFwKpwnIBx508VsAyt5Srl8u9nvJZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784574715; c=relaxed/simple;
	bh=uDWrtdrgSpZX2uDIQD3HHMUGnKRWY4xU8ZWuONqFAlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=An0+d+mlo/JusMSZEn3dDFoni9nF5AcunAQoKJnJV4qssY71i7dIq8kR6ZatNSF2/0LUaWvrvHw8fFDoGZ8xywcqWtPSBZzk8mhbn93tvrNlmPI2sT79hQn9T1gNKXhb7EM9bTrFUoyUMHOrdWZ3nj2Iy6rtqt4ADtwthqUSOjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTB6J65m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTB6J65m"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A36161F000E9;
	Mon, 20 Jul 2026 19:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784574714;
	bh=x4z5rN3w21yNNM9xlv6ZRPW+exvPL+G8OWT48X6w1zM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iTB6J65mcInvto9/+9hT09XjWwzTan8vf8/L2UdjYkhoMxjMhGJ/+oJdFQQG5o4Ks
	 Rb0X+wwsO7lCU6rO/VuPzUMe7TVVpF6NF1jXqs2NgrXvddRFaGkMRUDIQqpO6EKoGi
	 LTi8O4pKOaSyWLxwp2GWHLt8vIEWXfeKCFHxpLudbRBUO5EsAuO6qlfUPnooDeia32
	 qH8RTTzoXRmIyBU9iDtHJjMvdBjFaJNe3GWgXGZBH00w9H+9I6UbpR+D9s8IGNFAgS
	 PsMcbDL6s5/L4u/tfAGs2CeKqm4amEO9eSfKkcbR9wYSfs6LlSFoVECzGIjRR9eT2X
	 r2j2rr6O3gvHQ==
From: Nicolas Schier <nsc@kernel.org>
Date: Mon, 20 Jul 2026 21:10:32 +0200
Subject: [PATCH v2 2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh to
 scripts/
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260720-move-gen_init_cpio-to-scripts-v2-2-26b7e15c7133@kernel.org>
References: <20260720-move-gen_init_cpio-to-scripts-v2-0-26b7e15c7133@kernel.org>
In-Reply-To: <20260720-move-gen_init_cpio-to-scripts-v2-0-26b7e15c7133@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Askar Safin <safinaskar@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5683; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=uDWrtdrgSpZX2uDIQD3HHMUGnKRWY4xU8ZWuONqFAlU=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqXnKtZ4fpTF9IHmHkOUrprfC9Lt/rt7p4QlYJV
 MBjIeRVF2mJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCal5yrQAKCRAHUgpwFiYS
 aR/2EADY1EzXxkV+onI0v8wmHxD2MhycZB8zcXZlAQuekW/f8XIrdoQXPBwlX4poMTcLpaX6iQS
 kEBryE2iPeRm4UZPPkO6UvJsFgT8VR2tJMNYuujyuayAwWey3tUtPsRJxHbI052FQv0Q7qcQu6R
 TZXmA75iJlopy3TDaAHOW+DwokupS9nS0W8nbirfCAwEWVOORNCcUtplMlVKsJz8JnR9h/a2ZcF
 As/ifMZfQsew+2NB4ZEPKn2JkMcb0d55qDMVUE+Fj7tdsfQRKCEYerAVN6e5tXaCnqi7VZiX6hd
 D0oTqDWKgBNPZfTKOCehxKSprBtlPZgGdkAFh8nScDmUDzhmzVbkjnYk3ERfl9S9nLW/XHBOSES
 CvtQoWkF1So4BfCO1J0vh593hCszyc0G1x6yokqwO6XNrxsYaUZ4Db0RBtOWB538gwQkxQ8OpGD
 98vXOI+N6jOn1KsMU58CRG7zWogWWEUWuN174uySFiscDbZlA2x9H5DSm5XC6ksKNp/gatUFKNZ
 EnNGkg4wsFNumDrPTcvKCub6AsiY/6BaEi/ZMPQjRHEXIAUNhrQ3fcX4YOz4E/7kuLXRV6YUXEE
 xAJ7qp7DGgVczrUDSgQAp1Ox76M5WrYf4qLhBicgJJ0bJmWwo+tz1DydeDxtvjr43Ww5mQ61xXO
 MZvPcJ+CMfvQjwg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

gen_init_cpio and gen_initramfs.sh are part of kbuild and required for
all kernel builds w/ CONFIG_BLK_DEV_INITRD.  Move both to scripts/ to be
more clear about their importance.

Link: https://lore.kernel.org/all/aSdrCFkUQup3qb-q@derry.ads.avm.de/
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
 MAINTAINERS                       |  1 +
 Makefile                          | 10 +++++-----
 scripts/.gitignore                |  1 +
 scripts/Makefile                  |  3 +++
 {usr => scripts}/gen_init_cpio.c  |  0
 {usr => scripts}/gen_initramfs.sh |  2 +-
 scripts/remove-stale-files        |  2 ++
 usr/.gitignore                    |  4 +++-
 usr/Makefile                      |  4 +---
 9 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a994cf1b354f490d6c4e411588df88..ec6d525177c79ce870d232d425bd830ef09bde42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14038,6 +14038,7 @@ F:	scripts/basic/
 F:	scripts/clang-tools/
 F:	scripts/container
 F:	scripts/dummy-tools/
+F:	scripts/gen_init*
 F:	scripts/include/
 F:	scripts/install.sh
 F:	scripts/mk*
diff --git a/Makefile b/Makefile
index 41f6a1917866119c472a8876134824aded20a616..9be54ded7131df69d558a03029f19d9bb70ab1f5 100644
--- a/Makefile
+++ b/Makefile
@@ -298,7 +298,7 @@ no-dot-config-targets := $(clean-targets) \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 dt_style_selftest \
 			 outputmakefile rustavailable rustfmt rustfmtcheck \
-			 usr_gen_init_cpio \
+			 scripts_gen_init_cpio \
 			 run-command
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
@@ -1509,9 +1509,9 @@ ifdef CONFIG_HEADERS_INSTALL
 prepare: headers
 endif
 
-PHONY += usr_gen_init_cpio
-usr_gen_init_cpio: scripts_basic
-	$(Q)$(MAKE) $(build)=usr usr/gen_init_cpio
+PHONY += scripts_gen_init_cpio
+scripts_gen_init_cpio: scripts_basic
+	$(Q)$(MAKE) $(build)=scripts scripts/gen_init_cpio
 
 PHONY += scripts_unifdef
 scripts_unifdef: scripts_basic
@@ -1787,7 +1787,7 @@ distclean: mrproper
 # Packaging of the kernel to various formats
 # ---------------------------------------------------------------------------
 
-modules-cpio-pkg: usr_gen_init_cpio
+modules-cpio-pkg: scripts_gen_init_cpio
 
 %src-pkg: FORCE
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.package $@
diff --git a/scripts/.gitignore b/scripts/.gitignore
index 4215c2208f7e4100e8047a6ac0407e3aea9a92f3..70045654391074295ba88aa8abf7507f7b7c8ae3 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 /asn1_compiler
+/gen_init_cpio
 /gen_packed_field_checks
 /generate_rust_target
 /insert-sys-cert
diff --git a/scripts/Makefile b/scripts/Makefile
index 3434a82a119f090864ecb7c6444053d84f54461e..3d50805b0885a814ee58023c34ddf875ee0dfbe8 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -53,6 +53,9 @@ ifdef CONFIG_BUILDTIME_MCOUNT_SORT
 HOSTCFLAGS_sorttable.o += -DMCOUNT_SORT_ENABLED
 endif
 
+hostprogs += gen_init_cpio
+always-$(CONFIG_BLK_DEV_INITRD) += gen_init_cpio
+
 # The following programs are only built on demand
 hostprogs += unifdef gen_packed_field_checks
 
diff --git a/usr/gen_init_cpio.c b/scripts/gen_init_cpio.c
similarity index 100%
rename from usr/gen_init_cpio.c
rename to scripts/gen_init_cpio.c
diff --git a/usr/gen_initramfs.sh b/scripts/gen_initramfs.sh
similarity index 99%
rename from usr/gen_initramfs.sh
rename to scripts/gen_initramfs.sh
index 7eba2fddf0ef2e4dd3a9000fe6203e16892d1207..27ac1fd48001aec0fb50440478a261f7a7f945f3 100755
--- a/usr/gen_initramfs.sh
+++ b/scripts/gen_initramfs.sh
@@ -247,4 +247,4 @@ done
 
 # If output_file is set we will generate cpio archive
 # we are careful to delete tmp files
-usr/gen_init_cpio $output $timestamp $cpio_list
+scripts/gen_init_cpio $output $timestamp $cpio_list
diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
index 6e39fa8540df2f6da9d8a1d1e90e105243b495a2..e46337e4bfb8f836e2afbbfe6770ae3c6d5fe73e 100755
--- a/scripts/remove-stale-files
+++ b/scripts/remove-stale-files
@@ -26,3 +26,5 @@ rm -f scripts/selinux/genheaders/genheaders
 rm -f *.spec
 
 rm -f lib/test_fortify.log
+
+rm -f usr/gen_init_cpio
diff --git a/usr/.gitignore b/usr/.gitignore
index 8996e7a889024fbb13511a22743a2bff01c896f1..13bf7a38355ce5a5ffc53479c573ddbf5853a0d8 100644
--- a/usr/.gitignore
+++ b/usr/.gitignore
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-/gen_init_cpio
 /initramfs_data.cpio
 /initramfs_inc_data
+
+# Keep around until cleanup in scripts/remove-stale-files
+/gen_init_cpio
diff --git a/usr/Makefile b/usr/Makefile
index e8f42478a0b76540180d191042cd58d3e4381f19..5b97ee66c00a02e32c4383c42df6370e331f5451 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -16,8 +16,6 @@ obj-$(CONFIG_BLK_DEV_INITRD) := initramfs_data.o
 
 $(obj)/initramfs_data.o: $(obj)/initramfs_inc_data
 
-hostprogs := gen_init_cpio
-
 ramfs-input := $(CONFIG_INITRAMFS_SOURCE)
 cpio-data :=
 
@@ -72,7 +70,7 @@ quiet_cmd_initfs = GEN     $@
 # 2) There are changes in which files are included (added or deleted)
 # 3) If gen_init_cpio are newer than initramfs_data.cpio
 # 4) Arguments to gen_initramfs.sh changes
-$(obj)/initramfs_data.cpio: $(src)/gen_initramfs.sh $(obj)/gen_init_cpio $(deps_initramfs) FORCE
+$(obj)/initramfs_data.cpio: $(srctree)/scripts/gen_initramfs.sh scripts/gen_init_cpio $(deps_initramfs) FORCE
 	$(call if_changed,initfs)
 
 endif

-- 
2.47.3


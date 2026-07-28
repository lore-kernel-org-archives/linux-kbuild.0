Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C8018CC13;
	Tue, 28 Jul 2026 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.248.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249181; cv=none; b=a1giuTUcb8Z5FW5OExSASSbDvDbKwIJzzA9EwTPg8xMNh8VXYvOwLotC1QMEFHTWwjv2/8+5mnJJIRY+ScBBUrAiYwrfT/XuHUtZzz01DbX422Sr0reJy5NSURcFp5vBcOmEgNuG/poiB/5m/BFvzyrqDXwLgpDSOu/1R3KursQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249181; c=relaxed/simple;
	bh=LzLkYCuMohN+wvYyXlqkTBqCEgV/mEe1aZZT1UFpSKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uY2fAEWTjwlScMrxd0DthT36ve/KieacJjrVGc6aHze3DBTGfTd8l/yGW153GqYr9xB3JrukPoEN6bV3l2xPl8JPms2Uy4y6zyLrOvMMsJxsYwyOg30dwpWQUt7u40Kcr/SOfAf25dRDjjo3aZpC69VJG3X3NJ0ytGs488bojZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=WCiphDSz; arc=none smtp.client-ip=159.100.248.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="WCiphDSz"
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.155])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 2A3952651F;
	Tue, 28 Jul 2026 14:32:52 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id D243A201CE;
	Tue, 28 Jul 2026 14:32:43 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id F03174007A;
	Tue, 28 Jul 2026 14:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1785249161; bh=LzLkYCuMohN+wvYyXlqkTBqCEgV/mEe1aZZT1UFpSKc=;
	h=From:To:Cc:Subject:Date:From;
	b=WCiphDSz4v809jVN0mRlSif6+TyWZCn85pbqgwXOVssHWqeeIV8w8+Hm5q0c1a7E8
	 5CTSqJaDhdZRROvO7pIBCQ1mhQBhRI3xAk10SA/tmjz9/a5Qjs5U3R/9FaTe33G/lS
	 ZEVcRruYZSkA7f/+KHVllzaq5Gzm3MYJQ9HWOMD0=
Received: from JellyCambarellus.localdomain (unknown [216.236.40.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 1881840C06;
	Tue, 28 Jul 2026 14:32:24 +0000 (UTC)
From: Mingcong Bai <jeffbai@aosc.io>
To: linux-kernel@vger.kernel.org
Cc: Kexy Biscuit <kexybiscuit@aosc.io>,
	Xi Ruoyao <xry111@xry111.site>,
	Mingcong Bai <jeffbai@aosc.io>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	David Sterba <dsterba@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jan Stancek <jstancek@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Simon Glass <sjg@chromium.org>,
	Marco Elver <elver@google.com>,
	linux-kbuild@vger.kernel.org
Subject: [RFC PATCH] x86/boot: use zstd -19 if building for 32-bit
Date: Tue, 28 Jul 2026 22:31:35 +0800
Message-ID: <20260728143141.2870515-1-jeffbai@aosc.io>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.20 / 10.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.10)[aosc.io:s=default];
	R_SPF_ALLOW(-0.10)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	LOCAL_OUTBOUND(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DMARC_POLICY_ALLOW(0.00)[aosc.io,quarantine];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[aosc.io:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Queue-Id: F03174007A
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Action: no action

When using native build environments (that is, 32-bit x86 chroot/container
as build environment for 32-bit x86 binaries), `zstd -22' requests more
virtual memory than that could be allowed on 32-bit hosts.

Introduce `cmd_zstd_with_size' for CONFIG_X86_32 builds.

This is quite possibly just stupid... But there doesn't seem to be a way
to detect the host environment. So I'm sending this patch as a means to
ask for your opinions.

Any help would be greated appreciated.

Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
---
 arch/x86/boot/compressed/Makefile | 5 +++++
 scripts/Makefile.lib              | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 07e0e64b9a98..2261fb0d4d1d 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -143,8 +143,13 @@ $(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lzo_with_size)
 $(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lz4_with_size)
+ifdef CONFIG_X86_32
+$(obj)/vmlinux.bin.zst: $(vmlinux.bin.all-y) FORCE
+	$(call if_changed,zstd_with_size)
+else
 $(obj)/vmlinux.bin.zst: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,zstd22_with_size)
+endif
 
 suffix-$(CONFIG_KERNEL_GZIP)	:= gz
 suffix-$(CONFIG_KERNEL_BZIP2)	:= bz2
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0718e39cedda..09910dc57af3 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -464,6 +464,9 @@ quiet_cmd_xzmisc = XZMISC  $@
 quiet_cmd_zstd = ZSTD    $@
       cmd_zstd = cat $(real-prereqs) | $(ZSTD) -19 > $@
 
+quiet_cmd_zstd = ZSTD    $@
+      cmd_zstd_with_size = { cat $(real-prereqs) | $(ZSTD) -19; $(size_append); } > $@
+
 quiet_cmd_zstd22 = ZSTD22  $@
       cmd_zstd22 = cat $(real-prereqs) | $(ZSTD) -22 --ultra > $@
 
-- 
2.55.0


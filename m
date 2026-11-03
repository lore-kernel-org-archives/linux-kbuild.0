Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718534;
	b=3aY6dIFW3yzY5w5iHC9nX1EDyctJ+XkH5wdcybywaH/GgSsBxf4fxz7oJZA49yrTPPAW
	 yNzbDQZZ5SxCxqx2x0+CdgYeKEn+plJqKOP/q02FxBkgmxloa/9BSpaicdHr1ZxAMf2HA
	 lMRuXK64+aaDQMBEFimWGzfhBPdoiZPC/VE52JojPjM9qvuA7qajFgkgLHip16QjkHkWD
	 lhmQZacCQ4Ap2Jzs275ZY+CP6P1fo9Wh+rnuE1MPG3KIy4skIsJRKkR6aUBiXQKfj73kJ
	 pF/rF8BJNXWfxRBzpz753zqMGedIL9cuk9p0YbUQamtFpl+YZZ/uxIyDIaPhr4sl3Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TYS9NFes0pX3u5RGLOyKL2oHpVaqbTMJYMFIjZ8YRdw=;
	b=oeN4gMkjywQK6mcLNwtDGS1UQwQTQz7ZfFd81UqAtaNPcYSigggp3vSPl+T6jLGXCRpQ
	 FTgsKbQckZgOHOVTVatCpRdq/bBUQBeBTwQqAR4aNMQQoiZ9uNdirqauKsxRbgDlXL7zg
	 eDVAUHMrTD1VXrH0AenXuLYHnh0AB6a03Mn0GI7pffDKkCu2zXgoJfsDupYFuD1Xq5v1X
	 sTIM6qKQlQtkcuQIbDHsPwZfPEZMYXfFakh8c4nmkTeZliOp+aTbSuv9wiLKHV5UHmSC0
	 bP4EAryu4a2Zb/a5rUDJU4KqprdBn2CheQdOoDjTUhbbBmyjbD6sLnjJD7YgaIRHxdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWtI4kiT;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA0E606FCC8
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 15:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA0E606FCC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWtI4kiT
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-47b47de8b4cso2363634fac.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2026 07:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718533; x=1794323333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYS9NFes0pX3u5RGLOyKL2oHpVaqbTMJYMFIjZ8YRdw=;
        b=rWtI4kiTGNoXT1C1bcQXiqVVGk33DsXyXg55gK/LPhNvgn/rJxJKGg6NSiEm5XEdUz
         b4bbFzR1k6G/LhvCBDODi+6ji9CApnN8bT9czaNaGOD8daFTcafGnghXbEHJYwINixdV
         ZKsZlDQ6Qh1r1hnNhzKhJlYRm1E6/ZJD6GUqVzUHjjfrlqTzSP++28bIb6Ju2LnxdWA8
         Vf/zzz+cRLbe19vXNecUM8yh9Y7fWhUU1PIbg+C6VeYq4akTz+eQ6H8Pl1rqKfrYN/fU
         loukcK2AF3waKQG34iJRYRjSBHoeALxeQbSmQqui4kVS+Px4/OQGr23vUKuEouefi2l6
         lP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718533; x=1794323333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYS9NFes0pX3u5RGLOyKL2oHpVaqbTMJYMFIjZ8YRdw=;
        b=RF0e25GnwbFPWp+h1yXCsMTvs5jld1X0JqpTKu2/+ElPiYrgRlYU0TRD1P2eMJJFMO
         kwsqoQYuJIdpQJShZo2s6TUZ+BZbNdlXVBoAHnLM1AGAxBkNrNfUuEoLW3wCgC1gYr2Y
         1ga27JnSP5jwoPt6+IJZA45J040WHbofp1aRpBdq/mHT0xyW+tm5pjoNFxGazdaa0V0C
         qUU4/FdGLwpbcZcRnnjBK8vQ5ZxFsXMvlHT6DvnCxA1nP9fxuagg6lJdujBgZL7zzkri
         9S07ajSAr+uQ6ddgMJRb47SqXvGETg3FOMqdleKf8nuStQQ0UU0o9FLxawEdDewh65Yz
         ISJg==
X-Forwarded-Encrypted: i=1; AKwUvByFyE4cxxhWJw+Z2LgLGCAeqvU4eLUVaKLvwQlRX8sqQNz9FRy3b9LJm90EkCl0FJVAsEkKnEE1fiHtz3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ENM3KeRmUnJd5g4Kmk03gQ4sodjSrjiuoUEwWr355DIjxH/bk
	YFI3JpiewDKQaesp9Fn9zphzL7uEDBgh185FULKKdGBLqGNo06bHlHz9
X-Gm-Gg: AYBFou1vlsh2hJAcViI4vQijaLwg6WAJ/2V+77CO4wSvE7055E44RXaeFhIM6SqY5JJ
	3FEh1LaITbFnZCwkxEJI4oZCGp0MS4l4YcIQTLHmKqu3IDYXzSd0GsasGiEUvYWJ02WX0XAWiw9
	+7IDtgxyoy3FzXNvD8rUWkNDTT/ZA66aNlmtqsw5ljnZ0083z7b3Vx+hp3/hZzIDWr1opFQBIlS
	Rpw2aL/NMe1xaUu5F91ljPXujb2mM3hreZivt5Un5WEJ5N7Irle0O1dzhHqGpnUtOiv5kJi7juF
	JHJ5V+tsLBfvX093RH6NvpB7GSqr5iwevMslxOWqYYUxxknr4QeLBM4ZRpMm5SNT6fSRdDCn09v
	LtECfjZTzxcM61NJ/TK3f4XKuiBLpzntG9f5LQrljEfv/3ImQkIeAPnsK/yyxca+/2+ytggngQ/
	SRysQMS72xzMEKZ76Z/WNkBDHZIs4gvxoVX1gVS3PHh+zWFcTxvQZH44Du6weRxqbzRHORCqdt1
	30liVfKjI6Qy1wDPoloR78Bmgvae2Uqc8ME6JTD7qCMvXTFI6tY1i7PT+d6YO6OGKntvsP0SAZK
	KOy7Ds5hcFBaYH5gUsvDE70NR0IK7a1UFku+Fw==
X-Received: by 2002:a05:6870:7a18:b0:4a6:f698:df8f with SMTP id 586e51a60fabf-4a907781260mr8302880fac.42.1793718533281;
        Tue, 03 Nov 2026 07:08:53 -0800 (PST)
Received: from penguin.lxd ([2605:3f84:842:3300:216:3eff:fe58:9322])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a95d970b9bsm4730448fac.8.2026.11.03.07.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:08:51 -0800 (PST)
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
Subject: [PATCH] Documentation: kcov: clarify coverage example
Date: Tue,  3 Nov 2026 09:08:42 -0600
Message-Id: <20261103150845.13008-2-matthew.l.weber@gmail.com>
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

Clarify that the saved count bounds the printed entries while KCOV
remains enabled, including during output. The examples continue to disable
KCOV after printing, as before.

Document the KCOV configuration requirements and how to symbolize
collected PCs.

Signed-off-by: Matthew Weber <matthew.l.weber@gmail.com>
---
 Documentation/dev-tools/kcov.rst | 44 +++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
index 8127849d4..0c3099c06 100644
--- a/Documentation/dev-tools/kcov.rst
+++ b/Documentation/dev-tools/kcov.rst
@@ -31,6 +31,15 @@ Collecting comparison operands is supported with GCC 8+ or with Clang.
 To enable KCOV, configure the kernel with::
 
         CONFIG_KCOV=y
+        CONFIG_DEBUG_FS=y
+
+``CONFIG_KCOV_INSTRUMENT_ALL=y`` (the default) instruments eligible kernel
+code throughout the build. If it is disabled, only explicitly selected code
+is instrumented.
+
+To resolve collected PCs to source locations, also build with debug information
+(``CONFIG_DEBUG_INFO=y``) and retain the matching ``vmlinux``. Debug information
+is not required for collection itself.
 
 To enable comparison operands collection, set::
 
@@ -94,7 +103,7 @@ single syscall from within a test program:
 	__atomic_store_n(&cover[0], 0, __ATOMIC_RELAXED);
 	/* Call the target syscall call. */
 	read(-1, NULL, 0);
-	/* Read number of PCs collected. */
+	/* Save the output count; KCOV continues recording until disabled. */
 	n = __atomic_load_n(&cover[0], __ATOMIC_RELAXED);
 	for (i = 0; i < n; i++)
 		printf("0x%lx\n", cover[i + 1]);
@@ -111,7 +120,36 @@ single syscall from within a test program:
 	return 0;
     }
 
-After piping through ``addr2line`` the output of the program looks as follows::
+In PC mode, the first ``unsigned long`` holds the count and the remaining
+``COVER_SIZE - 1`` slots hold PCs. KCOV stops adding entries when the buffer
+is full, so increase the buffer or shorten the collection window if the count
+reaches it. An empty buffer can indicate that the target path was not
+instrumented; it is not proof that no kernel code ran.
+
+The count is read while KCOV is enabled and sets the number of entries printed.
+KCOV remains enabled while those entries are printed, so the output syscalls
+may add entries to the buffer. They are not included in the printed list,
+because the loop is bounded by the saved count. Syscall entry/return paths
+around the target can also appear.
+
+Symbolizing PCs
+~~~~~~~~~~~~~~~
+
+Save the example as ``kcov-example.c``, compile it for the target, and run it
+where debugfs is mounted and accessible::
+
+    cc -O2 -o kcov-example kcov-example.c
+    sudo ./kcov-example > kcov-pcs.txt
+    addr2line -f -i -e /path/to/matching/vmlinux < kcov-pcs.txt > kcov-symbols.txt
+
+For a cross-built target, use the matching toolchain's compiler and
+``addr2line`` (for example ``aarch64-linux-gnu-addr2line``). Use the exact build's
+debug ELF, not another build's ``vmlinux``. KCOV subtracts the kernel's KASLR
+offset on architectures that support it; do not apply an assumed relocation
+adjustment. Instrumented modules need their own debug ELF and load-address
+handling rather than symbolization against ``vmlinux``.
+
+The output can look as follows::
 
     SyS_read
     fs/read_write.c:562
@@ -184,7 +222,7 @@ Comparison operands collection is similar to coverage collection:
 		perror("ioctl"), exit(1);
 	__atomic_store_n(&cover[0], 0, __ATOMIC_RELAXED);
 	read(-1, NULL, 0);
-	/* Read number of comparisons collected. */
+	/* Save the output count, as in PC mode. */
 	n = __atomic_load_n(&cover[0], __ATOMIC_RELAXED);
 	for (i = 0; i < n; i++) {
 		uint64_t ip;
-- 
2.39.5


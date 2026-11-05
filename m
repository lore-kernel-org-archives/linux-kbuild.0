Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842714;
	b=DJolvKYfbcWgqW/Eq2K2NZZN9GtT2DIbp8BVM0KuehrJoDs+FR16e1k7GkoMggOyUqBL
	 oDwqBBY4AI4yXI7X3cHhRgzHFXSu+dRUj4XDKPHD3ptQDYfOBdv7MbwDqpUqnjcfK0/6L
	 5Xb34KdWn7G6D3v0WRTXrnqhhG/2b8Td/aT1lE9BxXVllfTy2rfSaF4qh/YM1gr+vE7gI
	 FaE1qN0mQlhjafThCzmuShWOyAPz0/kAJngCQXgr0069sKFNWLfvavIrz8em0QwiSYnr6
	 +zBKRi9tXf0ksSqe3XO9a6QcbHg6r1fun2qXqfY26rcEcSwM/n+OU3tcj7Mo9MQ3BhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TYS9NFes0pX3u5RGLOyKL2oHpVaqbTMJYMFIjZ8YRdw=;
	b=uUF6oM9e+3cQ9aXODnj1jKYIBB5W7OD77YeAFVGtYn4kIfNevg8BBY2UoL3gMpWw5wNW
	 fzi4u72xekzlhW98qfsbtS4d6Tek+GcG5S9ayzkJ99iv1Sj/0P8rEfIpzwNQNjMYQn8dd
	 sbI7T9ZgqiU2z+W9+yhcs5byOL75/36ozkvJnH8dYC9tckr2W/j7426ObWYUI7a1Yva/q
	 QTcFAqAQ0p57JYddYYehDggZqf8dgH+iBAM73Fy43eGFaO91VkaV1rDXOJITxQ/9yuxeq
	 OG4oSbIKwUIN19yZegXLiBVly76c4bCpcM0833u1fftC6oPTeHebBAffli5RtUQlV8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJAfSQhw;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97CA606A31B
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 01:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D97CA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJAfSQhw
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc751eddf25so813372a12.3
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Nov 2026 17:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793842713; x=1794447513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYS9NFes0pX3u5RGLOyKL2oHpVaqbTMJYMFIjZ8YRdw=;
        b=rJAfSQhwGfz9QaIyxt24TLwNJgE9KzlaG0i7Y9s8cMSvfN9GNqx8piEbi5DrzkExG3
         v4AA0Tn0pweD9qM3a6XtyP+E3AK/ZNtXvuUfQC4Dt+R1/CZYppKElmBQRYeR/wZjat4e
         S/kGsbsxNbjiEA489HGJdUsbpWhBW+s01Jvm+guE9Tx1iJT0tdtCdZSJAnEJLVoS3Kg4
         DV4ot8sFz9RRo/29OX2roqh0l3AI+93LK72rF5142YHrJU7wFTOBiE32uQ9PwrtePDRC
         G7Fvm0OikX73+8jStqjkQLJ1eShQRUapNNHoXT9dNOOmVgTVbAJdBw0K329b0YEH1Hl5
         K3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793842713; x=1794447513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYS9NFes0pX3u5RGLOyKL2oHpVaqbTMJYMFIjZ8YRdw=;
        b=GVpfapAbdrvMgoxXJVfb7m25+rDF/QWwNFGLLzGB0YcxKg4WQfqDhIi8MShXrId3yg
         4ShaDyLU6DCAcLKeeP6RYoK+eOwGO0US+5v/4nhp/cE1w6hK2OZbcjFOol6fIYM76dS7
         3LOSH80qrzuMVA16fFNIUdelME1eg+pQoKrB3ErFKAuFm1SIclCzdCcbDpOMEzz5XsAb
         hgkv4dfPBrwlUQvUjVCQtpHUN4KZKFTDucGxiLmihHp0zOWXwWhMQueLvVEDIrd2nccT
         /5ua7lp6bbgswXczw05pnNiRjPvp1/osO/VsgnHcTJ5MBuPTOeLIFurZq7+e679lBLYQ
         wLqA==
X-Forwarded-Encrypted: i=1; AKwUvBwo+mqSwAHPV5zAmLWVh5UQZYvP1dAwZZSJGGRFbQBcsrJvh30i6zheYLuDHjA/VNd7kJLtMpgIfbfAp1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZuDv+V2m3GK1hyQeAlBfiKLj+X+LD1b3jDKgwSLfor9b3tOes
	XkAEZS1YAvawyrE5u1BmMwUbtZUG8F14TI0zPI8sDVZ2apoYB8K7N6uG
X-Gm-Gg: AYBFou3QEttX4NSSg5lCn6Ti3uO+jL2JVmmgSrXBxpYAplBdjhwXeRX0s7ZlX4LkXi4
	QaN6kH935GRJvbcXC4sPZtgDyaxL68UGVha7iIhafIFvLDVZibvJ6SJA4ivOxrSmTlLstGTBs27
	7oqQxxfTn/f97pEMR5MrenQmmPhkehhRp1yn7AKCuQ4fnqC8r2Z8Tik2lrUeNmG4kK4bhEvHBJ9
	4DCzjk0Z7myMLelUuzrfkwr9W1+fh56Q6t2MrDox4vWkKBXfJgXxqWzCSE7ZgiHtpv9oy3Ldue3
	itXKJn43/ji605ZhrthxrlUjldnAzMPN85Ct+PoANW/bK4AfuKAvi+KUSUwsLWuk9dlCArJrPGY
	Jj0nrd4VsdrL1uA9GFA0Ob69D0RE0PguKxdIjM88vFE7bDy2OqgnlpG0338jSKXupDKp51tKCbw
	O27LNal9ej0WPd5/eq05cKxueEfhQa4Gp8SaGcI5Rg14O2eriSyxQnquwnLmOr4/KssOCbdyCEg
	S7XEJHf8RNBUcXsBQW7/XASHA7YypoGDC0hh3YF0P0HHIwq735n8GYhrdbJsfKFnbmfAb/Fge7z
	PDfTuALyIBPzBSqlt5loYGT1ounqR2GBlheap4Lt0D0EenD5ZOBSjf45Cw==
X-Received: by 2002:a17:90b:17cd:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3ae8987a7bfmr15048640a91.65.1793842713202;
        Wed, 04 Nov 2026 17:38:33 -0800 (PST)
Received: from penguin.lxd ([67.223.127.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31d2b5esm1164975a91.15.2026.11.04.17.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:38:32 -0800 (PST)
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
Subject: [PATCH v2 1/4] Documentation: kcov: clarify coverage example
Date: Wed,  4 Nov 2026 19:38:20 -0600
Message-Id: <20261105013823.29741-2-matthew.l.weber@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261105013823.29741-1-matthew.l.weber@gmail.com>
References: <20261105013823.29741-1-matthew.l.weber@gmail.com>
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


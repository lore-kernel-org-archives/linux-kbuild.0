Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3203403EE
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 03:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789876744; cv=none; b=aUNg3WUlkVy0HR8NH76nqireb5xAV7YedBJ9TEJByA1cU/PnA5JoK/psa+3bdl8TYHIVjDee6f2LJgiCGYJC/5INLRzqMFP9ioo7DLGoQWY0ithMwNFus6bArgx7lKViYak6tSPV8T2Z/dupp2MKMK2GBOe242UoMuYZfTsWKFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789876744; c=relaxed/simple;
	bh=wgFd2Zz+xKm64GymnW2JCvzeHg8b5PxpVVpLtQi5Dlg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oMSaBYW1LLnVnzDkCoYDiK5TX0Oczm8H0WZWXDXwOPGiJFoeeLdvBFs6XFxLSv82vS5y8c6s4sWbeXS4ksYoBAsWk+h+IUB2H/lQBN1ykp7X+ZwRZYhOex+yPZUTdEcHD9lQtF3kv+zuQ2vdPj+Vm0RMI85ll9WGXJZTcrbnJOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZiD/6is6; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiD/6is6"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-46ad7304688so2508165fac.0
        for <linux-kbuild@vger.kernel.org>; Sat, 19 Sep 2026 20:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789876742; x=1790481542; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aXJkwlv7hWWcnEH9eUVa3N38OqXdJ3otZXtuqM7meAU=;
        b=ZiD/6is6eXPONxGMac9QaTAXS6SF8z/R2etpuDI24dezKCSyCrLSj34hcbmS+Hq6Fs
         O3q9OgXO4fR14aOg66g8Fx4F6QkJZkx764/VKY7tp6l0Z8Yu+ufQuEqY24+6AbagO/cN
         mAparFYgPF5sqTCwbbb3TTG/lQsHdrKtIfp1OPrxdrXJcmolWPeAdjxyHPo/5pX2qXxz
         gG2r29hHK5Hk8BCaCybeggPoOqrvTMsivS6RAYhqZ+U88Giyet1WNT34lhrEneZFPOcq
         npNnSW0I1is34JgN39bH9buDlGgzwCOTiAVHMoZn5cIjdY9TFC5xU4T3WHr2O82NLiM/
         o2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789876742; x=1790481542;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aXJkwlv7hWWcnEH9eUVa3N38OqXdJ3otZXtuqM7meAU=;
        b=QjU7edV5Qcy+8Y2MlikuwS9qbkU31ED2hWKbqhHvTPDVx44lFhlq1TLUZjBPH1Qqgz
         RjqdZRSEWUNVFsVTyfSjT6g73JAH96YjJd8vqlaFFrTSdmNbWpJTM8Th6zloqtK8LG7E
         mFlpQfR0Jv7aHOzn+hYiLi7oEQRP0Mj0g9ZjNFiCDZStAJjc0wgFplPnxtEnhjCnMAuS
         35X5eWoSY3/AA0m+KeFMPr5ur6xWGWbGVtLNE2dNz5Ng15djFyrpAqnBn+C1fACEsDFR
         VWhlRZbYdc/XNVecq+9CsyBNGGrxRwunszf83yH7GueFu8Jqork+WZGQ0i56VOLnwSLL
         eXyQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7xcLnbCNLsKnzX4pHMARPboVR31lN+GGI/fxQ/K7BBsafmruizzLdNQ1x/ap7MA0xZu8wfsVOVJaF5OA=@vger.kernel.org
X-Gm-Message-State: AFuF++n7ciXV5wMwn/nBK9plpNbCM+mLCIb6I2vUoDa/8yyM81UI2X4R
	82HvZCJg4/thuaJ7kBVRTEklsZHF6DEUkDmZQo5zoRCOfpJQfF2JyXe3oXXFqw==
X-Gm-Gg: AYBFou1kHM0DYId4QepaTkpSY76ViZfjgBVkVxRtdyOBdcRz2Ppfqkklm6XNIbYs2Y/
	3dkN3p+mzZpXCLXr+69B990ZM3UId03ULKXYNlEpdcok0NDNh8Ug8wBF6JK/t28qcs9qmkYQVrm
	OtQ1X0xcq0yVwjFzXAamAZeZCLjD7uVT79FTZLoPJCH1bYQxXB6t/Qf4hdk2RF2YTt4z5Xm2PgF
	2GVoTTDKHAnTPwhKgN9j6mY28FbLgE6ZVPEvDPX/8g/rHfjtAUR/VO1RFjuBbByTDPk1rX1baO8
	RZ2iAN5IPIuH+9e8I/0nFJMvr3V7o7UY11OXmLdfBcOQoOD+mqqkue7sjB4DNdmw4TBCuMLyt6k
	Mw/u/KAUOoQCo/tMz+8nH5jTraMnFgoWKrXANrILlf/5a++GxPk0sOhUJX+u2spaoMNoUb//JOu
	jRwqkTowiSbqylnhoxWIKHrIHmtxtqSL/hyLW90CUcy7egTwFCDjHt1qJkTMrxk8hHtm/fFH77x
	yR/UV0s2tMBD6dvCBuz5lrqps7wIyqGAvc+pnhDZc5SSwFtPsjPLHKVSoOUzV6JGTmiKJzPg5R8
	k2KRSKNo8/EUg7VdNes=
X-Received: by 2002:a05:6870:b204:b0:45f:10:f963 with SMTP id 586e51a60fabf-4856d859a0fmr9618764fac.12.1789876741979;
        Sat, 19 Sep 2026 20:59:01 -0700 (PDT)
Received: from [192.168.0.197] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm4146915fac.1.2026.09.19.20.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 20:59:01 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 0/3] kallsyms: Accelerate symbol name lookups by ~19x
Date: Sat, 19 Sep 2026 21:58:54 -0600
Message-Id: <20260919-ksyms-tune-v1-0-d85c97da1a32@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0NL3eziytxi3ZLSvFTdVCOjRBOjFItEY8NEJaCGgqLUtMwKsGHRsbW
 1AJz3MXJcAAAA
X-Change-ID: 20260919-ksyms-tune-e22a42d8a31a
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789876740; l=4966;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=wgFd2Zz+xKm64GymnW2JCvzeHg8b5PxpVVpLtQi5Dlg=;
 b=oHZoFLwvd+Sj5pgJiQrLiZSc2e22fqEaMxNJzN+isjFkRV3jdfdJCh+0zI1psXaUTJSyOMxMJ
 YM2euqQxALZCCHoC0OsmzaR5Qitkou7OdokmlfzpcGV4jkRtI8PU9+6
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

kallsyms_lookup_names() resolves symbol names to addresses using a
17-step binary search over kallsyms_names[] (~191k symbols on x86_64).
At each step of the search, two bottlenecks compound to create
substantial lookup latency:

0. Marker scanning: get_symbol_offset() scans sequentially from the
   nearest 256-symbol marker, decoding an average of ~128 ULEB128 record
   headers per probe (~2,176 header decodes per lookup).

1. Redundant string expansion: kallsyms_expand_symbol() decompresses
   the entire candidate symbol into a 512-byte stack buffer (namebuf)
   before calling strcmp(), even though ~94% of binary search probes
   mismatch on the first 1-2 characters.

Together, these bottlenecks impose a ~4.3 us latency penalty per hit and
~3.8 us per miss.

This 3-patch series eliminates both overheads while keeping the symbol
table strictly in sequential address order:

0. Patch 1 adds lib/test_kallsyms_perf.ko, a microbenchmark module to
   measure name hits, name misses, sprint_symbol(), and table iteration
   latency, with built-in correctness validation and a sysfs trigger.

1. Patch 2 introduces kallsyms_names_offsets, a build-time 3-byte direct
   index into kallsyms_names[].  This turns get_symbol_offset() into an
   O(1) table lookup, dropping the ~2,176 marker hops per lookup and
   eliminating the legacy kallsyms_markers[] table.

2. Patch 3 introduces kallsyms_strcmp_symbol() to compare ASCII queries
   against compressed tokens incrementally on the fly, bailing out on
   the first mismatched character without expanding subsequent tokens.
   This drops the 512-byte namebuf buffer from the kernel stack.

Context & Lineage:

This series was originally developed and benchmarked on mainline (v7.3-rc3).
To ensure compatibility with Lorenzo Stoakes' kbuild speedup series (v3),
it has been rebased on top of commit c1c0fd58e281 ("kbuild: compress the
kernel with pigz if available").

Rebasing required only a trivial mechanical fix in scripts/kallsyms.c to
align Patch 2 ("Add 3-byte index into compressed symbols") with Lorenzo's
direct binary streaming path (write_incbin).

Glomming onto Lorenzo's build-time acceleration push extends the speedup
theme into runtime: his series speeds up the compile and link, and this
series speeds up runtime symbol lookups by ~18x.

Live Microbenchmark Results (via test_kallsyms_perf, 100k iters):

Metric                    Baseline      Patched       Speedup
-----------------------------------------------------------------
Name Search Hit           4,370 ns      247 ns        17.7x
Name Search Miss          3,860 ns      195 ns        19.8x
sprint_symbol               440 ns      441 ns        parity
sprint_symbol_no_offset     315 ns      307 ns        parity
Table Full Walk           14,500 us   14,437 us       parity

Address-to-name resolution (sprint_symbol) and sequential table walks
(/proc/kallsyms) remain completely unaffected, maintaining full L1/L2
hardware prefetching.

Hardware PMU Event Counters (perf stat via sysfs run_test trigger):

$ perf stat -e cycles,instructions,branches,branch-misses,cache-misses \
    sh -c 'echo 1 > /sys/module/test_kallsyms_perf/parameters/run_test'

Counter                 Baseline          Patched           Delta
------------------------------------------------------------------------
Wall-clock elapsed      1.746 s           0.852 s           -51.2%
CPU cycles              7,320,048,030     3,628,523,081     -50.4%
Instructions            9,943,172,792     5,034,260,318     -49.4%
Branches                2,391,663,821     1,173,258,010     -51.0%
Branch-misses             117,241,513        99,805,938     -14.9%
Cache-misses               84,996,149           731,025     -99.1%

Dropping marker scans and avoiding redundant string expansions cuts
4.91 billion instructions (-49.4%) and drops 84.2 million cache misses
(-99.1%) across the test workload.

Memory footprint: +573 KiB .rodata for kallsyms_names_offsets (191k
symbols * 3 bytes on x86_64 defconfig), minus ~2 KiB from dropping
kallsyms_markers[].

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Jim Cromie (3):
      kallsyms: Add test_kallsyms_perf module to benchmark lookup latency
      kallsyms: Add 3-byte index into compressed symbols to replace marker scans
      kallsyms: Match compressed tokens on the fly during binary search

 kernel/kallsyms.c          | 138 ++++++++++++++-------------
 kernel/kallsyms_internal.h |   2 +-
 lib/Kconfig.debug          |  10 ++
 lib/Makefile               |   1 +
 lib/test_kallsyms_perf.c   | 228 +++++++++++++++++++++++++++++++++++++++++++++
 scripts/kallsyms.c         |  30 +++---
 6 files changed, 322 insertions(+), 87 deletions(-)
---
base-commit: c1c0fd58e28143fd10071f51f4dcc8249a331513
change-id: 20260919-ksyms-tune-e22a42d8a31a

Best regards,
-- 
Jim Cromie <jim.cromie@gmail.com>


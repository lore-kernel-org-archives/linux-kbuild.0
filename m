Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEC318BC3B
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 00:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368184; cv=none; b=hKX1HGLqZ03pgiFG1D/eoZUDESBOKhKwWmoUjTjLimuhnkldEMw2xiTdZV5hz/hU7zZ4JW2krjLaxA2Y4yzMEBkTFP+4tz6Jd0qlRnI+AUnF73Z1SsYGdlzrdKpsQgwLzf4w+dkx+JNVOnlUydDI+g3+5r1W0m3XNdFSZlkkFMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368184; c=relaxed/simple;
	bh=+7uunGwoy0C1mzqxTjbwB/rALRAuIvFdqqLq1AVKSLg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a7NMvkJBToxqoe1GCeYegMq2hbykujb2P66ZJ+a1IRDW6YP9S/U5kjEQdljuygFO+q+KllDqDIYf3/InelmXgs11dcYXZJIsO+7rgst3yELaDHiK/1ZqNcnSE5vi6J2voAR/DDC5gU7lKlSYkkmRbxIZS7qGZ9g0I/9QAnYx/gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+J0FDO1; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+J0FDO1"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4d198f1a591so910400b6e.2
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2026 17:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368181; x=1792972981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ntwCDwHIASzRwaVOgC2xXNZadJNzSVEJMo19avjC2fU=;
        b=o+J0FDO1u4R8/sNvzKNPODjPDyQgROOso1Z9VKGrNxAk/hfDqTqmqi3Vzt1tAdGBdK
         NcfVH5HdKQUrVPb+MrAY6Ngw3Qw0v6jNWTRah6zsaWhUPppZk7xqM0CQGwGS2f0QP9YH
         yLG4WmrIf1jsSir3IlO8Cms5OOJupJUjaW4vW6nUbFzAOBysAe1J29aRDRH7JSmYDiaT
         EmoN0SDoPVkIeJPxbj/kImF8eRX4Who6ld7tcplILLzDvgzbf6xZsRc1AFCpi/Gi9UiG
         ng4ZgNF7Hb7fJ/fj29xnhDfcpHp0qS8CdTCS6D+iJLmcu7xWFSlieUcM4KVKlr5a8Y4S
         BqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368181; x=1792972981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntwCDwHIASzRwaVOgC2xXNZadJNzSVEJMo19avjC2fU=;
        b=BZQzxf55B0d6mqyc1zi3i5fOKv2fPaZUZppfphZtaxUk6C45zjbrqB9V5thP4xvgej
         Q0Z1HH1FCyZkH3qDlfmBl1ACnES8f+MXcvhlz3XIzZ2kx2NgEX8DJNGXDLNwHrWq8Yks
         MQAAHKIuuFqey1KKx7cfyDCWabj+cVBYz7PAr8CONLCp7geL2C0sj8meC46iQrpuLE7v
         rYpbTTJvi68FOMgiwmBXwVbiX7eG9kkwhWT9PMtvGsNqEQCcaJzxuA9/1LYn7BLs02Nn
         926BYZkXrIpI1gDkQ63wkhy5P8duTxeLrgOw/JDu5BRADZ/wc3d5a5676wpdFyVwQLi/
         ouyg==
X-Gm-Message-State: AFq9FYKIucDmkTDl2UYrr/QzvD1MIy2w5SVPtLLN3CONnT7ERe4/cVT4
	hi7bSJOYwl25lbBW2Lc8bYyb61pjcP1sE5uIL5FSd57Z2kCIJmr9VsHepykCsA==
X-Gm-Gg: AYBFou0RT5YIyXW1ehYNyqwG2SKacXheHDXlL5ATOVgG87P++BNsLjMs2bGzFIA27Qe
	QXJmT1RyCsa4COrMg8vpz4dlpnLadmoIIspyfRAUMCCBjO/DzTq1r3g1hOtAPzqiOOMMJWLSmV5
	6dyUo1DY8vFCu9lf4WC/DmtzI2FJ2dyB8i8FhgXc4A1zWnu9hruI5vYUMF7F9pwSNHcw70FuA3/
	Utvq4ChCZ3NNiGU3cqurkVExKMXe9THuvI0xdjSjrwp85DEnm5zuJq6Ocw6DtdjTMoHwKRMqhtS
	mFuzmG8OqI6yg4GwBnrUXIeGUHSbsqX0N1dUVJWr4Ts6GFOmFpCBAjFbHR1Pl+r9hv2koUdG13a
	SctvtgCemIJgwrK6atxc8q5PDLTD7rTju9pPyRJBmqIJKH/Y/HX3LTRnv53xyhgqoeKg0EA3Oe7
	Dph8eDlp3IpLwaKjD+3vBg7llI9NTWCBZiu+1yOBcVzcCkhJI2HEOkauVOTwmIKoMg3S+Dk3xPt
	5xrltgG3543
X-Received: by 2002:a05:6808:509f:b0:4f8:4a95:9b3a with SMTP id 5614622812f47-53ccd3e9167mr5356932b6e.11.1792368181281;
        Sun, 18 Oct 2026 17:03:01 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388d8ab165sm5811806b6e.11.2026.10.18.17.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:03:00 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	ljs@kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 0/5] elf-parse: validate what the host ELF tools read from the file
Date: Sun, 18 Oct 2026 19:02:13 -0500
Message-Id: <20261019000218.3977398-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scripts/elf-parse.c takes the section header table, the section indices and
the symbol table straight out of the file it maps, without checking any of
them against the mapping. All three users -- kallsyms, sorttable and
tracepoint-update -- then index with those values, so a truncated or
corrupted object file makes the tools read outside the mapping, allocate
from a file-supplied count, or divide by zero instead of printing an error.

These are build-time tools fed by the local toolchain, so under
Documentation/process/threat-model.rst this looks like a robustness problem
rather than a vulnerability: reaching it takes a corrupt or hostile object
in the build tree. I am leaving that classification for you to review.

How this was found: the three tools were built with
-fsanitize=address,undefined and driven by a mutational fuzzer that pokes
ELF structure fields (ELF header, section headers, symbol entries) in
otherwise valid objects. Every crash was then reduced to a reproducer that
changes exactly one field of a valid file, which is what each patch quotes.

  1/5  e_type >= 32 shifts by at least the width of int (UB). Hits all three
       tools, and is in mainline as well as -next.
  2/5  nothing checks that the file is long enough for its ELF header, or
       that e_shoff/e_shnum/e_shstrndx describe a table inside the mapping.
       Also mainline.
  3/5  elf_open_ro() resolves a count and a name index through section 0 and
       a string table through sh_link, all unchecked. -next only.
  4/5  a zero sh_entsize divides by zero, and an sh_size past the end of the
       file yields an unbounded symbol count which the caller allocates.
       -next only.
  5/5  st_name is unbounded, so one symbol can point its name anywhere.
       -next only.

Verification, per patch, on the reproducer it quotes and on a valid vmlinux,
a shared object and a .o: every reproducer now prints one line and exits 1,
and the three tools accept the valid objects unchanged. After the series the
fuzzer no longer reaches any of these paths (3420 kallsyms, 2149 sorttable
and 2594 tracepoint-update iterations). gcc -Wall -Wextra is clean on the
changed files, and checkpatch --strict reports nothing except CamelCase
complaints about the standard ELF type names.

What is NOT fixed, and what I could not do:

 - An unaligned symbol-table sh_offset makes elf_symbol() form a misaligned
   Elf_Sym pointer, which UBSan reports at scripts/elf-parse.h:233. Checking
   alignment here would reject legitimate ELF32 objects, whose symbol tables
   need 4-byte alignment while the Elf_Sym union wants 8, so this wants the
   accessors to read unaligned instead. Patch 4/5 says so in its message.
 - Reading e_shoff itself through get_unaligned_le32() is UB on a byte with
   the top bit set. That is a separate bug in
   tools/include/tools/le_byteshift.h which I have a patch pending for
   ("tools/include: fix signed shift overflow in 32-bit unaligned
   accessors"). Until it lands, the e_shoff reproducer in 2/5 stops at the
   byteshift report first; with it applied the behaviour is as described.
 - sorttable.c and tracepoint-update.c read *section* names the same
   unbounded way through the elf_map() path. Both crash, both have a
   one-field reproducer, and both are sent as separate patches to their own
   maintainers rather than buried in this series.
 - The series is based on next-20261002, the newest linux-next I could fetch
   here. Patches 1 and 2 apply to mainline as well.
 - Per Documentation/process/coding-assistants.rst each patch carries an
   Assisted-by tag recording that an LLM found and drafted it, along with
   the sanitizers used. The Signed-off-by is mine: I reviewed the analysis
   and the code.

Leizhen Zhang (5):
  elf-parse: avoid an undefined shift when checking the ELF type
  elf-parse: check that the section header table is inside the file
  elf-parse: check the section indices that elf_open_ro() takes from the
    file
  elf-parse: check the symbol table before walking it
  elf-parse: bound symbol names by the string table

 scripts/elf-parse.c       | 125 +++++++++++++++++++++++++++++++++++---
 scripts/elf-parse.h       |  14 +++++
 scripts/kallsyms-sysmap.c |   4 +-
 3 files changed, 133 insertions(+), 10 deletions(-)

-- 
2.34.1


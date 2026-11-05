Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842711;
	b=5gJ0VXswI3z8Js20SguBJ+bdy90K4aIvZTUdtBot13NL3tPYyI+4lvfcqHarsxVv3T4g
	 bdlNZ0ymMZS3pgRTnYPR10MbYbaJU7uRbfrt8sC9b2ESKIn29n405F17VCrnjbYWOI6IU
	 0GWGDW2JjkwQpO0lXpL8FMc7JhlPOQYHY4bk/GheT/c9ZufrntH/sjWiFChJdIkB89fXb
	 yLGcMkIzO7oebhJNeDkGHmXoEPTMcN0B86sPDrVUriBRVUUXhDXiVhM8BzA9/5HZAf2JT
	 T6+oFU6i4MKhEmd8H5Sxb8oA25H6m5MuTJWl7YxtR86etZtv2DbN+pmFAKCBHZtDrcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DUEA+9h66ghDornvXCd/DpQs6mkffmNPjamgH4lIwY4=;
	b=SH0r71HT9cEGsnvXEEoVeqO5QE61sQDwBP7J0Zxj1QxD/ROipp99lBDc+OS5gM23te/d
	 o60cLJOHPPCACGNqcaOgK5vKb8hKy5pHKQ4DRuzgrzD0rAQ0QkS4C+X4k9tLZICs2YGdh
	 Js1PbMesmze6ukS0XGsWjXnv74B9rG6PbbOaqis/F1jWTsLibagc2AGGNMubd2ahfRuZN
	 G6Kd19jmaUZ3H4ZiCgvXzIR0lolQYM6fNAflZ0NyNGLIuvqZlus1kt3Cp7I1r7+SvaUWU
	 bF/U7A0WA4INJznma73gDVO3g9cbD4MfzanGiuCETH/hAV5ND1CC7UZB6fIY3I/ObgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yiJuzisU;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA16606A326
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 01:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA16606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yiJuzisU
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso280540a91.2
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Nov 2026 17:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793842711; x=1794447511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DUEA+9h66ghDornvXCd/DpQs6mkffmNPjamgH4lIwY4=;
        b=yiJuzisUIMv9uvdqEBcv9RlsRpaCullP0dn98o9XVizIlIhRhtQHC+RSQBldn8KvUU
         zDOGaWvi7zbak+nGNnjE3OTRjjWeXVetdIrw46657KMLreVuS983MJKO3RGFndyCoCqd
         8INE5RpRQfs4Z4UKr40KUqlTW/bz4aA6y349bQuKQXVD2gDuFTLZIvL+++ufyLDjI+an
         2hff+7NzZCvWgVIOSDxpq62pnb2wN2dK7eeFRWceIe0RStJ7JwHioO4NLomnSlaRal2+
         BiW4KjnUb0iELlb9mP94B3YzQhPAssj/bgrXzOo8MMM1yoNO99hf+4mESyOVo7oTvDYF
         S9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793842711; x=1794447511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUEA+9h66ghDornvXCd/DpQs6mkffmNPjamgH4lIwY4=;
        b=cM9WXxcHsr4xFG484BjZAz6FoZueXc3zIFCgXt1PZ3LpMuytCIIhKv4yfDN+SvMgue
         W5E8h9QkLSNGxLHEl8tnzkAY6pq4ZjoyLyfY7zSEbb2ZiO5V7jK5rUKgb/Ku+fsmb/NC
         sEPBEolWYuzW45JGzxguvMajFhiiFA8vDbLnZhneJ9D1F/Thxp7aeboCr3nTUlYsSREi
         qm1RoRpypYh23IpxteqGVS9nQSYeynWlxkrjfRkSSGqxCqMzGwrLryODtV4iqRRxErmP
         hjeofiNEEiFAsFShii3syoKJyDsUCct0DCCDl1RgfH0E8yJa+GEUtJi9TsH42Vw0fVx0
         Savg==
X-Forwarded-Encrypted: i=1; AKwUvByPczn+p/cD84KPgVwAo4I4xG4Un4g10qFyfGwFeOOYhmtMK2pacULC9hkjwLBFpatMZ56Kcjhk8a5gD7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XgZIHq4Xa3PEd7P75Q5qZuvis2W75FiGIQFjMtdhzdk9sSxi8
	Ts4PE1fuZGNnCOtvhr1fWjXsSnaVdrxkpsK9J7JVGUMX7LLGJ7RT/Lsm
X-Gm-Gg: AYBFou2MSd1BfS/+6EJMGx2zeZ2E1bRTgln1OVc8Xargeshbz0h9cy1UF3ZsXinpD9W
	FDyxmxBK0xeXFDfhIPDRw4OYaikqR7G+UlBeC3gaM5TPQTc0ay/aIX3azquh6mZOPaOB/94cnT9
	cUQyq49EEHc7o5pHRh+WRTc90pEW1/KMDCjtddVTRyNqsvLj2kxTsqf6rGuqZy0bcAl7YQVqZOT
	UtjQ+pKQiunSxMgtPHdnyu25JBrleA04FYWM56GBO+HKR2R1yhk+ADCBytR35Nt3J4zTeVRfcpP
	oTLQc0C/jexTJgWsXspgHY4RBxRC4zOjhPMKpiUNFGXBWA0ZUVjw/zlKIElklLVTXM3T6Ro4/lE
	07o2tqdaEUanYqlaPvY0fXgAD9nuz5rD2rEeHU4RtSoi82bVurnLDehXzL4oDLuIPe6Uw9fUs+s
	cXOoE7OYWefFMWRaDx0O+6+5cBHAWkdhcA4EAEKfpkCBk0CvXoipd3B5X/hYHFtjgGNdDqwQA/b
	CcnLT5HPdzvv9t1qLQCTfun4mETpxRf4KIB+27dvTr4VYsOwb35gSEa3QnOWBm/xvR0LrHUerok
	kMTFIK8WM3bXOoH1KGhSdM40l7kTYsiSzJLF
X-Received: by 2002:a17:90a:eb03:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b092b2333dmr2690547a91.62.1793842710498;
        Wed, 04 Nov 2026 17:38:30 -0800 (PST)
Received: from penguin.lxd ([67.223.127.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31d2b5esm1164975a91.15.2026.11.04.17.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:38:29 -0800 (PST)
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
Subject: [PATCH v2 0/4] Documentation: Add kernel minimization guide
Date: Wed,  4 Nov 2026 19:38:19 -0600
Message-Id: <20261105013823.29741-1-matthew.l.weber@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Hi all,

This series adds documentation and a script for measuring source lines of
code (SLOC) in kernel builds, supporting developers and system integrators
who need to trim a Linux kernel.

The Workload analysis section of the admin-guide already describes tracing
a workload. This series builds on that guidance with a worked example of
using workload observations to inform kernel minimization and measure the
resulting configuration. The guide is intended for developers working on
embedded and safety-critical use cases, including work related to ELISA.

The series builds on the ELISA Aerospace Working Group's ongoing
minimization discussions and iterations in
https://github.com/elisa-tech/wg-aerospace/pull/257. That effort explores a
generic, newcomer-oriented workflow for tracing a workload, iterating on a
kernel configuration, measuring kernel metrics, and understanding userspace
metrics. The ELISA documentation aims to present a complete containerized
workflow, with analysis steps to guide users through successive iterations.
This series contributes reusable, general-purpose kernel documentation and
tooling upstream to support that broader process. Clear upstream guidance can
also give AI-assisted tools reliable steering context as they help users
iterate on kernel configurations. One likely early application is producing
minimized release configurations for Space Grade Linux.

Rendered drafts are available online:

  Kernel minimization:
  https://matthew-l-weber.github.io/linux/admin-guide/kernel-minimization.html

  Workload tracing:
  https://matthew-l-weber.github.io/linux/admin-guide/workload-tracing.html

The series and its review discussion are in PR #1:
https://github.com/matthew-l-weber/linux/pull/1

The patches are:

  1/4 Documentation: kcov: clarify coverage example
      Clarify that the saved count bounds the printed entries while KCOV
      remains enabled until the disable ioctl. Document the relevant
      config requirements and PC symbolization.

  2/4 scripts: Add kernel-sloc helper script
      Add a helper to count source lines from compile_commands.json or
      estimate distinct source lines represented in a vmlinux DWARF line
      table.

  3/4 Documentation: admin-guide: Update workload tracing guide
      Expand workload tracing guidance with ftrace function-graph
      tracing, syscall tracing under QEMU with the GDB stub, and mapping
      observations to kernel configuration symbols. Add the Workload
      analysis MAINTAINERS entry.

  4/4 Documentation: admin-guide: Add kernel minimization guide
      Add the guide to the Workload analysis section, cross-reference it
      from the workload tracing guide, and add its MAINTAINERS coverage.

Tool-use disclosure: I used GitHub Copilot CLI while preparing this series.
It helped revise the KCOV example, edit parts of the documentation, add
MAINTAINERS entries, and integrate error-handling revisions to kernel-sloc.
I reviewed the changes and take responsibility for the series.

I checked kernel-sloc syntax and help output, and ran
checkpatch.pl --strict on all four patches in the new order. The GitHub
Actions htmldocs build completed successfully with no warnings from the
changed files; the published documentation is available at
https://matthew-l-weber.github.io/linux/admin-guide/index.html#workload-analysis.
I did not run make htmldocs locally.

Changes in v2:
  - Reorder the series so the workload tracing update precedes the kernel
    minimization guide. The guide refers to the "Tracing a minimal user
    space" and "Mapping observations to configuration" sections added by
    the tracing update, so those sections now exist before they are
    referenced (reported by Sashiko).
  - Move the cross-references from the workload tracing guide to the
    kernel minimization guide into the minimization patch, so no patch
    refers to a document added later in the series.
  - Create the Workload analysis MAINTAINERS entry in the tracing patch and
    extend it with kernel-minimization.rst in the minimization patch.
  - No other content changes.

Any feedback is appreciated.

Thanks,
Matthew

Matthew Weber (4):
  Documentation: kcov: clarify coverage example
  scripts: Add kernel-sloc helper script
  Documentation: admin-guide: Update workload tracing guide
  Documentation: admin-guide: Add kernel minimization guide

 Documentation/admin-guide/index.rst           |   1 +
 .../admin-guide/kernel-minimization.rst       | 413 ++++++++++++++++++
 .../quickly-build-trimmed-linux.rst           |   4 +
 .../admin-guide/workload-tracing.rst          | 139 +++++-
 Documentation/dev-tools/kcov.rst              |  44 +-
 MAINTAINERS                                   |  13 +
 scripts/kernel-sloc                           | 299 +++++++++++++
 7 files changed, 903 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/admin-guide/kernel-minimization.rst
 create mode 100755 scripts/kernel-sloc


base-commit: a592a36e49372172d7c7551ec19ed18184c935e1
-- 
2.39.5


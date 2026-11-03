Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718532;
	b=RZ1OnX3p/9wvYDw/9RENjKrEIRuuhxHMi5OGWi2DFjHtuDOs8qUjnnWOFYAR8TrmrOS3
	 0VHjkghlbui88UBwc3cihmzkcmNFHsdmOWRS3je4l78Uz890cGLcSkUVf/fjfIIZWTSmK
	 LH2a6u+OBuqcAcqKabNu7vOc8NmvHTLeTjtWO8lzdv1shUyIeu454O/omrW26oa25s76Y
	 0TPb3jiQvFvO/YGNk6XIyDJTTIl0x+ZSIPCXrSs5U27w+IEg0sNgCszV5195D/+bE6kEy
	 ECtndDEovlQhDVpNlMkhL/iKHJifSvljKH4Q954rgCLg3nBKSXXkdadmV14PgmdAVGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ztc4qLkMwN1NoVUWOEPMzFNWuHwPq9rAxrAFP/pyv3k=;
	b=0G6CjjwaURandoLsbIqymmPQ+Z4/Jl8V4t1tBGYx0r6yxOhykcUlCasW6Un2fMRMx1sL
	 JlOPZZL2vYJGnUlj7zOBT8uzRChmeI/564mpAwOz0PNBu2sRz2lUMq8Tx1pMiuH7Qa8xh
	 Oy6ydGXMgVJcth2ZxI5LAA3iInmL6Pl3OmW/LWFK+x4cjz1byI7rSQiQHH99icrernFy0
	 yP6Uwsv7Y9D2M+9Mm0s8q5JSSB5Ork8wsiQ0j/kNA6M/f6qy+QLABQxl1b/ucV/BtRlkp
	 PK9wU3VCpnNVe5x8MRnrb/X+7Kid9DuZm1UQoroKUlEevR3Mhkd2Nx7S/Dio6/Qrusg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LPAosJaQ;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AB9606FCC5
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 15:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92AB9606FCC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LPAosJaQ
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4a85c656c58so2588696fac.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2026 07:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718530; x=1794323330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztc4qLkMwN1NoVUWOEPMzFNWuHwPq9rAxrAFP/pyv3k=;
        b=LPAosJaQomkk+3IHBdKD17odPMqzTKcRQQntLNNF8saauK6Rh/eeGGF/aRJsr6Pmqf
         89D2mNvu8k13XA45/c6ZfhELpGbAs/+9ANPLrocgsTrV22jHjbWQ4i72WoBWv07wK/D0
         XcMkEuouJUjRghaccdaAzKgPsoAt+Vut83CeeKLT7h+wVQ5zx7Go8m80wYT2dYOqM0j2
         t+sDXay6dzIYWdO9dEGFuCl7Ck4Ut1zOB4adrqQKZAcJY/Z2helMv4nQ9GNGiV8bTCNx
         nDj4lWBNaWI7CaMz6RV2YcS2jlwNqU4AJaSYjcqfafn6v0pGG7ZB8dmp3U8IjhJgpP0P
         8rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718530; x=1794323330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztc4qLkMwN1NoVUWOEPMzFNWuHwPq9rAxrAFP/pyv3k=;
        b=e1SxIhKj36gBWHu5Cv+olXhYp3Ie0+3ehAVnXM0/yNlhzhe7is8elGBcMynfXB/cRs
         yQ2lZmHaEPMVFh82FinaQnUpI1f4q33dW5qR+Mr4YaNEgbrMpe7hLPtNbWSzcBdFQEsb
         FKHBCXLbos9U9JyV8vPCVmYWgrB12h6g8javy0U2ORyeNXGOhh5GxT/JIXHnmQ5PxvRz
         b1MGPg9yHfQBZfPy1/sQNe/EUubqs8Xy3jdWkkOON1oBF+ptsN5zJKLYiTUI9NKIBto4
         S1hgPQpT3eqMVylOizGJ7J13i/xw+CUzbGGdBzhhcPvAHRXzmdrOPl9AMRlMBpr/Vxmz
         Y0NA==
X-Forwarded-Encrypted: i=1; AKwUvBwjodFAsAPoWOnsKcU64w7eGCrMzDU839BEDMwAubFZlLwbu8hqxWga2k2zOc1//7434cBfJETt5i4ztTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e+6NVVJ179lfRH4/H7KdWaP4DefvCq2DG9CPK7yJ/Dqp+oJ+r
	13ATD7QelTAfn4OQT9CDa6P4rYNogZrojVm1J5u115O5/yrsuU2Y+m64
X-Gm-Gg: AYBFou0PDtvs0q9qaNaqWSr2tHWY1y7CWmQIYlHTHtmMNxe9P4obilziZw46fxMcH7G
	fhmmpU3G184pop0fs6nIa7VQxBWf41ZgV5Ej8FkzGNaevEFUe1HXu+UIiw5c9NWwVCT0ZeFUFQZ
	uo7Qb/nycnfi5Rb3cJzmkqh5ZMzzwLxbMPPk4TginRlQvyNC062DQNaIdU/bMJHG2dnjn5ADgMv
	5jWwhU69oYRGEi6grvuBZzmJnDU2vDS/Em3UC7CN9fE/RpUHPuYiUurqeu6vrjE7W3NLYoLici0
	Ge+JYjzP5mMaJfLXGYu0IZZELG65lw0LGVGyiEuvxfh93OtEZ/TzqJUERMu5TztyrZcD0JemC+O
	iNKybHB8QIdXV7jJYZ6DXBJ1ElXXAL+D6DKOO3fcVK0RObUsj+KSwWgpy90rP3LGL7HOem57xWg
	oS+cxcRY+xKHZe9z9q5/xDsqQ00sWx5G+E+klbi1FxGc/EpPsQHzUGkpU+66HqQFLbw0VDTewxP
	vVAygq99NmyUJSycVYWf6UgwLhzKxF2adN7S7BlXYj/X1o9f+S6/60tlSXgATrMNbYI5MGIKS5U
	b/tKwbgwg1CiISi3v9xKXOro5Son3INnfVZV6Q==
X-Received: by 2002:a05:6870:15d5:b0:483:bdb3:a524 with SMTP id 586e51a60fabf-4a9072ccf3fmr7956354fac.4.1793718530479;
        Tue, 03 Nov 2026 07:08:50 -0800 (PST)
Received: from penguin.lxd ([2605:3f84:842:3300:216:3eff:fe58:9322])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a95d970b9bsm4730448fac.8.2026.11.03.07.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:08:49 -0800 (PST)
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
Subject: [PATCH 0/4] Documentation: Add kernel minimization guide
Date: Tue,  3 Nov 2026 09:08:41 -0600
Message-Id: <20261103150845.13008-1-matthew.l.weber@gmail.com>
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

  3/4 Documentation: admin-guide: Add kernel minimization guide
      Add the guide to the Workload analysis section and add its
      MAINTAINERS coverage.

  4/4 Documentation: admin-guide: Update workload tracing guide
      Expand workload tracing guidance with ftrace function-graph
      tracing, syscall tracing under QEMU with the GDB stub, and mapping
      observations to kernel configuration symbols.

Tool-use disclosure: I used GitHub Copilot CLI while preparing this series.
It helped revise the KCOV example, edit parts of the documentation, add
MAINTAINERS entries, and integrate error-handling revisions to kernel-sloc.
I reviewed the changes and take responsibility for the series.

I checked kernel-sloc syntax and help output, and ran
checkpatch.pl --strict on all four patches. The GitHub Actions htmldocs
build completed successfully with no warnings from the changed files; the
published documentation is available at
https://matthew-l-weber.github.io/linux/admin-guide/index.html#workload-analysis.
I did not run make htmldocs locally.

Any feedback is appreciated.

Thanks,
Matthew

Matthew Weber (4):
  Documentation: kcov: clarify coverage example
  scripts: Add kernel-sloc helper script
  Documentation: admin-guide: Add kernel minimization guide
  Documentation: admin-guide: Update workload tracing guide

 Documentation/admin-guide/index.rst           |   1 +
 .../admin-guide/kernel-minimization.rst       | 413 ++++++++++++++++++
 .../quickly-build-trimmed-linux.rst           |   4 +
 .../admin-guide/workload-tracing.rst          | 139 +++++-
 Documentation/dev-tools/kcov.rst              |  44 ++-
 MAINTAINERS                                   |  13 +
 scripts/kernel-sloc                           | 299 +++++++++++++
 7 files changed, 903 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/admin-guide/kernel-minimization.rst
 create mode 100755 scripts/kernel-sloc


base-commit: a592a36e49372172d7c7551ec19ed18184c935e1
-- 
2.39.5

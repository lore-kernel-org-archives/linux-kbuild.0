Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434F62F6931;
	Wed, 12 Aug 2026 03:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505593; cv=none; b=Z2cWa56GTwM8tzknbH9UqTLpbB9uzRfea7LrWxe0SLhJQMojZR814iqXP2bdoZXeOV6Y8WWC93MIgSAGJQIByVIcEkdnws+6ZmnWzd2l8RCHxdOoepVIN9KFs9LDoXIB+iv0+JxcNJeLyFUPraXe24c+pLMCTEEIdcTZr8pp2hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505593; c=relaxed/simple;
	bh=wrTEcN6TO354Mdq5ylYUXKC8F+M5nmWtZzQ+W6wEUz8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DtSB4dT1SwynT2GcYLDEkz2Pw1HHOQBO2ry6UyETHCmHWXOfyLchEKtNMNR0mfOmAmiCyItBaJUCbXNqPeq0NK12+YRyLCAOd+hxAjIH8mjDgP1aQf8efhimBGF/6ex0dZkxvHQC94/f+Gef7pZXFErqp26Ou8tmkspJNOe/lKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=C9SVNyJB; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="C9SVNyJB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=bDcjtixa0z6fn2j6lLnTkOiREkWS9pilzWyFhIk8Lc4=; b=C9SVNyJBviZfa4OaeCT3cUPsso
	eixODsZwMx/LAO5ndwVi+VXxN7gKHkc6Rf/N9NpsJTviyr3tHTrC/P7f2BicYXHGsb95YTdD3EWMF
	M0L2QKknTkHwW6lGmTfvmPiTGmCM6jUC8TlmedyVDtU31RttTCKCp5WACYtxqvjUn1QCfXCC5F8Xh
	BRwVZ5+rPuYaz4Dn8qszr4x8dU9ZLU8k8NCG0F3HubLcdhZeRNrgjZ9jPLTM4y/Tuo/WRN7i4AOYg
	vufMHoYXVbMeseVX6dwT6eg3gm7eFIH0DsmAFV6w02Oqw0oW+Pn6D0burZyX+bbDb4mfrVPW9goJd
	Mp9g7vfQ==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtziB-00HTm1-4c; Wed, 12 Aug 2026 05:33:03 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v4 00/12] syscalls: Add a shared table for all archs
Date: Wed, 12 Aug 2026 00:32:56 -0300
Message-Id: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NzQ6CMBAE4FcxPVvTbltBT76HMaZbFq0iGIpEQ
 nh3qR7U+HOcZOabngWqPQW2nPSsptYHX5Vj0NMJc3tb7oj7bMwMBMxFApo3VdkdeeiCs0WxbSw
 WxBeQIqJEmCOycXmuKffXu7rePHK44IFcE6nY2PvQVHV3v21l7P1/aCUXfOGMkmmqQWV25Xe28
 HbmqhOLFy28Isl3BCJiMp1LIp3I/ANRTyQVPxA1IonTxoJyRqB5Q4ZhuAHEbQmeUwEAAA==
X-Change-ID: 20260724-tonyk-syscall_table-928bbb1b26bb
To: Thomas Gleixner <tglx@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2

While implementing a new syscall, we need to wire up it's number to the arch
table. Since syscall number 403, all architectures are on sync regarding the
number (except alpha), which make things a lot easier but more repetitive as
well. Have a look at commit b36d4b6aa88 ("arch: hookup listns() system call"),
with 15 lines of mostly:

  +470    common  listns                          sys_listns

There's already a "common" table shared with a bunch of archs at
`scripts/syscall.tbl`, but due to historical reasons some archs will never be
able to move to this table and share all the numbers.

The generic table starts from 403 (clock_gettime64), the first common syscall.

I've compile tested for arm32, arm64, s390, mips, sparc and alpha by comparing
the syscalls_*.h and unistd_*.h files generated before and after this patchset.
For most of cases the files are identical, for the few cases that they are not,
there's a note in the commit explaining why they are equivalent.

Thanks!
	André

Changes in v4:
- Replace cln3 with clone3 in the ABIs
- mips: Get rid of custom mips ABIs (o32, n32, n64) and use 32 and 64
- mips: Unify n32 and n64 tables
- Add alpha to the syscall party, along with it's adaptations
- Remove --no-compat option and define SYSCALL_WITH_COMPAT() macro for archs
that need it
- v3: https://patch.msgid.link/20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com

Changes in v3:
- Removed x86 for now, let's wait till x32 is dropped
- Added much more archs
- v2: https://patch.msgid.link/20260727-tonyk-syscall_table-v2-0-95d4f1ee471f@igalia.com

Changes in v2:
- Managed to move to the real first common syscall: 403 (clock_gettime64)
- Added -no-compat option to be used with x86_64
- v1: https://patch.msgid.link/20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com

---
André Almeida (12):
      syscalls: Make --abis parsing more robust
      syscalls: Create unified partial table for all archs
      scripts/syscall.tbl: Use the common table
      arm: Use the common syscall table
      s390: Use the common syscall table
      sparc: Use the common syscall table
      mips: Remove duplicated syscallnr.sh
      mips: Get rid of custom mips ABIs for syscall tables
      mips: Use the common syscall table
      syscalls: Add an option for offsetting the common table
      alpha: Define entry point for set_mempolicy_home_node syscall
      alpha: Use the common syscall table

 arch/alpha/kernel/syscalls/Makefile       |  10 +-
 arch/alpha/kernel/syscalls/syscall.tbl    |  48 --
 arch/alpha/kernel/systbls.S               |   1 +
 arch/arm/tools/Makefile                   |  10 +-
 arch/arm/tools/syscall.tbl                |  68 ---
 arch/arm64/tools/syscall_32.tbl           |  68 ---
 arch/mips/kernel/scall64-n32.S            |   1 +
 arch/mips/kernel/scall64-n64.S            |   2 +
 arch/mips/kernel/syscalls/Makefile        |  31 +-
 arch/mips/kernel/syscalls/syscall_n.tbl   | 464 +++++++++++++++++
 arch/mips/kernel/syscalls/syscall_n32.tbl | 412 ---------------
 arch/mips/kernel/syscalls/syscall_n64.tbl | 388 --------------
 arch/mips/kernel/syscalls/syscall_o32.tbl | 826 ++++++++++++++----------------
 arch/mips/kernel/syscalls/syscallnr.sh    |  26 -
 arch/s390/kernel/syscall.c                |   2 +
 arch/s390/kernel/syscalls/Makefile        |   8 +-
 arch/s390/kernel/syscalls/syscall.tbl     |  48 --
 arch/sparc/kernel/syscalls/Makefile       |   8 +-
 arch/sparc/kernel/syscalls/syscall.tbl    |  68 ---
 scripts/Makefile.asm-headers              |   9 +-
 scripts/syscall.tbl                       |  68 ---
 scripts/syscall_common.tbl                |  84 +++
 scripts/syscallhdr.sh                     |  79 ++-
 scripts/syscalltbl.sh                     |  44 +-
 24 files changed, 1083 insertions(+), 1690 deletions(-)
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260724-tonyk-syscall_table-928bbb1b26bb

Best regards,
--  
André Almeida <andrealmeid@igalia.com>


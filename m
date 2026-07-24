Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6975A2FD694;
	Fri, 24 Jul 2026 20:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784923237; cv=none; b=n4NJucYajfhoolrvHkQEohEZkQrxamITbHpsQdLQW2vlv2t3zIzG0KI922jdyLh4SGSt/D3Tfy07v2KXS5r7GPSEuMzkMwJp3ei2tBlxYGmbPOJTk0fqcq46Usbsh4A8c4TC2LFFgY8A90wvZOAmS0Cw/2FojpX26H/LRlA+SzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784923237; c=relaxed/simple;
	bh=++FxkPl/GziZ9jf1z01jagAQe2bVE3MsirCWFyF1NAM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cbx/2Va6hEpC17EWgcefQxg5F6IuAcSVwUUfmeeOH2oiX2ZIPBHkWMtkobXcNS4AssTVzi0FjzbsIcLNe8TfSqyV5md6A0vPkhqicDJTry/XP+FKO59XGRsJkaXy5mfSbjyBrRLERDHWpRdAIVMHNIyQdY5Tk5mk1Qw4he6MTfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=YhaEvuQ6; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="YhaEvuQ6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=FEy5QmzAoN+9TFMenjgUC/Es0w9ErX3BXE0B6PncuV4=; b=YhaEvuQ6WVydYp3d1ntFNlY9Pz
	un9Z+4u2DydboxElXj7u/P8TuhIpwK+tRc5uPtmdkxRsviZPuU5v9STpCF6fNLpsE4bXmBplLWhwu
	LAn7UMxxHYLFYXB75Q7XHJLeTTy9yyPzIaDTg/IzoMBTUIKJJ51f26pe62eTEkehYr8G6BnGHfzIn
	g003eV/Jvfkrzz2fDfPKzK3sOgp+B4936aWJqMdRQQxxiL1ENOnpnE7k3Na7kmuBnfOZl5iLfIbiq
	J9eBKn9MtEhpejzf1+UW9Oi7oqWU0bIrI/wWcm+ZJaDGT9bMoSxAw201k0L8No1PqlPgU+z8ZXo4A
	G3GVtHpg==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wnM4E-0057cp-Sa; Fri, 24 Jul 2026 22:00:23 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH RFC 0/4] syscalls: Add a shared table for all archs
Date: Fri, 24 Jul 2026 17:00:10 -0300
Message-Id: <20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMT3ZL8vMps3eLK4uTEnJz4ksSknFRdSyOLpKQkwyQjs6QkJaDOgqL
 UtMwKsKnRSkFuzkqxEMHi0qSs1OQSkHlKtbUAhd3WdnwAAAA=
X-Change-ID: 20260724-tonyk-syscall_table-928bbb1b26bb
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
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

In order to make things a bit easier, this patchset creates yet another common
syscall table with a subset of numbers that are already being shared among the
syscalls. I've started from syscall 442 (mount_setattr) to avoid dealing with
compat syscalls for now, but this already have the benefit of adding or rebasing
a new syscall much easier. If this work sounds reasonable I can later add more
syscalls, removing more repetitive lines from the code.

I've tested this with x86 and arm64, by comparing the syscalls_*.h and
unistd_*.h files generated before and after this patchset and they are
identical.

Thanks!
	André

---
André Almeida (4):
      syscalls: Create unified partial table for all archs
      syscalls: Add support for x86_x32 for the common syscall table
      x86: Use common syscall table
      scripts/syscall.tbl: Use the common table

 arch/arm64/tools/syscall_32.tbl        | 30 -------------
 arch/x86/entry/syscalls/Makefile       | 15 ++++---
 arch/x86/entry/syscalls/syscall_32.tbl | 30 -------------
 arch/x86/entry/syscalls/syscall_64.tbl | 30 -------------
 scripts/Makefile.asm-headers           |  4 +-
 scripts/syscall.tbl                    | 30 -------------
 scripts/syscall_common.tbl             | 34 ++++++++++++++
 scripts/syscallhdr.sh                  | 81 +++++++++++++++++++++++++++++-----
 scripts/syscalltbl.sh                  | 26 ++++++++---
 9 files changed, 134 insertions(+), 146 deletions(-)
---
base-commit: af5e34a41cd607c00ef752e00331736570992354
change-id: 20260724-tonyk-syscall_table-928bbb1b26bb

Best regards,
--  
André Almeida <andrealmeid@igalia.com>


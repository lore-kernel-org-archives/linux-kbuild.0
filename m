Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A2F3890E8;
	Fri,  7 Aug 2026 20:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132851; cv=none; b=CI6Eo81+lQCtEYL2XM+/gV5/iBgCEn7wXsa/1UKZwAYhCiFN/koqeFQOAJI7JJVxQLiKn53XXeU4ibZMAGhquQCd5OoGq3uN1yGSi1eYmjWkoyIhfqzo+u+O/Q0dW58Y4cX8hmsiiImMCqlvjZjByh4zr9qER54svOqWX1kMaMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132851; c=relaxed/simple;
	bh=v/qAF5KAEaK0gsiTIRKaQ+xh7VFSAxELNXzp8uYiRrk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gpN5TWLGfS/iPXjYcPhFiwEW7Wn5muUewYUoK/5V4/6qqMGqWrNupDhiTls/8h47I65W5BVO6BTX+sBOvo0eQv8AjG1YB7gC3YVHyA9J7hEmuXla5qmFp56hH7zNyveJhDXHGh3opbGwDJX6kilNnKVQseWChLST1eKNgty4j7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=PCGZ1HCD; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="PCGZ1HCD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=sOkK/TjyPJP7dHlqTvwdVuVzPDhRJqJNSj8QNTgo/3k=; b=PCGZ1HCDEHK8f7pWqjCktTABYD
	b1LUZoOqfdd3QbOCNE2G7FIXg8ffdJhd1YnH+qnJS3ChtuU3g1Udpo7nK4GkOTv4QF2sRl+eSamn1
	6qTbci53lU2r/kjReQTGyeHpeCf60PFzwBgyVAFUaNRdUtmTKm5yzDHrD4jBdr/J+HmZcywrVFkma
	TvuhENFppYcCEsL8pMJSUflgw79eRnhLztAYon/st9+ikAWKdYBd8g5xl3qhEyrtTyz/SgRDeRBzL
	Hhyk3oGn9QSw26LCIkUMrX1qewUSLKIIeyWQ8+qslf5j+2YlrgBECJgW1HzVM5qm3myby6T3znq1T
	fUklysvQ==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wsQL8-00Fa08-Oe; Fri, 07 Aug 2026 21:34:46 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH RFC v3 0/8] syscalls: Add a shared table for all archs
Date: Fri, 07 Aug 2026 16:34:27 -0300
Message-Id: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQrCMBAF4KuUrI00afrnShA8gFsRSdJpG42NJ
 DVYSu9uGzcK4vINb743IgdWgUObaEQWvHLKdHNIVhGSLe8awKqaM6IxzeKcMtybbrhiNzjJtT7
 3XGjAJS2EEETQTAg0f94t1OoZ1CM67Hfo9D66h7iA7BdvqbXK9cYOYduTUP474wmOcSnThBQFo
 0nFt6rhWvG1NLcw4eknkv9G6IKkFasJAMtJ/YVM0/QCoqoPOhMBAAA=
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

I've compile tested for arm32, arm64, s390, mips and sparc, by comparing the
syscalls_*.h and unistd_*.h files generated before and after this patchset. For
most of cases the files are identical, for the few cases that they are not,
there's a note in the commit explaining why they are equivalent.

Thanks!
	André

Changes in v3:
- Removed x86 for now, let's wait till x32 is dropped
- Added much more archs
- v2: https://patch.msgid.link/20260727-tonyk-syscall_table-v2-0-95d4f1ee471f@igalia.com

Changes in v2:
- Managed to move to the real first common syscall: 403 (clock_gettime64)
- Added -no-compat option to be used with x86_64
- v1: https://patch.msgid.link/20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com

---
André Almeida (8):
      syscalls: Make --abis parsing more robust
      syscalls: Create unified partial table for all archs
      scripts/syscall.tbl: Use the common table
      arm: Use the common syscall table
      s390: Use the common syscall table
      sparc: Use the common syscall table
      mips: Remove duplicated syscallnr.sh
      mips: Use the common syscall table

 arch/arm/tools/Makefile                   | 10 ++--
 arch/arm/tools/syscall.tbl                | 68 -------------------------
 arch/arm64/tools/syscall_32.tbl           | 68 -------------------------
 arch/mips/kernel/scall64-n32.S            |  1 +
 arch/mips/kernel/syscalls/Makefile        | 27 +++++++---
 arch/mips/kernel/syscalls/syscall_n32.tbl | 68 -------------------------
 arch/mips/kernel/syscalls/syscall_n64.tbl | 48 ------------------
 arch/mips/kernel/syscalls/syscall_o32.tbl | 68 -------------------------
 arch/mips/kernel/syscalls/syscallnr.sh    | 26 ----------
 arch/s390/kernel/syscalls/Makefile        |  8 ++-
 arch/s390/kernel/syscalls/syscall.tbl     | 48 ------------------
 arch/sparc/kernel/syscalls/Makefile       |  8 ++-
 arch/sparc/kernel/syscalls/syscall.tbl    | 68 -------------------------
 scripts/Makefile.asm-headers              |  9 ++--
 scripts/syscall.tbl                       | 68 -------------------------
 scripts/syscall_common.tbl                | 83 +++++++++++++++++++++++++++++++
 scripts/syscallhdr.sh                     | 62 +++++++++++++++++------
 scripts/syscalltbl.sh                     | 38 +++++++++++---
 18 files changed, 205 insertions(+), 571 deletions(-)
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260724-tonyk-syscall_table-928bbb1b26bb

Best regards,
--  
André Almeida <andrealmeid@igalia.com>


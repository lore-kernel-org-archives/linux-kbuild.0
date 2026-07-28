Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AF92F12A1;
	Tue, 28 Jul 2026 02:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206850; cv=none; b=XlZXqf9K9mdo89vMv51OJLSFurEL/k8h1Pu6+SD7qNtTiKQBBP/7CGrc2q6uK7TTgJz3gkpng1ZfDemLs/kSecFZnVEFlpARhvPlLI5pRVumeuQP7eJ8iBqh/Scz/s3OPEpFYmGIlRiYTh1vgx7Gt/h5821WzdTzLtpGiaLN7YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206850; c=relaxed/simple;
	bh=DQOcn34tbupdB8Go0oGoRpuR4Do0z4GI/799WvLb3qw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DM6KBj7WXOV+G5NvPLI2mKNjfZZXj5+of2c2KotEURCOKJey9QJGDf8si+bPCSM5JVYs7z0MBxgwl98nGLsPAoG41lp6UMa/vhc3+e2eQbRFHGEQl/v+i0umDSFLH+lbW6lCvFstiPF30+HtuOPgWkWvU/aclOVpDa+WRR9LoPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=HwW7D5Dy; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="HwW7D5Dy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=g0CHsuhAxFnr7V/mNT6oFljyOi9UR1OJtvvwq85sG3U=; b=HwW7D5DyGHsZSZSj8mAdqk72L7
	gkB9mZhG8ErgrYckAH+JwtNj9nE/K1Z+51xdrjQ0yxi7x70B6YwRjxCt1vCayJQIMR+S5l8Cwq055
	7WeIq4ywDc81jv+u5OVj/dWTdgfZtM/uP0fAH1IB0DdW1F4fhkOU+IsILqNYM2KG9ZHmJKCIDIGuO
	bqwufMLFEgR5fuvYMeyxiLx25m3fC7HItIlZgzaNsWgxJeOxnuwct6YBp1OX8cSWERXtOYUJLr5AK
	wSJLBdkhsm4lhSfLB8WjTz1w1iaYKOr24YfPV7OHNfmRVuHUHgV0JcQjqr31LSVWiS96JYYVbJvyN
	LT6/s4sg==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1woXqb-006nKh-7h; Tue, 28 Jul 2026 04:47:13 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH RFC v2 0/4] syscalls: Add a shared table for all archs
Date: Mon, 27 Jul 2026 23:47:01 -0300
Message-Id: <20260727-tonyk-syscall_table-v2-0-95d4f1ee471f@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBREr0L+2hpaEMGViYkHcGuI6S8VPlZq2
 kokhLsLuHc5kzdvRvDakfZwiEZwuidPtpuD2ESgGtnVmlE1ZxCxyOK9SFmw3fBgfvBKGnMLEo1
 mhcgRkaPIEGFevpy+02e1XuFyPkH5K/0bW63C4luwhnywbli/e77Cf296zmJWqF3C8zwVSSWPV
 EtDcqvsE8ppmr70u+lYzgAAAA==
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

The generic table starts from 403 (clock_gettime64), the first common syscall.
The scripts are adapted to x86 specifics, like not generating the compat entry
point for x86_64 and placing x86_x32 things in the proper order. x32 is likely
to be dropped from Linux soon but for the moment I left the support there. If
this sounds good, next revision I can add the docs bits too.

I've tested this with x86 and arm64, by comparing the syscalls_*.h and
unistd_*.h files generated before and after this patchset and they are
identical.

Thanks!
	André

Changes in v2:
- Managed to move to the real first common syscall: 403 (clock_gettime64)
- Added -no-compat option to be used with x86_64
- v1: https://patch.msgid.link/20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com

---
André Almeida (4):
      syscalls: Create unified partial table for all archs
      syscalls: Add support for x86_x32 for the common syscall table
      x86: Use common syscall table
      scripts/syscall.tbl: Use the common table

 arch/arm64/tools/syscall_32.tbl        | 68 ----------------------------
 arch/x86/entry/syscalls/Makefile       | 16 ++++---
 arch/x86/entry/syscalls/syscall_32.tbl | 68 ----------------------------
 arch/x86/entry/syscalls/syscall_64.tbl | 48 --------------------
 scripts/Makefile.asm-headers           |  4 +-
 scripts/syscall.tbl                    | 68 ----------------------------
 scripts/syscall_common.tbl             | 72 +++++++++++++++++++++++++++++
 scripts/syscallhdr.sh                  | 83 ++++++++++++++++++++++++++++------
 scripts/syscalltbl.sh                  | 35 +++++++++++---
 9 files changed, 181 insertions(+), 281 deletions(-)
---
base-commit: af5e34a41cd607c00ef752e00331736570992354
change-id: 20260724-tonyk-syscall_table-928bbb1b26bb

Best regards,
--  
André Almeida <andrealmeid@igalia.com>


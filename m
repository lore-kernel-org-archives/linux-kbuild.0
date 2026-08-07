Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E80140BCD4;
	Fri,  7 Aug 2026 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786131307; cv=none; b=O1I6xIOcrG1FIRjNjjqsLGjiUrqvEJivC/XONH8kkNRPgNm2qytMSoDlojLC2Qc0ziJWGRK1Nb95Z2KM4xrbZd8DJIc/Jk4rw7C3NKDWitt8EHarjO96gYb8UqErVFcpDfalHnCHfglErC6mycxCMALO+b5kdVPGuYR2pBg8jOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786131307; c=relaxed/simple;
	bh=8KINWR3aWJNh3jsfo9XdixjHepxXNFEX1tdYtF6OHNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AiNeogliUPgqqXTq6E/tSq9A6Wngh2HjdrNlo8nB2G+HxoqDb5bMkYA3Sy3Ht4Yhqhxl8vFu49eWAnonm7HDDzmJiFHyaYdgzEPUvgHKbzC7KMyXo56PmpuihjaxtrTfdJ9lW1ugc4WvKlUN6tnnhkuSWGQQHiVUAlntLKQuSXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hBRHnht8; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hBRHnht8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=quF/rmJR+ZZUaD4FKwu0PINJg03Gp63DAJI73RocdGk=; b=hBRHnht8bc8T+LtNDMmd3EJVIX
	/+bcOSEaqY4/6V1jJz4OV+mgaHCXUoacM/EIj6H6TN9I+bfnnGgoI5M4S9ux+NS/I/owilCTtpogf
	uCu/RKNc9yv4QwwxPEEKGBM7YdPx7GNOwQ874Ayys7o5plFjqPbaXXlzBwj4VP0IyOxHLlKnQMFqU
	9GLXOYNvXVDxwTiFDceOV3aAS7UMqiGP3kEO81a7X+osYWGQMiWub15PK2PKKbEewokUytV7e3Vke
	VGbX0xBtIfIWFAS2T9/vtc7buTQe+RG1ItX9erRPC+ri/CpA1LpmR4gGg+jdHZVtTgMXktEcjW2gN
	cfE90gqQ==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wsQLO-00Fa08-NS; Fri, 07 Aug 2026 21:35:02 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 07 Aug 2026 16:34:34 -0300
Subject: [PATCH RFC v3 7/8] mips: Remove duplicated syscallnr.sh
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260807-tonyk-syscall_table-v3-7-7c45a23c50b5@igalia.com>
References: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
In-Reply-To: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2

The common scripts/ already have a script for generating the numbers of
syscalls file. Use it and drop the custom script.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/mips/kernel/syscalls/Makefile     |  9 +++++----
 arch/mips/kernel/syscalls/syscallnr.sh | 26 --------------------------
 2 files changed, 5 insertions(+), 30 deletions(-)

diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index 56f6f093bb88..69adc21483ed 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -5,16 +5,17 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 $(shell mkdir -p $(uapi) $(kapi))
 
 syshdr := $(srctree)/scripts/syscallhdr.sh
-sysnr := $(src)/syscallnr.sh
+sysnr := $(srctree)/scripts/syscallnr.sh
 systbl := $(srctree)/scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --offset __NR_Linux $< $@
 
 quiet_cmd_sysnr = SYSNR   $@
-      cmd_sysnr = $(CONFIG_SHELL) '$(sysnr)' '$<' '$@'		\
-		  '$(sysnr_abis_$(basetarget))'			\
-		  '$(sysnr_pfx_$(basetarget))'
+      cmd_sysnr = $(CONFIG_SHELL) $(sysnr) \
+		  --prefix $(sysnr_pfx_$(basetarget))_Linux_ \
+		  --abis $(sysnr_abis_$(basetarget)) \
+		  $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
       cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
diff --git a/arch/mips/kernel/syscalls/syscallnr.sh b/arch/mips/kernel/syscalls/syscallnr.sh
deleted file mode 100644
index c190bbefbfc2..000000000000
--- a/arch/mips/kernel/syscalls/syscallnr.sh
+++ /dev/null
@@ -1,26 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-out="$2"
-my_abis=`echo "($3)" | tr ',' '|'`
-prefix="$4"
-
-fileguard=_UAPI_ASM_MIPS_`basename "$out" | sed \
-	-e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' \
-	-e 's/[^A-Z0-9_]/_/g' -e 's/__/_/g'`
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
-	printf "#ifndef %s\n" "${fileguard}"
-	printf "#define %s\n" "${fileguard}"
-	printf "\n"
-
-	nxt=0
-	while read nr abi name entry compat ; do
-		nxt=$((nr+1))
-	done
-
-	printf "#define __NR_%s_Linux_syscalls\t%s\n" "${prefix}" "${nxt}"
-	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
-	printf "\n"
-) > "$out"

-- 
2.55.0


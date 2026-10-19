Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176AA1A9F83
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 00:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368211; cv=none; b=fgzQbcmaCukS4RMzS1w8Gb1eoh3otREFVIrIO3uXADQBKlIMLhoEAUchERWPRkiPBjxPaPRuVvdEEolnW+3dX9KL86A2bhmNPuEwU9xC9SHLaSw76+OykhkT9Me3jfu3uAwJA/Yg0uq482muDKPHTMa2NzuyD2EdTOHmOK3KeJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368211; c=relaxed/simple;
	bh=2JKcgyL5MZsa1atFWKqaDkgVvI6MNsCv8edchhencJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qs7kEoa1c8LFjXq+HUEHmSc55M+npjuoHJ9ltCSRzOdb2hmoyf2Hpi5Mgmicf86yNEB5qgldN7bYVT9S7hUwxUVGNEPYIMzgz25ol+GlXSQxeIeOfC6M4lbiuS+obV9TLERxcAxT8/nr2Wa9AxH2OlgeYjQhExrHMhKHkdw7uLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcrJ+XoV; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcrJ+XoV"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4f14642adb4so662294b6e.1
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2026 17:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368209; x=1792973009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1v4MX1Kl0eeFBdztaswBZeFOsomX3w44ItcTRymTJw=;
        b=GcrJ+XoVXDBIJG6PPYXGlrjRsr1WI2ove1hzD5PJ8tUkZRFqD+9yHWHirfQAG9tYaU
         U4lGSQ7u7eYOpolKsuL43nxKziGxvNJs29c+x+Babcu5yRCDM5RH3zCPNMIDUOK26eDS
         FFwOgXphCCwU7vpJVuBXVo4CgZ6mPXWVyCAp868nwyou1+oMF0rCbZbYRXIKY1Rsp6YE
         NheQ/Hq5TOP8RGHDVVXGMcmxeAiIKzp9r5KakS4NzkIqKTElYpHc2IbyUea0QWxMv0B0
         cYMkAi5c8hArTMBWy5LizHNWTlAbI/lWoKL4MZpf8IHcVTT/2C3C96bzKWbvZa6L7VPi
         xdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368209; x=1792973009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1v4MX1Kl0eeFBdztaswBZeFOsomX3w44ItcTRymTJw=;
        b=hMCn33vv9NdfrzLGScfDSZ61VJVMFebYj2ZgCVz58aj8rz9ZsT2hbmm3+pfUGJ1M5w
         Z9T2hH7jpuWwUMql4OPmKgBmdSykjpFaPeyMM5sWCnH8TvVxZw8zxlb5qhlJodFJRdYB
         OuS3fFeDT2biBS3vMG6GeQaRokMHhDTPNgM6rRW1G/hsZp5N9q+sgX336HlKAT6aOscY
         chAa6xmlbVsR8of4BPYOEND7zxeWVT+tokhaxBamBAzdtYAQlcng46R1Jte3fI2zd/X3
         rQ+f+yghRI5jhJHkxYjcBmgHtZggZ4kLJcyaBke8dS2oC1Pxsa/lf2EDWvUqoxyPJ1hB
         +MWQ==
X-Gm-Message-State: AFq9FYLLGXzEeTdM0rPn5IsLVE1jjREFZ+51sif3MrkbI9f13W9pnX18
	KTjRZ5woZ1yz2xpv+onfDraTlAglItUToZO7lH7zSQE1EC6DObE9avXk
X-Gm-Gg: AYBFou3yF79hk88XFMKS+1yTKPWsMH3akLkyiymEhOWs1v7NUN0/epbr1iYwd+JeDhZ
	vV0SyBp0ChES7lKv7n+lwm6xKtM6KI1FAmDbIi2AOZr0A/+OQUSZBPIVvTyLbN5pEy960sRW9hh
	4+vnXnlgBXFBstVBUEb0T9T/E1rBPJearVzA2jsOwM60Y7vWF/84eddAkhwNIq63YRVzOaXs6Y2
	EhzjeSOp0Alv0OF1kDUWIODndc/yfow6m9DdMg2ALUV8RMAXXnLoQwp2++ztsax2fS/f9JzqZiH
	s1n1azySse2Y+uxnwCwZQKZpjR2gzQ4dxYztgGHXVNx5NJuY2fOW45VyDAiwBOV4RWiqpDSS8NN
	jePtrBLhGdoRhA/3B5W0dXAIge2hlFfTmwHG/CL8rxOyZUSjNRDqlNApg4cTP0b3e/6l9ILb/ZV
	e2nzsiNsRJFTSc15qugwjheOkz+j0yNHDpp8R5SEHMaxgzq9x/MomSlDhypyXNlXNqCrMfJKJI7
	+JdwCgK3T1h
X-Received: by 2002:a05:6808:4f6a:b0:539:4d53:170e with SMTP id 5614622812f47-53cd2592db5mr5858611b6e.43.1792368208894;
        Sun, 18 Oct 2026 17:03:28 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388d8ab165sm5811806b6e.11.2026.10.18.17.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:03:27 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	ljs@kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 4/5] elf-parse: check the symbol table before walking it
Date: Sun, 18 Oct 2026 19:02:17 -0500
Message-Id: <20261019000218.3977398-5-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019000218.3977398-1-lzsx618@gmail.com>
References: <20261019000218.3977398-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

elf_open_ro() ends with

	elf->nr_syms = shdr_size(elf->symtab) / shdr_entsize(elf->symtab);

on a section header taken from the file. A zero sh_entsize divides by
zero, and an sh_size that runs past the end of the mapping produces a
symbol count bounded by nothing: scripts/kallsyms-sysmap.c allocates
nr_syms entries up front and then reads every one of them.

Found by fuzzing the host ELF tools with mutated object files under
ASan/UBSan. Both reproducers change one field of the symbol table's
section header in an otherwise valid vmlinux:

  sh_entsize = 0
    ./kallsyms --sysmap=/dev/null t.elf
    scripts/elf-parse.c:266:40: runtime error: division by zero
      #0 in elf_open_ro scripts/elf-parse.c:266

  sh_size = 0x7fffffff0000
    ./kallsyms --sysmap=/dev/null t.elf
    ERROR: AddressSanitizer: requested allocation size 0x7ffffffefff0
    exceeds maximum supported size
      #0 in malloc
      #1 in xmalloc scripts/include/xalloc.h
      #2 in elf_read_symbols scripts/kallsyms-sysmap.c:195

Require an entry size that can hold a symbol of the file's class, and a
table that lies inside the mapping. Both reproducers then print "symbol
table out of range" and exit 1, while a vmlinux and a shared object are
read unchanged.

One UBSan report in this area is deliberately not addressed here: an
unaligned sh_offset makes elf_symbol() form a misaligned Elf_Sym
pointer, which the header's accessors then dereference. Rejecting it on
alignment would also reject legitimate ELF32 objects, whose symbol
tables need only 4-byte alignment while the Elf_Sym union requires 8, so
that one needs the accessors to read unaligned instead of a check here.

This code is only in linux-next, from the "kbuild: significantly speed
up kernel builds" series, so there is no mainline commit to reference in
a Fixes tag.

Assisted-by: LLM ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/elf-parse.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
index 39ac25ddf188..756843c433ee 100644
--- a/scripts/elf-parse.c
+++ b/scripts/elf-parse.c
@@ -271,6 +271,26 @@ static bool elf_shnum_out_of_range(const struct elf_file *elf)
 	return (elf->size - shoff) / elf->shentsize < elf->shnum;
 }
 
+/*
+ * True when the symbol table cannot be walked inside the mapping: an entry
+ * size too small to hold a symbol divides by zero (or steps through the file
+ * in the wrong units) below, and a table running past the end of the file is
+ * read out of bounds -- its size also drives the allocation in the callers.
+ */
+static bool elf_symtab_out_of_range(const struct elf_file *elf)
+{
+	size_t offset = shdr_offset(elf->symtab);
+	size_t size = shdr_size(elf->symtab);
+	size_t entsize = shdr_entsize(elf->symtab);
+	size_t minsize = elf_map_long_size(elf->base) == 4 ?
+			 sizeof(Elf32_Sym) : sizeof(Elf64_Sym);
+
+	if (entsize < minsize)
+		return true;
+
+	return offset > elf->size || elf->size - offset < size;
+}
+
 /*
  * Open an ELF file and map it read-only, locating its section headers, section
  * names and symbol table which are populated in the elf out parameter.
@@ -324,6 +344,12 @@ int elf_open_ro(char const *fname, uint32_t types, struct elf_file *elf)
 		return -1;
 	}
 
+	if (elf_symtab_out_of_range(elf)) {
+		fprintf(stderr, "%s: symbol table out of range\n", fname);
+		elf_close(elf);
+		return -1;
+	}
+
 	if (shdr_link(elf->symtab) >= elf->shnum) {
 		fprintf(stderr, "%s: symbol table has no string table\n", fname);
 		elf_close(elf);
-- 
2.34.1


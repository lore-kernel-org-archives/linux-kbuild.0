Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DABB125A0
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 00:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368202; cv=none; b=B/WGZdLoTaSn1Dtd1avX2XS0bqS+AFK54BipimBllv9MGPPFLqTTmSZeJzmidxjqPzKiSOidChNoumwwQkJNOVclvK20ffdBBjDP1BFLxy3OmDBHHP/M5ZsYYE7VNKcP/hXNGS949udhrYkaAwAG58q84sqJnQCpMiFn0tGbxJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368202; c=relaxed/simple;
	bh=Trc5MacUoIWMt9S9JC6roHzobYc4LYrAnPcMW5DbqRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MGPKHItHzWhcmiRUpnovyNq49lptDzN9BuVOXPvcgJ4+5O+m18DVBst/qJ+4DbPIh67bc+HTDXxWs3nR1KIt7419JFXVYnB2HDjXqh2i86ZQCPPMi0FJxDkuCreXeKxXEgoDzc0Zfak1eLoBzq4pibaHbysWPMlMk+wo64hrA7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r6IJR17T; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r6IJR17T"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4af81963f35so887040b6e.0
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2026 17:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368199; x=1792972999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4K2X5GJGTiThr22yM8KrVu2dGvAZ7aM/q0eb6OUgy4=;
        b=r6IJR17TZZAA/DBKgGHa9X+cxuhR+QO2MQ+POgDUClrSZqFRp3euHVtj/EVmLDXeoF
         khsP94rRUYO2fL/JC6LC7Wg9lAf7lFdYLk/t9GFdvQHiAwbnkHoHsQY8zZI6nulFZBXH
         u+xy2GX0tiwJlmhctQ9sCixIFkXag8+JhlIoWjN2FhR63WFvlcO/y7TfHqu9SSXdc36n
         EfoaXXOYMhbRzF49ySss9KNPc24Rx92y+CjWCvfQfL3ePERfHJQopSBD7ttgtr456ddM
         cc/oOaAr2SP8ColzZLGNtCVjbCEPIzrzqePt+KXob+e5hIYpBXj2MjpHqdB7hj8WQCzQ
         B3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368199; x=1792972999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4K2X5GJGTiThr22yM8KrVu2dGvAZ7aM/q0eb6OUgy4=;
        b=WHkTSMJaX3O52PsmRVeUn9VWaM4HTjKD+11fnSeBRGmFkBTOFeWjTdA5baUUgvm1SB
         igzAOG/SQgi+sPvy1rZI3/4QNmg7MdyCj0jEXPIA8ztkbmfdo0o7VWZiriYoM9+rZs9S
         4ZY8CBuzMuuTkShyqX1FNUIc7FYN1t+CZaIis2AGYhhl/gu09xZO/0U9771NlB1Nh1fR
         lvWmrEZzgF0w3FxHfY7yiCZ3uDpGpD8t4gqn5XTXfb65N8VUAPqrQEbuGBHnUQXvDfVb
         avqk0v+xHUgJD1msYEIaMLDuIZf6i9Cjg0L9WKqDNYZCrl/I53fvt1sNaiS+K03CpJ8+
         0tHw==
X-Gm-Message-State: AFq9FYK/a3gxG/lR9orJ2Wn3jbsJ7Jh45KdrvP3RXlrc/k9c7Y6rGquz
	4CZjabmfagW/Eea2BOE1v8RQVlZChkSzj9P384nuLQtJ1a72mYFxhy73
X-Gm-Gg: AYBFou24dfZiuwIFAtTsjyE9L41CaddrZswPfHmIcj2M31GdC6xpc4QINRPYAst4mCq
	OI0Ecyuog6zb5i23utRD1m3XN56A+GTXouEu2RUuZj0TsrNzddwuO8g6MergAYaSRVo5Khd/fOp
	52uLl0SYmLSUMYVupQ9s2eI+PeUZyvd39r4UrY32vmkfqoFu948ALKdHweqOeLe726fR7fUDZfA
	NiHSyv/Pq9WngpslfIMbriU8Ga3gtJyR7oCuFAUn79kDxmo+K5se7Eig82ip6mLotUYltUsqqAx
	F+dvhhZjxW6nHrjRisXFWwNFTkwDjg9oOOv2IHyT2rE4NazrWyo3Dgvz6kAGCc+yF0fbr7/t0da
	w7IFPD6CYBn/xaEKC1tNkfv4qVcDVdKLaZiaUTge+4sQHeCXtswJ5B0r2OgqS5gQWR9N44zowGc
	5UMTXzd2XPVJACReukzF5ucadozCZCFJ2SaTsrgk+NoGxDB8QDJC0ngfehBYdNj6FnY34vcpIXE
	3heIn7D1K8O
X-Received: by 2002:a05:6808:1787:b0:4f4:be18:5de2 with SMTP id 5614622812f47-53ccd9ba696mr5122711b6e.13.1792368198784;
        Sun, 18 Oct 2026 17:03:18 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388d8ab165sm5811806b6e.11.2026.10.18.17.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:03:17 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	ljs@kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 2/5] elf-parse: check that the section header table is inside the file
Date: Sun, 18 Oct 2026 19:02:15 -0500
Message-Id: <20261019000218.3977398-3-lzsx618@gmail.com>
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

elf_parse() validates e_ehsize and e_shentsize, and nothing else. The
section header table that every caller then walks is described entirely
by unchecked file data, so a truncated or corrupted object makes the
parser read outside the mapping:

 - a file shorter than one ELF header is read past its end, since e_type
   at offset 16 and e_ehsize at 52/54 are read before any length check;
 - e_shoff may point anywhere, including far past the end of the file;
 - e_shnum may claim more sections than the file can hold;
 - e_shstrndx may name a section that does not exist.

elf_map() hands the mapping to sorttable and tracepoint-update, which
index the table directly, and elf_open_ro() does the same for kallsyms,
so all three tools fault on the same inputs.

Found by fuzzing the host ELF tools with mutated object files under
ASan/UBSan. Each reproducer below changes one field of an otherwise
valid file; the sanitizer output is from host tools built with
-fsanitize=address,undefined:

  e_shoff = filesize + 0x1000 (offset 0x28)
    ./kallsyms --sysmap=/dev/null t.elf
    ERROR: AddressSanitizer: unknown-crash on address 0x7f914e32cbdc
      #0 in __get_unaligned_le32 tools/include/tools/le_byteshift.h:14
         (reading sh_type of section 0)
    ./sorttable t.elf   -- same
  e_shnum = 0xffff (offset 0x3c)
    ./sorttable t.elf
    ERROR: AddressSanitizer: unknown-crash on address 0x7f64023b8000
      #0 in __get_unaligned_le32 tools/include/tools/le_byteshift.h:14
    ./tracepoint-update t.o
    ERROR: AddressSanitizer: SEGV on unknown address 0x7f9fc264db28
      #0 in strcmp
  e_shstrndx = 0xfff0 (offset 0x3e)
    ./tracepoint-update t.o
    ERROR: AddressSanitizer: SEGV on unknown address 0x7f0f83b29544
      #0 in __get_unaligned_le32 tools/include/tools/le_byteshift.h:14

Pass the mapped size down to elf_parse() and reject a file that cannot
hold its own ELF header, a section header table that does not fit in the
mapping, and a section name index outside the table. The division keeps
the extent check free of overflow. A count of SHN_UNDEF means the real
count lives in section 0, so one entry must still be present; resolving
that count, and the SHN_XINDEX name index, stays with elf_open_ro().

The three tools keep accepting the objects they accepted before: a
vmlinux, a shared object and a .o built from the same source are parsed
unchanged, and the reproducers above now print one line and exit 1.

Fixes: b055f4c431e3 ("sorttable: Move ELF parsing into scripts/elf-parse.[ch]")
Assisted-by: LLM ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/elf-parse.c | 44 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
index 9e7d1a4f263f..0e16a9cf67f4 100644
--- a/scripts/elf-parse.c
+++ b/scripts/elf-parse.c
@@ -58,10 +58,17 @@ static void *map_file(char const *fname, size_t *size, bool writable)
 	return addr;
 }
 
-static int elf_parse(const char *fname, void *addr, uint32_t types)
+static int elf_parse(const char *fname, void *addr, size_t size, uint32_t types)
 {
 	Elf_Ehdr *ehdr = addr;
-	uint16_t type;
+	size_t shoff, shentsize, shnum;
+	uint16_t type, shstrndx;
+
+	/* Every field read below lives in the smaller of the two headers. */
+	if (size < sizeof(Elf32_Ehdr)) {
+		fprintf(stderr, "ELF file too short: %s\n", fname);
+		return -1;
+	}
 
 	if (memcmp(ELFMAG, ehdr->e32.e_ident, SELFMAG) != 0 ||
 	    ehdr->e32.e_ident[EI_VERSION] != EV_CURRENT) {
@@ -153,7 +160,8 @@ static int elf_parse(const char *fname, void *addr, uint32_t types)
 		elf_parser.rela_addend		= rela64_addend;
 		elf_parser.rela_write_addend	= rela64_write_addend;
 
-		if (elf_parser.r2(&ehdr->e64.e_ehsize) != sizeof(Elf64_Ehdr) ||
+		if (size < sizeof(Elf64_Ehdr) ||
+		    elf_parser.r2(&ehdr->e64.e_ehsize) != sizeof(Elf64_Ehdr) ||
 		    elf_parser.r2(&ehdr->e64.e_shentsize) != sizeof(Elf64_Shdr)) {
 			fprintf(stderr,
 				"unrecognized ET_EXEC/ET_DYN file: %s\n",
@@ -168,6 +176,34 @@ static int elf_parse(const char *fname, void *addr, uint32_t types)
 			ehdr->e32.e_ident[EI_CLASS], fname);
 		return -1;
 	}
+
+	/*
+	 * Everything past here walks the section headers with offsets and
+	 * indices taken from the file, so the table the ELF header describes
+	 * has to be inside the mapping first. e_shnum == 0 means the real
+	 * count lives in section 0, which must then be present to be read.
+	 */
+	shoff = ehdr_shoff(ehdr);
+	shentsize = ehdr_shentsize(ehdr);
+	shnum = ehdr_shnum(ehdr);
+	if (shnum == SHN_UNDEF)
+		shnum = 1;
+	if (shoff > size || shentsize == 0 ||
+	    (size - shoff) / shentsize < shnum) {
+		fprintf(stderr, "ELF section headers out of range: %s\n",
+			fname);
+		return -1;
+	}
+
+	/* SHN_XINDEX defers the index to section 0; elf_open_ro() checks it. */
+	shstrndx = ehdr_shstrndx(ehdr);
+	if (shstrndx != SHN_XINDEX && ehdr_shnum(ehdr) != SHN_UNDEF &&
+	    shstrndx >= ehdr_shnum(ehdr)) {
+		fprintf(stderr, "ELF section name index out of range: %s\n",
+			fname);
+		return -1;
+	}
+
 	return 0;
 }
 
@@ -195,7 +231,7 @@ static void *__elf_map(char const *fname, size_t *size, uint32_t types,
 	if (!addr)
 		return NULL;
 
-	ret = elf_parse(fname, addr, types);
+	ret = elf_parse(fname, addr, *size, types);
 	if (ret < 0) {
 		elf_unmap(addr, *size);
 		return NULL;
-- 
2.34.1


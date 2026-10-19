Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA5B81ACD
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 00:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368244; cv=none; b=MWvEP6WD3Jzx6GwLuFPCLoAT62c8bawtp2ObHB4C84AGkmm8RBMeDeKGJU82h+OxP1q6FoSfbG4dJjddHqJMmxN+Ucy8IuREBYd1XPiKhZ4lGMody0HLsEfk8Zi+psK+Q+0+2RoumLPHTwFb1yTcYG1IJyJ7GA3GXW+mLCg8t4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368244; c=relaxed/simple;
	bh=fhGmOi+B+mpJVwkg/1/RQZQhTqesKGGHBxsF45F2mko=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VlgcuRwFVL+x6a0yC+cTCy9LQgc1c9XYDhFHG1NR3qzP9HCYLjDKjdXTvb5qziv+33Y2rabHp3zqFPs0YgKOzjdAZUhNHnGy3xPmiiZnWamW87PskY1TJdHkjv72K+B+23ho1VDIYO5UWVAH272PJlMp6GdroeO5ZNnwQy8m3og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGG+7NHg; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGG+7NHg"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6df0b02fe91so1958038eaf.0
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2026 17:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368240; x=1792973040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O37gCsfJT8Hx2fi4gGzz4+n+PK8cIKKGym5NM7TZCmI=;
        b=nGG+7NHgvYIqYXkftV/iT5xAr5oJpZ1VuBLKyNiaQqiPLVejMpCpy0a1fpjjvBnoH2
         01TQG5rhmrPeAp0i4tvUMaytRFiHUVAu85+zsv0nUNcdhFAw0EiarDKqCzTo+3IV1/dp
         vrwc/Bxyo+rUWa1SB2XXoY95OSQHMUGM3tcGLmtljznnA8Vq9TCVS240qIWej/HUt1ub
         pWvttJHzw1hmqrkbRO2K3IOgQ+7rS9yeM29H5Rxx2WMkDbwmsqT66oO1kKIz8gIgyX6m
         tAs5GmeX5/cqXqnqPIcTELAJqpyyRaBCQPauGthSq4Qm+i6RV6j/r7E/K8GPDUyxztA+
         ei2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368240; x=1792973040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O37gCsfJT8Hx2fi4gGzz4+n+PK8cIKKGym5NM7TZCmI=;
        b=Yrw5+j6l/GfCIiXYB5tHxI110/PXNVkCQbaqjxxbzGg1jmQkz536pkc8KvQjwrgdei
         uOU8s5S0eqoL9W75SAeFP9zxBqrbJS5lRg2jb1hh4E5aG2XRVaY6Po14sLYjmVsdA3o1
         J4xsjnjOq0zAj3ugbYKA3pbqDVTFvWVVUcpJqh0gPUnH28nzRe6h7AG1Lqu2zBSGLsaR
         2Th7MNUHKd3xLKJ7ligeM/elto7hfIO+RlgyaWJlzIBAPEypqON1w6JBNUME96p6JFX2
         ek2L+Nk4mu5WxmvV2I38o8ib48J+dtUPR74O9ep+OufesXGCJOEICsWghwbSsTGE0yfh
         CQLw==
X-Forwarded-Encrypted: i=1; AKwUvBycPvxO45eCMb41xahnViKGFUYtZBO8u9b3EbbJzx10v5k65ROsyFhEoHgW+7R4lEMHFuwpM29K0Ci3VqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdVtV18Wx+3wMUpjGnBsByexRfeMeDmv6CLRJVWkzXYrt7DrFc
	xiJdmt51qI+BK1vvNCS908PAlR8JCSn3Zg3fBT5eSFdsNxRrKmlL2kzL
X-Gm-Gg: AYBFou0XQHkPGF+jyK1eDvXHHwki6RPGDJT8d9B22d5u9Q94wz/46xP/cXkOidOHPEU
	bkVowUyj5fmyiqS5OGDgl1KlH+3nRSSM6jU5e+6/tpig5Z5N0XA7qS0c9uBpUBpCm7IBc+lyHyS
	GJbeok4X/OdwUr2ajpv60UA0KNt4bRE3WxGykQZreYEV5a+FYWpn9/IhTrfYZW4Nnars15sJ+gT
	PXPkOwZ3psND+tk/b1yJzSBKi+ql5yCfvKad9JybMZk+MeLok6VL53DEOSbxdXI/ZosYkBbo+iF
	+cJckNUWDjjeptOBFz7GRBZvS8LswxnGinIMBTrsCswE2GH0xeD/Ke5g45/Aw1YJIyF/PyBNJNw
	Aas2qTH6FuAWKCRd/xt692PJYNe68bpFhObvN9kOU3yN6bf5qaaH+wd/76vtPUo3gbF0YTqUkOx
	dnRf2jmz44en/lpDwbeWLkKO+teTXkyq66ZK5ChclxNsW59jutuYMdp31yycbaeXodLJ/ioAgmH
	7/t7Vq/kcti
X-Received: by 2002:a4a:ee0e:0:b0:6e1:f7c5:9539 with SMTP id 006d021491bc7-701124b00e0mr5993440eaf.21.1792368240553;
        Sun, 18 Oct 2026 17:04:00 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b7728casm7431833fac.16.2026.10.18.17.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:03:59 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH] sorttable: bound section names by the section name table
Date: Sun, 18 Oct 2026 19:03:44 -0500
Message-Id: <20261019000344.3977701-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_sort() looks up the sections it needs by name:

	secstrings = (const char *)ehdr + shdr_offset(string_sec);
	...
		idx = shdr_name(shdr);
		if (!strcmp(secstrings + idx, "__ex_table"))

sh_name is a 32-bit offset read from the file and nothing bounds it, so one
section header can point the name anywhere and strcmp() reads from there.

Found by fuzzing the host ELF tools with mutated object files under
ASan/UBSan. Reproducer, setting only sh_name of section 1 in an otherwise
valid vmlinux:

  $ python3 -c 'import struct
  d = bytearray(open("vmlinux","rb").read())
  shoff, = struct.unpack_from("<Q", d, 0x28)
  entsize, = struct.unpack_from("<H", d, 0x3a)
  struct.pack_into("<I", d, shoff + entsize, 0x7ffffff0)
  open("t.elf","wb").write(bytes(d))'

  $ ./sorttable t.elf
  ERROR: AddressSanitizer: SEGV on unknown address 0x7f2555f92911
    #0 in strcmp
    #1 in do_sort scripts/sorttable.c:657

Skip a section whose name offset is outside the name table. Such a section
cannot be one of the four this loop is looking for, so skipping it changes
nothing for a valid object: the reproducer and an unmodified vmlinux now
both print the same "incomplete ORC unwind tables" line and exit 1.

This bounds the index into the table, not the table itself: a name table
whose own sh_offset or sh_size is bogus is a separate gap, and in the
elf_map() path used here there is no mapped size to check it against.

The read predates commit 1091670637be ("scripts/sorttable: Rename
'sortextable' to 'sorttable'"); I could not pin the original commit from a
shallow clone, so there is no Fixes tag.

Assisted-by: LLM ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/sorttable.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 88e49a5c4251..2f72a7710a0c 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -619,6 +619,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 	void *sym_start;
 	void *sym_end;
 	const char *secstrings;
+	uint64_t secstrings_size;
 	const char *strtab;
 	char *extab_image;
 	int sort_need_index;
@@ -645,6 +646,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 		shstrndx = shdr_link(shdr_start);
 	string_sec = get_index(shdr_start, shentsize, shstrndx);
 	secstrings = (const char *)ehdr + shdr_offset(string_sec);
+	secstrings_size = shdr_size(string_sec);
 
 	shnum = ehdr_shnum(ehdr);
 	if (shnum == SHN_UNDEF)
@@ -653,7 +655,10 @@ static int do_sort(Elf_Ehdr *ehdr,
 	for (i = 0; i < shnum; i++) {
 		Elf_Shdr *shdr = get_index(shdr_start, shentsize, i);
 
+		/* sh_name is a file-supplied offset into the name table. */
 		idx = shdr_name(shdr);
+		if ((uint32_t)idx >= secstrings_size)
+			continue;
 		if (!strcmp(secstrings + idx, "__ex_table"))
 			extab_sec = shdr;
 		if (!strcmp(secstrings + idx, ".symtab"))
-- 
2.34.1


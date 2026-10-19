Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DE141A8F
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 00:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368206; cv=none; b=P4een7S+PU2I55gpRWRo9lTtNfo++qSovUx8egNTJQTv6KyaMsgu5U+keuL0cGWbt7Tm9YRFaQBtWau3gKjC8T6FtwcnbazgW03jtEV1mXxW7H0IV5pbiWIjiPl6tECuySvQSyU12gutQEbALLNf8EYx2K9TcDOHNIUsxTsKGOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368206; c=relaxed/simple;
	bh=CmIIrzJ7Uun//yJKq+031MJwO9Y+GMeiK4+3nQuypvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JKuNCd9MaQZGiorVOTPkgqCnz2NgAZad5e81Xw7SACgyC7foTdkDQznv3AXtw1XR2W131xXECYM8jVJK2msSjWDfsIQ+tn6Su/nMWyzJ8ku9lxlo5KVhVmic8HxzWxjBJ4dKsIDu6V3L+u4ZdEnG7qjfvzGsZ/PmPkUkuaDwDZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ndx9tlTc; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ndx9tlTc"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-81ba09a5d23so1234840a34.3
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2026 17:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368204; x=1792973004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKbDNWvWGa3cmJaCEBLpZ7m9ikh3MZG7EdE2bkW0TU8=;
        b=Ndx9tlTc6PsKSbEZimM1p9qaIR8UUxi6tXHKiVdjZC0q3YUYGrZNzPatdjVnnVzhjI
         ZBsshz6TXaV5gaUkUgcocAOFn8tXWAQ/maTs5y21yWZDd+xKIaInfNwlVL2z5LTIuUCq
         C/unShZHONzSb8YraYuvhXNoZCXXnMxG5e88Cxlxrpp8g3vIXHZpzJHQyXRN5qG/dDI7
         7VIjT60thfa7Ihg6ApB6RtF8ROSx78CyhitBh3wmnUAx4blbmXLfw1X/Yo3xLSMQHf2P
         mAJNpZuYldOhMITqKnhSLRp4pxj9J1KZHg1QwGJfmY0h4DFs9oE922MxB2sV8P91mi9P
         DY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368204; x=1792973004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKbDNWvWGa3cmJaCEBLpZ7m9ikh3MZG7EdE2bkW0TU8=;
        b=1lsVh8+Tq2ASi71VfQjZCCrlZOb3ju1hIZoU3SP54/BYY1JF+E9/TfnkGGuUZpImxb
         6qIk1Y0+V/AisCqj/99eq3F7oIXnc6YJnPhXfhC+qEgMpsMFhWsF3wZwsu45iaYo7Wqw
         tqQzHfOhbzkYQx6lnlx8sSObyCkfeEm9FFQ2BvMtp8kCVK8GeFUZmJL980qoNp3dQ1TE
         SL3h5ftuK05khnJg/p2Vcz9NUIniLELn2uQsr/5UZsqJcPwlvUxHuqwfODfiNCZGWR30
         lp4PYO+8sWJOP7SjBGgiRoF6Ui/6r3Ld066r0jtDna1tf4Ky950IpuxbpV5MyS3f+TV/
         fkIQ==
X-Gm-Message-State: AFq9FYLQ23Ah7eCsBv8Y8AneNGPNWO6XPXGTC61Ir1C7B4qtwVhuxu8n
	1XwzAYiNx4nno76W7XMWwvT8yr3y6x/1kW1N7pW0dhAfJafuyoGl4KTV
X-Gm-Gg: AYBFou0vxv60kUH89mYpimgB3q0WHlMUgCtv3GUv3YAg1vkP5Q9QdKMlPGN3lqS8Q+s
	7EfJY4ih7lOl3oravFU4gcwR6YGL1XmGGcF8KeZQS26sPrPXOxJZHH29K5G6Ijmx1b84fH7FACx
	q5JMq7poYy6Afshi7mj9c2f2sy+YYqeYOqwlvXX9SGTP164z725e2/pQPJQUrH/20Oz1A1aoeQT
	fyEgRPz9rO4juBIT4N1ZgYrJHT8KJ01RZ3106OhUq6KW5r+UUscOPmmgMhWa48HUotOfXLzzB9j
	BYzS3MrQmbjclh7RI0aZBm8Asy1d6WtkrK1Vy86PL1fw28AuekhBFYIbw+yoH4A148RatddCP6u
	EvkLHkQE5kYxsgjkWjhqvSgCssgTgzDwvG9j1+Z2p7gy82QkVDSXdL74WglEBLPJeWsazUaap5+
	0A5FvWXXpsS0PIemQbFZWrzzCkiEiwGRBWm4sIdOdVkv77hHyymlWX5VivXfjt+dPPi/B3AaUvc
	9Yhqf3pdbtF
X-Received: by 2002:a05:6808:67c6:b0:4d7:2721:cfb0 with SMTP id 5614622812f47-53cd42a3861mr5563592b6e.31.1792368204306;
        Sun, 18 Oct 2026 17:03:24 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388d8ab165sm5811806b6e.11.2026.10.18.17.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:03:23 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	ljs@kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 3/5] elf-parse: check the section indices that elf_open_ro() takes from the file
Date: Sun, 18 Oct 2026 19:02:16 -0500
Message-Id: <20261019000218.3977398-4-lzsx618@gmail.com>
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

elf_open_ro() resolves two values that the ELF header can delegate to
section 0 -- the section count when e_shnum is SHN_UNDEF, and the section
name index when e_shstrndx is SHN_XINDEX -- and then looks up the string
table of the symbol table through its sh_link. None of the three is
checked, so each one indexes the section header table with a value taken
straight from the file.

Found by fuzzing the host ELF tools with mutated object files under
ASan/UBSan. Setting only the sh_link of the symbol table in an otherwise
valid vmlinux (the strtab index it resolves):

  ./kallsyms --sysmap=/dev/null t.elf
  ERROR: AddressSanitizer: SEGV on unknown address
    #0 in strncmp
    #1 in sysmap_omits scripts/kallsyms-sysmap.c
  -- elf->strtab points outside the mapping, and every symbol name is
     then read through it.

With the preceding patch in place the header-supplied count and index
are already rejected before this point; the values that come out of
section 0 are not, which is what this adds, together with the sh_link of
the symbol table. elf_shnum_out_of_range() repeats the extent check from
elf_parse() against the count actually in use.

The reproducer now prints "symbol table has no string table" and exits
1, and a vmlinux and a shared object are still read unchanged.

This code is only in linux-next, from the "kbuild: significantly speed
up kernel builds" series, so there is no mainline commit to reference in
a Fixes tag.

Assisted-by: LLM ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/elf-parse.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
index 0e16a9cf67f4..39ac25ddf188 100644
--- a/scripts/elf-parse.c
+++ b/scripts/elf-parse.c
@@ -256,6 +256,21 @@ void elf_unmap(void *addr, size_t size)
 	munmap(addr, size);
 }
 
+/*
+ * True when the section header count does not fit in the mapping. The count
+ * can come from section 0, so it is not covered by the header check in
+ * elf_parse().
+ */
+static bool elf_shnum_out_of_range(const struct elf_file *elf)
+{
+	size_t shoff = (size_t)(elf->shdrs - (const char *)elf->base);
+
+	if (!elf->shnum || !elf->shentsize || shoff > elf->size)
+		return true;
+
+	return (elf->size - shoff) / elf->shentsize < elf->shnum;
+}
+
 /*
  * Open an ELF file and map it read-only, locating its section headers, section
  * names and symbol table which are populated in the elf out parameter.
@@ -285,6 +300,17 @@ int elf_open_ro(char const *fname, uint32_t types, struct elf_file *elf)
 	shstrndx = ehdr_shstrndx(ehdr);
 	if (shstrndx == SHN_XINDEX)
 		shstrndx = shdr_link(first);
+
+	/*
+	 * elf_parse() checked the count and the name index carried by the ELF
+	 * header, but both can instead come from section 0, and that index is
+	 * unchecked. Recheck whatever was actually used.
+	 */
+	if (elf_shnum_out_of_range(elf) || shstrndx >= elf->shnum) {
+		fprintf(stderr, "%s: ELF section headers out of range\n", fname);
+		elf_close(elf);
+		return -1;
+	}
 	elf->shstrtab = (const char *)elf->base +
 			shdr_offset(elf_section(elf, shstrndx));
 
@@ -298,6 +324,11 @@ int elf_open_ro(char const *fname, uint32_t types, struct elf_file *elf)
 		return -1;
 	}
 
+	if (shdr_link(elf->symtab) >= elf->shnum) {
+		fprintf(stderr, "%s: symbol table has no string table\n", fname);
+		elf_close(elf);
+		return -1;
+	}
 	elf->strtab = (const char *)elf->base +
 		      shdr_offset(elf_section(elf, shdr_link(elf->symtab)));
 	elf->nr_syms = shdr_size(elf->symtab) / shdr_entsize(elf->symtab);
-- 
2.34.1


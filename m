Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911673;
	b=zhO7Z8qBZyyw7n4F6NfPJn67NGFUkUjbdpnnxqpYUuuR9dYR/nAsig+HG8/qPXVAQ9rC
	 RlhhQO0M/p0PJc1F3uG0/SatB3HR1VQ/pbnnzjwAhKAxbKRUWnnHt5+WDajvwPBamMVeL
	 oOz4KE9wGg0OxHWCDNYOe0Ec3MXnmBsLqDfUvGhWxABaJpvzX2WaF8etsqKGhe4l6V3Mn
	 NQVrx1OPlO6BSiUKbR31FOhAZKCttqrW/UOI/hMDL1YdWYtICNU+GGbSDsiPW0ML19FJo
	 gH0yVlEFnd3yZDe6jM2evk5RrXCPFPGL8MyB/HKgbkADMfwAFnWzPVj+lw6lJC50rXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911673;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ocZ/46a5ph+IliKAbBgAKYE9a/QLwfo6JXh2Uy8J9xw=;
	b=aPN2e/L5ymRNQXH1x6FRuhTi/iBsNIvYxlPp7e3+ivJ8JyJ02bfZBn8cN5uVd8Xzk9zZ
	 TN431hl6CeCL4nTq8eYcJmn/TDBeezPTogKF9tXL8g7NUJVHxBUZEpgxSHhPav9avCSS9
	 l5CFqh+8H3d3gnC/AAI/8E5TvskScfvHVvsHrUCU39oSeZ3D4fKqHkZTLtAsdtfXcFW/j
	 egNgM/KuAHwMDT/+uFUU+rpgq4b3ebRIk6fJJ0CZh08Y3NL6n+Xn4bn56dVmcKH32kMkI
	 m6o89o3BPq3/bVhxdLpvs4fYGl8K98dIre1/8ZOoln4+WaeJPDmZnJxxlF6L2Opbeyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=runbox.com;
	dkim=pass header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b="Soe9/nM2";
	arc=none smtp.remote-ip=185.226.149.38
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363A2606A330;
	Tue, 17 Nov 2026 10:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 363A2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b=Soe9/nM2
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xTGW8-002Ljq-30; Tue, 17 Nov 2026 11:34:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=ocZ/46a5ph+IliKAbBgAKYE9a/QLwfo6JXh2Uy8J9xw=; b=Soe9/nM2GGKaLIEMBSSo9TrYuX
	s6r/WKHrjtZ/40Z8msgZrlcT/PtRQ34N9Sf7g06j1cYgcrPmEyw1fXw0ZzSE8j2yYVi9heF+hZQUT
	fbS5/zpeJqXF9BHPdxpicWi5zWEe+Pw8/X/3sGx4+qTDHBqWEY8jFVZbNBSB8rf91zbjOxCRue7vh
	Uv+sZ3fZZOmL1RXuPHglUj+pFs+UQR3s5iauLNLjNalIrCirvXCM2QZFTVMGwHjhbh81FrHabq0Fr
	mXkWN4vCSYSWr15VMU85pp6e/KZtapM6qXVyZ2/LfBraNxb0SKdWjUMcdo3nhVkG/9Fshsctts/la
	IeDqzZ4g==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xTGW2-0002fE-Fo; Tue, 17 Nov 2026 11:34:18 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xTGVl-005qHU-E1;
	Tue, 17 Nov 2026 11:34:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Petr Mladek <pmladek@suse.com>,
	Kees Cook <kees@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	bpf@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Samuel Wu <wusamuel@google.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 next 03/13] scripts/elf-parse: add elf_map_big_endian() helper
Date: Tue, 17 Nov 2026 10:33:42 +0000
Message-Id: <20261117103352.1244657-4-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117103352.1244657-1-david.laight.linux@gmail.com>
References: <20261117103352.1244657-1-david.laight.linux@gmail.com>
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

Returns 1 for big-endian, 0 for little-endian.
While the tools are compiled for a specific architecture the target
endianness isn't easily obtainable.

Use 'const Elf_Ehdr *ehdr' for the argument, change the argument of the
very similar elf_map_machine() and elf_map_long_size() to be the same.
All the callers either pass the correct type or 'void *'.

Will be used by kallsyms.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---

New patch for v3, unchanged in v4.

 scripts/elf-parse.c | 13 +++++++------
 scripts/elf-parse.h |  5 +++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
index ce1c2a670244..24d99ab9adc0 100644
--- a/scripts/elf-parse.c
+++ b/scripts/elf-parse.c
@@ -170,20 +170,21 @@ static int elf_parse(const char *fname, void *addr, uint32_t types)
 	return 0;
 }
 
-int elf_map_machine(void *addr)
+int elf_map_machine(const Elf_Ehdr *ehdr)
 {
-	Elf_Ehdr *ehdr = addr;
-
 	return elf_parser.r2(&ehdr->e32.e_machine);
 }
 
-int elf_map_long_size(void *addr)
+int elf_map_long_size(const Elf_Ehdr *ehdr)
 {
-	Elf_Ehdr *ehdr = addr;
-
 	return ehdr->e32.e_ident[EI_CLASS] == ELFCLASS32 ? 4 : 8;
 }
 
+int elf_map_big_endian(const Elf_Ehdr *ehdr)
+{
+	return ehdr->e32.e_ident[EI_DATA] ==  ELFDATA2MSB;
+}
+
 static void *__elf_map(char const *fname, size_t *size, uint32_t types,
 		       bool writable)
 {
diff --git a/scripts/elf-parse.h b/scripts/elf-parse.h
index c5ad754da254..72c78da5cb3a 100644
--- a/scripts/elf-parse.h
+++ b/scripts/elf-parse.h
@@ -318,8 +318,9 @@ static inline void w8le(uint64_t val, uint64_t *x)
 void *elf_map(char const *fname, size_t *size, uint32_t types);
 void *elf_map_ro(char const *fname, size_t *size, uint32_t types);
 void elf_unmap(void *addr, size_t size);
-int elf_map_machine(void *addr);
-int elf_map_long_size(void *addr);
+int elf_map_machine(const Elf_Ehdr *ehdr);
+int elf_map_long_size(const Elf_Ehdr *ehdr);
+int elf_map_big_endian(const Elf_Ehdr *ehdr);
 
 /* A mapped file with its section headers, section names and symbol table. */
 struct elf_file {
-- 
2.39.5


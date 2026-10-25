Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792889120;
	b=e0uFlr6K5ioduQlrWI8Wjrpk4FmIZFgkTyJX9ph8HCihTkVqu1qXiYLB376hA03ALQmp
	 Sh5qlcVByaGBwDDegGWIQh3uQiufAoCiZAwO1af2yN1B3dYkvNH7UaNBQMH8SgURpFKIJ
	 6jeA6bt5YjUWC8oHmoBbBpPbd9HKP2bhSAQ93bMSoYosfYDsHOdWq9ioW7m4+FZB60Prw
	 XmypXUR13SbpVv1DjgUFutJSliWw9rq23DziacbAKWDxUy8Z6qEAXrSq8yQUSXh9Q116h
	 e2yq3j4D3XRjAhLBeP2+eoQTC+Ez4PH58ExGU+U5gZlFLrjBMGrARv1/xKjLokxEM6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792889120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zG8r7n5adPzuOqWBUaQLE4ST6ZHXuDXXcUP0nYBbPM0=;
	b=znEdPWVQ28nMMqjZ8ILdL6FZp25K5rDZlcYWKDJlr5ZLPdiMhtR8phCpTM6bZKC9kkOo
	 alfPXaYyyas/1GMZ1/zkSImWWLzvrXJuE8foB5ygsszCMMQnEYrmm8h9Wxsfd1NPRGeoh
	 xXLrri3KLB3lC0FHScC6lZNaZtads1hfguounrvZL6mjiOZ59XVmBj8tksEpA8RaXXnc6
	 MIcpfWyguZ5m43nWfPATYibxF2/aN9dnkX/Dew9+jvrmcZTjWsa1DW+9QvmZH9fX16CNB
	 KBxRlLV21GFG2QB7CtsIULaVPhiFeiv2vBDpJELxKaoiNcp38RoD+BkuOyo/sT1Xliw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RYDu5ad2;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F404B606A324
	for <linux-kbuild@vger.kernel.org>; Sun, 25 Oct 2026 00:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F404B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RYDu5ad2
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-483d290f398so1165197fac.2
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 17:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792889119; x=1793493919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zG8r7n5adPzuOqWBUaQLE4ST6ZHXuDXXcUP0nYBbPM0=;
        b=RYDu5ad27CZ/qaXiTHxKhU9GnIvlaaCG5KHSOcv0GgWGsb8l2wGJDz7fX+vwzzWd5e
         mMskqr6niv71jVe9W37SOUGIoZd6B7JZZ7jzDn+UGj1ZgVvMUSfMVAA3nUN/uRpTIOjo
         sEB3eb1Vms4P+eQDEocprxkAh1mwI9/3drANeyWyNN8UPfsKf4/RXuTFxFgNGXp9Y/QT
         2l2Zw47abGDRwSzanB2sOVkoCKQro0jlGjQINhv6ZU5PpWRwzcihylJPe1tdqVaU82Eo
         OvLNZszqxSidHfbDutJdazwyjvIjPJeoyFQeD7Lf2jn+g0Ywppjo/lt83PZpihPWT1g4
         YLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792889119; x=1793493919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zG8r7n5adPzuOqWBUaQLE4ST6ZHXuDXXcUP0nYBbPM0=;
        b=Qt4L8ch5c5NizuOx5CYHHekYb2GUBiSKE2kbHMV3RTonNdlmwRhB0y+CHxwxEl9bHt
         QtuW8tYT6zcD8vwk3hGChdxwnapnuJguCzY+n6L9q8VXrW5JduCrma94ubi2YNSuhpK0
         EGVa8wzEAIkJZe88AcNPV2ksiFeY+TieQDZrPKvd03/EcYonOvZp7zNzcZ7jjXIlMnig
         7NVlNg5xHmtPKmQOo+OmmC18yzZDwQ4UQmhCpdVcVEHx3FG1KFYiqMxt4Vfut67xwoA7
         8ZQehbUVIuj0PqEoO3i7Z24aPPUlPJXaLEAxpQeKz7QF/qdraQCYuXO/GagWS/JDckYz
         0YoQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6V+gA9Gwgph8pZ+xxePZ2waoFLyLCZdLUlPVw/frUQfSUgGJ/wTOcl4CwqLlaA8JhKF28JyVvVggfkkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN+1cp9ruM3kchbWl4YgE22EEURV3cIXCt57BHxCkFAjIqleEU
	A/gON+MWfUOgkPntW8cWyy5EOD4K6PauWE+5VYBtbMJiOJQZGj2LlPkFT60Jcw==
X-Gm-Gg: AYBFou0jzMLPtA9Yh21dZ72zTjKEoYQ2YDRiYdJLr1gc6SZKw7MJ7M5fi0OKwtmETHf
	4lfKW3fcGFcImgNZp78AmMVI13J8CE1hWJF2xvvA/+Ft+/mx0XkEiJxGTl326+FgQ6n10bl+Axy
	0LlB3A4v2TDqZMPSl7jiACdagHg8OwN8AiaowUxiE1dXwR82NF4iyYYkj2gR2iBRp8yMpZGLOcm
	L1KCYYF0tz2qKf6WIUZ5NiO4h3u3ERfmm3jwcK0w+PlAdUY9G70VHvVB125ZXzhO17IwUewJbLy
	CMH/U77PpTw5WDw/ASHdVSZyo7xzjuPcPnFXvFENBwygWjM6qCNsUEq3/qNdAxovH90ztBAIAwH
	SfL++3z6c+yxztkE6knO0OStOYF+mtA8V1CEpRMh0Ar3RGYq7qoGxUEOfIHnXXZac3J3zqBjZfR
	2hkvH8Z4PrcapE5dzBmaEKqG3DrdvUijdynG0hxujDpiKQU6x1p5/yitSrtvdXBpJQ8V/UuP32L
	W1MEQGPrff8Wd75k8lUMn4fjMDWQJorCXoIK+LFnK3qLiYUiHii28JL9p3Ra1olnjYP4A==
X-Received: by 2002:a05:6870:3196:b0:4a6:f698:df8f with SMTP id 586e51a60fabf-4a83f5f099bmr2252359fac.42.1792889118900;
        Sat, 24 Oct 2026 17:45:18 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a84322d21asm1943245fac.16.2026.10.24.17.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 17:45:17 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH v2] elf-parse: avoid an undefined shift when checking the ELF type
Date: Sat, 24 Oct 2026 19:44:40 -0500
Message-Id: <20261025004440.432272-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019084749.03c4386b@gandalf.local.home>
References: <20261019084749.03c4386b@gandalf.local.home>
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

elf_parse() takes a bitmap of permitted ELF types and tests it with

	type = elf_parser.r2(&ehdr->e32.e_type);
	if (!((1 << type) & types)) {

e_type is a 16-bit field read straight out of the file, so a type of 32
or more shifts by at least the width of int and the result is undefined;
31 shifts into the sign bit. All three users of the parser -- kallsyms,
sorttable and tracepoint-update -- reach this with e_type unvalidated.

Found by fuzzing the host ELF tools with mutated object files under
ASan/UBSan. Reproducer, on any vmlinux (or any ET_REL object for
tracepoint-update), setting only e_type:

  $ python3 -c 'import struct
  d = bytearray(open("vmlinux","rb").read())
  struct.pack_into("<H", d, 0x10, 40)
  open("t.elf","wb").write(bytes(d))'

  $ ./kallsyms --sysmap=/dev/null t.elf
  scripts/elf-parse.c:94:11: runtime error: shift exponent 40 is too
  large for 32-bit type 'int'
      #0 in elf_parse scripts/elf-parse.c:94

(host tools built with -fsanitize=address,undefined)

This does not need a corrupt file. include/uapi/linux/elf.h itself
declares legitimate types above 32:

	#define ET_LOPROC 0xff00
	#define ET_HIPROC 0xffff

so any processor-specific object -- and the 0xfe00..0xfeff OS-specific
range the ELF spec reserves alongside it -- shifts out of range here
while being a perfectly well-formed file. The tools would reject such an
object either way; the point is that they currently reach that decision
through undefined behaviour.

Reject a type that cannot be in the bitmap, and shift an unsigned 1 so
that a type of 31 stays defined. No valid object changes behaviour: every
ET_* value the callers put in the bitmap is far below 32, and a file with
a larger e_type already took the error path -- it just took it through
undefined behaviour.

Fixes: b055f4c431e3 ("sorttable: Move ELF parsing into scripts/elf-parse.[ch]")
Assisted-by: LLM ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - drop the inline comment (Steven Rostedt)
 - note that ET_LOPROC/ET_HIPROC make this reachable from a well-formed
   object, so it does not rest on the fuzzer finding it
---
 scripts/elf-parse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
index ce1c2a670244..f02dc377e841 100644
--- a/scripts/elf-parse.c
+++ b/scripts/elf-parse.c
@@ -91,7 +91,7 @@ static int elf_parse(const char *fname, void *addr, uint32_t types)
 	}
 
 	type = elf_parser.r2(&ehdr->e32.e_type);
-	if (!((1 << type) & types)) {
+	if (type >= 32 || !((1U << type) & types)) {
 		fprintf(stderr, "Invalid ELF type file %s\n", fname);
 		return -1;
 	}
-- 
2.34.1


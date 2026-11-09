Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268854;
	b=bJ6efSdSdehBK9lPeZZqB01gop8+bwAri4wGYXoeDdsYFLjd1AwT868tkKllwZgvpyrg
	 5zf30SRFLQ0bQ0sthycp8InkOXEQvXHsss0KFFF8BF+v+lfM3trDeEZrkMb2b+IyGaHop
	 HX95rOcJcAQWPBkJzBwszc90TWOjjmBpUDHgASDKeSMBpGOInSzL0zo/hHv51EsuVLfHH
	 HVWX5gWzoPVGk3CcQz6Rd8tkNqMV0dovC4Yx7M01b5V8rWqZ7BJsXctaE9L5eUryhuc9I
	 /mrKmOhot+ycx+1j8oZA7Nf+Ow2shDZl2XuSu7cCAPS/QPVk2GeDyBdaZb1J5Ly1IyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WFJKTttb+9w1SToDPMlK+ZhvhJNtUsRWKsncaoz5Paw=;
	b=X3bosod+oNh5Kw1LlWslthoaVUNfdmV7Yq9Pbq8jzDc+Iurd7l5UtYtdLbOokGIUzCgj
	 1IlfOKDRexYd8S2ssgEUD7gI62AqNh/lODcToWGN3nvyDfUDrPLRr/JlvUynBb/wrosFw
	 d0Xiy1WWgnDUpHFEpDj9/S2unrLT5foVKLC9qZoDWl8HThfNu3D+dBphDjpvYH8/Jbxv8
	 eNd38P1fabzZptdj3f6g7mx7KVke9gViwNVOEW1fmhNEyV5l8Bpq9p/q4zpwonS5rV47I
	 z/4H0s63P+P38oRr6uHmF5+Qi2QXnX6KTXPEF1yBSRzKm0p23BHHCXnIanO/LxcfogQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXUCJciS;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BA6606A321
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 00:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18BA6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXUCJciS
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-53aa0802881so678069b6e.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Nov 2026 16:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268853; x=1794873653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WFJKTttb+9w1SToDPMlK+ZhvhJNtUsRWKsncaoz5Paw=;
        b=qXUCJciSL9bZkBJ8qtcVkDNIjvWdze1sW84sQMktjsWURrnxFYKdmz3ahEboofMG+p
         SUtaHq3s2NhtRv+mp5UzikLrXYJfNM/5pWAf084oiHiSQVdqPZVlBeW/HXvtdB0kiETm
         PSWkCi4CIg+Mx58fk9YM/EV/uQKhI0+a+2rVKziTgvPik4KaS3dYYzhFuRke/Y+kqLKP
         I7luG/hCz1EhMOsTgnwplD6i2Lw8WyCriEK8KAHbONqhqOMssosqH6sPupApOL6nOWSt
         CuENFDS5Z6VMwCL3H3cjn5nkHNfEbRB0hJySzxjmNdvZZZcItMAgNSX5UmmTMzeTRufS
         zUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268853; x=1794873653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFJKTttb+9w1SToDPMlK+ZhvhJNtUsRWKsncaoz5Paw=;
        b=XzE+Z3YFrAopWASJQvv22DMZhYycNxgmdMwRrko4gwpbUj1wdVKPLalLSkIb1EheBv
         UHJV8xG1t3B0bRyvOf7pLKWUJemHGHpwloWKFkk1qEX6NAOpXLhCFwrQm7cOhM2QMA09
         qAXHxU6hEHXygoKka8mRK5WRmC7OtAH9svHSeB1cA8jpR2taymiY8NtO6KRSzlnje0hh
         Pj2qZJSybOE4KklIHDeYPIE9UnCckyPW+io2Y+W9pvXBDqLWCcgpr3Ejx9AKv67Ts/3h
         IpyQ9+thDTKYA2s8LCmW8pf0gkidzdR7PGWVH3WbOs5MDTCBSPdSu5VZzHyAnO+HfDzS
         UyfQ==
X-Forwarded-Encrypted: i=1; AL+hErF10zB6gFk7zITkqdFzeVp6vadW8yfZP8EYATIiJX5Tw+ZveQp9ANVK7BCsFqbaV+OH6Pqna60tldjdtes=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1pJcXXVFSkRul+3UTQIs89y56dJHhDhjUFHYOLEBOWf5TbvUS
	ycIxzj49FuIgtR+0cw4hwXJgpMjYqEqJszc7JzENBjm3hWNJAasBUlLn
X-Gm-Gg: AYBFou2wnq+5lWUk+DYeKezqWY218O/vHBxQjl80xICIU3JBjblXxgtB5SSlLC283Sw
	/FO7+IEBPAXIVBxlrZAAJIQw5haQ2a9ZFHAQ+UYnHeo/Uhwsa4ErrSfsC4hJbAnT4uKVLZ8ytRz
	PddF6vnYwuLSArBo/puotdcL3OZEEjCoUBeEZ8zHuAqsLWom4m245tu4M/WEVxP+MLwtJaCMun8
	pXcL1qfooKoCIax9l7AxotyS4oXtcMhojrqaMda5i8OSvIESkuqCePl1acLwOavuTK8QNs9RwHh
	+hfG5BdyfKsavY4KomDFqPk7qZNR+U32iYyucvYvz23wu9yODXYF8/zGiw406k61yrok6/crZRh
	/Oc7m05Rn42vfD1ohZC5vbGEy+4FFEqlQtJgIif/aLRAfV0r5+bijZFayOdJ4himVrNJQgyDbuh
	Of8L9zuLq/OARntxC0jrvUQ5r0IMPguCvgrNkNIQZywjBIa3l8wem/nPnAQmMZ6DcxE/6NwEtTL
	iDUx1/8LNPJfgZis8x1iNL/sixPJTdriaXrMJS0QN7/ofJjjCBV/DP0lnOT3ZXGt9zcHvDVMKXv
	v4G6rNuJ4RQ+0SviVuLaB+qaf4CtJ0qKsjUcLCSg/GA=
X-Received: by 2002:a05:6808:148e:b0:4e9:69e9:59c3 with SMTP id 5614622812f47-5683df688dcmr796994b6e.67.1794268852828;
        Mon, 09 Nov 2026 16:00:52 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm623697b6e.7.2026.11.09.16.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:00:51 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: masahiroy@kernel.org,
	ardb@kernel.org,
	rostedt@goodmis.org,
	hpa@zytor.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH v3 0/6] kbuild: fix UB hit by normal builds in host tools
Date: Mon,  9 Nov 2026 17:59:57 -0600
Message-Id: <20261110000003.1719966-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This is v3 of the host tool fixes. The main change is what is left in
it: following the feedback on my elf-parse series, I went back over
every patch and kept only the ones a normal build or valid source can
trigger. Each of the six below was re-checked on mainline as of
b23545529c21 (the rc1 rebase changed no code) by doing a plain x86_64
defconfig build (MODVERSIONS and MODULE_SRCVERSION_ALL enabled, 12
modules) with the host tools built with sanitizers, and then rerunning
the same step with the patch applied:

  1/6 genksyms   'int a, f(int);' is valid C and makes genksyms loop
                 forever; 'int a; int f(int);' is fine.
  2/6 kallsyms   link-vmlinux.sh hands kallsyms an empty .syms file on
                 every build (the .tmp_vmlinux0 pass), and both qsort()
                 calls then get a NULL table. 2 UBSan reports -> 0, the
                 generated tables are byte-identical.
  3/6 modpost    read_text_file() rereads into the start of the buffer
                 after a short read. Not something a local filesystem
                 does in practice; shown with an LD_PRELOAD shim that
                 caps read() at 64 bytes, under which modpost rejects a
                 valid Module.symvers.
  4/6 modpost    parse_source_files() does arithmetic on the NULL that
                 strstr() returns for dependencies outside the module's
                 directory. Reported on the build's own modpost
                 invocation; Module.symvers is identical with the fix.
  5/6 sorttable  the sort_needed address is computed by adding a kernel
                 virtual address to a host pointer first. Reported on
                 the real vmlinux.
  6/6 tools      __get_unaligned_le32() shifts a byte >= 0x80 into the
                 sign bit. Hit 4 times during the defconfig link, by
                 sorttable.

The 4/6 and 5/6 reports need clang's -fsanitize=undefined; GCC 12 does
not instrument those two pointer-arithmetic cases, so they are silent
with a GCC host build.

The 2/6 and 6/6 reports reproduce unchanged on v7.4-rc2 (GCC host
build, same config).

Changes in v3:
- Rebased onto v7.4-rc1. No code changes in the patches that remain.
- Dropped "fixdep: fix out-of-bounds read on a comment ending with a
  backslash": it needs a hand-written .d file; the compiler never
  produces one.
- Dropped "modpost: fix stack out-of-bounds read for unterminated PNP
  ids": all 699 PNP ids in the tree are 7 characters, and the overflow
  needs an 8-character one, which is not a well-formed PNP id.
- Replaced the Assisted-by trailers, which checkpatch no longer
  accepts, with a sentence in each changelog saying how the problem was
  found and that an AI coding assistant helped prepare the fix.

v2: https://lore.kernel.org/r/20261008164035.3668885-1-lzsx618@gmail.com

Leizhen Zhang (6):
  genksyms: fix infinite loop on declarations with parameter lists
  kallsyms: do not call qsort() with a NULL table
  modpost: fix handling of short reads in read_text_file()
  modpost: fix pointer arithmetic on NULL in parse_source_files()
  sorttable: avoid pointer arithmetic overflow when locating sort_needed
  tools/include: fix signed shift overflow in 32-bit unaligned accessors

 scripts/genksyms/parse.y           | 23 +++++++++++++++++++----
 scripts/kallsyms.c                 |  6 ++++--
 scripts/mod/modpost.c              |  6 +++++-
 scripts/mod/sumversion.c           |  3 ++-
 scripts/sorttable.c                |  2 +-
 tools/include/tools/be_byteshift.h |  2 +-
 tools/include/tools/le_byteshift.h |  2 +-
 7 files changed, 33 insertions(+), 11 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1


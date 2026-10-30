Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362574;
	b=JCjElW5F7X8y31/MeW6DLnYDpXh7yRPxkVNLGQamqREj+MWLi+9vuj8soLUQyTtuD6v5
	 GuYSx4CDuF+LKjS4L0YaOYRK2MnU/JCEtizjyZ/0plVMjA/OAx4zcfM4fHN93bj6+yuLv
	 zqtKsjOvp5ESU4h9pWxOBiF/zU+pGXx/aTf7u3YZNmEgQPOfm2d+K0vk107n9w4vyYvh+
	 Uz/OJ19P2j8q5nLgcrPMUTpt3smNwkLUIIgDM8jAt46rWlsvGmDcFpHrlPHtBF3WYkb42
	 NCgECxemsEjhFPNuYCVxnKILvJMR7D+Dutr1wnUSJ81DZdvxh0ep7NL6oHF6mlthKbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=zfGTr8GP82BAHjVGcRWUJj13EK5BmCatBJlN0vTN3F8=;
	b=mTAriM7XQc7SrxFcGWZweISmRYoBTJt56SzaWXWuWWSIrdhkTomccDojoGPr93wpcFRZ
	 gtTZo4N/vjq2d+KLvN/jq41aaExsCLI+6Ln0boDYrRzFBW1lex/mQEHZODQsxH1P14AJb
	 aHfX4EC7NqfoLs0RzOTSU+9ydguScLqkrL7ab7FmXr/HP0ZydtX854TtVXXxREDIbvNpA
	 hqR+L3IV+ukVx7pyRaDpJaivrKJmBMmm0sWeuJd9kcLf47TU6U5rkBGX3FXkJUKrrP5Sm
	 PspJaApgFsHa/fseFSI+FyrrLcbJM18qM6KpRL5WFRyshtgSSfGqz3z7cGxJLLhTEDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RrANfIKA;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560F9606A31C
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 12:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RrANfIKA
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c468bd799ecso73700866b.1
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 05:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793362573; x=1793967373; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zfGTr8GP82BAHjVGcRWUJj13EK5BmCatBJlN0vTN3F8=;
        b=RrANfIKAnQwplsmZf36+g8+qb3TJPI+P1KTq3sqddtfDdH+c//CF5suiAvJdCgHaPG
         qb+fo4e1Wwqk3uokpKcZliooux8JXq1kiQnTeCH4Fn9C96BP8RWlLJs61pZqqDMFL7ZY
         cT9mork83Z4eIk3vT9UcY97Fi+tQSgAO3GSsWBMyW6KPO5kBQ+9jQc/7cRyP08tS44IT
         UJjhAcCL33stKASvnoauVxdJVVHIJ1lJQ9TvmvjGdyLHE1R598R4G8ZZ9qqf4/Blv8pO
         Gmmdt1iwM4zUhSHyJqYMqmTI8OURU06VfhtmDaWPvxeWg5Bo0+9gVkZT2rfWVOiY8cON
         2+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362573; x=1793967373;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zfGTr8GP82BAHjVGcRWUJj13EK5BmCatBJlN0vTN3F8=;
        b=spnJCobicsJ5fNTEzCr8od9qrxbGwhXCnHRAAmCWCC4ttYKx1bx/GcBsU6Cp99WDTS
         LRZrLboSW3uq1lGZjmtU1iSZ5lKCkXSEj4ALBQb9Tz3ejyMPtN8X7D4AzjNTMfaG7yo8
         zmmQoqygMeeThiWVS40I1y+WjORoP9ts5dJNlqh2QgDrjmXF2dakZPtftcZPho4Y2AJd
         pvKHiIaSmVbKHzDOv75mNDtaOB626up7NC1Q0xz0ZBV5pCaxGgVjg68FZLHlY5cMoDfS
         O8/5cZekC59nzGgqbWnQJJ5VfTWHhAVRuzaPNBc3wAZjbTWLZBZeKcuDh6MeasVpSGtV
         JiEA==
X-Forwarded-Encrypted: i=1; AKwUvBwSUjA6RtTbH40v/2IAAJjBw4gv9oDZMp1CDbQwY2hgC4SubQWWj0kckIuriFN5MLD6CJMgtXXhmAOyriA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5Oo5b422CC0sa5asWEG0onjGTMkOXxEnURCUOgW+iD4Txl941
	YmCabzD5enwBJGUUSug0F/3wsLODlRJlU10uiecbp30J8qu4ckS8De+8mZtR95P0UuI=
X-Gm-Gg: AYBFou1jhi1korCv5oQSEoqpa/jtNKBVWtVf1exFWn2jrkVnZlnSu0nJYiJD4RyUYAI
	aR4rFNahV9gDV5TVmPX2VRqLZevs3XsYltIeX/PU7qOl/He0DwyfxF5L1w9n63ImQVvR2K1gIlq
	c5kspz10KQOLHzeB4TkzrVCZCTnVifesIwnnaQXGC8GZggEf4lz3/lb1yAA8IZU5A4zMpX4nnX3
	MZZFZrFLQtlhvUe8XigRbzt/wE3bdZ4voOyuNKILIYATWpOxpRV7wta2bLBnERyUdg5tjXB1ar0
	A3MzzX7j3WK56MX7PBdt7L93yFYg+LMoYW3vgJsUBEFo90NF2FKhOmSX+3twL2Cya3c9Xb7sKdu
	P8TCBgDMB0X8uU8Fdg7GzH2f7U3bhlSvbtomVLv9ZLPJtO01NmClnY1CKfwLu9RZnu2sSPmUOgb
	adz4Oa9sgkQnAfZ4kQIFdcc63jO4zUsLovjnqISFiMQkH/wJIpYaH5h6PBcgYXXpba7rsI0vuBG
	vPAf1t+cITsh1KPbomn8V+ZB0Jm+vy9nxP9MuJ9hKaQyJNsSc3Dm4JKasXyoBbA4a2g/S+UHsfF
	f6lW1VqLBVg7Afdxf3BbfuTsaCe9lMZWAtUkNG/kyvDYDfKdqH6VqM7cffVc5kCeiptsY0KcsYW
	EVB9Pj1EY+kK6IUQC6YTG
X-Received: by 2002:a17:907:86a7:b0:c40:80eb:c54e with SMTP id a640c23a62f3a-c4ca792ea6fmr195573666b.4.1793362572692;
        Fri, 30 Oct 2026 05:16:12 -0700 (PDT)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4aa12sm59377166b.52.2026.10.30.05.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:16:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 30 Oct 2026 12:15:53 +0000
Subject: [PATCH 6.12.y v2] kbuild: link-vmlinux.sh: improve detection of
 third pass requirement
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-linux-kallsyms-fix-6-12-v2-1-689a11cb5b7b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHiK5GoC/4VNSw6CMBC9Cpm1QzoDqeDKexgWDQzQiNS0SiCEu
 zvhAr7d+++QJHpJcMt2iLL45MOshC8ZtKObB0HfKQc2bMkUBic/f1d8umlK2yth71e0SIzs7LV
 3UpECtP2Oot65/ACbE+cbNKqPPn1C3M7DhU737/ZCSFi3ZdFWNXdiyrsmXQx5iAM0x3H8AD53d
 UvHAAAA
X-Change-ID: 20261030-linux-kallsyms-fix-6-12-2a67fae81111
To: stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

commit 14b8b4bf2d7bd5d58c17adbeed0edfda1dfc1a7f upstream.

It can happen that symbol sizes within .tmp_vmlinux1.kallsyms.o and
.tmp_vmlinux2.kallsyms.o differ, without affecting file size on disk
because of section alignment and/or padding emitted by the assembler.

link-vmlinux.sh doesn't detect this case currently and keeps using
.tmp_vmlinux2.kallsyms.o to link the final vmlinux. Due to the
different symbol sizes, other symbols are shifted within the final
image compared to .tmp_vmlinux2, and the final comparison of System.map
against "${kallsyms_sysmap}" fails with the message:

    Inconsistent kallsyms data
    Try "make KALLSYMS_EXTRA_PASS=1" as a workaround

This can happen in particular if the linker emits additional symbols
that might have different names between our (re-)linking steps, e.g.
because those names depend on the virtual address of the symbol. Linker
stubs for ARM errata work-arounds are one such case.

These changed symbol names can cause the output of the token
compression of kallsyms.c to change due to the changed symbol substring
count, which in turn can change the size of the kallsyms_names symbol
itself, causing the potential shift of subsequent symbol addresses in
.tmp_vmlinux2.kallsyms.o and therefore the final image.

Update link-vmlinux.sh to not rely on file size of
.tmp_vmlinux?.kallsyms.o alone but to also consider symbol offsets
within to resolve this, and do a third pass if required.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Nicolas Schier <nsc@kernel.org>
[AD: adjust context]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
This patch fixes an actual problem people are seeing in various
different kernel versions.

The version from 7.3 doesn't apply cleanly on 6.12 and a minor context
update was necessary.

The bug was introduced by 7e2b37c971a2 ("kbuild: kallsyms allow
3-pass generation if symbols size has changed") in v4.10.

Cheers,
Andre'
---
Changes in v2:
- drop a left-over sentence from the v6.18 version of this patch that
  doesn't apply here anymore
- Link to v1: https://lore.kernel.org/r/20261030-linux-kallsyms-fix-6-12-v1-1-9c43c892de04@linaro.org
---
 scripts/link-vmlinux.sh | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 94f794ca11ca..a5729419a452 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -131,6 +131,18 @@ gen_btf()
 	btf_vmlinux_bin_o=${btf_data}
 }
 
+# Check if kallsymso_prev and kallsymso differ
+# If symbol sizes within ${kallsymso} change, any symbols within vmlinux are
+# likely to shift, invalidating ${kallsymso}.
+# Since file size can remain unchanged even if symbol sizes change, compare the
+# actual symbols instead of relying on file size only.
+kallsymso_changed()
+{
+	${NM} -n "${kallsymso_prev}" > "${kallsymso_prev}.sym"
+	${NM} -n "${kallsymso}" > "${kallsymso}.sym"
+	! cmp -s "${kallsymso_prev}.sym" "${kallsymso}.sym"
+}
+
 # Create ${2}.o file with all symbols from the ${1} object file
 kallsyms()
 {
@@ -151,6 +163,7 @@ kallsyms()
 	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
 	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} -c -o "${2}.o" "${2}.S"
 
+	kallsymso_prev="${kallsymso:-}"
 	kallsymso=${2}.o
 }
 
@@ -263,7 +276,12 @@ if is_enabled CONFIG_KALLSYMS; then
 	sysmap_and_kallsyms .tmp_vmlinux2
 	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
 
-	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
+	# Due to alignment, file size of the kallsymso object file might remain
+	# unchanged even if individual symbols within change size. Changed
+	# symbol sizes can still shift other symbols, though. Therefore, don't
+	# rely on file size alone.
+	if [ $size1 -ne $size2 ] || kallsymso_changed || \
+			[ -n "${KALLSYMS_EXTRA_PASS}" ]; then
 		vmlinux_link .tmp_vmlinux3
 		sysmap_and_kallsyms .tmp_vmlinux3
 	fi

---
base-commit: 85d82e0d7c2dfd3e75d34f35b7ebbf41f45c9c4e
change-id: 20261030-linux-kallsyms-fix-6-12-2a67fae81111

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


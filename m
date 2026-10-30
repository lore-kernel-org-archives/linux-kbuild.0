Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359777;
	b=kt2CosDK6/UJOlWRLvvApGkxShNstKdGy1mjnUsQQVJh/VrpGbL2iiK2VDe/HEbSG8S/
	 P47NGcREAfNsH8pUeppVyZDGOvlizCdFJU9gtQT8D5KqVXP92y9TYmzqoF5A7lEnaTM0N
	 p2zfq6+9iP+yQl4kouDNtNDnd++bs1/mu5we5rt/oO/5oQ5Q9w3RXs/un3zkrsrD2WafD
	 d6+X0YyNpTS6+e5vYm96Hi2rTDxwwtVMSDP/o6PUFwE2hUtx+aOdOZceFvcB2yMiLyQnM
	 nyhkyLHW/OoX8Tg5ymmBsXKLh6HrgwtxDCWQHGHvYLf4h9u9fsPE6XR7H7j0v4Ok+7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=k+4d3YeUVXdsSSuX0GC4pWzZJQi/FeecQ3AMlBUJ4B4=;
	b=GBSdurRc1r+EZWU5AUKOAQDxoR8XG4OrAdfLTFFuL6qSa7X7/1SA0xu8znLq6ljHeRwr
	 bvqeqBOHwoSGvotPpaX5oWwkhQ9vOxGdp43216JVsx+xKDpjN2N+yDAPJ45rSUgGcR7fF
	 /TQbUlQn8jEi3j2Jbrs9thDgMSr2DeiF6z6o4mHI07JMgAJKO6PDnM866sdk/UfniJbzv
	 JwsDyERMobmbGspH2akEiiDzisVhtjsABmlQDLrcr7/VKn8h68TuuvDlw3QkItOs6ACSi
	 Ok4fIKaqa/BuYLWGCHp+3DszcZ1YeJl2WWXNIIpCfg0KAXo1j3DqVxmkN+cugMupKJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kKrY1rZZ;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E40606A321
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 11:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E40606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kKrY1rZZ
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so876240a12.2
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 04:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793359774; x=1793964574; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k+4d3YeUVXdsSSuX0GC4pWzZJQi/FeecQ3AMlBUJ4B4=;
        b=kKrY1rZZ632i0tdgWUKU60WkHdyu9nIPYABSlnuDF7oi8bFRjYIKhO5XzQlbl75Ctt
         PKmMtRZPK0a7q4qLIMkDH91H294XZN5PTFJPTWW5twUPp7rk6sLiMLTNgNcCE5HdUHNE
         yCOWYZ/97ECB812gXzDxla/kwLzWPAXLpFx+xrIggUru3Y2QupTUl9sjH7Agq6QDLTq4
         3vgpJkLCRBAEldI5hzc57hgiE/mnhdPgVKDtypmHjZQJpMJcikLqd46Mv0VVKj/H1MBG
         9auiZjArNPfy5+uFbFhTzC5P6xaBcYxazq5sGVZkbHE+Dr0F87rvsmDMCVQ0kTbw7pTS
         G/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359774; x=1793964574;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k+4d3YeUVXdsSSuX0GC4pWzZJQi/FeecQ3AMlBUJ4B4=;
        b=14DHIvd+VE3KMjeHTG5QRrGPkDk4o6OO76YRSSi1sUK2swbgaxezD4IaqB0oZ2mn4u
         oYVh8txvkSShspKRszMDicntW5Dfr/oDGMTNHNNuFiwckcwUmArWQFvmtcWcjjIEFx8R
         Ukl6yILuwRmjIorw12gJfKNmxYS2YttzyRXp9fkIC42RI0acj5qqqiq7JJ2REkG/WuI9
         SIXYzIQg2yIRdjQM9swOwvXfODCIJHW7dMaH0SeBdNVPgnv+fXme2wtGhwInmUwUz9QU
         hwehShxbmZ4KicIvvgG+KuOlFhMsHsgE5D2z5RUGBRZQMr8LYuKfQKlfzpNIBuoYkfaU
         qkFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTXqZxwOfPdJdkyL3bxzH6876HEeOMhUpNs/g3OF4SSkd6otN50iwMrXicihX83kglUMIIsoPQs3Oe92g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLMPSEarNtWvgka4xHmxqbWFvqTaoZqnCRr8UJXsnGIgY/vnpm
	y/u3YKEl+npta7YVVl5rBbYIfyCW0BY9TVgokIBSFgLMa1pZUvqOjIvf6lEO1Mu6Lo8=
X-Gm-Gg: AYBFou2NMk7Y/vKWfuX8TUn0ToMHBhkNjj0qGU+CcsFD5poUJ086C24VABAzR9WC/ty
	tRlw0ryS5qieg+cx0Tydz/IBLfoM73Ois7X7J32kW3F80UBMqvhWIjATydf5PCtMLW7bj9HTc49
	JD/sfQtd/VsD9lsz+qrUWXe6yPbFYg+sXCedy/ZsbwNvWG1vJJZY/5GWxQM8c3xfTQlLe90VECM
	2F7tTDmS79NPyBbmH9SAvOKWMZWilLaWJRoPabt8AUGLJsvsJNu3jytelMDhGr4ngneyOxmQcWs
	5YnAyoTGYwBSLDq3LoGUKpTGEuh81INZbz0t9Cnx3s8nHcAisVJmFHvfbCn8vKuynlQzRTMj429
	kw31Ux1JKATW04FVwcAffrT7MVS4pjIBNQzLkKWF32RHelREWzA0StPnjnQn00foRnZBUxYklmV
	BmZMtCXb+Yqe6t1eEju99e7SxiLBOrTk9ji9ZOivfoKzj9eQo9hnBroTZVL7OX8q4Kit1N4zbZC
	8IrQK0okrtDOqox4t/AWhTcDhPIXa6PfAvMaDrRwJxBIyGobaesCsaojC+aso8b3U21WkxmofJW
	JSsNwt3sk5TlxTKcLd+F13Z/hYim75HT7LHfW/L3EusCARlGN9yEzUWlfy1vGDubJ5GOasxNpYH
	lUt10xvWsaQMrENcKrZY0
X-Received: by 2002:aa7:c0d7:0:b0:6b3:d0a0:39e5 with SMTP id 4fb4d7f45d1cf-6b4d438bdb7mr1069754a12.9.1793359774419;
        Fri, 30 Oct 2026 04:29:34 -0700 (PDT)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7aff3d8sm494375a12.17.2026.10.30.04.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:29:34 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 30 Oct 2026 11:29:31 +0000
Subject: [PATCH 6.12.y] kbuild: link-vmlinux.sh: improve detection of third
 pass requirement
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
Message-Id: <20261030-linux-kallsyms-fix-6-12-v1-1-9c43c892de04@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJp/5GoC/x2MQQqDQAxFryJZNzKJMJZepXQx2NgGp9MyQVHEu
 zf4do/H/zuYVBWDW7NDlUVNv8WFLg0M71Regvp0Bw4cKXQBs5Z5xSnlbNvHcNQVIxIjp9iPSa7
 kgK9/Vbydz3eILXG7weM4/iJjCmVxAAAA
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

xxUpstream 14b8b4bf2d7b cherry-picks cleanly onto 7.2; please apply it to
the stable 7.2 tree as well.

Cheers,
Andre'
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


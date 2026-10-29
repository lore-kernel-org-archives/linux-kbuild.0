Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271811;
	b=cGyIhuzVlHhJkZrBOwA/aybfd07h8LdVNkccjBgtSJljDjd+9I06ZmpJHhe0vkXlLtUc
	 C5GhSn+XYUAA8G0sVlS1fElOYMf133/UCw3a6nDDSetHgN91N59bxnDRcHSwMAVd895Xk
	 tzqTkx9g+WIvLeoptgmxCPGAQPSVx1eGvczXNY2qA4vZNDd+EepsgIO3f3sZUT6gJxcEn
	 uj0wCndjsRdWzdkIy94zSQvpNuwe3AgOXKBx7EW8IJkInWfWyiuvbef4TurGA7AAhxL7h
	 3Nrrx2vou/5z0bf2TqgFhanHhewVC7fGeWuilrU65U+JPIZMEvQ+qV2nMZgmIOQ4qGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=J5RKqB0wgxY8YriR4eRdaupljBM7MivKlhMpyC78ArI=;
	b=OJ2ir+0QvW9W1sKf+TRKbgL+Hb4W2HuKTTXQsibbTmg4zOGjsDg0/5VnEHxb77uzc7vR
	 Yoj8F3Lhlq5mmL+kJCddyADZDONXY3YJNOsb2SnHZD09Hzm6OJvGsDDypP3iTLmnrrw3i
	 XvAfHa/Y1o3fmcKTferXd0+/JJblwn7jNc/esIQ0n4l+1CDpIcMpb/QItawBQ0bBb4cd2
	 e6lMxZ6mtuY0j5Blnw1pjmb0IbMqR1e9zS3+4WhfGxkE/DM8dynvbMwwnX2CpINylkUZh
	 x2ZbcP30Yt17790AkE3+83mgjBYSL0YiheTrT+UvLcrBOAH1s6uxlNb5oAYG1l1Cb/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hrXahkik;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D19606A335
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 11:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D19606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hrXahkik
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c445c95d553so275582166b.1
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 04:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793271810; x=1793876610; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J5RKqB0wgxY8YriR4eRdaupljBM7MivKlhMpyC78ArI=;
        b=hrXahkikk7oPVzSRUtQfM/bx8Q+IZRX4rdX79RaEPz/v4VBbl43d+ck3Cd2vrB5Sj3
         gFx2QuyMC20hfHiS4FxPcfN7zUBaoQIw76IuDe0qf0LHTkF8WXHvDQXilycCuPpU0LkV
         DAabHYnBM7Xdc0VUjq3xEcBW9iSSM8i/tvja/z2LrzMrkBjgIjK2JouGDkjcxYj9hazm
         TOMOmuW3bYbLsvzMYJoZu8PwfbazZIMUpFiSRSPCB9ZrPngsojD/2eC27bO1CyUFr4St
         HtK1obuv/HRs3nWAvxWXyFzLUcWW1LjtuYEoNZ9DY0IDpg/nVmmN9k8CVS9qQyTfaY5Q
         wvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271810; x=1793876610;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J5RKqB0wgxY8YriR4eRdaupljBM7MivKlhMpyC78ArI=;
        b=2mehkAEgTfYVWMmxMYzqr6xZOWuhTMghtBfRY2GnQyGiVXakt9wpPK0sJiyBDQyIb1
         I9in9tXqYmmBdN4jzQ47U6K/UR6aAJTYpU6uk6vlLR4JFR7octAFUk7FAwy3RB+dhszY
         3h3Ha65kKd8M1bFrU0qBHLZH2JATxePbr5ZkpIi+AhViqmTsSy2Fd/YkMfVaVslmmzUE
         Yyp6gSkG6i31i9TnpM2hpEeo8gy50430xOhGFmdDPpr/NazDeIFGamJWq4/eOET9pyNK
         U5LqzweStT4I6i1eEB+d8Y6v8F7V+UjoOlvHRZySUTDXv7XZ+/8UI+MaTUSUEaVGxu4Y
         IG5w==
X-Forwarded-Encrypted: i=1; AKwUvBx7bfM3xJ1qkhPnUexC57w3UtpfBLbfWwmLyJo80KJ1W3aq/jTz5ymXa3iPse7xRUrV9rfOfW5DgO54QB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkrvpIXRidR5irJbPMyR46NDic9kcY1R2xBK+Gu6Gy9eYfQQkE
	kTso4c1bJ/4uPXhGR6CO10Qkja8WKYPXcUPZqhwLsBXjaKhnZWKU3rcCHO8NBH9qpt0=
X-Gm-Gg: AYBFou0JfBwUJerJSR54m5HpP4ZsC7T2A0AyfF5V3R2Cpt0dVgjhLNAzrZR9RP8WfLi
	114Ww+tUB0z164riX75a9BhocuTmRzGnadi8NBU9wRsWlu8qYpd4HbL6n43v7AukPPVAxt83CtG
	Ik5/t7BrTlkPZisJlTz6Nati1AkL+WCICIG1gnBC09ARAldvg6/oBecgfOytq01CptHTnJbj5uM
	Wc/+ydfzaIZUDMnajMMK7yv0miIP6+uLKnvAHy9J0KaBCnvcGq0HgBz8aqLgR0EUgYMZv7ezMc7
	d1ia8yGaA+1sxlv9ZQQI8qlWzXAfeslHxQY0UJO7pu4Jm1A0j/eJtALz43fjLLnJBW8SGQjFMUE
	Ef6ddXaS04uz6G1jLLuiIowrAkvMsyBRK+xeL/DVchhiK1W0Ay2eZUD/RJ2ROmGPWmeBWC0AK8V
	a4ftAw5yiRb1u1aIvaa2K0QYS2cwn1eR1stfzIbjFmqybHYMNVVJ0R4ceFpC3lvbQKlBTLepSpV
	Y/W94ht3OcW5DFbFr8L2OPyTkBRjoNN/HI3dchd8ShNTEwF6PNMAu6RcFeBTHIc7edbeVLxn9yc
	nc2buHXrbHvv8hUgslWyX5MSbvDD0AGtqSUEEaTKDAdlE+SJMWdkbnFT/qr54tOzDeQzs6pON+7
	zdklJMJRZ0eNzfeQsSK7GzA==
X-Received: by 2002:a17:907:9606:b0:c41:e75e:5889 with SMTP id a640c23a62f3a-c49bdf2edb1mr432560966b.33.1793271808923;
        Thu, 29 Oct 2026 04:03:28 -0700 (PDT)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd5206dasm723212766b.33.2026.10.29.04.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:03:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 29 Oct 2026 11:03:26 +0000
Subject: [PATCH 6.18.y] kbuild: link-vmlinux.sh: improve detection of third
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
Message-Id: <20261029-linux-kallsyms-fix-6-18-v1-1-69c5dbee4c80@linaro.org>
X-B4-Tracking: v=1; b=H4sIAP0n42oC/x2MQQqDMBAAvyJ7diUJEmO/Ih6iWdulaZQsLYr4d
 0OPwzBzglBmEnhUJ2T6sfCaCui6gvnl05OQQ2EwyljVmxYjp++Obx+jHB/BhXe0qB2GEKbOqcV
 T30Gpt0zF/c8D2Ea75oDxum4inuOicQAAAA==
X-Change-ID: 20260924-linux-kallsyms-fix-6-18-dddb780fae97
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

The version from 7.3 doesn't apply cleanly on 6.18 and a minor context
update was necessary.

The bug was introduced by 7e2b37c971a2 ("kbuild: kallsyms allow
3-pass generation if symbols size has changed") in v4.10.

Upstream 14b8b4bf2d7b cherry-picks cleanly onto 7.2; please apply it to
the stable 7.2 tree as well.

Cheers,
Andre'
---
 scripts/link-vmlinux.sh | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 433849ff7529..050791ea1023 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -133,6 +133,18 @@ gen_btf()
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
@@ -149,6 +161,7 @@ kallsyms()
 	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
 	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} -c -o "${2}.o" "${2}.S"
 
+	kallsymso_prev="${kallsymso:-}"
 	kallsymso=${2}.o
 }
 
@@ -267,7 +280,12 @@ if is_enabled CONFIG_KALLSYMS; then
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
base-commit: 1253a6aa5d104312bf0992afacc15220ae35bdf9
change-id: 20260924-linux-kallsyms-fix-6-18-dddb780fae97

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


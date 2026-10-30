Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360628;
	b=dXKWc1cB7gerz4TwOsATr4pwQEKC47Ol+YBj3igNO9Ql7Zspr1Db4Lf8UlO0vI6hlJi+
	 pqjr8IkZRmDgO8w9W0AM1a35n4593YAYQBXkXtmXiob4k7fq+KWXcV1erXRtvGoWEDC2I
	 USbUWuh3TI/xU50rqKUbEg7Gbs+tQrMxcOJO1P5Inysbd79pbRPDwRxlzQNuSFj/ybZ0r
	 /CaA/+x+42+ptBa57Q2FAPlY7vHTQUOTEvitJ1h+68qWiZHK1JCePcv7kCWo10T11rh15
	 OXH8lMXMk6gFCZj84OWh1qwGE640YiVHfxHgQl5cZsdX54H7YqLFo/mt4T2LRGeRTBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=28PCckgDhGD/ZLp9OHCQjH3mpXja8gxz92m6X/6oBYs=;
	b=0qIa+ziLvX4iA2YdbwP/mtZ9tb0msjcRiK6Tj9llYYVqA4ZevSSbEN6+gLoU925WuAii
	 WxHP6+WYGK+EdkZflPU8hYS8DZ/qaFFG8iobrN97npB+py4KMAZ2ZnOhxstok73FEs2EZ
	 ESVdpjyYPjfPX6Co2LysjsTw1117mZRLywLPhKJz9MsPwJt2unuZTXeNv1Cuo6LbEpJJm
	 DSRUAb85sgksP4GVH2h25RA4+zcVsdcoA1HPs6GYxCOiutpu1keGZW3o0s68qgAo6kCGP
	 vcZI885KFdbkdOrKiCcQeZLKTHGmx1gw/2daaXXk/3ekEgoVq0XNuztG02xsa2oQWMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BrRcfepc;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73639606A31A
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 11:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73639606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BrRcfepc
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso746367a12.3
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793360626; x=1793965426; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=28PCckgDhGD/ZLp9OHCQjH3mpXja8gxz92m6X/6oBYs=;
        b=BrRcfepciz2w83GNcZbxHrJ2h/DD4uYz5bujei/G8If+M64RnJr1m0opOigiTXRwux
         uIOzF8dGYeRVyprDCL2z9h0k2rneEVLWdfSOt3Ll4OAYv+WT8MYxtaotoBh0WJN5UHiq
         EarDp7MVeY16oksd9RM+KmcY+xOzl8Q5EyWt+J3kDdKsgm68J6op3DfoTw8XZCaaOeSk
         f50avOJeBH2NkLcAwZwDkuoDe79qQ0ObNb18JeaBm0hFzP8ZdnXOVmYyDsyABusdi3IZ
         qwet0ZXiocIjYi1KjQajjr874HEA1mT3ijQakyjUPHzlOtSRKNN/3yuyuRTwfpOY5Ilw
         Vmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360626; x=1793965426;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=28PCckgDhGD/ZLp9OHCQjH3mpXja8gxz92m6X/6oBYs=;
        b=Lbg8pcErZOWDbveMv4bi+G3Wn6MESbbLwnlX0fUJrrgCe8sPCV0Da6f/ipb3W3VXxP
         6r0MEtqKSKIKcipVG/WKOifZXLHkMMfGwqAcxIDs9Irm0wgUKL7XpDeAtydofr1uw9gV
         6VQEPGwmJO/1hMtG/aR51asyTkDJQXCUhBgpVwjm7lgUgnU3ws9C5QRAdaFDiLpG6qJ5
         JSPCHCifQigPzsdjucNHTwHNA7rQz6m5ZaK24UQUHipiuTPR6wazAB5Epsk9H8lnlOyi
         UYyy8Pwx/WUX60FUgihR4JJQGg6Ks5yFd/yGnZ6YKueztKbD0YRKD5LBESCxZIqnUlxj
         bYhQ==
X-Forwarded-Encrypted: i=1; AKwUvByerkNVhp9Qh5dGwywMWqaclu3lIYtDDke0Yi92Jf9AZ4g05f8nZqIU8GlMtC7REYVbbT/Cap463uzmPxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLQ56tH7qiGMRltIBz1C8bGZ+/1bkkK4KhlU5wq9bcYpz9j1I+
	5ZZxe4GGluAwEXrdR5dcoZdh6qIEgreYb/9imAeqJ8PvESIME3y6XQs8I9Agdg3Vltw=
X-Gm-Gg: AYBFou2O8Egau0w/YN6tXoljkvBkQEJmHUq/alHyMOjj6WPW7UEmRHwjRKy/xMYNWH4
	l9Na+sFXpHpHIV+AmXJsf3X2AcuCpYrkxjQWjiBHpP7empu1bBLJtsuXF6XCJKwfxOfGwPqEp35
	cYezQ4piAMqbA2U6Z0d7akRJ0JHJXJCNPF3niEah5KwbwQwhBdlBl159TVvoLLynfUhgFcbFF3p
	4XOzemZDvoFk84w0F4ZWBu0YrIqsltn+qFcvN0r7OqgOZkEfJ6i5PjeVUmcOga+O7qCZI30Jhp3
	83I6Wd+Bkrdj0CjKHqN5B/loKpP6BwCceIlcCb6/5J9Qu0o/AnyrXKWbFbyvUklzvIRsFoDSq7j
	6nupA0A7eITBzGGiXbvXBmGL7WXwuSIoAAHAppU9JOaKbnjJbaP8Ws0PHsnVsUdjOyKDv5O8XrY
	W3XtiHHNf/SEnHF5LyBvhShEPiacaxHzqrmXRl9+XcwHZL7AALCw2ef3+0QPx/Q/t/cnWTeZpmS
	+A0wmJClMk2T6BefTXVGoQvHDpttvGIVD8GGmxX6C2RlxhD1aXrAnRio4ybFTw1lTMZ3ufLCQXN
	U9JQ+LB985ZReUpP+Weenb2brwfuxHDjZpjGb+V0ZCkUmL7bU3kUbDDzZnZXc3RaudT4hzc3NBR
	gzxNczfBSEVzZV/aelSvy
X-Received: by 2002:a17:906:9f84:b0:c41:b94c:4538 with SMTP id a640c23a62f3a-c4ca7af1b6cmr189766166b.47.1793360625856;
        Fri, 30 Oct 2026 04:43:45 -0700 (PDT)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe1003fsm57506466b.44.2026.10.30.04.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:43:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 30 Oct 2026 11:43:33 +0000
Subject: [PATCH 6.6.y 6.1.y] kbuild: link-vmlinux.sh: improve detection of
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
Message-Id: <20261030-linux-kallsyms-fix-6-6-v1-1-91a57d3197cd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOSC5GoC/x2MwQ7CMAxDf2XKmVTtpuXAryAOa5tBRCmoEWjTt
 H9fQL742bI3UG7CCudug8ZfUXlVg3DqIN2nemOUbAy97yn4wWOR+lnwMZWi61NxlgXJlOI4x5x
 HohTBxu/GVv2PL0CO3PpLyQUz130/AEyI3AB4AAAA
X-Change-ID: 20261030-linux-kallsyms-fix-6-6-cb5fbdd566cb
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

[AD: kallsymso_prev is already tracked by kallsyms_step() here, so only
 add kallsymso_changed() and use it]

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
This patch fixes an actual problem people are seeing in various
different kernel versions.

No versions from more recent kernels apply cleanly on 6.6 and a minor
context update was necessary.

The bug was introduced by 7e2b37c971a2 ("kbuild: kallsyms allow
3-pass generation if symbols size has changed") in v4.10.

This version of the patch applies cleanly against 6.6 and 6.1, can you
please apply it to both branches.

Cheers,
Andre'
---
 scripts/link-vmlinux.sh | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index ad16e25a62ce..2b8746f7bcc8 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -144,6 +144,18 @@ gen_btf()
 	printf "${et_rel}" | dd of=${2} conv=notrunc bs=1 seek=16 status=none
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
 # Create ${2} .S file with all symbols from the ${1} object file
 kallsyms()
 {
@@ -271,7 +283,12 @@ if is_enabled CONFIG_KALLSYMS; then
 	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso_prev})
 	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
 
-	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
+	# Due to alignment, file size of the kallsymso object file might remain
+	# unchanged even if individual symbols within change size. Changed
+	# symbol sizes can still shift other symbols, though. Therefore, don't
+	# rely on file size alone.
+	if [ $size1 -ne $size2 ] || kallsymso_changed || \
+			[ -n "${KALLSYMS_EXTRA_PASS}" ]; then
 		kallsyms_step 3
 	fi
 fi

---
base-commit: 0aebf2870d53a8d97e02a99e2103ea0b38950c1b
change-id: 20261030-linux-kallsyms-fix-6-6-cb5fbdd566cb

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92B43B585F
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Jul 2026 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242592; cv=none; b=rmclI5ogGokI1m8M/B3vjhWVKE09d2+VIQ/qwMVJOeITob/a+IQFHeQ+Z4HZnRDJ0b8rMM1lyM1KF5VtMj04lROpIrEJyeLcY0lQ9oNWZUcCQeSU8Dt71QGhKwxOaANUd/QhuSwbCQGeI+yNnIJzNNzSTyyv5lAVSCTQiuXy2Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242592; c=relaxed/simple;
	bh=sISaQzaH+VTpRnyWAc2SlIPqhjf3NMP0c2WTav+LdKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JKRaqet2yrk0yeSzrlBGt4DhvUNdgaZz8V20tNbHZsik2ZsVg3yVlT+ri3khCdsUJfvaWlj31lMkw3Z6z2WaD3Dcg3/cYawEXuzjz2BAtc4B6h/BAzUNRbumfgnK2lGp34/VP25aNglBNBC2a65aLSplHHxIs+m9PAJr+55ith8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JlxFSg65; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JlxFSg65"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso453625666b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Jul 2026 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785242588; x=1785847388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WrFF5zeJa6i3dJjxCwt2P+w1tBuT5VdStKupxsyRdtc=;
        b=JlxFSg65GKZ+Rtpc2wyo/SOs8G3NhIJypruIwE4Ub0lxRXml9dbbFMGas96SnPNxOn
         d3/dDHVNgzbQ+AZlCf/TDYqBQ0n9QqX2gdFcp1DQzfbweXbFzSkN/XgTTT2snsQc2m2N
         1KrxElcFKIyUgGdroeeBjTUrQyO7W3CMlVji0YCE24tXOxfJmMuYjW9SBNte5unWVnko
         IU1X3siu/clQaPNZCC9PrLwBVeS4RvK7ToqvyptVkLAhz7emFw78d6xEbel03AsfXh+i
         m1G3ht0J06FGfjIc3dnnACiFd51Am5Ljcfe5q1EMXDW/gZFz4ZkxOFp9gWD25EkcaPj4
         7xuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785242588; x=1785847388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrFF5zeJa6i3dJjxCwt2P+w1tBuT5VdStKupxsyRdtc=;
        b=qLt6v2Rw/gpzFYuGaWuK4Y7dyAEgiecYQ+1ajn+Xu3b3kBwBYhljvsUj2nxt8iiFkJ
         pHqbAdR4QYGwhRwMpDJRbliEiZMCdiwkgmjQkeeyFdm6ipol/60Zk02zWkNxzSbDlV7M
         MSzpaBgzsnEZjf63IOF4+KwRo2xiRwwaz9v6JPXOA+NOqwogkd6VN496xRAVCDv557/Q
         4olWsR2VpH3PTCJVL3wJVI0fxAAM/0BVetEcXrTpAYzOxFki1Bsd3l65kbNp8M+m4/jj
         rR4HIB/b04v/WCRSEvwzZ6RVq+Wu2na8bWg/VA9DdT2Bbc7EWnSf8a/Wq1/EjRrRf0Eu
         Y5uQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2kD/2irLxkRpJgmVEvDFae2HLF7NKyBZVDyjCo2/UrORVytKxgpCGybQYMzHi7sQ6SFPPWqAyS7HDh0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQr4Isk19bXRbAu7GUTBHDOdqyZkX6Y1Td+zGt7Kl8x5MDk88D
	rvhkMeMQZ74EDYO3m8YmQzjzaOfRtLugs4fqjlAD19TI/NZVu+ns30g1Zzz3pG+fa+Q=
X-Gm-Gg: AR+sD11rP2urnQF4z+2yR9CbjwaINkF4b/H5XoglbfBzViR0BIn3nXX70rGWRJMNVoy
	xrHjwC9PeHB364pFWj3wUFozXzlZ31KqGsgjacG7BO1vZ54fnpccIOo83sDLFQvKiHOrTTpxQl/
	a3HnGbh8F7Q046gcQKX1oWz9uy7IBXlvmKLXw8BiBrP/RGTce0YtLabp9zRmgqqmozLRoKyuoP+
	iVdprpPlzOqJN7RdRW2cygXQcuqQ/sW8br24zUlSs33IGaHw33ENePX0Bl0kZxo7akFLM8dd+yv
	35ayMI3jEOxgxpMrCrvS7MalopnYA3lN9HwXMAbvCcqSAQF80thMXznTcKNb/16cA1wVDg3aBrE
	tXh1YbYh6hwGRXWgHXn+W/lHjiPZQMerOOFkNyKxs/wZHdpGyR5mUH9Eqlkc0XwHGmPM7ltp7V1
	0lv9m/8wVyjifFQ6kQkp7rpTQkOesQhfZ1qFL8PP+rLHPwC5vejH41IEUiP58A2rhGhw==
X-Received: by 2002:a17:907:8dcd:b0:c1f:6f31:2880 with SMTP id a640c23a62f3a-c1f721507c1mr116075766b.50.1785242587931;
        Tue, 28 Jul 2026 05:43:07 -0700 (PDT)
Received: from puffmais2.c.googlers.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c902d2sm745805766b.34.2026.07.28.05.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:43:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 28 Jul 2026 13:42:40 +0100
Subject: [PATCH 2/2] kbuild: link-vmlinux.sh: improve detection of third
 pass requirement
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-linux-kallsyms-fix-v1-2-1a665156c898@linaro.org>
References: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
In-Reply-To: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Guenter Roeck <linux@roeck-us.net>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

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

---
The issue was hitting:

In a build with CONFIG_ARM64_ERRATUM_843419=y, the linker adds numerous
instances of __CortexA53843419_<stub target virtual address> stubs
(LLVM in my case). As the second part of the symbol name depends on the
virtual address of the stub target, it changes between .tmp_vmlinux1
and .tmp_vmlinux2.

This change made kallsyms_names bigger by one byte:

-       .byte 0x1c, 0x74, 0xff, 0x43, 0xb9, 0xc3, 0x78, 0x41, 0x35, 0x33, 0x38, 0x34, 0x33, 0x34, 0x31, 0x39, 0x5f, 0x1a, 0x1a, 0x1a, 0x43, 0x30, 0x38, 0x33, 0x41, 0x1a, 0x30, 0x30, 0x34      /* t__CortexA53843419_FFFFFFC083AFF004 */
+       .byte 0x1d, 0x74, 0xff, 0x43, 0xb9, 0xc3, 0x78, 0x41, 0x35, 0x33, 0x38, 0x34, 0x33, 0x34, 0x31, 0x39, 0x5f, 0x1a, 0x1a, 0x1a, 0x43, 0x30, 0x38, 0x34, 0x38, 0x38, 0x46, 0x30, 0x30, 0x34        /* t__CortexA53843419_FFFFFFC08488F004 */

and grew the total size of kallsyms_names from 3879944 to 3879945
bytes. Since this moved it past the four byte alignment, all subsequent
symbols were shifted by 4 bytes, causing the final sanity check to
fail.

$ stat -c'%s' .tmp_vmlinux1.kallsyms.o .tmp_vmlinux2.kallsyms.o
18458168
18458168

$ diff -u <(nm -n .tmp_vmlinux1.kallsyms.o) <(nm -n .tmp_vmlinux2.kallsyms.o)
--- /dev/fd/63	2026-07-28 12:17:55.542466443 +0100
+++ /dev/fd/62	2026-07-28 12:17:55.542466443 +0100
@@ -4,8 +4,8 @@
 0000000000000000 N $d
 0000000000000000 R kallsyms_num_syms
 0000000000000004 R kallsyms_names
-00000000003b340c R kallsyms_markers
-00000000003b50bc R kallsyms_token_table
-00000000003b563c R kallsyms_token_index
-00000000003b583c R kallsyms_offsets
-00000000005806c8 R kallsyms_seqs_of_names
+00000000003b3410 R kallsyms_markers
+00000000003b50c0 R kallsyms_token_table
+00000000003b5640 R kallsyms_token_index
+00000000003b5840 R kallsyms_offsets
+00000000005806cc R kallsyms_seqs_of_names

$ size -A .tmp_vmlinux1.kallsyms.o .tmp_vmlinux2.kallsyms.o
.tmp_vmlinux1.kallsyms.o  :
section              size   addr
.text                   0      0
.rodata           7178673      0
.debug_line            49      0
.debug_line_str        72      0
Total             7178794

.tmp_vmlinux2.kallsyms.o  :
section              size   addr
.text                   0      0
.rodata           7178677      0
.debug_line            49      0
.debug_line_str        72      0
Total             7178798
---
 scripts/link-vmlinux.sh | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index c8f27e4175f9..ab0b8125c8cb 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -106,6 +106,18 @@ vmlinux_link()
 		${kallsymso} ${btf_vmlinux_bin_o} ${arch_vmlinux_o} ${ldlibs}
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
@@ -126,6 +138,7 @@ kallsyms()
 	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
 	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} -c -o "${2}.o" "${2}.S"
 
+	kallsymso_prev="${kallsymso:-}"
 	kallsymso=${2}.o
 }
 
@@ -255,7 +268,12 @@ if is_enabled CONFIG_KALLSYMS; then
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

-- 
2.55.0.229.g6434b31f56-goog


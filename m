Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436273;
	b=IKn4Os74fAhT75Ctu3psUlByJZXPkhT+F+r1UEAkz9cYEM9Gspaem1hcrxEAKoeeW0Xk
	 jdzo4t7BVpxG6jH5oGoCxSsnSm96rC57p2bqETopM7hvKOlN5dh5OEioEybiq253bC8tX
	 75I/hsIKzM15WI5OFzJgkybMoCzAHYOsj7o8vaR6YXuDL/Ziuiuzj065E7YkxZEcZpyg9
	 VYfQfsmJMoCCobmFRpRYGBrYs0w+m2ptV0RwxJvy/4ufztJTPwbXLUpRLxG9FXAaO2V7f
	 /kxXlPqinIdW58luHZRE+ITy83SnIeJRCAZDGJJSDXLbrkJqnT01VLvg4sHkpDCfxBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436273;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=w/P7Au62M+92CbRcPyECeOn9VVSwxvVTLIBVsrRkV4U=;
	b=RHArcmsdSEklh4KRCJBSJCAjtg3eGH737BHUipON/n1wYF2/ouDZdSMLFmi1M3OWpUE2
	 FfT/t32DRCYdlDV+GoOQlPYXsVTlZYGnl5Zgk+7NBMs3i/D4lmRC+iR/Y4J90GPluT9y3
	 5GkoPKYgKRvopE2iuHpoV8C+0gpZ4W0c5T2DK6iI4TMIHhITbNzIDMdqJ6NmoGIO55u9C
	 gEt2qa7sgko3PgC5/pSg9lXvb4YOLhba0GElbPMsy8G06YTGJtsW4yjvadrOBVjy6IkQq
	 fCoNhgfTJtUUWQB+kAL2rFJweJaUWeMjdj/wjBXV30PZYKEVHNsxlZczttiaWOvrqOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=c6jWfE6f;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451D5606A31A
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2026 12:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=c6jWfE6f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1795436242;
	bh=w/P7Au62M+92CbRcPyECeOn9VVSwxvVTLIBVsrRkV4U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=c6jWfE6fs8QMnPMkZdSuqQ7WLE8ee3OyQgsxn+XuawzwQ2iKTWsIu286sWIGu2pS0
	 /3HtLr7A8g7GaYv4qyxf9DfwjVGlajN469GNMlABA5fwgbd7tlo994dnDMuyAZXN1E
	 GzZ+SRf7V51Ditvnp+2AeeedcoXHhxk7xvIjxOhE=
X-QQ-mid: zesmtpsz8t1795436226t187c8887
X-QQ-Originating-IP: m11/7KgAf6dNCDHmt9WGjVhdPFueqtJpyyEwn2eQiWw=
Received: from localhost.localdomain ( [61.183.83.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 20:16:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2967070718750964981
EX-QQ-RecipientCnt: 5
From: Wentao Guan <guanwentao@uniontech.com>
To: chenhuacai@kernel.org,
	nathan@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	loongarch@lists.linux.dev,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [PATCH RFC] kbuild: deb-pkg: strip orphaned debug labels from LoongArch modules
Date: Mon, 23 Nov 2026 20:15:55 +0800
Message-ID: <E73BE2D8A39F2EBF+20261123121554.2559667-2-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.47.3
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OOH5Lt9wNw30p5dDjYlENwairEk+43N76HHMpgtxTuRflNnbgKT/76aj
	X6h8a8rDAW59OdaqHUPphFT9CDEywlTsu7S2LSB6R7Tbzo9vE3WxS0lofDnjjnJ7Kqkxdwi
	qxAtaUtRjbH5VHv0rw918Fxw7vXp4GOmH3KDc3HpXe7uchhL6leYuaZgxTw9VAv7T3etSaw
	Fl2vZoYdAgHXe74a0egwynxa4blMAIOA5qS9yjg6amKOdpWqog0IyaKIwHEzyM2HKmre/f2
	3vFj33O4rtaqHlMnymzVjDhc0ebNKOAUnXX2BDpbdwUx2hob83QZ+G7C7HOCC0D6AfA8cbE
	LWTZSj/f5CFpEa8jbsT7CHpk34/squ8Ez6LTak7w6xDgWL8LH9LPdN+PC0i+Ln8jA6/mBqU
	d3iwqxlPzDzhJYdkwePVQ8iwuWPhjc37MEagJMACnsaF65qhgd+7OrBtg7k1BI0O3BOrGNl
	VWIYUOrtTHgHFB76SJYpc6IOngSKawWme8+eurh5KKMvXULHmjvOPxIYpOoU0VV0gGqgRIU
	rEQbYWCBVmTbG5dg25mI7INKuDxU2Cq35y7x7nzay61O4mVszr8G7ddWAM6XuRAAWGs84j9
	mUV+HaTIqldjjUXBTFwUxA8wFjJ+z3Usrc9B7vc4DZeQLkR+fRrLstL/GJmb26h5WN4JI8L
	iAZY30YW+IM8jd4AU5jMw2e6TUVm1tMguKvMTAU/oK/XDPZyzonXL6oA9Qli3UB+8iyo2nG
	1iUTkjDrWvVZy2EqoWj5RCnS8Pk620CyK5vobwMvzY3kg2vlf8yshY50BWWU4s7stpAWyve
	ocPX4eUn+Z9R/x/R+uRWsLy3rbUYyXdSriExCBQdFuvo3Rr3Ub3CAuMGNXdlj0gSuCYPoI4
	6mwK2LSjwmg0tmDW4N2rlzpFs23MuekhXRNEnAFZjmh86f11+11waOnF+kbB4J4hCdki2QJ
	JGR+WSCGxzajU0MTCN4og0tCA8o7Tc2cU8qnl9XA7mPUxShVQaaqGrkjGY+97MGpTCFdXsx
	bZCDLxJY+gJO4S3Xiuuj0MZ9ZYA4WkXgu9DI4SgES6qe3aIiHgA37TjVuWgrM=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

With CONFIG_DEBUG_INFO, gcc emits .L-prefixed labels for function and
block boundaries and for location views (.LVL, .LBI, .LBB, .LFB, .LPFE),
and the assembler keeps them in .symtab as long as a debug section
references them.  On x86-64 those references are expressed as a section
symbol plus an addend and the labels are discarded, but the LoongArch
assembler has to name them in relocations:

    0000000000000057 R_LARCH_64          .LFB1 + 0
    0000000000000015 R_LARCH_ADD_ULEB128 .LVL0 + 0

so they end up in the object's symbol table.

INSTALL_MOD_STRIP=1 expands to "strip --strip-debug", which is a section
operation: it drops .debug_* and .rela.debug_* but leaves the symbol
table alone, so every label that was only referenced from debug data
stays behind as an orphan.  On 7.2.2-loong64-desktop-rolling 86.7% of the
roughly 3M module symbols are such labels.  Nothing uses them at run time,
yet they cost 22% of the module payload (168 MB -> 130 MB) and 19% of the
linux-image package (195 MB -> 157 MB).  This is the same problem
commit ac031f26e89cc ("kbuild: add option for stripping modules while
installing them") addressed for the general debug-info case.

Strip them with --discard-locals as well.  binutils removes a local
symbol only when its name still follows the assembler's local label
convention (.L, .., _.L_ and the L<digits> pseudo labels) *and* no
relocation in the output still names it: mark_symbols_used_in_relocations()
sets BSF_KEEP on every relocation target and filter_symbols() keeps those
unconditionally.  What the module loader needs therefore survives -- the
relocation set of every module is byte-for-byte identical before and
after, .LC, .LPFE and the -fpatchable-function-entry labels stay, exactly
one SHT_SYMTAB remains as elf_validity_cache_index_sym() requires, and
the modules are still signed, because modules_install strips before it
signs.  The dbg package is built from the unstripped modules in the build
tree, so it keeps all debug information.

Restrict this to LoongArch on a GNU toolchain, everyone else keeps
INSTALL_MOD_STRIP=1.  Other architectures never see these labels: on
x86-64 the option drops two unreferenced .LC symbols out of an amdgpu.ko
and leaves all 429,648 relocations alone, so there is nothing to gain
there.  LLVM builds have to keep the plain option, because
kbuild hands the same value to llvm-strip for LLVM=1 and llvm-strip
refuses to strip a symbol that a relocation still names, aborting the
build, while clang does emit such labels for string constants:

    llvm-strip: error: 'super.ko': not stripping symbol '.L.str.1'
    because it is named in a relocation

Clang none the less generates none of the debug labels that make the
package grow, so an LLVM build loses nothing by being left alone.

Boot tested with qemu-system-loongarch64 (EDK2 firmware, vmlinuz.efi,
test modules loaded from the initramfs with finit_module()): modules
stripped with --strip-debug, --discard-locals and --strip-unneeded all
load with rc=0, while --strip-all is rejected with "module has no symbols
(stripped?)".

Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 scripts/package/builddeb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index a806f5094da44..a355d65927115 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -35,7 +35,14 @@ install_linux_image () {
 		${MAKE} -f ${srctree}/Makefile INSTALL_DTBS_PATH="${pdir}/usr/lib/linux-image-${KERNELRELEASE}" dtbs_install
 	fi
 
-	${MAKE} -f ${srctree}/Makefile INSTALL_MOD_PATH="${pdir}" INSTALL_MOD_STRIP=1 modules_install
+	mod_strip="1"
+	if [ "${SRCARCH}" = loongarch ] &&
+		"${STRIP:-strip}" --version 2>/dev/null | grep -qs "^GNU strip"; then
+		mod_strip="--strip-debug --discard-locals"
+	fi
+
+	${MAKE} -f ${srctree}/Makefile INSTALL_MOD_PATH="${pdir}" \
+		INSTALL_MOD_STRIP="${mod_strip}" modules_install
 	rm -f "${pdir}/lib/modules/${KERNELRELEASE}/build"
 
 	# Install the kernel
-- 
2.47.3


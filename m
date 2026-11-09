Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206811;
	b=aQwynZ7XzSM5H6idbGalDygTZbWbuijeCxshWR81UnMIwLWIihmmzQuDNny2H20GpgTP
	 6FnxXYzzWv/alhbvtGVUUDo1CifPrsqeamjgf5XFu/cY2XpIOqfDqY6+iSmSIx13Xdolv
	 oEhnI0o6P4fc7ujDhJ3IN08p7UTACO4hkBJwh4Wlck9pJNFouFx6XLs/IfIXuNogGWCT2
	 PR+ihgWESQ4fjQDDFuhV7wEhDF+gwiXbMH9lXnBfSkylzTMKY1ixOJNkftqKvhL7Xv13x
	 J1Ah/fAbcSFibNfC8nFHv27ZcubwndpsPX6CsCzbgE8a4WrentFQZIb4YUFdRtC0xPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206811;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=djs195KZY/BJdEFCgcDSpeR4fu1pIHlWnSTsGITALWI=;
	b=LNCxViZJOEFXlcdhlsW/HFCtIYIVB/vFl+3C7OMkFp2kLlzFH/M4fp70gdgHaj3dC7hl
	 feV60+tL7ut+nEW3zUPR3e70m+22drK61SBdqGNib0ZpWW8+UF/9mXY9XMWBLzoouxRra
	 zHj4+84slyxxly+s+qUuapuFeqggZPSVE95j/11MrzW+keBfh7TZDR/QswyXbP1JFA/M8
	 XIY6JbGrQGhXVeIg1FL0O000has7edjFhUB46NyBpTj9BxWOfv2U46fk2L45JbhvFU52v
	 TTzEfiwX+3TdHvrhzk2NsgF3kSQ30zUYl95AcKDpJnvp2dk60QMsdzLTyBftctph/vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fctk7shm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E253606A31C;
	Mon,  9 Nov 2026 06:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fctk7shm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AE51F008A1;
	Mon,  9 Nov 2026 06:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794206810;
	bh=djs195KZY/BJdEFCgcDSpeR4fu1pIHlWnSTsGITALWI=;
	h=From:Date:Subject:To:Cc;
	b=fctk7shmf9TRh1KwyKD0HX4xz2w8GL0ddf7yz2exNNrNwmmMGGMPC8JtzSwncsOWL
	 65PqMPlxf5Abs+k4Udx5fTzm5Kp3PtlmMPOAQZM4sUTN7KO6j9DtJRxlZNYh3hD8r0
	 AW0iGgkeAmFQN+aI9WfZyUioxx7ePizma7edDn15lmohKsv7LDMjCSJPUxJu14yFua
	 hnIIhJoX12qRdWgPqmhOky02D/hTNWo3F7x/IsxHU7m3sGzB5Av2/AfKcc+fwAa2Qd
	 ba+16walC9JU9xxmDYgkQUXO+16NG769FhnpJX9oXfZNb4JDQHbuDbXhwGVpKu7K6f
	 /pd2y/ruiSwcw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 09 Nov 2026 01:46:42 -0500
Subject: [PATCH] ARM: kprobes: Rename test-kprobes.ko to
 test-kprobes-arm.ko
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQrCMBBG4auUWTuQCTVQryIu0vZXozQtM1EKp
 Xc36vJbvLeRQROMTs1GineyNOcKOTQ03GO+gdNYTd75IOI6jjpxgRV+Ljr3MFbkOIFdcKMc0bX
 BC9V6UVzT+jufL3/bq39gKN8d7fsHMRbZyHsAAAA=
X-Change-ID: 20261109-arm-test-kprobes-rename-060d15e94621
To: Russell King <linux@armlinux.org.uk>, Nicolas Schier <nsc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513; i=nathan@kernel.org;
 h=from:subject:message-id; bh=d5ZqSkJGrlvMOK0yRJD5xyXF8O7G7+KdgShpcEY9QEE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkfc0KbbaJ37974TGDPg9ZPEllvr9XN+252cMH2B1ty8
 kT4JIy1OkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBELPYw/BV70HuT21/DOPWA
 jG3OvM+Xre6alN5O3dDAwiS0Ujnm2VVGhjeP1vEoBflvcJ39gHPH101b75Sfetip3D1V3FJ036E
 93HwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When scripts/modules-check.sh is fixed to normalize the module's name
like name-fix-token does in scripts/Makefile.lib before checking that it
is unique [1], there is an error due to lib/tests/test_kprobes.ko and
arch/arm/probes/kprobes/test-kprobes.ko having the same module name.

  error: the following would cause module name conflict:
    arch/arm/probes/kprobes/test-kprobes.ko
    lib/tests/test_kprobes.ko

  $ modinfo arch/arm/probes/kprobes/test-kprobes.ko lib/tests/test_kprobes.ko | grep name:
  filename:       arch/arm/probes/kprobes/test-kprobes.ko
  name:           test_kprobes
  filename:       lib/tests/test_kprobes.ko
  name:           test_kprobes

Rename arch/arm/probes/kprobes/test-kprobes.ko to test-kprobes-arm.ko to
make its module name unique and clear up the error.

Reported-by: Sasha Levin <sashal@kernel.org>
Closes: https://lore.kernel.org/20261108225808.1809266-1-sashal@kernel.org/
Link: https://lore.kernel.org/20261103110411.11698-1-info@daylightlinux.ch/ [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
We would like to take [1] for 7.5 in kbuild-next, so we would appreciate
an ack to take this directly or a stable branch that we can pull in.
---
 arch/arm/probes/kprobes/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/probes/kprobes/Makefile b/arch/arm/probes/kprobes/Makefile
index 6159010dac4a..f909a47a01aa 100644
--- a/arch/arm/probes/kprobes/Makefile
+++ b/arch/arm/probes/kprobes/Makefile
@@ -3,14 +3,14 @@ KASAN_SANITIZE_actions-common.o := n
 KASAN_SANITIZE_actions-arm.o := n
 KASAN_SANITIZE_actions-thumb.o := n
 obj-$(CONFIG_KPROBES)		+= core.o actions-common.o checkers-common.o
-obj-$(CONFIG_ARM_KPROBES_TEST)	+= test-kprobes.o
-test-kprobes-objs		:= test-core.o
+obj-$(CONFIG_ARM_KPROBES_TEST)	+= test-kprobes-arm.o
+test-kprobes-arm-objs		:= test-core.o
 
 ifdef CONFIG_THUMB2_KERNEL
 obj-$(CONFIG_KPROBES)		+= actions-thumb.o checkers-thumb.o
-test-kprobes-objs		+= test-thumb.o
+test-kprobes-arm-objs		+= test-thumb.o
 else
 obj-$(CONFIG_KPROBES)		+= actions-arm.o checkers-arm.o
 obj-$(CONFIG_OPTPROBES)		+= opt-arm.o
-test-kprobes-objs		+= test-arm.o
+test-kprobes-arm-objs		+= test-arm.o
 endif

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261109-arm-test-kprobes-rename-060d15e94621

Best regards,
--  
Cheers,
Nathan


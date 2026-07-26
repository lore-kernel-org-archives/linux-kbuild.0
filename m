Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1412F6596
	for <linux-kbuild@vger.kernel.org>; Sun, 26 Jul 2026 02:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785034394; cv=none; b=c6Sz9+jfjhyiu9XEGa789WrEludook9vpzO5CGCBJmdF/TwFeaBE82pIcnozOTFfAN+ZkS+jzCYSxSpNT7CW017hAsxIALSNiqN1T7vGv94UqLGSZP1wRQXp122+07ERE3q8LiH7CYD//TcZUdu9slsWuKJW4qhD3sRV/jOHrTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785034394; c=relaxed/simple;
	bh=ur7J3+xa2ZE/P0fviH4Md/Wp2oKnOCvVnY95NF6AUpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aA+3ptmv/xYZCpjz+7uFxZpb6Ufcw9fqdTNKzw1MwIdqb5rMQ5CU2AP8ZnX05Igs9T0vK0zCkM4MFAakc6afXaO5WRnoVb4X9BqyTmlwSlnBf8wyWcUzXmbyviiWLp9agu4iWxLsfURz7+4QUjI35uKNac0vM301EGkbZfJmSVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sa/4ZN+V; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sa/4ZN+V"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caed617615so17151585ad.3
        for <linux-kbuild@vger.kernel.org>; Sat, 25 Jul 2026 19:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785034393; x=1785639193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A+fZlpoNwUNiIF9UMejK6Q5RLcRANFeTV+evvoYlWpc=;
        b=sa/4ZN+VqkOZ9H7mpmfN1XffHKNmq2HaibTGqRcVepjMgrpID2zavKEgQ5Ie56vAWr
         JPkkUyLD05HdvD6al4y7wYaI5BZ26NMeg+bsVfAdiw9t4mtHXDXDsHOv9Jx5EjQWEzT8
         /usVp1HtC8ejNdNSeXKvStQzG0u3fboWuLft+6mvAuj1FIEiSvlF4AgBrrna8LdxeMYa
         bIPDQ0ZGSP21M2cnVTnVswvYkYzzNtqTSM2e/xvrCgCqRjSlElOfIN3TKTl4nJPdcRLL
         23qm4e38vufZUg18zcxeEhgYw8QNvp4s8u6iK5i9hkfss29wu6D0/F5Gj/1nSqKuCa5E
         9fYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785034393; x=1785639193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+fZlpoNwUNiIF9UMejK6Q5RLcRANFeTV+evvoYlWpc=;
        b=o+GmDywRJeFzQdmtxErALpJUfiTCv6ReQ801bC/57IgOEl4gce78Xl7Um0wEE8Kcr6
         cUujpCdJOrccmbmMtyRbOIhAJSNoH2sPfpmjXEY6hOVmtduB106465Jj1AkF9V+0b8ow
         qzShhDR0MDiZyK0etoK78ltNKXmAVtIHeaMx8h0+JnN3LhQ+70E2Gaz5PothOSMaKBJp
         sa0vZk67nNocVhxs0h0nmyNetRb4BNan29DSFU9QlvnH2a+J6ySIqxkIl0TJ69x/IRhG
         NEw/towZkAT+OiajxEMwcQjVmKBzJ9S6/t/U6ZX5PGp2umHIYfT+aPZ4b5b3qIZiGk7x
         gY3w==
X-Gm-Message-State: AOJu0YwytffBrWuhcK+l4pTZKazCDLZRTUVGX7RjKEPiPKQn62mUwnWB
	P0EpCEBva0zq5XoNpx53KLPRtzkiZZD+fiEM/TfxtGs/EB4BGxCXh1ay
X-Gm-Gg: AR+sD13X72mNtia+ol0xnSyeXJCr6SaxZA+me4iqGNKZ5+9HHjgTb2D/2DxKfU3/ASE
	G6suuwiKY1ntvu52ge9dKFOEeW9ISBiTPLWsaalDDZRcQYYRE1mnWGcv/MzKVy/oTmiQUWGH8/x
	Lq6VaSKOqn7/mtxWlTTuTMliaPgyEXZkZMryxKf4647KrJsmB5bMZfgnvLg+IBsn3sJOMq5RReH
	s89dMqr91pceEs0mPRyg3xel0f1gmGNijqYQCR40WRHKyiwIA7qCgL0YfDwILWwXcmIWRTHfbmq
	N510aWZzykppArOW0lX4azWU8zxpNj/088QR6znGQ51CMCyen+Pmbrst819Z9S+3KDw90IBeAc0
	RteSI1fnXATb7JIuKxA5y/zEBCAoZW1yfo+GgbAl+sUL2VJoOY3YpXgXc3iaoS7QCuq7sOdkVyQ
	U2Djw6ACAu9dpjKzeiBhdD5ClK453wt/zQWgPz8a89yMTZLWVEGI0Az1RfZ1nsiRKLCz3zdIw=
X-Received: by 2002:a17:90b:2b50:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38f2939e6c4mr3721113a91.7.1785034392599;
        Sat, 25 Jul 2026 19:53:12 -0700 (PDT)
Received: from localhost.localdomain ([240e:46c:2000:294d:9ad:36c8:10e3:4aa8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f2951eb8dsm1324936a91.13.2026.07.25.19.53.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 25 Jul 2026 19:53:11 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	bpf@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v3] kbuild: rpm-pkg: Preserve .BTF section in kernel modules during debuginfo stripping
Date: Sun, 26 Jul 2026 10:52:42 +0800
Message-ID: <20260726025242.42245-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After switching to the kernel's default package scripts for our local
kernel RPM builds, we noticed that module BTF entries were missing:

  $ ls /sys/kernel/btf/
  vmlinux    <<<< only vmlinux, no module BTF

Root cause: find-debuginfo.sh (from the debugedit package) prefers
eu-strip over strip when elfutils is installed, which is the common
case on RHEL 9. eu-strip removes non-allocated ELF sections, including
the .BTF section that contains BPF Type Format information for kernel
modules. Without .BTF, BPF tools (bpftool, bcc, bpftrace) cannot resolve
kernel types at runtime, and /sys/kernel/btf/<module> entries are not
created when modules are loaded.

Fix by passing --keep-section .BTF via _find_debuginfo_opts, which adds
-K .BTF to the eu-strip/strip command, preserving the .BTF section while
allowing normal debuginfo extraction to proceed.

After this change, all module BTF files are properly generated:

  $ ls /sys/kernel/btf/
  aesni_intel         drm                 i2c_i801            mfd_core
  ahci                drm_client_lib      i2c_mux             net_failover
  backlight           drm_kms_helper      i2c_smbus           pcspkr
  ccp                 drm_shmem_helper    input_leds          qemu_fw_cfg
  dm_log              failover            intel_rapl_common   sch_fq_codel
  dm_mirror           fat                 intel_rapl_msr      serio_raw
  dm_mod              fuse                irqbypass           sunrpc
  dm_region_hash      gf128mul            iTCO_wdt            vfat
  virtio_balloon      virtio_console      virtio_dma_buf      virtio_gpu
  virtio_net          virtio_rng          virtio_blk          vmlinux
  xfs

Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 scripts/package/kernel.spec | 10 ++++++++++
 1 file changed, 10 insertions(+)

v2->v3: use %{__find_debuginfo} (Nathan)
v1->v2: check if find-debuginfo.sh supports --keep-section (sashiko-bot)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index c732415662ef..1032f337a71c 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -67,7 +67,17 @@ This package provides debug information for the kernel image and modules from th
 %undefine _unique_debug_srcs
 %undefine _debugsource_packages
 %undefine _debuginfo_subpackages
+
+# Preserve .BTF section in kernel modules during debuginfo stripping
+# find-debuginfo.sh (from debugedit) uses eu-strip which removes
+# non-allocated ELF sections like .BTF by default.
+%global with_keep_section %(%{__find_debuginfo} --help 2>&1 | grep -c keep-section)
+%if %{with_keep_section}
+%global _find_debuginfo_opts -r --keep-section .BTF
+%else
 %global _find_debuginfo_opts -r
+%endif
+
 %global _missing_build_ids_terminate_build 1
 %global _no_recompute_build_ids 1
 %{debug_package}
-- 
2.52.0


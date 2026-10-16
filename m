Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C21732B132;
	Fri, 16 Oct 2026 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161607; cv=none; b=kLpV652lE0EFtx//CRL9AytvTIHgPkvD9+G95aLbCJy1AC+E24vH/CSz2QB1UV2ZgIHkIo8Aaqu3osB1mu3yS9kQ/R7ZnPWwhVbeF2W/Swddu+14znhozeEQPxsB23xXGWJOvgDCfU/2czxODWBrK/Z08hmGh8dBDXkSJHvBZWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161607; c=relaxed/simple;
	bh=5rWXlSacB3ZK6lYF8y/F6URMgitlO2bJ/xBhk7KZqnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aa7tKPW3As2y5EHq2XDhbj5EXVIwAnZTO8a8H4Oqjrg+Q2IJltd8KE7sLVeSnw9kNF1ff7Yt0IWUS0U9tnoCzhw4pmmIENFPOFU5p+ZHQ78Zu98JvLwmfb+MFR1DJzgQadZt2iFedDmVvqEIiADCrr1T+IA6cSQflp0hvyGptTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3GpZBmN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3GpZBmN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7911F000C5;
	Fri, 16 Oct 2026 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161606;
	bh=5iR/n5TxdTxz+OUopmkuWFQB0Je/YmkpDFf1jsLtlHA=;
	h=From:Date:Subject:To:Cc;
	b=W3GpZBmNGxqsX8cYOIrZ/SKyhdgYcw8UGd/S0hNsR2gVBY/bkKXwDchx/ljRRy70p
	 VrYxlx9+9Vtr3tHMJXiKDGK5deP2T4RZ3F0EIeUwB1UDSIXwJilaxLSsJ+V6yvhZPB
	 Urd0Za7Eei8jEIkjElv5uuabZVMto91Lq2WPJv7yNGCblqEXM9Np8RUOisNv/W91gR
	 KuyQC5OogY8JVZznKkG0FXTiUjgUMMm4Cu3SufAUBFKvAEhBoameIrKwa9tVjBgbXg
	 Gi61c+4DMaOPTiJd/bMFWkwaHx8S2gRjhwFvLFgK2U1UNWfLnwoK0ytXCZtT6G/pei
	 nLmFnEnEgqlYQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 16 Oct 2026 16:40:01 +0200
Subject: [PATCH] kbuild: dtbinst: Create destination directories before
 installing
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-topic-dtbs_install_fix-v1-1-8cf50b642cba@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrDIBCF4auEWVdQF4bmKqWEqGM6Iag4tgRC7
 h7TLL8H79+BsRAyDN0OBX/ElGKDenTgPlOcUZBvBi21UVIZUVMmJ3y1PFLkOq3rGGgTvZP+GbQ
 0wVto51ywzf/w632bv3ZBV68aHMcJb0+2+noAAAA=
X-Change-ID: 20261016-topic-dtbs_install_fix-7c0d9f206fdb
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161603; l=1700;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=dBPuCTPAMlqIZYz7kulxNy3CUJrPvnUckNPDp4MTzrc=;
 b=U84/ah1Tcd1c8PeUaJg+mUmoaomm7vc/JVLwoJaZKpHV5ooAAR/7J8s0a0TG6avbSU0VCG1uS
 9nLsGYFglLJDiiSWeXdRheFuQbhDDAIDquqcn/Exn08L7JmohpU7x4E
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

dtbs_install installs each DTB with 'install -D', which creates the
parent directory of the destination on demand. With a parallel build,
two DTBs that share a not yet existing directory are installed
concurrently and both try to create it. The loser fails, which aborts
the whole build:

  install: cannot create directory 'debian/linux-image-7.1.0/usr/lib/linux-image-7.1.0/arm'
  make[6]: *** [scripts/Makefile.dtbinst:23: .../arm/foundation-v8-gicv3.dtb] Error 1

The failure depends on job scheduling, so it shows up as a build that
fails for no apparent reason and passes when re-run.

Create all destination directories up front, the same way
scripts/Makefile.modinst does for modules, so the install rules no
longer race.

Fixes: aefd80307a05 ("kbuild: refactor Makefile.dtbinst more")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 scripts/Makefile.dtbinst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index 9d920419a62c..a55f2a7acbc2 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -37,6 +37,10 @@ dtbs := $(notdir $(dtbs))
 
 endif # CONFIG_ARCH_WANT_FLAT_DTB_INSTALL
 
+# Create destination directories up front: with parallel make, concurrent
+# 'install -D' calls race on creating the same parent directory.
+$(foreach dir, $(sort $(dir $(addprefix $(dst)/, $(dtbs)))), $(shell mkdir -p $(dir)))
+
 __dtbs_install: $(addprefix $(dst)/, $(dtbs))
 	@:
 

---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20261016-topic-dtbs_install_fix-7c0d9f206fdb

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5083520C478
	for <linux-kbuild@vger.kernel.org>; Tue, 12 Aug 2025 02:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754965490; cv=none; b=nIE/8GJDwqYePz4wXVz4LJxvLzybuB24rvhH8gT3odDknpKuRfvk7rHJU360fShuDpU0QUsd0Cf90rssNi7rfDOshCKY+i0Y0iKCrx8h2b0WGhhkZMt82tfga6oXE+cVC6otzfTgL5dCWMtSZheDYLGaTA6qp8v7hTU2ccBKeAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754965490; c=relaxed/simple;
	bh=LohMC8L02xEkula2AUYpNoVunc7EP4wwSnkuLUppFqo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NCqWRbr6dblZ4cqAY8jTk8LC2tPuRGpy4xKyfkBHVRhB4TqOCjgJ/KG6sEb8tfLfzZJf21p7haOSwQnh3oTnkAPgpTsvG2SHVb3esuyVl5hmWuZdbnQdEARbBzS66D326mTh9gIYz9ftRZeqS1YNJl0WsPwH5z+o7ys8vbwl4Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PwUJQl5W; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PwUJQl5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Sg
	nVgy+6ldbq15M/rjJipP5qX3IUixcwlIcbykJW6yY=; b=PwUJQl5WkHmjlmNvgb
	WHTxks+3Wbx/toGAOvXbM9V44xrodRKUUj2rtddPpBpfVhkiyYVTlA97VNSDkwhm
	SJwPfh6U/PQ1/rgIVxmYGaSnPUk1G3i6LwjzKu9XEMm0XgbLPYugsLPhx/8f4A9i
	7kZmqEM86E/TGVRCvxq9L0WEQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgC3D37gpZpo8NBmAA--.4775S2;
	Tue, 12 Aug 2025 10:24:33 +0800 (CST)
From: "longguang.yue" <bigclouds@163.com>
To: linux-kbuild@vger.kernel.org
Cc: nathan@kernel.org,
	nicolas.schier@linux.dev,
	masahiroy@kernel.org,
	"longguang.yue" <bigclouds@163.com>
Subject: [PATCH] Makefile: mrproper deletes signing_key.x509
Date: Tue, 12 Aug 2025 10:24:29 +0800
Message-Id: <20250812022429.52674-1-bigclouds@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgC3D37gpZpo8NBmAA--.4775S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRuoGmUUUUU
X-CM-SenderInfo: peljuzprxg2qqrwthudrp/1tbiNg+mQ2iaULJhMQAJsV

delete temporary signing_key.x509

Signed-off-by: longguang.yue <bigclouds@163.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 6bfe776bf3c5..7c45fa8e44ef 100644
--- a/Makefile
+++ b/Makefile
@@ -1589,6 +1589,7 @@ MRPROPER_FILES += include/config include/generated          \
 		  .config .config.old .version \
 		  Module.symvers \
 		  certs/signing_key.pem \
+		  certs/signing_key.x509 \
 		  certs/x509.genkey \
 		  vmlinux-gdb.py \
 		  rpmbuild \
-- 
2.34.1


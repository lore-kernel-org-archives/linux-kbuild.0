Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D893F23C8;
	Tue, 20 Jan 2026 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912668; cv=none; b=mD+7UFuKWbvAL4BZ0JFeLW4OAp9CkBi9r58vf2d7AoqNu8eEs/glPqSmxn7wMWUZF+3vBJCZU0px3ghZKDuJfKpQ/0SutlxbKyjDbXahPmPbwC3ROC7zJb07X9wS0hkHncgA+3TFroccvh6/pO8fCs9Nrs8gxNhIrTRlvNVvJcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912668; c=relaxed/simple;
	bh=o/H120QuglZYp+2jypHZ3CE/IW5jst0eEeTnceWveDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+dgq9lKyMlhHG/XXTw1hHaIyHN3wRBEKOopDWOJ4CyPwaqYsNS0pGElpBRVP6meLJFnBhKJTOlGPy5Aih5oR1t2is+qdaXSoNwMzr2YPVRUn8ukEPozjyf/n3bCZYqj9N//0XnltbohiUZEcIhBu2MKzoJKED9ZUPjTkJHd7SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxacITd29pEbgKAA--.34642S3;
	Tue, 20 Jan 2026 20:37:39 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxWcEKd29py60nAA--.733S5;
	Tue, 20 Jan 2026 20:37:39 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] kbuild: Make sure to generate System.map file
Date: Tue, 20 Jan 2026 20:37:30 +0800
Message-ID: <20260120123730.30487-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260120123730.30487-1-yangtiezhu@loongson.cn>
References: <20260120123730.30487-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxWcEKd29py60nAA--.733S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWrtF43AFy8trykXr4rKFWUKFX_yoW8Jr4Up3
	Wxu347G3Wktr13uay5KrWfGryUA39aqFy5ur4UCFy2yryDtrykKrsxZryrCF4Uu3yrKryF
	gr4vya4Uua1UJFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcDDGUUUUU

After commit 75cffd392bfa ("LoongArch: Using generic scripts/install.sh
in `make install`"), arch/loongarch/boot/install.sh is usually not used,
either /root/bin/installkernel or /sbin/installkernel is used if found.

It should generate System.map when using the script installkernel on x86
and LoongArch Fedora Linux system according to the man pages but it does
not in practice, just copy it to the installation path.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 scripts/install.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/install.sh b/scripts/install.sh
index ecf354d8f4f1..93714ef65967 100755
--- a/scripts/install.sh
+++ b/scripts/install.sh
@@ -40,6 +40,12 @@ do
 	fi
 	cp .config ${INSTALL_PATH}/config-${KERNELRELEASE}
 
+	# Install system map file
+	if [ -f ${INSTALL_PATH}/System.map-${KERNELRELEASE} ]; then
+	  mv ${INSTALL_PATH}/System.map-${KERNELRELEASE} ${INSTALL_PATH}/System.map-${KERNELRELEASE}.old
+	fi
+	cp System.map ${INSTALL_PATH}/System.map-${KERNELRELEASE}
+
 	# installkernel(8) says the parameters are like follows:
 	#
 	#   installkernel version zImage System.map [directory]
-- 
2.42.0


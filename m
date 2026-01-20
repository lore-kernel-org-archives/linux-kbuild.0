Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E80C3EDAC2;
	Tue, 20 Jan 2026 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912665; cv=none; b=EBH2J1RoebZ+HnRQ/IPLnyOjj4GWKvaqGomTikTqbPVaFvLcNsedb//w8rrcbEWcbq8IVtyoDDFgQ7f22LXDVMbqdihSXM7SC30xem7VA5yaIA5XWSn0yeY3ZRUHZUdzs9hCGzqVYiU5YlK4dcM205ShUUltcTJc6qsrlMGUa6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912665; c=relaxed/simple;
	bh=fGjZY6HxnhAQmlZughiPOpAbLZtre85P5Dc0LOjUbck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GWfhBthwbeWEygur/WMqwnHPWcV94YGDBUyQRGFOQ0Ss07hoEkegKBI2kCpBKmaN2HoA6+Jk9OSD6JkV9qrbDWZ7l/hW5Tc5SiGnEqg1pWiwR/pw2xPQ6CN8PYExmzA23KA06SdUo44MtMuWCelAX68tu8Xiwap3AO5o0QpW4rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx+8IMd29pCbgKAA--.34627S3;
	Tue, 20 Jan 2026 20:37:32 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxWcEKd29py60nAA--.733S2;
	Tue, 20 Jan 2026 20:37:31 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] kbuild: Make sure to generate config and System.map
Date: Tue, 20 Jan 2026 20:37:27 +0800
Message-ID: <20260120123730.30487-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxWcEKd29py60nAA--.733S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcyxRUUUUU

This series is based on 6.19-rc6.

Tiezhu Yang (3):
  MAINTAINERS: Add scripts/install.sh into Kbuild entry
  kbuild: Make sure to generate config file
  kbuild: Make sure to generate System.map file

 MAINTAINERS        |  1 +
 scripts/install.sh | 12 ++++++++++++
 2 files changed, 13 insertions(+)

-- 
2.42.0


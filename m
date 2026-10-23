Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792794785;
	b=BuLv5PPsU7TrcNMLoIYpwRywojhxlyCTjX8utfiQVg+kWswg8tcUHx3r9qL0hZp5IuEg
	 dYFEE0N6NEHtDnGTL4a6ptlwZKDVdA9oRJmFOmz5QjUsou9dRqL94RKZhHVvaA0RfXcp7
	 6mIWnnsExl1VPJQyzt1SQ79AfPmzArMc5h7cx3CYa5MAvvWbBG9vBGDqjMPxKbP3Te6wB
	 tJuh6Jo9F38q7FZ8yQYoEsdn1T6UWmDMkGyINJFaMbHjYWkuHRx0VcW8/VHhRoDC7oa6y
	 Wng4aX9MLUcd2cgyTv6nk8VXOogPiWxAojHzW2Yy+egOaGUu6yz2FQvb7+XDdFaAr0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794785;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=D6R2uGQgyYEQdu9bHiQuc/wPAA+AiFNV7XuNwHNmkBE=;
	b=1o2qvj7IpuJsZp344VSZQ6Vr645pjHzwTGsE5Ulkn7fC/zBaVToVvbYxhRXKkCUWv0wy
	 mwUWpYFJTJ3WFkIXdLMzhapE4tFJCL6a+q6WkT43J7Wnq/9cesgGpAaDWn+1AFeVg2i9+
	 ZM3xX2bxK9k+REeDezRn3xkZNp9EupVq3w1Ta6xv2lZ1T1IeY4FPCuap10iARXl4DtPgl
	 J536V4pQR7J3c5ieJd4jCtcxLw7G7cRvSZGXqVKElZqq5WowtHtTB2xcrGrLNgdW+8iLw
	 m49gyD6ad03KCZ/IiU+1bDmYYetyvHHgxG4Jivm7Q02gCSOY+hHzEnO2uRI0TC3lT0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vatbrjfp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C1606A31B;
	Fri, 23 Oct 2026 22:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vatbrjfp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93401F01825;
	Fri, 23 Oct 2026 22:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792794785;
	bh=D6R2uGQgyYEQdu9bHiQuc/wPAA+AiFNV7XuNwHNmkBE=;
	h=From:Subject:Date:To:Cc;
	b=Vatbrjfpdv+XpnJ2XEImf2OL3DjPk5MyRJYc/SfBVsIqJxE8wtn4IzKJ6UPIjzPEs
	 8QlFIAi/7NlkGjkEBsLg1qXIvIelcaTFYp+kjqcBxd1C/sMFWhDEGoxo8egzD6cKr4
	 yXGawdhXCq2oyvj9Jlp5P6ycaen9pB9zb6ggsVms3IQl+RriOqHAtwfXtraqe+qnho
	 8wVyLbcpnIv2pk9SvTBJnR2dyQlDPlfX8uA6XYXUzoCPqTFlgtuKaOaL7xrcIwJ3gF
	 fnABugmr56SqD9iQF3RP3qZGKSCASJSfxGsBUf9vgDLaPvhanSoAP/JCLCPEvdYfdO
	 u9g/n1w4LppxA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v5 0/2] kbuild: Support directory targets for DTBs
Date: Fri, 23 Oct 2026 17:32:46 -0500
Message-Id: <20261023-dtb-dirs-v3-v5-0-dfe13d47aa64@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NTQ7CIBgFr9KwFkOB0urKexgX/Hy0qKEGKtE0v
 btQNzZxOcmbeTOKEBxEdKxmFCC56EafodlVSA/S94CdyYwooaImpMVmUti4EHFimJDOysZapVu
 OsvEIYN1rrZ0vX45PdQU9lURZDC5OY3ivd4mV3f9yiWPFpGJUCW6lON0geLjvx9Cjkk78R67FV
 uZZJqA5taYDe1AbeVmWD4+5+wr2AAAA
X-Change-ID: 20261007-dtb-dirs-v3-008fa5ffbc74
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, Arnd Bergmann <arnd@arndb.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.16-dev

This series adds support for using directory targets to build DTBs. This 
is primarily useful for architectures with lots of vendor DTS 
subdirectories.

v2 had some issues reported after I applied. In fixing David's issue,
that introduced random parallel build issues Arnd reported. I didn't get
it figured out quickly, so I ended up dropping it. I finally got
around to revisiting it with some LLM help this time. Having multiple 
paths in the build system to building DTBs complicates things, so I've 
reworked things to always use the single target and directory targets 
for building.

Arnd, can you give this a spin on your randconfig builds?
    
Please ack and I'll take this in the DT tree.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v5:
- Don't drop 'dtbs_prepare' for 'dtbs' rule to avoid parallel make issue
- Limit adding boot/dts subdir to DT targets (also a parallel make 
  issue)
- Link to v4: https://patch.msgid.link/20261016-dtb-dirs-v3-v4-0-0ec42fd8ef9b@kernel.org

Changes in v4:
- Don't create dtbs-list files in every directory
- Link to v3: https://patch.msgid.link/20261007-dtb-dirs-v3-v3-0-b3ab32b64fa6@kernel.org

Changes in v3:
 - Convert %.dtbo? rules to single target
 - Convert dtbs rule to use directory target
 - Link to v2: https://lore.kernel.org/all/20251120204812.1983452-4-robh@kernel.org/

---
Rob Herring (Arm) (2):
      kbuild: Convert %.dtb(o) targets to single target rules
      kbuild: Support directory targets for building DTBs

 Makefile                          | 36 +++++++++++++++++++++++++-----------
 drivers/of/unittest-data/Makefile |  5 +++++
 scripts/Makefile.build            |  7 +++++++
 scripts/Makefile.dtbs             |  2 ++
 4 files changed, 39 insertions(+), 11 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261007-dtb-dirs-v3-008fa5ffbc74

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>


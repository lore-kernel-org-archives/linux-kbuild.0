Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502201;
	b=o3Z7u4L0CnE8AwV7SUetGcruc8PCXjubqNHJZPyZ0xFBL+gu/bsDQTvqCkXP1yPQ5RKD
	 8QGclmREduAmrgr+c2KLiQNo6oAc4KgN+V35Qg4yV7cLSy3y06tFzOmZaBpNjM9eIrfdK
	 PDke7RcD5kR9MhefXVdR4Iuvev0acyuyccRVQIMRWvsz4rNr+hTWiy/mEqRSLACCk8zTf
	 YsqGh2ivJMap9JbgNl3C2gqs+LTKbvx9iB2I4Sh67yg0Z5DfXVXNgzjZPIy4avrOQizeE
	 gsm/MPqNePgInvsftfDyEuRhyagpvk2BnCdKnn2oijXqs5fRrroJMfyXuWwj+wzHwsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HTjwYebmxtLa4PiItolJ5AKZJdmlFWAT4a1+ga2BQ5w=;
	b=e1UwfeTCsl7n6xGG0NORe+HMZBjtHkmDQ42f08cDpB8Ff6D/SP0iXjtIoqcDu+NO6TVD
	 zpqA6+E0m79+4lw74oQv0rs4Ado4YyuLfH2vRM39xNfxGeCXf8SQjhH28U0qsOZGeIiul
	 F9Y5G01ZHSx6BhDxH+iNvJXQSu3KqNH6j+pyAeA+gFkklsybr4SS2fpsvSaevc1I01Ohf
	 7sYlY6fqw2b5/+FObnUoon0FpT/THERmtid/WFk+Xez2gWrqeXSp57WWDvfvXRkdb3+kH
	 Wr0hkfXJdvPiZ2RoZ24T4kdUa06GXEzJY8CaymBfnFktoNiEOkezW/ORbKp7Zab9Oxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vfrYXOAG;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2EE606A32D
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2026 16:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2EE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vfrYXOAG
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so3040937f8f.3
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2026 08:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794502199; x=1795106999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTjwYebmxtLa4PiItolJ5AKZJdmlFWAT4a1+ga2BQ5w=;
        b=vfrYXOAGJtvaDHCSlWSFFpVBsjesNVMrHHslD0+Nr89w2Q4Lnms26P5+Dgc0CGlpY5
         qAdwuAwnDlLbug6dcW6ZSDkJMThYvJkvVRVlhe3Mg5lZ0z71y3zFWEzBF6IN5cwmfeSh
         1QPhAtTWtB/hqfafWJv9LfZf8rWd0f7tTetPUTgHEV8867Aou+7poedhUiW38gZRR0az
         Ohv9uqenqxTCla2ACQSIxx2gVAkudx4raaQFzmnkGtTql3kVgQS3nehYUJABaTSEewvl
         f5lymy0kVezcATV2D4ByFEjY4rjXuY/4A8T3h8jrnXv2Xz3p1cI5jEL3hA+wyzbM3ZC5
         DOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502199; x=1795106999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTjwYebmxtLa4PiItolJ5AKZJdmlFWAT4a1+ga2BQ5w=;
        b=lMIqwnv6djqEqsagJOs8iOriZAk3F3UWFPScHQTV8ajCvqjTD1t4vxBOsrGz7QLBSj
         rmXaDi6TzNI3lna6GE8zPIExaeBnvJc61JkQJESHRhz8eTArY1qUN6k1An5/YcL1pBhh
         80n1ga9CEcwU/r9SbSGEWELmt1qVO11chb+Ze5NdLdP6DF1EdEpzY4QqAus0GVJ84Hwy
         ZrKzd9mFN5vq+eYGPL/yPkfJHbd5OeBNl40bA4K5Si/8qobwTyYCMYAI4y7wg6+u72Ju
         XZ7e0Ct8d1okSVOHXnHLIw6FIGxoI4tU4MDJrDWKeaMyEGqSZ4KbhkCYPM58sJBMJR9p
         /Xwg==
X-Forwarded-Encrypted: i=1; AL+hErFWRQS6uo4zkoWcXIX1QezAapvN7o/uTTAuk5GKEDACA2xfVX3esdBPS53xWb3chDqnrKQYEwrusY8EqE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5VtN5sxpDKCX4+jeBM3egdBfRUYghtUmIQ+w0BZXXT8rOh+xw
	8gqSoU+cKVCyeT+9SAPkfJz/ZWPtRIFwHukIPM2aPDBunCZgujWS+VuT
X-Gm-Gg: AYBFou2oLx5Vwzgy/Lb+uRLFFg/SyzMjZYpLB/WBsj7ZZLUkMA3wArr0HKEofqcHXBJ
	7LEV9mkmRPilplfk2j+VmX1HP3tASjfCKiwE/biAYpWJ26/XleBjLSU2YAxht5lpzz93TcSBNqx
	SKaNomE21KIU38aCruzuwxNdCghZBr5sGIh03WMtBMkhvqhpC5fxKMJhKrNu5Nm0CenplRnI07B
	SvYPk6JN2/t5FLrfZ7QpxKdL/M35w6rX5MLZ0cq4m2fse6z7C5tnO0LnPJ+22eLBcrKJMxzgMwC
	B05WbXqrJ5Cb4BT/D26Y234wfLRGX6/7vfChFK8jusQhgyrdSL4Etaip3c8TslPWu1aC6v8k6t9
	HLWIb3G1XPhHju3efUldxQYnBopYgTuddB7cazN4Xzg8IrsmZTran2RLC0spbcXR3y775THKCFO
	hmuddjwY6RuxmCm5FN800sbca9y7VZw1/9MwlW6HpRcx6JtWrMbPbzEQwiFykI6Nxnc5MRSqxGG
	kCqROxZKqBzn/ynGirP8gMBYWV8SQF+AGQAMj0QypeXCTX7nU1ck/FASJ5WVS0wlDQgD93GtAfg
	OhPB/Q7sC7CHkquyFIFipFegExQZJeO1FQrU2efUcz7G+NfIM8qPCA2WtuVP+Cg1RigQRllKitB
	ydTjqQUw=
X-Received: by 2002:a05:6000:601:b0:48f:bcf0:2026 with SMTP id ffacd0b85a97d-499c75525edmr11618552f8f.13.1794502198904;
        Thu, 12 Nov 2026 08:49:58 -0800 (PST)
Received: from nixos-office ([62.28.7.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e0dsm234202f8f.15.2026.11.12.08.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:49:58 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: andi@firstfloor.org,
	ljs@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] MAINTAINERS: cleanup Kconfig entry
Date: Thu, 12 Nov 2026 16:48:26 +0000
Message-ID: <20261112164826.110736-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.56.0
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

'scripts/config' provides a CLI for kernel configuration, but currently is
not included in any MAINTAINERS entry, despite the commit that created it
using the 'kconfig:' subject:
commit 8e54701ea85b ("kconfig: add script to manipulate .config files on the command line")
so let's add it to the Kconfig entry.

Additionally, 'scripts/Kconfig.toolchain' is used for checking various
aspects of the active build toolchain from the host environment. It's
merely written in Kconfig, and is not really part of Kconfig's
implementation. Let's move it into the Kbuild entry.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..245bbfed8122 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14374,8 +14374,8 @@ S:	Odd Fixes
 Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git
 F:	Documentation/kbuild/kconfig*
+F:	scripts/config
 F:	scripts/Kconfig.include
-F:	scripts/Kconfig.toolchain
 F:	scripts/kconfig/
 
 KCORE
@@ -14451,6 +14451,7 @@ F:	Documentation/kbuild/
 F:	Makefile
 F:	scripts/*vmlinux*
 F:	scripts/Kbuild*
+F:	scripts/Kconfig.toolchain
 F:	scripts/Makefile*
 F:	scripts/bash-completion/
 F:	scripts/basic/
-- 
2.56.0


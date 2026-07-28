Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9843ACF02
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Jul 2026 12:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242589; cv=none; b=POekoQeWAXbRLXiWe5dO2XyRVszFzhQjsCglQeLM2lzmQqLHsVY2inEsg8k0T55uOcXwKRmAqEsyvhondqsp6Ww87FwP1Q0zNbwTSfBIL6nLA7Jx4BegwfhNi3tWGYUE/Y8LPdiDe3IZCHHw9/3eVnJBVM+NKUtpLEBZSgZtzDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242589; c=relaxed/simple;
	bh=+I542TCyEiR2dkdc/EjJMpQVyAenOURWCaveKVfQk5U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EKAX06hcZjslc8NJ6BLDOr+IX1OsKQFSQjMlSNiozuCMoAqm62+8AK/VFPxKijCZK1UGB/Dkb7YmOM07yD/LoHfkf0gc5eZA1SVE2XR2AyONt+2fiW5dqaHr9JAoaK3Dz9pBc7Ofht5i+gWujJ12izYlALcBPYmA/Z1/SD/KS8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fOEwYyTS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fOEwYyTS"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15f020a223so511582466b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Jul 2026 05:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785242586; x=1785847386; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fD4Ka0zrPbVAg4KYEq8UyY0zj2IasFwu7KBSI8jg6EM=;
        b=fOEwYyTSwntIMbmpNZ9dr72rIj35P1rw9BIpPPHbhkCk8EkiGd/NPCLNyDx7lIn4F1
         PXbDcWC+7UNAXarBNbdDuHts+GQDdDQb+hEQpKo46snu0Q+uw0arvRZTnWsGElWknXDo
         GOv1DplO0IoHtm2FsyukSVPsCEeuUjmDhtoFoqn6OJoQBRjuy6omCsFpuzJGlTrzpUTK
         D1AaIjvok5D7oj/TfwrlBPAmgDZT8VSQidhwgFS3cVI86EjIo5N0EGXgcLlogZuQrexB
         sewOHlUodBFdv25ndVoff5NRpS8tX3ZB/5OQry8gIKNPxbi4QN5GuB0W9lO+dFp/aD6l
         PSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785242586; x=1785847386;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fD4Ka0zrPbVAg4KYEq8UyY0zj2IasFwu7KBSI8jg6EM=;
        b=ZWdz0XpZdJACJ6octAwhiEpU6asbI1WXJWZN037ZPoLAy5SS+e+DRMNBWis9WWTn1R
         BESeDtzhJTp+Mo+FGUnL/xm6A4RGXAfYwypiz/k3ZCIGPvC6f6LV9c2XUoVDK2B+VPQ4
         TzF3m6FZ3ODxX4HqP+5DF1ji6WClKNuhNyxq3tamBHr5dNZIhnrKSngLZ0dAu/bC5lyr
         7O2T75csq+SAagI+dEhahmYOlBZh7eXk1Ty8SaYL2tUKO/Hbg2UWQHQxY0aXr45Mcvm3
         OXTc3uQJTg6p7qIyvPFyMIVsAY9Y6/VP59VksY5t0FzeuXXwdllIvAL6WuIFb/jdcOWz
         FSHA==
X-Forwarded-Encrypted: i=1; AHgh+Rorga/fXzfXSv26fJED5coblhtYh2eEh6FZ3waFKvL5ZhIii5dfvS0XxEKfsfgeCKlbc0fuMdxZIdUYkZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvfo6lQCynw61f/B01vj9GsE08fioTYypukZeJHS7GlAad099X
	7OjWyq09HrD41+xoyuo5MmbsSBo+QF87CL5CkTT6SaspnwxlyWNO2/bShrmPcvXHbRQ=
X-Gm-Gg: AR+sD12DruLere1cq9EkBo5l7Y/6/pfDE26+AoVcvE/UzvpyF3zpWNpcuJFm/F1BROa
	vncG5i7ic/XddQGtTFhouhAZzb51xMSCKf2leCmyCJr7OptIxESDIMzGPFUvMG+EKPh/n9Sw7wY
	GhGf5PHVY9qJt+OhcShwaxVWHP4AMN+oL7N4FZcMW9MrlvvHwsgccNmYW72Xi6gCoUBKSvQuWN8
	SRy2+YKY4LExdzJ0m1h7v2DngYbaEWE4cpyRESlBhUrbeD79J2+kFEgE5Z1erLeYcEUKm5X4t5p
	sSt7RiyZcfSnYppZH1URx4jB0FLNurWF6i11/Y5BKq5MbtiQQAPLp1sUZrStQiVBBGgAja1hRwf
	/hgZxAHii/pDwoY7C058DJd3u8y/fgEY583QKtbY0HuKp7rPR0o4+7k14TcgwrmkI1Z9Llme+M5
	ujpsUY5FbXJiUvFVeM7DLHpg4et1wjDVlzc3daCf/2cpA0S1arqpgFlsmKh85cN0WM7Q==
X-Received: by 2002:a17:907:d113:b0:c12:5e26:da50 with SMTP id a640c23a62f3a-c1f7223e43amr112857566b.65.1785242585774;
        Tue, 28 Jul 2026 05:43:05 -0700 (PDT)
Received: from puffmais2.c.googlers.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c902d2sm745805766b.34.2026.07.28.05.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:43:04 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] kbuild: link-vmlinux.sh: more reliable 3rd pass
 linking
Date: Tue, 28 Jul 2026 13:42:38 +0100
Message-Id: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL6jaGoC/x2MSQqAMAwAvyI5G9C6+xXx4JJqsFZpUBTx7xaPM
 zDzgJBjEqiDBxydLLxZD3EYwDB3diLk0TOoSOVRoUo0bI8Ll84YuVdBzRdWGWmdVn2R9Qn4cHf
 k9T9t2vf9AII7pq5kAAAA
X-Change-ID: 20260728-linux-kallsyms-fix-95eff49b75b3
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

link-vmlinux.sh currently only uses the file size of
.tmp_vmlinux?.kallsyms.o to determine if it needs to do a third pass. I
was hitting a case where file size didn't change, but symbols changed
sufficiently to still move subsequent symbols in vmlinux to invalidate
kallsyms.

In particular kallsyms_names grew by one byte between
.tmp_vmlinux1.kallsyms.o and .tmp_vmlinux2.kallsyms.o, moving the next
symbol to the next alignment offset (4 bytes), moving many subsequent
symbols in the final vmlinux image in turn (until abosrbed by further
alignment instructions). This failed the final link with:

    Inconsistent kallsyms data
    Try "make KALLSYMS_EXTRA_PASS=1" as a workaround

The two patches here are independent of each other:
* Patch 2 in this series addresses the actual issue and also has a more
  detailed explanation with exact failure case
* Patch 1 could be omitted if deemed useless, but I found it useful
  while debugging the issue. It just updates the kallsyms.c to instruct
  the assembler to also emit symbol sizes.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (2):
      kallsyms: add symbol size for kallsyms symbols that can change size
      kbuild: link-vmlinux.sh: improve detection of third pass requirement

 scripts/kallsyms.c      |  4 ++++
 scripts/link-vmlinux.sh | 20 +++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-linux-kallsyms-fix-95eff49b75b3

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


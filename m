Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBB630B51D
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2026 05:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781069157; cv=none; b=TSUtCxqpB7Lf3VsfoNcRhs624P22fY6yJccwwqsck2nfYJV68st/rNS69qtvaZzcYV0usHlSTTnLgGORY+IisgX/+RimGtMqkTL/QsxaCHcR3M2GRDBm/D690/71bKxESmM2iw5pbbc/2/DGgD9aMSM9xdtyrXFNuUGhRI865eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781069157; c=relaxed/simple;
	bh=RgLvJfoktkYbk8WIGWa8iONc+11FqhDyQQ9lxOZgCxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nSmMP25kUkH7Aak8+7ClMH598zBAi+/HIpjNRQl7DLliDkQGXEw1uKTC6vTcijJHBuctg2AsKcNJo8VzPYYB9L11LcgzxlzfFT23TuD3HJDBbCnYp6khkmJDlK6VTEUFKYMtQXDD3h3i7cSVZODAqLqRSHR39t7ovmwnsO51U3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUksJaxN; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUksJaxN"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84234c83142so2641307b3a.1
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jun 2026 22:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781069156; x=1781673956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gvT1EVjtfblNZFvJfxilQFWKbaHZZ5R/iepDqQLGtW0=;
        b=OUksJaxNZoAIlQYVZt1A8yjfhHktt0SFNHVb5h5PUpSA717S9nYt0vKXWdmi2fmSJn
         ACDYxbDu/3J+W4j7FWHm0BD27OLKzMhyOt5EbPMX89wJudnUBJygrzALrv5ndS9eFk8T
         UsLm8J3tFULNOepZUfQ0JjcKQgWKt48WvyK51/WHL9j0XGeWjjeC+whP55g289a1X9vA
         lVzvjR24S0Mlr+2UIITB6CBKowL+dX51vmqAwr0QMn3uyKAungkt7uVNLVMlw7+psLhD
         e8jG7q45iSQiuSkpe9d0Z/16oW/IiS8Wzdh0VvAjHZe92+cdvs8S2jpSMb5UQ1x2YjxP
         iMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781069156; x=1781673956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvT1EVjtfblNZFvJfxilQFWKbaHZZ5R/iepDqQLGtW0=;
        b=gedPW5kZcfUC+pouWJNhTtIeQqhqpFH3WI7ZW6LaJ/653GOMXYLX6t1O65i6Oq8JjE
         VHWrUlPclCsMW/Upx+NKqnmM/ArNOwMpACWJ1DDhlCq3zvd1l6ydJqND9k6EBzMv5A5L
         zrXZdu58eIBomUAdUlCddSsvcBcHQOAs8S2zVhci/3V0ckjmCDbJIVp355XHFV0A24ov
         SNZJj2w8t59HJcmE3e7eVOCzT2ZMbtaH9S5QKw5n8Woy0dGVsrBov52p32hbWdJoICAB
         5bmCmolqAIGkkifnBpZDJmvfjD7ZfLDEdawCF2ed9uDefig1fsCi7eQ++mFtyO33UiYZ
         Vf4w==
X-Gm-Message-State: AOJu0Yw6dM18tuE1jXRm1C4YTBIwpnIH3MQc0U8wLymPi6fFpLOy8Hcm
	lxQDcumLMyrPQ7Fi/2v8t72JbZd3J/ZOelyzPUfBjxnIYsw/tfgPsmnZ
X-Gm-Gg: Acq92OG02RtrYnpwjXYJAmOy8iAL4bkSvdSPGYWNN8eI3kTDU9urfJYhYGFM8KJEYmN
	6rZXEUjNT+Q4gwthHdc1Kn7aZBywYkRhWyIsdxd53EbLn91N5Ao7SbosVmUS1mgaVcmw0h8U2Ot
	+2oxy4xRN1wrlFgIiwfG951Xg1H5tZ6Eqv7O8fUiKgg9vayrt8p8u36wWC79Zr5ilAoRGn3uYRH
	sMIKU1UbfEoY7LCra8BHrKLinmvzqQu55L20Sw4RFvlYNZxHPo/fwgZPViG5rlJMQOKm5B8iAhM
	jWN1qBLPufKo4C3zLh/94XFahrjFpQYvI086OPkzAAjazpqUOwNs1oW+8DwmTwcseAHZbl4Vo6p
	YjxeI3kYvbi3dEjMK60cWn+y9njgVThnhuhheuga9FvoDKhubS7XefyfWRNu8mSf+fGJLkONLzJ
	Z/MsFXM6ROvXQjnernBn+EnI4zQcXZYyFkDUtTaQ==
X-Received: by 2002:a05:6a00:a13:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-842b0e95e0fmr24760458b3a.21.1781069155781;
        Tue, 09 Jun 2026 22:25:55 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:ee8d:482e:804a:1508:13a3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm23172109b3a.48.2026.06.09.22.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:25:55 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH] modpost: release allocation when early return no suffix .o in read_symbols()
Date: Wed, 10 Jun 2026 12:25:50 +0700
Message-ID: <20260610052550.187006-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The allocation for elf info symsearch and hdr from parse_elf() haven't
been released when return because of modname didn't have suffix ".o".
So, release the allocation before early return because of modname
without suffix ".o".

This is reported by Coverity Scan as "Resource leak".

Fixes: 8c9ce89c5b63 ("modpost: simplify mod->name allocation")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
 scripts/mod/modpost.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index abbcd3fc1394..8e231544f9f3 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1585,6 +1585,7 @@ static void read_symbols(const char *modname)
 
 	if (!strends(modname, ".o")) {
 		error("%s: filename must be suffixed with .o\n", modname);
+		parse_elf_finish(&info);
 		return;
 	}
 

base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
-- 
2.54.0


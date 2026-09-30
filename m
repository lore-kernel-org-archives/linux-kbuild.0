Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CAC4D954D
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Sep 2026 13:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774480; cv=none; b=tx/RwP5YB/iPqs2Lin+uQqTlMX77rLCWENG+y0wc/Ja8uyiKZr2elTmUF1kYftS7lg1lm+xboUR/ZBbLCtTTKp395KQCPRXolGRmdVxRFG7GdlVSTlxtYDEzxKx6y6MVGLu3RGMeTR2Pm9zHIcPyoPTsMg5EX4p97xqSOrWGZ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774480; c=relaxed/simple;
	bh=KF7dDOx7DaLCNyQNSsul75suel+43Q9ip6d+eR3BH5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ViTVZx8pvTqF0DyJtOLvBfAnvywkNnNcMzIWTAcQSVZFnV1y8SCGgDOhO5J9mFRHC1OGfnXK1QDjizO8PNu4O+0aCZ16PmhuI7sAYfN2/Mc2hd9T6FcM3hmSpVevbq2euoZ6ggbZAvmQ8rx75acQ0ydfz2FNdRNxXJsTZuG8rp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fplhQ7qS; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fplhQ7qS"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b0503e39fso103562f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Sep 2026 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790774471; x=1791379271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGm+gMifQidcQlMxmJXtxnGy2ShpN9JxNJdyz7K8Aho=;
        b=fplhQ7qS3y/WREvjdvh6RXRkRgvXvOtCsOAJdGliy/q96tIMygouXNL24DOTuVX/RD
         WbFpOOzuxTnz/r2T7sKC4GDLCJR2SJn2xcBrie1wfijTj94dlxbFcG77S17im+QNnTFL
         gbJnqQNzokUkHi/etgwrVSMBDEo0hOrh/IG48vSzxaD5v8iM/l51yBFyyWUSV8na+Rn8
         yrZxgsyzRgsTQQiN10nj9ucLYzcf6Yesn/qq0wwu4fHe2avjVQTJ2ilxDUgCmtuwJPUD
         MbeLhWdWuhW7ttkYDOndOK6sdIeUtBoOARJILgDpXcrtAslNVUSGeb18zZbPUcJVWYPV
         Bgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790774471; x=1791379271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGm+gMifQidcQlMxmJXtxnGy2ShpN9JxNJdyz7K8Aho=;
        b=yTn6OXgEXEc3uWdj7SJt0NpmGU4GjBaiSj4eJKvZKOKv0zc972Q6DawwG5OirnlcEX
         8Ap8INh8GF06HekPWOPkdVSyFYcALgKoO3H86jXeQMV6ONytDqSDbEof1W8LV+ssusA9
         QzFzjYpy0aJBC6ouK3gw9vWlSAHYcJ9viA38+Mz5gi4aLtIwbTkr9qddLSZ9STagaL6p
         4xNKss1s4sSbx1wpJXN/U+YwlLLykwwPTA3iLmyM00qBKpeHRI2S0NorO0OHspVkIT1d
         i3cwd1X9TqhOB58hNwe0Bwz8WuD1RrzGeAC7HBu9Fq7AuBGcpIyp+BoWfKUTIOfYoHew
         aZ+g==
X-Forwarded-Encrypted: i=1; AKwUvByyGMR2fncbt7zoMSsE3ILW49NsahXCildC+vNtmUTl/c4ZJ7lhT7KtJhzc9bD7c9s9IJMCRv35z8rQOCI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3HeZUQgrcg2Epd5OBS9EnZ7CLe+ykfiTFNC/o7qFhUZtzjcuh
	WQ6mvC1jjd6mIAfmDQqRbVqAr11v/ZcRgZZQ2giu/YE1h/eFFgExu/J3
X-Gm-Gg: AYBFou13EyknxqPwVLdjoUempGcZj+lcTm3EtQHw6PX7PyNz4KWIdR7TC2D8HV5u2uc
	anpQDmRSj6epFAmnANJLsxRK5UAAe1zCJUnvPu5A5I1XVHhAWTg2x9POxf8uMQwYGkuS8XZgbkO
	pGQQFGcmaaCIGhHvRGLvjmLDHP7pvMtliDCk45JJM1L4obELrp43bztgpYDMAgqhYKUzbYntZk0
	BZ43Lawzkod+kqUhXOrPXixy8WZVpUSueTh2+34TKRWKEAlFdHETznbyeZ97P9hJuH+sQbBPKFO
	pJx7xAF3S2cMxFmiOOGap2e+ktZXkgFEO4U8SEF4SkWZkvL8AdFqOW6dJNg4RwtsySahxumLhUI
	vTSvEDXE7Vn3QaEFvYy7o3sMV4I8wWk/vdUahk9JmAU2hpkuixzkFtSpBR6XMuzT8FCZM8i5jRl
	4jXebOT6l0ep/0rVi+jPWWzcmhoiZfFu8QeHQ1oAMJyLNnrcNKmVErSq7QjN4ok88LsMA/PEdyv
	PdiMGYkGl7CIdU66Z+WzJigk9j+mUDT7ll0m7TBxZFTLmffrP/VVsI=
X-Received: by 2002:a05:6000:2284:b0:488:8859:b0dc with SMTP id ffacd0b85a97d-48b02554433mr2945079f8f.56.1790774470878;
        Wed, 30 Sep 2026 06:21:10 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bef64sm5047284f8f.10.2026.09.30.06.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:21:10 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Kees Cook <kees@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	bpf@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Zhen Lei <thunder.leizhen@huawei.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH next 0/2] kallsyms: optimise symbol search by name
Date: Wed, 30 Sep 2026 14:21:06 +0100
Message-Id: <20260930132109.260597-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 is from Jim Crome, included so the patch series builds.
This is currently in mm-nonmm-unstable

Patch 2 Removes the linear scan from the 'search by name' binary bisect.
Data size unchanged for 'sane' kernels.

Seems to work (I'm running it on this system), but I haven't got any performance
numbers.

David Laight (1):
  kallsyms: Optimise symbol name search

Jim Cromie (1):
  kallsyms: Match compressed tokens on the fly during binary search

 kernel/kallsyms.c          | 171 ++++++++++++++++++++++++-------------
 kernel/kallsyms_internal.h |   4 +-
 scripts/Makefile           |   1 +
 scripts/kallsyms.c         |  50 ++++++-----
 4 files changed, 144 insertions(+), 82 deletions(-)

-- 
2.39.5


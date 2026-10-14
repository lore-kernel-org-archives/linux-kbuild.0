Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C8A52BE35
	for <linux-kbuild@vger.kernel.org>; Wed, 14 Oct 2026 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985229; cv=none; b=TbBOXDclmXvFJlDW9/Fpg/SeOH8teydPatE40h5kPX1g5tx5rGh/Q4wSQyqBlMU8OAOvOnnyd1vJL4eBYMo8CS8/Uz6r/znUBRXzcCKVB3sZJ8GSxiQFxsd2NE02qzcJ6tDwFWX2QoOzdXM3to9qUxgg0H7pqsGyAggQNw65awQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985229; c=relaxed/simple;
	bh=W5yOQ61rKBYv/RMJIq2Eh/EaYd8zAs9RxgaF3vvQVDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bqG6sqIF2cKjgy9F2ffRlAPWI+wSqWJYOBr7DVz/7kyXnpxCNk3WXy6RpKHpwpbbO97qoCU0QCkqQB1ealOR9EDP+jBwfVV6jcFF5u0UWuGpqiZ0ZJWueYInbiegLsif23s9CSWXlsKZI2cvxJWnQdLNrtH6eJhoHho/MAJk3Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzoACW4t; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzoACW4t"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so13890315e9.0
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Oct 2026 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791985221; x=1792590021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FtK0lRUjLXQKxpCoNzzWjfIESEFE9YW7BbkGrmVQGAQ=;
        b=dzoACW4t3eKHXdsynsrieGvskNqqhKtjTyVSzXPkPw4xnpl3aV+oIWyFZNiWJ/TRfN
         iONc3/Q8Eh82DkiE0+9uvfIN2OMhXXFcmcvLtyZk2xyr96x+uo740Q7ojOqSu9M7A8J/
         08ByaO12kz3CVD332Ui6FSUYXxBcuxOwaDNIpis2uoY19iQN3VtVI0NFb+JTBLvcxqff
         RPErLZc8aZQaaWAFVD+Ftigo2FgAv8TTZ6r5Moii8ByXCCQEgpThkNCAfl8SdLWNsVWm
         JFwawLNpQIHY8n+SpQOXIto7vltZthoAKNMC08SMp3o9ir6ACwGLOl0hrIiCeckymQOY
         47uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985221; x=1792590021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtK0lRUjLXQKxpCoNzzWjfIESEFE9YW7BbkGrmVQGAQ=;
        b=20X7YrutZ9rhuwm/2zPrxt1MmcMpa8HPKL9QsGVjf+gTwxf5Cdhfe2swB8oOzffFWK
         KZDb1BPIt/+MHhZnCxUVZFKwekQT2Ct/Se+USlCzSsDwePht/yANhcUHGy56I8SeUZWc
         yb0q9uRTkeiP/uwlmSNvgWG/raVgqJ3sjxN/K5w0qQyKmkiXyRW/YWDAO++DsNdKZmR6
         LP9Dhez7KKnw4iMag5k5qdLnXqGyRXiOSQfp6I56qaPVDgUQoPcgU7K17gGo8MF7xv/T
         W1AoRqfiErxLmOK9Pq48DcO+n9NJ7CZtFnzgXYD8/5saQ2GVxwxLdywdpmDDwIhvZu7i
         1ToQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX+t5av+23fSSCsHLUrB8l5U0o9ijCmK0ftSwC+Kgw94/1XsRlwcvsCo7Pssu+OyjLz0I6GrV6tvNWLME=@vger.kernel.org
X-Gm-Message-State: AFq9FYLm7nn1yoMAfAARL6pP8mCgyEHnvidvb0rWsSL+AXMHmElqNrxy
	jfurDfphuKcMEY83fa/PKr0/hTypFS7vY5YtPX4oXD2EaxJwAvcMa7Jf
X-Gm-Gg: AYBFou1wy5zP1eYbf8+aYwneoSfc0VXyzbU8V0G2j7IfDvKAyqg6ncJQfjwsRm4U964
	mElBLRbuEOGC48yISMjSOecJCz9Y8ohHY3n3yGNbloBI/V86KFfxfYX2zEkI19CdlX31F8fQfDJ
	nSSCQmpWsbWaTNeWQWkp6DQi5z8vZw29+NZIGj86KBYGnnOgWCUQt+0MpY1URI/5HtSjHB/+3S9
	JF9tCvkUYGHzX19XGVzbnwYai4qS4nXgLWCaMoLvIxomdfpptHKm0jSGXecV0UzSanpz6HVn4a1
	ZDsYdEEAz/u4LlXPL+bTNN+u45OCIEBpbAeebzr3+Ar0RqeP9IPdvaXyVIeu6lM7s4+PG/UpGjd
	wsQe+zNeiVZQa/sogTyhh4MzsdhXCo/Onu/h0WRrPTlzDTiQEFaZHHz7LTMkAvsvm+spyfB34CA
	8ip3CBOM3OVqTkcIlE/+otj83o3O4Z3fzkPww/1WOmolEoS7hNR4C4jvRNfrnSnSHJ824G1TouR
	c4wv0SxY+unRGgJIs1Y75UDUH0L/hBwxjz00tGXmw8HZzmE18J25HmHVYc3X+Y=
X-Received: by 2002:a05:600c:8718:b0:4a1:7259:349e with SMTP id 5b1f17b1804b1-4a18e4e0a33mr307699125e9.27.1791985220840;
        Wed, 14 Oct 2026 06:40:20 -0700 (PDT)
Received: from nixos-office (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac52d3sm12036009f8f.43.2026.10.14.06.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:40:20 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: n.schier@fritz.com,
	grahamr@qti.qualcomm.com,
	rdunlap@infradead.org,
	nico@fluxnic.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 0/2] kconfig: error on reverse range
Date: Wed, 14 Oct 2026 14:40:15 +0100
Message-ID: <20261014134017.2310819-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds more input validation to Kconfig, specifically checking
that ranges for numeric options are properly ordered. This check was
originally introduced as part of kconfirm [1], but there are no findings
for this across the tree, so the check can be added directly into Kconfig.

Patch 1/2 adds a prop_err() function to match the existing prop_warn(),
which is then used in patch 2/2 where the check is introduced.

[1] https://lore.kernel.org/all/20260904220559.GB2787252@ax162/
---
Changes since v1:
- fix typo in commit message: where -> there (Nicolas)
- adjust warning and error printing to match gcc (Nicolas)
- handle case with multiple (conditional) ranges (sashiko)

Link to v1:
https://lore.kernel.org/linux-kbuild/20260922163749.2031594-1-julianbraha@gmail.com/
---
Julian Braha (2):
  kconfig: add prop_err function to simplify property error handling
  kconfig: error on reverse range

 scripts/kconfig/menu.c                        |  49 +++++---
 .../tests/err_num_reverse_range/Kconfig       | 111 ++++++++++++++++++
 .../tests/err_num_reverse_range/__init__.py   |   8 ++
 .../err_num_reverse_range/expected_stderr     |  11 ++
 .../tests/err_transitional/expected_stderr    |   2 +-
 5 files changed, 166 insertions(+), 15 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/expected_stderr

-- 
2.55.0


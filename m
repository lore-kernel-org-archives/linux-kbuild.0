Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9916121A434
	for <linux-kbuild@vger.kernel.org>; Sat, 29 Aug 2026 17:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788024001; cv=none; b=t8kAeZQC9CCNjRbwLjpqlsmd7gGyr60o3PPBJGn9SR8wtIjZnHqwnQtKNq9lfs9SA2y7TA968khgxzDaHbQEmx19f+/lzGjmY2oqQV9wJwm5qx60c73vquAVWyEe/hJsqqT3kmUK26VFb3knzaN3lKSiwypD75cxRMUz8+1XmSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788024001; c=relaxed/simple;
	bh=gzyG0Ut3hBq8/EdxfysApzysmJvogHClAIb4KPO+YJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=otbmunO6ETYE7UoGsmsZ5y2g/4yZY8PlwbZPr0t/b2/57I9LvMXFxks4LtKA95CjJnVkFOD62Yd28C2//Vicw0Keb5JOeLb6WsSQpoEyD99cq4GiN5ikbujRpJgj18M41YybMyS4Y83442ToFkYoRQTqer4LemG2muLIyLwQrlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPO4++DL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPO4++DL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso21231715e9.1
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Aug 2026 10:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023998; x=1788628798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjtxZp+1cmvuSgfyC6Dsr7StqMjbj57Jnc1lQXIGBbk=;
        b=KPO4++DLl2BqKo5vJa7R/2klDQeMRG/6xJFPUPGKR6go4E4O0gOiCiY2FHkAcg0l0k
         TZAdiXbC0OpgJ6gh4s96bfIOU0nViTZG76p1ZeFjX49g+m3XVSQzHr4taOjy5U/fkmdP
         E/1NEqif0WlJrpKQo62vLdD7EzxXxy7yg4FT+3YEPnFYqEmHfBFj5uGBQFa6Pnrq1Exn
         UoL4qofEmoUgd0r/FbMQpD904w834S8MwdC8BSq4lx/VjRaxMaeG9xkn5Y9gGmb51wkV
         J336BEEjcD/cgbx+2gwOWVlwwSZbGefTMy9FQ2po1+18B8GUoRaKF7LoMbr3oFYR1Hk/
         fJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023998; x=1788628798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjtxZp+1cmvuSgfyC6Dsr7StqMjbj57Jnc1lQXIGBbk=;
        b=giLRX5UfbidmE+147ji9GaCz+rPvRV6u43vPidgxQMqfqYSJejp93JFzXNQI+xq5Ri
         vvKQXoREleImO5xodtGNPTcvBy8hCy1G5z/SOZk7e0BzphL4h8Fx0Yvzp5BktNoMy5R3
         vOT2l9CTHCpuv1qdsGBL7jTGLm1x5gJBz/9Oxe9j2qnxTZ0pkI6qYgwYASoZFc5pLqtH
         4OVtzLEydq6vjpAfUgJv8NTE4hTKnsoR8XMe2yztS1TEMdTCoOmXY46Yx6f8b07Gk9MA
         0r4tsXxS05wVUsYPsOOLK9W6UrbpdsWHdG8mmqmPEa+QKZugI74vtPa2yF849SR5vIhe
         k8Cw==
X-Forwarded-Encrypted: i=1; AHgh+Rqnc1neM6JIE1jRMWvL9sb0EncVQyIclz9x55S9UGvxtC5bc+wcOXn72XcVqYOjEIwWUpD0NmgKCT+d1vM=@vger.kernel.org
X-Gm-Message-State: AFuF++mpogUjT7pDXfZAb9CRjuU7cKMOLW2U6J309xdc+eQPz8cfAmOA
	KrwmC8MDRwichvHBqnYiElmZfY7Gwnu7RSxidOOIHh9b4ublSlD+K1uB
X-Gm-Gg: AR+sD11LNikvkmzsQSSYtdOLpkOk8FopCKr9cqzGErZtfJvqzr9bz5ywaiDPyyLEQxd
	RunRFVT4ZK5VzTSzyt/rFp1wkA5g67NPUFjO3lc94iGAslzc6awp+jWZhnig8/zlIjDTcWfVVXf
	kne6UAZHb9fQVE1SnbH0L/06W59MBj1Ibv3dzF4KdWTIaFFKnxSl+VGRAvWvCtomv+nlAUxppMh
	KWoKICgOSPdMC+fB3dRX3ZZVXCnXZ59EXt8MFi2d7pf8E/2KIZUDmAjjGqKGuREuo+O96qgmzPV
	j1hEen0gsM63tMZh7XhS1aToFeXTmJ/ZPR3CBmSFb8FBjak1VYUQA3eNvP9XKZeq+Mt9LfheZ50
	Wsjiqv1KxJ3kLBxcXQFN1irEkCv/i1nIN8/GSf+vV8AwnJCrZDBjLPOrkP70vk5E34O5f4xAM0u
	sTMPNv8cV87Bv8cxQRl8EbjJCHT5HYHgVQZ4mGQJeJUik68S1h2SEV8wP5Yol8VnioLgEKVzVdZ
	2kgCzzfK4157O6NYeqVwrewN8JH8CbIaL22YKhHXqCw8om3DMXm
X-Received: by 2002:a05:600c:8b35:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-49b91c3b71dmr226235025e9.11.1788023997546;
        Sat, 29 Aug 2026 10:19:57 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm121080285e9.1.2026.08.29.10.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:19:57 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	kees@kernel.org,
	pengpeng@iscas.ac.cn,
	vegard.nossum@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH 0/4] kconfig: improve input validation for numeric options
Date: Sat, 29 Aug 2026 18:18:58 +0100
Message-ID: <20260829171902.1510587-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves checks for invalid values of 'int' and 'hex' config
options in the Kconfig interpreter.

Tests are added for all new warnings and errors.

Patch 1/4 promotes an existing warning to an error, for attempting to use
a non-numeric option to set a numeric option's value. This warning did not
have a test, but one is added with the promotion to error.

Patch 2/4 adds a check that the constant values for numerics are within
the bounds of the type (64-bit signed integer for 'int', and 64-bit
unsigned integer for 'hex'). This prevents silent failures, for example in
comparisons.

Patch 3/4 adds a check that 'int' and 'hex' options aren't used to set
each other's values. Since the values are naively reused from their
internal string representations, this currently also leads to later silent
failures. 

Finally, patch 4/4 rejects out-of-bounds numeric values from the Kconfig
frontends and adds a warning upon reading in an existing .config file
with one of these values. In the future, this warning should be promoted
to an error.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Julian Braha (4):
  kconfig: promote invalid numeric reference from warning to error
  kconfig: check for out-of-bounds numeric constants
  kconfig: check for hex and int mismatches
  kconfig: prevent out-of-bounds user input for numeric options

 scripts/kconfig/confdata.c                    |  6 ++
 scripts/kconfig/lkc.h                         |  2 +-
 scripts/kconfig/lkc_proto.h                   |  1 +
 scripts/kconfig/menu.c                        | 68 ++++++++++++----
 scripts/kconfig/parser.y                      |  2 +-
 scripts/kconfig/symbol.c                      | 20 +++++
 scripts/kconfig/tests/err_num_bounds/Kconfig  | 79 +++++++++++++++++++
 .../kconfig/tests/err_num_bounds/__init__.py  | 12 +++
 .../tests/err_num_bounds/expected_stderr      | 10 +++
 .../kconfig/tests/err_num_mismatch/Kconfig    | 38 +++++++++
 .../tests/err_num_mismatch/__init__.py        |  9 +++
 .../tests/err_num_mismatch/expected_stderr    |  4 +
 .../tests/err_num_non_numeric_ref/Kconfig     | 75 ++++++++++++++++++
 .../tests/err_num_non_numeric_ref/__init__.py |  9 +++
 .../err_num_non_numeric_ref/expected_stderr   | 16 ++++
 scripts/kconfig/tests/warn_num_bounds/Kconfig | 24 ++++++
 .../kconfig/tests/warn_num_bounds/__init__.py | 25 ++++++
 scripts/kconfig/tests/warn_num_bounds/config  |  7 ++
 .../tests/warn_num_bounds/expected_config     | 11 +++
 .../warn_num_bounds/expected_config_stderr    |  3 +
 .../warn_num_bounds/expected_frontend_config  | 11 +++
 .../warn_num_bounds/expected_frontend_stderr  |  0
 22 files changed, 413 insertions(+), 19 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_num_bounds/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_bounds/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_bounds/expected_stderr
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/expected_stderr
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/Kconfig
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/__init__.py
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_config_stderr
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_frontend_config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_frontend_stderr

-- 
2.55.0


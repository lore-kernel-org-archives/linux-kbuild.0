Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036BC4A3F10
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 21:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506915; cv=none; b=ASRaVejnmx2u7ox+SUjarK89hNdEoR6LfBp4a/5ojg++snMigb0bXBhnHLBF0JTVP3YTvSgLZm1PPcGG9VtTDVVtlVZ8Q4VnfbpH4DDcnJbfhAlcZro3iir/6rVO07hWq5j5yL6ylSsfHKc3vi6epijHGduNq03Xg7eaGFnGUAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506915; c=relaxed/simple;
	bh=ALhkxPO+fNFOoRpay0MJRDbiqxW9v4c+hhntR24pFbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aSa0LIV63Fl3kunVAP7yR3yK12o+p8629nt8KZR348NKC40pRKxyTByXlZz7LbFz0jFM4bQM9BtYatOT9pUihXlwi6DflsMP7kCB0OXjL8lyOiJUiqcK4fhN7QMe7xNZ4MihDkpNf18xWVgEDAY/hcMj4NOwgv1pBLWAULP6ZOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXARi+p9; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXARi+p9"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so1448225e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 14:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506912; x=1790111712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fh5M+SOXGFOo0fE5dDk6nfH861G3XeTauBS+ExEQBqw=;
        b=RXARi+p9Xb/ZFzb8B0LTJreAiBpb9iQmvRUPxQndqwEjYEYuz65BMRwSlQM/3VGm1j
         BH2mpLeDI4ZRhn5fTuAfg3Z7GWbLB4GRRfrd94QQHwc/yfnCmv5QW70KhZwnlV7+LdAJ
         0k9mf98hafdr6K9ynb1pmxyRWv9tTbQVAuOHtweiD51SNA9h6toqoAISFpS+kdHWHmlo
         A2IGM40CgBEq73fT4y+4Zc2RD+XVRmopbegBgs94dURXTO2dBirAaB2YMsQEopjzErbN
         yEsNDIeiuZ1JL6EzGuaY4cQkD5BIm40OvC4gYvEaijm6Cn295CHETRaYhaKELCTZAV80
         NLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506912; x=1790111712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fh5M+SOXGFOo0fE5dDk6nfH861G3XeTauBS+ExEQBqw=;
        b=QBQG/P+La0ol9NpZrOUqmHcirhPrrT0a6xhQGZYN1upB9lRZvbuMzLnsJi3p14D0bF
         RC0iaWaKrIwi4e1m084BKRa/DFE6pr3QnhOYrRpDjtbxm+zILg7qW0IQOthFWqaB4c/s
         HJxgoxCo0bnJwBtDdsdL0LvresPH4gFJV6ACgcYbFKjsk/OwTcXJ3UH1KJXLL2nxRMKc
         96Q+cFGMl+cnmP7nNki3PWY4Py6SH32gxgCIEKtWsvnO9S2cODDMqhCSHc073aZd9mkV
         yD1Kwaf/fnz2HBpZaRxSwYAPVLE9BA6a1nOrlJXo8m3CZ3w0Q3vnWk3CeA51cI7q6s4Z
         N0rw==
X-Forwarded-Encrypted: i=1; AKwUvBxvw27SgiraecKv7gW+XiWA9TW1xnWw6KF8mGctoXXt2rmphk+T/gaq2ofbldenORN+lHFO5oZr2fn9VVg=@vger.kernel.org
X-Gm-Message-State: AFuF++n2vOfu/P2ZVnUyvccmNC0ClwG10QCbI3vos+QuWFdsJWUFuTQZ
	GMWChp0/xmqJQZVKISpiQTqSxwjQoyJjuR2Am7oeec4fxOdI6jCkFuPm
X-Gm-Gg: AYBFou2OtXiSBhWZFJZjkqhHJ0SJahOthG8OBOoK/qf8OerLzLJTOwb/Btf+d0FdHuI
	b9bDZwpBzzV7AqowOE9O5MQrs0jr8Fn39AiwBlSZdr4CeIoiRJYLs+x+6uFmk5SaAEIBnCdGW1K
	XoROTA5QFGJDTNr9LlIyNWT8ahBJcibU/EvFRTXtEM9gbzh0bI9xcfRUf0BsuzNWq7O+HegN8Si
	HjgWiU5NQc0wVdXq3RTMR/54vfgxnIjnO5G33PzBdCnwDnmt3Elg0o3ZKgEnacgQmDkgrre4CKV
	NAmdkDWtiCUcxEFHrFwXj/zCAlsu8IAqRV/epZ948au995PPa2JhyP4iP21R3b6CmKtmwBivz38
	TXKZi372ckRlH5ZEubF91iVYDjCriXO+D94jStjMD7r17aM6EQZqdykA11X6YoYKg5tiEp58D4S
	PzQFMOrSjupiqONGJPzLrN0puVbaj6LapJjz8JhVk4/bndRtgK3d1/h7eYbwTvugV0OHd6NsK6M
	0v1TCGGGZSKNs1Q/9tRHa/H6kJuEdM3PzpT
X-Received: by 2002:a05:600c:3548:b0:49e:6e7c:d895 with SMTP id 5b1f17b1804b1-49e822a8fccmr30161045e9.26.1789506912023;
        Tue, 15 Sep 2026 14:15:12 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e962:d100:b3c:e4b2:2d5f:e949])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b1ba9bsm24804695e9.15.2026.09.15.14.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:15:11 -0700 (PDT)
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
Subject: [PATCH v2 0/5] kconfig: improve input validation for numeric options
Date: Tue, 15 Sep 2026 22:15:03 +0100
Message-ID: <20260915211508.291790-1-julianbraha@gmail.com>
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

Patch 1/5 promotes an existing warning to an error, for attempting to use
a non-numeric option to set a numeric option's value. This warning did not
have a test, but one is added with the promotion to error.

Patch 2/5 adds a check that the constant values for numerics are within
the bounds of the type (64-bit signed integer for 'int', and 64-bit
unsigned integer for 'hex'). This prevents silent failures, for example in
comparisons.

Patch 3/5 adds a check that 'int' and 'hex' options aren't used to set
each other's values. Since the values are naively reused from their
internal string representations, this currently also leads to later silent
failures.

Patch 4/5 rejects out-of-bounds numeric values from the Kconfig
frontends and adds a warning upon reading in an existing .config file
with one of these values. In the future, this warning should be promoted
to an error.

Finally, patch 5/5 fixes an existing issue where checks on 'range' values
for hex options parsed them as signed integers using 'strtoll' instead of
'strtoull'.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- unified formatting of int/hex messages in patch 4 (Nathan)
- added a 5th patch for the hex range issue (Nathan/Sashiko)

Link to v1:
https://lore.kernel.org/all/20260829171902.1510587-1-julianbraha@gmail.com/
---
Julian Braha (5):
  kconfig: promote invalid numeric reference from warning to error
  kconfig: check for out-of-bounds numeric constants
  kconfig: check for hex and int mismatches
  kconfig: prevent out-of-bounds user input for numeric options
  kconfig: use unsigned integers for hex range checks

 scripts/kconfig/confdata.c                    |  6 ++
 scripts/kconfig/lkc.h                         |  2 +-
 scripts/kconfig/lkc_proto.h                   |  1 +
 scripts/kconfig/menu.c                        | 62 ++++++++++-----
 scripts/kconfig/parser.y                      |  2 +-
 scripts/kconfig/symbol.c                      | 61 +++++++++++---
 scripts/kconfig/tests/err_num_bounds/Kconfig  | 79 +++++++++++++++++++
 .../kconfig/tests/err_num_bounds/__init__.py  | 12 +++
 .../tests/err_num_bounds/expected_stderr      | 10 +++
 .../kconfig/tests/err_num_mismatch/Kconfig    | 38 +++++++++
 .../tests/err_num_mismatch/__init__.py        |  9 +++
 .../tests/err_num_mismatch/expected_stderr    |  4 +
 .../tests/err_num_non_numeric_ref/Kconfig     | 75 ++++++++++++++++++
 .../tests/err_num_non_numeric_ref/__init__.py |  9 +++
 .../err_num_non_numeric_ref/expected_stderr   | 16 ++++
 .../kconfig/tests/warn_changed_input/Kconfig  |  5 ++
 .../tests/warn_changed_input/expected_config  |  1 +
 scripts/kconfig/tests/warn_num_bounds/Kconfig | 24 ++++++
 .../kconfig/tests/warn_num_bounds/__init__.py | 25 ++++++
 scripts/kconfig/tests/warn_num_bounds/config  |  7 ++
 .../tests/warn_num_bounds/expected_config     | 11 +++
 .../warn_num_bounds/expected_config_stderr    |  3 +
 .../warn_num_bounds/expected_frontend_config  | 11 +++
 .../warn_num_bounds/expected_frontend_stderr  |  0
 24 files changed, 442 insertions(+), 31 deletions(-)
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


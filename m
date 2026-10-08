Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549783955C1
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477947; cv=none; b=X1sLAp7weFBmI67TxKcj0Txnx2BBR9gt5nsBYscoxWLGAO+pt89MEHEYK/2C4UhuITrBegM1VSnKCycRPTe/hMt/p9rvP/iKXSg5u9KHefuVv9/iy3bWZN9phTPO5o5tE07pdTlEu1j30/CfnDjMWezjkk292rob4btTq1z9O2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477947; c=relaxed/simple;
	bh=2Gm3oCZAH5xEPW2gFonKXTzdW+Tu4iKs/jZ3IkMSoYA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iQGV6a646ncqPKexcOWgwkv9aTQqWS225Qv1wzybQugKzAkQ8rBIzzD4HXXGFOCxJZlGbxLNwcGXDTGrHIYTyMuYQxvWVo6Q7jzNWT7IK5TNl53aEm8/n7/Rf701BqAirOoEbnIWPSahW7QhdZm5MqYU4XgBy31eq+fZXPPSkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWq+cAzP; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWq+cAzP"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-82503732024so1459930a34.3
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2026 09:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477945; x=1792082745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UCfPp+7/JHVdolqbV5gJwvu/HMj/BA+RBUV+QQaMos4=;
        b=aWq+cAzPzQDEKT0AWeYSRGgYpaHhM2pf4VJNP5O5ggrzd5ialMgjxR6LMMu0AnyzP4
         08DHTEz5WqGbMOuObg/jUZ+s9G/BeSCdVakLN8SEZgEP9seX3bIeB7MM/4d/tnmz2NSx
         AgLRRi5t4L/68AW+qQzGm6ARg8zjIqJ3EjmklBUm+SJt27BfvBs6d/cAaJICYLY6JT5M
         X3FqjZJmwrVHU4wX+3hRUVVf5zq8oruTjNWLvZ1fWzQ03LyUP5uVFHc2mGY2lYI6MPn0
         wtfxAMZbME/rFW9Qze6Fc9kLz02ywrT/5thz+C0oXKbXhIoP5PxPIjZP679vDjeewkEG
         5GaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477945; x=1792082745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCfPp+7/JHVdolqbV5gJwvu/HMj/BA+RBUV+QQaMos4=;
        b=NyJExXQ0kx7BU5dyvfl8iYRGwCIzEivmgK5460b7RdOjJVPgP3622dECkayESJIFyy
         Sd3mgvEr8vpDhp73NM4xVr4uqBshS0sMp7hepEh5Uc6nqybxr6ZFY5j3NoryIqeacht+
         tJel7OGRciltR150Y/SGlSogWTWqrVyioFd+8fa8VPaTOHLqlVK+D9p0P+oVc9fFSkdq
         nIhxH+rdPRWOnf1q8WsLNzLbGaSgx/i2kWre6TZQCq7F38zD9GwzO5J5h70sKiRyGX/I
         HyqAQG5DLBl6b/1FhVeG9K4P2WQGvfXFd0tGncL4VsbyWkCDlUABN5m2AGT43J5OuMtP
         wbVA==
X-Forwarded-Encrypted: i=1; AKwUvBw9zfqakJ+QL2nCyW+S/P9tr559uFTqWWpB0l9wEiw4tlz8A0VudEDFk0XNfjOX2lIPU1qj3/3LJig0v28=@vger.kernel.org
X-Gm-Message-State: AFuF++l16vqQdxYbVbnKRVSqFXUwnW76Pmo3fJ7gPmuHxSbMIYRmzn5L
	djJnZoCnLSq4/lBJzy+Fl0OGrKSmPbtQINXjCUcG7KIyVdLaVf6lwWF31KGs4w==
X-Gm-Gg: AYBFou3TCHBLJ3M/3oCyh7oEjLypzY74NhmY1Mvsl/fm5ueikHoS8kJy8xw8MiOP55J
	fHdKouziD5InNxCSi/6b01+KCdizx8+aFQnFkTA51TgefRUvTOe+0knzvacRyK26+lweAVLsl9k
	3Eu2WRJbp23p0WnMznU4zDZWIRP+QAlxC/FLWbcyyXyArb7ty5a1/AUZzuMlB8HiBK5BzYmf1B9
	Evb8Kec5AZID11Thx0YRRZctNdhv+sGRTi3Mr9u7k3q75NY6scxHGzIe0WbRgzdyyw8X3f3vsKq
	XNollYQIE0Drds1MixWh1lynV5+aijDTIJmN4/yeAIS6znzwdZUke9AZMhMjHw16YYPN/Of1/PM
	rs8n3CIyAhCzvxyEOoXgExbMGj1hONA1DIPiHGnBdUrVaplqFBFWqnNGY5vHesnBbTtaLl4WnU2
	F2cNHOQHYHYyRNNOWDzY1RjMJWQ+0JmmlIzjNH1lz0uqwSCwUPp5AGK/xYd63PQoQiNn0zSntcX
	2g65q9N2C1p
X-Received: by 2002:a05:6830:6f41:b0:81f:138e:77a0 with SMTP id 46e09a7af769-82ad02b6843mr5713484a34.24.1791477945061;
        Thu, 08 Oct 2026 09:45:45 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82fc9430991sm64416a34.17.2026.10.08.09.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:45:42 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: julianbraha@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kconfig: use the value argument in sym_get_near_range_bound()
Date: Thu,  8 Oct 2026 11:45:40 -0500
Message-Id: <20261008164540.3686383-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sym_get_near_range_bound() is meant to check whether the given value is
outside of the active range of an int/hex symbol, and is called with the
symbol's current value from sym_calc_value() and with the default value
from sym_get_string_default().

Since commit 9b8719973ee2 ("kconfig: use unsigned integers for hex range
checks") it ignores its value argument and uses the current value of the
symbol (via sym_get_range_val()) instead. As a result, an out-of-range
default is no longer clamped in sym_get_string_default(), and
savedefconfig writes out values that are equal to the effective default
again, for example CONFIG_A=4 for:

  config A
  	int "a"
  	range 1 4
  	default 8

The existing savedefconfig_range test did not catch this because it only
covers symbols without a prompt.

Parse the value argument again, and add a test case for a symbol with a
prompt.

Found while fuzzing Kconfig input with ASan/UBSan.

Fixes: 9b8719973ee2 ("kconfig: use unsigned integers for hex range checks")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005202524.3461824-1-lzsx618@gmail.com

 scripts/kconfig/symbol.c                          | 5 ++++-
 scripts/kconfig/tests/savedefconfig_range/Kconfig | 7 +++++++
 scripts/kconfig/tests/savedefconfig_range/config  | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 2e87af0985..11302faa28 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -195,7 +195,10 @@ static struct symbol *sym_get_near_range_bound(struct symbol *sym,
 	prop = sym_get_range_prop(sym);
 	if (!prop)
 		return NULL;
-	val = sym_get_range_val(sym, base);
+	if (base == 10)
+		val.s = strtoll(value, NULL, base);
+	else
+		val.u = strtoull(value, NULL, base);
 	range_sym = prop->expr->left.sym;
 	val2 = sym_get_range_val(range_sym, base);
 
diff --git a/scripts/kconfig/tests/savedefconfig_range/Kconfig b/scripts/kconfig/tests/savedefconfig_range/Kconfig
index fd59d9082e..d879870a52 100644
--- a/scripts/kconfig/tests/savedefconfig_range/Kconfig
+++ b/scripts/kconfig/tests/savedefconfig_range/Kconfig
@@ -58,3 +58,10 @@ config INT_CONDITIONAL_DEFAULT
 	int
 	range 1 2
 	default 3 if USE_DEFAULT
+
+# Default outside of the range of a symbol with a prompt
+
+config INT_PROMPT_DEFAULT_ABOVE_RANGE
+	int "int with prompt"
+	range 1 4
+	default 8
diff --git a/scripts/kconfig/tests/savedefconfig_range/config b/scripts/kconfig/tests/savedefconfig_range/config
index d939cfe5fd..079a3107a0 100644
--- a/scripts/kconfig/tests/savedefconfig_range/config
+++ b/scripts/kconfig/tests/savedefconfig_range/config
@@ -5,3 +5,4 @@ CONFIG_HEX_DEFAULT_ABOVE_RANGE=0x20
 CONFIG_INT_IMPLICIT_DEFAULT_ZERO=1
 CONFIG_INT_CONDITIONAL_RANGE=2
 CONFIG_INT_CONDITIONAL_DEFAULT=2
+CONFIG_INT_PROMPT_DEFAULT_ABOVE_RANGE=4
-- 
2.34.1


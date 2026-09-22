Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED625372ECB
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Sep 2026 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790095084; cv=none; b=c4ra8EE+XahEI3AbsBpqCYgokTLWELVYJZvj26eD7YFQi7NNMKphsjm3znJG9YB519OWD1XHSwspu5UJPRYTdMocSCRtnVdnNk0eoRXTvPiC2civo9OWOXIFUXglmg2B/cFBqJ9hMAmcHlBCSdQmofXBR4oHDg2GqnfPHdKsT20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790095084; c=relaxed/simple;
	bh=u/5NBJ9c41St7uSuNDqGUFC2eOgMb+G9JYJcuiu41Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jyl2G95oUw9HSHz+Lt+SPsVYsSjEQGsv2ssbkHLLbeNrONSbdR51Y4KykfpxywrDM3BKgEST6evjYYxLObTT1GTdL89FzEGiLeUVcMyPEyN2xmaasB2PI3SYT56dFV0zV3PxSFRgWolDggiFnNNXajDzXWwCfjNIyM0ukv6nsEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIxdHPeC; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIxdHPeC"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so121054f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Sep 2026 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790095075; x=1790699875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYNW4sRzccNeX2MRnDFj382Q5PRFEVE8j1IYHbolu3s=;
        b=JIxdHPeCOBxrdOWzjfG7STEzTrJEv4cZAKE2lw8LxkiZHvOpB7s8tg87ZnA4ETL0ra
         jBYFJ20i7NneFKFcTt42JQCSjna8jXR23GHNLbDDHCBNY+DOLuZwKNGExJScicuFcP4I
         QOV0GMcbAn5LJAUkYCulHjXKFNWBgEdYPZcpIVNSJJpa4eL1isYUCgKal/Swyd0TdvQS
         dpqjpEQYrfFr0Oh5idE1ZQJOnKwbTHp/4aUnO6ZCrX81LwwMbdjamFLsxls/hh0ye+c4
         x6Xz7QBK3JnJsyA+n1EtTqEAvxy8el4/gX0gJqbRjfi/Sbf1cNhwXVfq8d1OHFIE7DEj
         Pleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790095075; x=1790699875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYNW4sRzccNeX2MRnDFj382Q5PRFEVE8j1IYHbolu3s=;
        b=K2i4elSoaxCYvl3bS4Bf2xsqKekC8eJTcgiF/RHTz21/df6nAB7NXSU2JlnRnby5ip
         bCB9FUgtB8HrNX8zol7qxDDO+DH1JWUrmv3MNjpiisClSN+EHOT0wFU8Ti+tr7VQT9Q1
         KHab9+hXp+7ZYljUT9bRaCXUfcwCWUqqFdJMEnHqetQHxMp8OULOjBrGGV6A+WzlPzo1
         8UPKJk8BS5FI1DzD1piKlh9AJKyfPgirwn3/YWU9dJlJUP0Y8txr1VeVIHQ2vsfp7crK
         mxe6fxqKozeVhE6Rg1fsDjsE2dVfHooRuNZGZB8SMBSID1/vkRpjJ77m3XnnDSML58Os
         oynw==
X-Forwarded-Encrypted: i=1; AKwUvByWakS3LWctKR1Ps7RsYL2g6VRH95cT6o67FgjYmSaG2X7GKUTXHasmq9Bpd1+bOafUCPAMTyRiWcysBoo=@vger.kernel.org
X-Gm-Message-State: AFuF++mntLVl31qXiUYQmN6g4UW5k8VRG279iWNAnGOcWlNwdPQlLuTl
	iFO/yd6OQdr2YPV9j0HhBz3VFwRY2W0aoOc7zaXdKsDpOYgIH+t8mK7j
X-Gm-Gg: AYBFou120Tp2VAteCkgpoKNQPa6AFaGTn1nvKXWAeIlzr8vJs0kY2qTYkIiA+Zp7Tks
	KfrCj+TwMy8gOw0Hd2oGjfOflee8JjxL1b7XSMcr3nQWgothdQyaO2zR+bpiooV6c03620ItQEP
	wXk5A/Lj0uSQcD62OladdB8od7yQM4zFCfrSQR7G0/6j84/ZiMGHvhtycUcnHkJGxhsWnjZNBZ8
	lvMclV2cydfaLHglyk+q01Xr/NXQgv9bpUtsGH69rD8P2c6BcgoEOtge1VfdvHjJ/62hFFxRawB
	H0qPHdsTGMciAzkvQHRZbi/SBgVKNUCC4dj8iB98njkx6xLReDm5uNQZXfRzjPKaZlPRUWFu22+
	lt8U87FKFvaIcrEIjiNr/rc+E6XDHqlwBLtYuNV906I7/5B7k+oC9YLVXz12ltwefMFedMgo6Fo
	T0gzOyPvIPcoLb3XSUu3aq5S0IOu4UWx+90prWe6QcCjmBJI9ZAd5DP7KVGbTWP2KzeBODqJbCM
	vVgZQdwGboUq5xl0cJhOSJdV80Z7uCQUNT0hri6X1pLpu2GoeNWvsbo4x9FaCM=
X-Received: by 2002:a05:6000:4a0e:b0:487:b53:65b2 with SMTP id ffacd0b85a97d-4886704a254mr309392f8f.6.1790095075001;
        Tue, 22 Sep 2026 09:37:55 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862773ee0sm6162192f8f.6.2026.09.22.09.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:37:54 -0700 (PDT)
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
Subject: [PATCH 0/2] kconfig: error on reverse range
Date: Tue, 22 Sep 2026 17:37:47 +0100
Message-ID: <20260922163749.2031594-1-julianbraha@gmail.com>
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
Julian Braha (2):
  kconfig: add prop_err function to simplify property error handling
  kconfig: error on reverse range

 scripts/kconfig/menu.c                        | 45 +++++++---
 .../tests/err_num_bounds/expected_stderr      | 20 ++---
 .../tests/err_num_mismatch/expected_stderr    |  8 +-
 .../err_num_non_numeric_ref/expected_stderr   | 32 +++----
 .../tests/err_num_reverse_range/Kconfig       | 90 +++++++++++++++++++
 .../tests/err_num_reverse_range/__init__.py   |  9 ++
 .../err_num_reverse_range/expected_stderr     |  7 ++
 7 files changed, 169 insertions(+), 42 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/expected_stderr

-- 
2.55.0


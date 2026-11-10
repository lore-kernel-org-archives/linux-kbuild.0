Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332133;
	b=IQxeYl07Xt3VqZ+5kMN4PJoX4iAIDqXcmCt6ublTTyEDYI0sXD/v1NJhxeKEtu52tFfa
	 hfAyHPf5NhBitz1E2dwAHtD7Ng2wRhIM5invP+/Ne8D7Th9arM/BRPGH924QtEvXwyYh6
	 ZhoRrbWjpojeyqLq+qpF0Y6q7h+kJcZjXn2ZXMqJ+jfLH2rfXh2wLGegQITaaRLQxe05c
	 w6DjWrBFSUChxS8TdWsaG3s7gDAyTwcSn5vko0KHI3RJCCUqdNFZ/a3/sm2xDLtwm6bC0
	 7SSOO6mZuXNOLkIHJCAZP9s3v+RWdAjIHVXNT8R8kAoolTDPYztQXxDXLip9vPlZPNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VRe6DvGzMVEKtF/UjYGmmLxKrND1yOzI81LM0TfOFc4=;
	b=zouo2mycc8rRRMvYx0Swa5EuAKuuZvaEsDoTEWI5tyI1lg3QftZWpTjNqi05We5F5yzU
	 HkJgnM2Gfbttpu9zPP7XcQSB4Z4DoK+JDyou3ogJlkMuBvbn5KzmFcY54vA5HbCFxSoKi
	 N5SWA9USfsAb+7Ps8zVaWWsXXx7/Jros653m96VecOhOiimM1JRqFI3hXC/Kp++5Fu676
	 zJJhgkzfQdmc1tIC5kVxam0qlSJ26ddej3k3I6wgaM8RkkP+O4MYia3LoqkTZqTRvtSLR
	 LaZkwfyEcZmq4FLZ70psfc4PjBL2Fv5KqVd8WRkqZgrDTzbrZgVqCAn4jpSW9w8Ootg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCLSelHd;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A4C606A31C
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 17:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A4C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCLSelHd
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso1538643f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 09:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332131; x=1794936931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VRe6DvGzMVEKtF/UjYGmmLxKrND1yOzI81LM0TfOFc4=;
        b=qCLSelHdSwkXDi7F+RK8rmmA8JQQ27OnfUgKyHi0/X6kr7m2KA8dGm7eRUAYrqbs51
         D7TRDFJSEHBeni84txLs6nAwKtI2lABPTcjJh8BIczjVP/5VhJVfoSkDRM1e+8agSbys
         S+pZfy8MzfwPQdYNctro7QYB7ppaWgtguEuRDyR3n1Ml1JKHFyn18zB6DUgPET+ymMlc
         +4d5BZDoz6gW1VdsoGSZnm5sH2TvxF1vmD8mg/MbznEkheFS6YAVdQIj8RGAC0S8tkKX
         myb04BMRp3e8bvAllXH1hpN/35c6bYS7piAZXKqXD9aqfzHKuxflD9Y02Ej6fER5yXun
         xDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332131; x=1794936931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRe6DvGzMVEKtF/UjYGmmLxKrND1yOzI81LM0TfOFc4=;
        b=bTRmj183O8Iyzi5VxBi2TjAIszRKb4Zs3p9MM6vN+792D/d9YLdNxEcV6GSDY1M8fg
         MxhTyg+fuZs9fYTaHr1LBRh65ypDV+9e3fZuUPLKANUj1AJcoH+SVItyWfxsXyNFRDsV
         iAniaINIpPVOQKWWW7NG4wJZICpsK100/tLcDY1WC+GcP5WNOMHErC2twSvIL4rtcVlf
         7dNf26P1RdadFa3XLKlawpWN/7EXESENCGHaC1pqMPnon7US8BxH05SWU1ZYZEWV5fJs
         JH2RFo2wlxFm9l8hk5BYcGYXOjry1B04BpGNTz4wO0gqhvZ4byW0a7+Yij2Y+8m9l+Q6
         +cfg==
X-Forwarded-Encrypted: i=1; AL+hErFLfYWoTwx0aqDVKV2aJfIkRcw2yrsl9Q7q3WxAxvBX06jRj0Q34PSVfkWlhRlc9tMnDXydNdtCdYo8hro=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F8OAPdkngJhYkiEucoGwgk0ZIp1USnykl7vsp2MJ9PJrjNpkq
	5gwJeV+qltVM89xKyt8e81tl5DKud15q16z4XtjNTrtS4743+xvmhJD1
X-Gm-Gg: AYBFou29ilDqfylXnc3viMlIfH+ZCwfEVATpOBCSRAzAil9pPgdFLhb8kCB45WHN/DJ
	/viJlE8Qh6ZoQkVrX78vPhL2rlR+EjAj3o9RMPrugYmQFNkOKBKiJ5yOs05k2WLlt3tdi93b1jK
	Zf25uFlxRVdkJBKn1F8Z4cOO3zywSFotNYsQjMpqscpANIaNw1kzNHVyIJuBDH9rCL64Pj8cbdl
	xS8TFBp66yWAPoRkoianTIyb+wUHYaXwmmtg0UDgtRUJ06PHojFpDk3JFUKrj4xoagHYWbb+S1/
	N6JcgPVJS/bTbLqkMYQ2R5tr8a/Y7RgELlCokOxdVrKwWdSW/gjY01XmZFSkB1pEUQyKVDQ38VF
	XJqWsUlZSF1+eDuDw36epExV1WZCAS9wVt6UD8RxkOSR6xSKf2Xy7EezxT8swBGi/XuIbMovg/n
	ZZAkpkBkKeWsIumUVYTx1ftcMxQBC3hBQAXUBrxX0b0ow7FG5loMwglYMvQ+oiB2Uy0hFYeDCyZ
	sfiTLtls31i6vnCooiqUM5s01446QwITnFkA3JUSwUgUu0TvFcbU6mVh1J5r7OjUHbwjthYeu+Z
	vXf3CGWBWnAlbt1Q6gx3xvjPkdOsIPrSl1vXVksg88KS48Wk4+9KL6kM+HuyN14AKcbq8jkdlZ5
	JqMrVohx52LeXzElb0Ss=
X-Received: by 2002:a05:6000:420d:b0:48e:7a41:d78e with SMTP id ffacd0b85a97d-4982e7379b7mr6438321f8f.19.1794332130261;
        Tue, 10 Nov 2026 09:35:30 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm6445687f8f.50.2026.11.10.09.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:29 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	a.hindborg@kernel.org,
	nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	jakub.git@horky.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 0/3] kconfig: wrap long expressions in menuconfig
Date: Tue, 10 Nov 2026 17:35:23 +0000
Message-ID: <20261110173526.1548434-1-julianbraha@gmail.com>
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

In an offline conversation, Miguel Ojeda reported that scrolling
horizontally in menuconfig's search to read RUST's dependencies has been
slowing down debugging.

Let's wrap expressions (like in the 'Depends on', 'Selected by', or
'Range' sections) between tokens at the end of the window, such that each
line begins with the same indentation. Ensure the '!' negation stays
attached to the left side of the option symbol, and keep the value
annotation attached to the right side when wrapping.

Additionally, write a '\' at the end of wrapped lines, to visually
indicate to the reader that the line continues. 

Patch 1 cleans up the existing expression printing for 'select' and
'imply' (which ANDs the select/imply targets), to properly call 
expr_alloc_and() and print the output of that function, instead of
printing a literal ' && '. This is necessary to ensure that any '&&' at
the end of those lines will wrap properly in patch 2.

Patch 2 makes the wrapping change primarily in expr_print_gstr_helper(),
which already handles writing expression tokens to a growable string, but
now also keeps track of the wrapping info in the 'gstr' struct because
this helper is called multiple times per expression. 

Patch 3 adds a visible continuation '\' to the end of each wrapped line.
This is because some line wraps are not otherwise obvious to the reader,
for example if a line ends with a symbol instead of an operator.
(Below example uses an 80-column terminal)

Here, it would be less obvious without '\' (GPIO_TQMX86):
    Depends on: GPIOLIB [=y] && (MFD_TQMX86 [=y] || COMPILE_TEST [=y]) \  
                && HAS_IOPORT_MAP [=y]

Note that the 'help' textbox uses the same expression printer as search,
so this has the side effect of improving the formatting in 'help', too.

In the future, we should consider a larger revamp that would wrap all text
in the search window, allowing us to safely disable horizontal scrolling.
---
Changes since v1:
- add '\' at end of wrapped lines to indicate continuation (self-review)
- use expr_alloc_and() instead of printing literal ' && ' (self-review)
- properly support trailing '!' and leading spaces (sashiko / Nathan)

Link to v1:
https://lore.kernel.org/all/20261010095001.265759-1-julianbraha@gmail.com/
---
Julian Braha (3):
  kconfig: print the output of expr_alloc_and() instead of printing '&&'
  kconfig: wrap long expressions in menuconfig
  kconfig: show continuation at the end of wrapped lines

 scripts/kconfig/expr.c  | 33 ++++++++++++++++++++++++---------
 scripts/kconfig/lkc.h   |  6 +++++-
 scripts/kconfig/mconf.c |  2 +-
 scripts/kconfig/menu.c  | 24 +++++++++++++-----------
 scripts/kconfig/nconf.c |  2 +-
 scripts/kconfig/util.c  |  2 ++
 6 files changed, 46 insertions(+), 23 deletions(-)

-- 
2.56.0


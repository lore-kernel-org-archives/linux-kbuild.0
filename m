Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744C83DA7C0;
	Thu,  1 Oct 2026 16:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873877; cv=none; b=flHmdREomaMCC5S+W87UqUSrGUJ+Keo20+P6Y4u6lsx28MZsk2TrrZIqqBGKj1QE+3LVr5poLVIkDfuk5NYI1S9LjI872ikZAmwA6HyI+FIK+Ufsi2rIf9SArPJKdiNGVeT+WporCI/ZPx8wmqdxggiXo78PZOej9Oqq0prlc8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873877; c=relaxed/simple;
	bh=MXgbgDAnI7rn5IrqTIFBqB/PlytVXVC9XEiWg2PwmB4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RVabOe4Cjqf5sF33yoALPBml6clVn6ArUa9mVisuRf1L0EgEZoZPhbuaKsAPA1m85xT0XrjgGZNY9HV5GyGHTtto+0QKxfjJ4wmsIovdBEba0kB1O763aq2LSpFB7D31mvy0DigB4Yjq1DJsW/zFkQwvwhvCvIWJi0k2vUczB5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=RJn3CHHK; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="RJn3CHHK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Message-Id:Date:Subject
	:From; bh=WBoL8+/IDop5lYVP15uq4BUaOWGMQHONcZqDwkj6tpw=; b=RJn3CHHKEivSJecBbhw
	E8es6OuMFrMyTFmrYgzUM2vffZGLnbU8xHmNnt7GzyUgDkYRvYY6cG6GCA3tJse0MYOoCt9naEb37
	kXpG+8fCKtf4Zv/ehzXeQGCbmDHsHqs+z6gBRX2VgLUfvF2Rw2TZgAVKyOUwSXrWV+brGPSxxxhpY
	uAKv8Hc98omOYD8ZTpz4HmTtJfKv5tZMh9TVJMLeeyl2akPPAN0pV+ERbYZHO5YjBlydGM6TgqCFT
	VDo7Z6ZqE752Cn29g7nBSQj5oxOC3lMmzdQYuVcSB1AK9yhlMPiJZlL7NNj7ydX6V4n8iUWsaRMTq
	olSohxKHlYsSDiw==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.sw.ru)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1xCK3A-001W2F-35;
	Thu, 01 Oct 2026 18:57:39 +0200
From: Konstantin Khorenko <khorenko@virtuozzo.com>
Subject: [PATCH 0/2] kbuild: GCOV cleanups following the prefer-atomic fix
Date: Thu, 01 Oct 2026 18:57:10 +0200
Message-Id: <20261001-b4-prep-gcov-v1-0-794792e06f24@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOaQvmoC/yXMywqAIBCF4VeJWTegEt1eJVqkjjYtKrQiiN49q
 +XH4fwXRApMEdrsgkAHR17mBJlnYMZh9oRsk0EJVUohJOoC10ArerMcWCuytiJnS91AuqTF8fn
 luv533PVEZnsbcN8P1XG8MHAAAAA=
X-Change-ID: 20261001-b4-prep-gcov-82edd7efd6b9
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Peter Oberparleiter <oberpar@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Mikhail Zaslonko <zaslonko@linux.ibm.com>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konstantin Khorenko <khorenko@virtuozzo.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212;
 i=khorenko@virtuozzo.com; h=from:subject:message-id;
 bh=MXgbgDAnI7rn5IrqTIFBqB/PlytVXVC9XEiWg2PwmB4=;
 b=owEBbQKS/ZANAwAKAVGWCkf5YVwqAcsmYgBqvpEEN92lo+Vl8tlA7nen/0ZYw0Ngo4fuKhIad
 aq/CA615ECJAjMEAAEKAB0WIQRWD23IPcXT0GO9CCxRlgpH+WFcKgUCar6RBAAKCRBRlgpH+WFc
 KgN6EACz8cNeGBAFdEqMbE3XysK49HT0AQRk7mxILnAfXFUzHko0jkqwvj/Q59qplg2T65vz5rp
 hHBPlVtJHuHX6uZb4rr57APuvj7KkOwoSSZyUVJrUkBJfx7mXHWTYxVxqBKGWlM8OmIGwa6cucu
 0YN/GOKZmwaZlcSPvu6yiRKdSH+dcFJDkJRy8RaH+e3q4BgYMVbucOmZu8iptHQ//GyWS0npdjU
 r8rzTODtUmmc25DH35S79PDABvDVn7LIHDDVow3tX3y8zLWF/Y5UTIE2uGfvCU32pPugTHw85ab
 NCaOFKCHV2hz98j1BY3ZwlNxkEI9+6kgQXJeFmyeX0qBURJm6ww/1/rZ+NF8EAV49tbrUyuGn9/
 6kmy7F9yE6gOaedxcI/z/v50kmIOb5FmQ948cF7obqQeK0j8pcld9/SeaKQrsGw+adNF1pfLC4B
 7pr3YiFozJ4aI8fhr4a+9F32thFvUoK31BJEAxAYYqbRj0jffBhzAKTOW/QsrZWOerGqgz1g6KK
 wHMLMoUX5nKY36vh0cnOhRFCkR7RmFnwqds6gCQIwBS6uPFiioa3HNun107ormQAXTxO2N/V2BM
 aXK9MlBvZGMXumvzrO7/chKDCRPCrj5caPnLEfe2HtHqyc681Kv6gvQKlTDM9e0irwJ9PcnVgZE
 tCvzjPa3+ArZNBQ==
X-Developer-Key: i=khorenko@virtuozzo.com; a=openpgp;
 fpr=560F6DC83DC5D3D063BD082C51960A47F9615C2A

Two cleanups Peter Oberparleiter suggested while reviewing
commit 56cb9b7d96b2 ("gcov: use atomic counter updates to fix
concurrent access crashes"):

https://lore.kernel.org/e1b6e768-51af-468b-a729-0ed3fceef2f1@linux.ibm.com

Patch 1 makes the prefer-atomic try-run test reuse $(CFLAGS_GCOV)
instead of spelling the flags out again, so the test compiles with the
exact GCOV flags, -fno-tree-loop-im included.

Patch 2 moves the CFLAGS_GCOV block into scripts/Makefile.gcov,
included via include-$(CONFIG_GCOV_KERNEL) like the other
instrumentation makefiles. The try-run also stops running on builds
without GCOV.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
Konstantin Khorenko (2):
      kbuild: use $(CFLAGS_GCOV) in the prefer-atomic try-run test
      kbuild: move GCOV flags to scripts/Makefile.gcov

 MAINTAINERS           |  1 +
 Makefile              | 22 +---------------------
 scripts/Makefile.gcov | 21 +++++++++++++++++++++
 3 files changed, 23 insertions(+), 21 deletions(-)
---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20261001-b4-prep-gcov-82edd7efd6b9

Best regards,
--  
Konstantin Khorenko <khorenko@virtuozzo.com>


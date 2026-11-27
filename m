Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737626;
	b=3mIwWEf4dTTPjCIef3GSN3FbISh/Od0TlHtSveTRNkRQfTMSgUWrwMhO30Sm6l51JkmS
	 1hGS+LGtBwIjuX9/XhrpLlozVRmpiwE1tNZxtPDD5XIGO3SBxSsfcE3BX2BLd4KpDqZHq
	 647WFjjOKRvBJW6ddyXEYb9zb3+HypRgHQ331g3KFqXJ5mYqsVABht9WQt7cMX8MQbV+G
	 YbM4grBrK2APC59Bk+dALgjQxqz8BN4tZJXLuPmCIanfHEkX/Rwh7RDGMC4OM3PcP7gMt
	 fb2EfoBPVD6prYB/r+BAbTwF0DtZEBXkP5j10/c0YYJtVYGAuRK/n9pN4g3Y6yaBpKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rbi2jPDujmhRc5z5gppxjoRcMRQjvajoDkRklULDng0=;
	b=IDoa4/Iys9Av9nawuj8AiXE8IpYx+4YYCRkB41B42nGw/1k2kBBXgHEJA9ZnoR5dFVT8
	 tfi7JA2itUpMCxzaliPXMNoLoFZ8n7C5mw+j60LO7lC2pwH8tzaN+ueQS81e94kpWQ70R
	 3E5yhWH496z+mxUmePxkBvIgj3ft6SNG7lx+kZ5C2Jfz8tjZTWTVw7Hb8s7CIjUtjFAhW
	 5yvQZ0YYCOwS3GLsquGBNQRfXYVBpoBR3TUZpykuU/LbUsctrE2rOgFsQYtklxqWwh3ls
	 csHXpV706ZKO7fsOMNQQPWiOOBMHXbyTuy5RkR24JwUAGgdFwTTHnRK7yEHZKLRyDqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGCFJtq6;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B50606A321
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 00:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00B50606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGCFJtq6
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso3451869f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Nov 2026 16:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795737624; x=1796342424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbi2jPDujmhRc5z5gppxjoRcMRQjvajoDkRklULDng0=;
        b=GGCFJtq6+W6CPFGF/ZSFEz958RH/AeA5EoHxtT4RIDGKhxyLfiIkj8VwSJtyz36D8e
         H948/ejyUIZ5xRunN7CqL8amDGNfMN33ZSPKi0usW1tCJIIHqR8cNSbDGIlQKAkCKYlA
         YFxfe2OY5G4KMUkdWR5A0zKdj58fKdJVy12tXfgSn8I7h+zKQxruG9Cad7YIoB2ktyne
         Yf0ziticDpRYz5mRIQD5stRH+w42GwtpQcjukYUrgqJSPYqN95xiteGAmMjACtO46jJT
         sKDYfAZtGdOamjrtlTiOt7CcXPn4T+uMt7PPIeU3UCEuU7oPXvPXFDeSPoxWaLEUBaMG
         KrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795737624; x=1796342424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbi2jPDujmhRc5z5gppxjoRcMRQjvajoDkRklULDng0=;
        b=Vep/MTN7lfFgU7hUm7PHsv9SQFCtIzFLqewA3E4nSSBtZDSu4bLOQzLFz5qsghU7Wc
         ZzVfKe+lYBdTvavifAAS0U6yNlCQEBU2nPYdzHuSbdPPGqMqZnk+/ysZJUzSTqvlEApD
         Zqh7wU3oQ9H82Vvo9FGzwdRvHAL+lOgqr+lxkenNVIqwtB9xhydG+lm9ufoEFSBP9xJQ
         PwRnFMA+FxWzSNbHXQ1RYTnMWKG/eiHYyBNWjjg+6q+prqgalBY6TXJqvqB0mrooCy8x
         /FhjeFuX82DBSOxn6AAC4RTBHwtC1yD1blt+dKpE3tcrOBhZyVYCeBzRmduLMUufCfH6
         MYbg==
X-Forwarded-Encrypted: i=1; AL+hErH09nOSmRG5QGnO1I1p6yrV0iVvac/LYxPA3PeMB7Dg5SbaqiPSuri2FKSqIMFlXHHEuin4KM6VufkwaPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qjft0z0meDvN3A7FlxfEaZmxgquZ9hXiVO7emjP9RIBALc2iF
	mnuISHqXRklMUM6NUVtizwrW9ef5TWpPjV3/mY4muPo17+1jQnO4gIZg
X-Gm-Gg: AZFdTZe5k0P97s+CDvxEc3+fKPmqjww0ipKhShqC4EKaD/fGeEGhRv2TbsNoc4v+mKP
	uMXMHfj3XXGnnXFlH8v+YwJ9jCfUZphFg3+qeZ66leiMjicpxRq6hM+AOltO6QpdiGC55ugM5kb
	Dba1juUuo1624Jddtp4hncKkQAw/dwG1QLBNYWmCVKJ8I3naLEZbj1MVwOG6QyrJsyrU35JZ0Da
	OvUcFrnWxeqehf0mg5S7tzDwEW8+SP1BW2hagKBzr1UDoOHZw16rYcgWl9Upsa3BkpDTQfnRhFb
	C+l2weVoAqp7VXR4PkjHi4ogdX6F2LwMFNQSfqfR+tsYZLbccbotMo7OHDoVE1u9LAZ89XeLviW
	Z9NYTBWqwu7mNc/Cf8DNRCyOTQzDJ/8FnasxFYflDPPM0BFarUSLqcMzucFUDeRAFdeoVBOiJUm
	a2VdHUfAoQ9ymRkRqzhUlKdA/nJ7BzntPTCgU/l0wIlhCxp4MCEQtrVF6ZkQPYxyw3wbN77vPiF
	7rDo7hITDHDRIf5a9UASNBrB3Tg5kaOMIHmeVJ0QJ9YE9wz2xn8GydpbQqAU60EExkX8ZjG/PyV
	Ncc41MpVzJ8DYLgrCeiK43dhswzzN5TEjtW99H/xCaTM54nbvgYyV9NEL7h0ZJei7YcNFb610Ax
	kZ0/XQnHHlR6ZdutmPg==
X-Received: by 2002:a05:6000:4024:b0:4a5:2e5b:51c2 with SMTP id ffacd0b85a97d-4abb4f59b72mr44345292f8f.29.1795737623844;
        Thu, 26 Nov 2026 16:00:23 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm45536616f8f.29.2026.11.26.16.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:00:23 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: samitolvanen@google.com,
	torvalds@linux-foundation.org,
	ljs@kernel.org,
	david.laight.linux@gmail.com,
	sashal@kernel.org,
	lzsx618@gmail.com,
	zuoan.penguin@gmail.com,
	petr.pavlu@suse.com,
	jani.nikula@intel.com,
	xur@google.com,
	sidnayyar@google.com,
	robertusdchris@gmail.com,
	acourbot@nvidia.com,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH 0/5] kconfig: fix slow 'make oldconfig' by reverting host header simplifications
Date: Fri, 27 Nov 2026 00:00:10 +0000
Message-ID: <20261127000015.3662267-1-julianbraha@gmail.com>
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

As Linus noted when reporting the 'make oldconfig' performance issue [1],
when the kernel's internal hash table implementation was copied over for
Kconfig to use, it also improperly simplified these headers.

By passing '(key) % HASH_SIZE(table)' to hash_head(), this caused a poor
hash table distribution due to using the clear lower bits with power-2
hash table size, leading to a slowdown in Kconfig's expr_lookup() which
makes heavy use of this.

To resolve the performance issue, let's revert the simplifications such
that the signatures of the host functions match the original and takes
the number of bits. Also, replace XOR in Kconfig's expr_lookup() as
suggested by Linus.

Patches 1-3 are pure refactors, restoring code from the original
hash.h and hashtable.h; 4 and 5 resolve the performance issue directly: 

Patch 1/5 reverts the removal of the bit count parameter from hash_32()
and hash_ptr() in scripts/include/hash.h (needed by hashtable.h in 3/5).

Patch 2/5 reverts the removal of the 64-bit path from hash_ptr(), so that
potential future callers can safely pass higher bit counts.

Patch 3/5 restores the original names of DEFINE_HASHTABLE() and
DECLARE_HASHTABLE() from the in-kernel implementation.

Patch 4/5 reverts the removal of the bit count parameter from
DECLARE_HASHTABLE and DEFINE_HASHTABLE in scripts/include/hashtable.h.

Patch 5/5 replaces XOR with addition in expr_lookup().

Link: https://lore.kernel.org/all/CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com/ [1]
---
Julian Braha (5):
  scripts: add bit count parameter back to host hash functions
  scripts: restore full 64-bit support in the host hash functions
  scripts: restore host hash table macro names
  scripts: add bit count parameter back to the host hash table functions
  kconfig: replace XOR with addition for expr_lookup() key generation

 scripts/gendwarfksyms/cache.c         |  4 ++--
 scripts/gendwarfksyms/die.c           |  4 ++--
 scripts/gendwarfksyms/gendwarfksyms.h |  4 ++--
 scripts/gendwarfksyms/kabi.c          |  4 ++--
 scripts/gendwarfksyms/symbols.c       |  6 +++---
 scripts/gendwarfksyms/types.c         |  2 +-
 scripts/genksyms/genksyms.c           |  4 ++--
 scripts/include/hash.h                | 20 ++++++++++++++++----
 scripts/include/hashtable.h           | 24 ++++++++++++++++++------
 scripts/kconfig/expr.c                |  4 ++--
 scripts/kconfig/internal.h            |  8 ++++----
 scripts/kconfig/symbol.c              |  2 +-
 scripts/kconfig/util.c                |  2 +-
 scripts/mod/modpost.c                 |  2 +-
 14 files changed, 57 insertions(+), 33 deletions(-)

-- 
2.56.0


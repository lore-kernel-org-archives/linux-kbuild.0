Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794020580;
	b=PVbQnv8Zia98q8e8CX2r+lc8vUw5XHLVkoiP64vz4+8PfsMza6Ca72f1BEwR387Bw1Kq
	 Yh9ooxslY+99rpTZpa8bBvt6UAzmwfXMxajOdbtwImLLnfOliHpPzLQ68jfUChtmKXdIy
	 3DLFirtU8MPOocCEuOVn4C2Q5IbIKuSow9F7gLPJWuF8YLFxtTXsibfzn5Xy5OKOxcG+h
	 /Yuam7iLNGup8yCB7hH6B0TD11Dx/WYW7IFxP9OLJUKy9Kr5iON9f/aFOwDlAdVse5pAI
	 +oB5MghsQn/U22AeLrK7IR+phQuMaG7OEn3mq5XzJH9uHNANJciSRUhNSSQ3Qv+ejgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794020580;
	h=DMARC-Filter:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/UkOQWLd6eRVRrDfK2+QZrH1T2m3PpYqb4Jf6gHiJ5Q=;
	b=Fobinfp9I4HYFKW+1LXRV4X0N5q4AFblDMa7gz/lXpGTq9roD7DJdwguIJ6l8yogdwzW
	 bH/jms45N8rzIKnpf9GCrKk/se+6x5FhxWm9xNKWe3Kyx6Ck9gz6lo6/AO4fob8+z94CC
	 Onf2EwPJr4gZ0xoAaAZQbDclhhqTluq17JiVXTWQsEQ6AkWdStDI51gXfEeehzZXOxSz2
	 uFdwL3koalfWoXjqId8DXFQ0Q41X4ng0KAfA3238r9RDFSR2vt5XpNXZezcbMwytSfhcB
	 ospnGG7QgaULxQKuvEIKTziizj6GgaD5dXFyX8EiA9+QFGi3kcBnOOo9/2L83V5bcYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Ul2Qu6IN;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65B606A32C;
	Sat,  7 Nov 2026 03:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC65B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Ul2Qu6IN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1794020576;
	bh=EtQCvew91uDEyX/1wCWDCqxhwRv/mNTPeNJbRJX41D4=;
	h=From:Subject:Date:To:Cc:From;
	b=Ul2Qu6IN7cjMdlTMNhNiSKPokV82Lq23BThf75E0jLc0eSuISBxAk15GvIrSgr7o6
	 mIhBA7atBNh/eFkT8yS+4NurNZ4YktUhXPprAV035AaGdm1vsVXds7jiYh6eIq/go+
	 /T+kU0c449QWViLTo2JyX5C9qPpv1dRaLNvH9rfE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/3] kbuild: don't print DESCEND messages from tools/
 build
Date: Sat, 07 Nov 2026 03:02:40 +0000
Message-Id: <20261107-kbuild-descend-spam-v2-0-3bb0a7c4781c@weissschuh.net>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf8V0bU3boIAr/8Ow6GNqx0chHUAN4
 d8tsHV5knvPmRhBQiB23k0swYiEbcyg9jtmg4434OgyMyXUSQpV84cZ8Om4A7IQHadOv7g3Qmr
 nS6irI8vPLoHHz2q9NhvTYO5g+0W1LAJS36bvmh3lstsKOfG3MEouuNXeF74qhDXl5Q1IRDYM4
 RChZ808zz+72iZJzQAAAA==
X-Change-ID: 20261029-kbuild-descend-spam-fb01adf7e985
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794020572; l=1096;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=EtQCvew91uDEyX/1wCWDCqxhwRv/mNTPeNJbRJX41D4=;
 b=JRVH2yPbB18djoM810K7RcrlRoAn0NIPm0V8LyUCLs8izsYM0MJ0RQyjXpdc18IyytPcT9+Py
 tvkrMo2c8sbBiZewTSJ0rIZYG4QTqrjT4VBiA5YQQqXU2nkqKchltT1
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

kbuild itself does not print the directories it descends into, the
tools/ build however does so. When kbuild executes the tools/ build
these messages are out of place.

Forward kbuild's behavior to the tools/ build:
Nothing is printed by default, the full command is printed with V=1.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Pick up tags from Nathan.
- Move override logic to the tools/ build.
- Reorder the patches.
- Link to v1: https://patch.msgid.link/20261102-kbuild-descend-spam-v1-0-caff4f840cb7@weissschuh.net

---
Thomas Weißschuh (3):
      kbuild: drop the tools/ target
      tools/build: Deduplicate the descend commands
      tools/build: Don't print DESCEND messages when executed through kbuild

 Makefile                       |  4 ----
 tools/scripts/Makefile.include | 12 +++++++-----
 2 files changed, 7 insertions(+), 9 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261029-kbuild-descend-spam-fb01adf7e985

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>


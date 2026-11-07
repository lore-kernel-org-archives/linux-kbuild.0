Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794020580;
	b=tvlJnuYuCUoiwD86q+rCT+RZJBc5BI0Cjlu+AfFB8NfbGPHGdFt9eSHbUBZtcZ+zvSZx
	 GJY4k8yfsg94B0yKumhIss2d/eftqbjUJgQxfdVSAP55XX2MOTmxnghhfPaR4jMp9Nk2O
	 GlO1DPWa5JDFrycasrokBlwSZu7WHQetF7aZN0QBy5UKgUvrNvdDJ37iwnqwr/YbtRG/Q
	 Ad9FVQ/F9wsCF2i+BhziY/eYxn21if8rA5q/BfDDB7RyFJto52gEYAbytGA2SBIlTq76i
	 yFPbZwjYbVWTTiZD48gsaaj9yKjFchk14rf4gP7Tfdxq4+Wcv7OWeLBSYNPsSE5WJCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794020580;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=B4YGZgfjEkoURpUrl2HC1WPcd/tMSMWKi2cjOwEtttk=;
	b=DN0PRX90p2sMqRWCUtpOChn7GzVgAKPvwQmtKfZP7XJPBVtnuaepO6LD0y/OssFJ34KP
	 S4LnQLWeRIMNF1aB0PntWHTYpZC9yZnhJsjV7gHynVFPmyOtPjzWgTvNwRAMx8ScB0T1u
	 uwlS0ghdOL4+UJai2VS4P17Gozh/xzhDA5UV6VJVTR6xqlXAWSc4P0G04uLrks58pEmXd
	 A4c/J6eN1P6rPJmN1AzfCrQn2MFfYephzvRpBwMO2vbWjW9CxfZ9BOyeYL33d2Q5DXNqi
	 xU0hGBvXXtz7pcRSOSyoslI/6XCv9c8sZ2VeE89Mv05/DfjOZfWyVsNpjklcZddSIZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=rV9nDbM4;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC674606A32D;
	Sat,  7 Nov 2026 03:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC674606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=rV9nDbM4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1794020576;
	bh=c0SN4qXyxcaruh/zEfUrqlvxKbOmfOFuczG5NbVc0As=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rV9nDbM4DTKy2hO0bZMjWtUixXmIicaNFPa3evf6mLUaZrtdKq5haK1wmYBljQcrD
	 /xcQY5nWARzmY85Rx0MicrmJfwls2cOOATCs2+SvCwRUACV48XAlN89kZM5Qq5n5xi
	 Sgc5ifn0N1oIOnNDFgl1/oZfUKlIhRZhMvwgUOOY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 07 Nov 2026 03:02:43 +0000
Subject: [PATCH v2 3/3] tools/build: Don't print DESCEND messages when
 executed through kbuild
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
Message-Id: <20261107-kbuild-descend-spam-v2-3-3bb0a7c4781c@weissschuh.net>
References: <20261107-kbuild-descend-spam-v2-0-3bb0a7c4781c@weissschuh.net>
In-Reply-To: <20261107-kbuild-descend-spam-v2-0-3bb0a7c4781c@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794020572; l=991;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=c0SN4qXyxcaruh/zEfUrqlvxKbOmfOFuczG5NbVc0As=;
 b=tKTferOmk7RPgofZLNN6fDXnGfh1DLMGgcQTFfsvM/HuZGD1Rt35bhNeqhp+taMeM1IDTnE57
 uwUPhZ7yotYDoi+xuwF9l7RWTvCaiVSfOZRZgCALO7Wd6oZ8uGA6EuD
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

kbuild itself does not print the directories it descends into.
When kbuild executes the tools/ build these messages are out of place.

Detect an execution through kbuild and use its printing logic:
Nothing is printed by default, the full command is printed with V=1.

The override logic is part of the tools/ build as kbuild executes
tools/ from multiple places.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/scripts/Makefile.include | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index db989830bbac..cfd9488136fa 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -237,4 +237,9 @@ ifneq ($(silent),1)
   endif
 endif
 
+# Don't print DESCEND messages when executed from kbuild
+ifneq ($(origin KBUILD_VERBOSE),undefined)
+	QUIET_DESCEND = $(Q)
+endif
+
 pound := \#

-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703513;
	b=fzQoi3tAPWI/fZ1+tEt7km1EYx1cYX464/TPnDh7FAHU97EVuqttNXOOAvb7LqNGuykW
	 w94b6S5jqMaN3J6AuuKE59GC8mx9AbP5tRCuvRIKZSalFW0HcNDgmR9CywnSjq0S3ZxOp
	 qIpID/eNsM1r5AVod7n+bvrtrLHWhEcdxucl1YQrz+XkHs8K7NE82rxmGtUBzIdzuG8Wv
	 1jYsulBUAXBjqvN1cWmqcBqNVsFFskvh/JDoXNiYdtIm/jVbrL33OnrfN0aQxzGHbw4yQ
	 PjGEUqvRFIxtmEWDLcPrfpUBlQ+FBy5Z0nCdb8hvxEVzmIHJjnMokbPrkVkPEWMsRnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=ma2S+15aObxfKj9bOXcaN0Y4hp4kbhpHNV/D+sINngk=;
	b=P8kZ5dBjE/EJPJ+GWAV5KGC4ekkjRaHJyBFMjNahx+YIopXAfCBcLVQ14uopu7Qi1hrF
	 ynViaNr3BwsQQiQrYPGH0DmCV8XZpRJpy6TmtahOf33CMoiXwI/PlnrlfoR3boPyGXgd+
	 dl/D1u+7fGRRbMQZ54EJp/ak0Ztwumws0VNiQwRYEZGLmMBs5jI+UHkTNuYpzzjyluM51
	 0dKHKnQ1X8W6tJfFzPlt+gxIAc/E12vKAa52puP6MQSdilK3TGT+D3odsBPPsOLkQAe7B
	 RjsqPB70kmY0b4G0mViRdGtnYJkL9kdy5q0h9T/KU/MQ4pgVfCQhiIGEK5+xBsRnQ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=84.16.66.169
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFD96070096
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 10:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFD96070096
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJltG5nzgzyBl;
	Tue,  3 Nov 2026 11:58:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793703510;
	bh=ma2S+15aObxfKj9bOXcaN0Y4hp4kbhpHNV/D+sINngk=;
	h=From:To:Cc:Subject:Date:From;
	b=SPEGuvtlsbS8LIna8WBPpipobMeb9e05lWJHGBMfGkznBveiZbvtC3mp+2PkRSOFf
	 8HcDwGbWGAqoIyqnZOvvLfOzi/lb04u12V7wZ7u+8M23BEEdlg9lAVHwCK9kXZGsGW
	 JpbqnOzloVAyYfhP3y7+cHHifasYaq1I/9iDBcUJ8HwCHwa5L/mcAX3h5eqMKhLefB
	 SJTUylaa47LjcgAs7Uv6chBlrmX0ggd5DtRBHnJSKPjwh72ZhwjQrPK2ZOtxGx+O65
	 SB0Ovd+lukS3fleEcEjoLQAQzERMtyQDJpGwdLzUet8el9pWU1Oq3niTVE6J4cHiYF
	 XTdw+cbV/0vlw==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJltG01TqzKmL;
	Tue,  3 Nov 2026 11:58:29 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOCDl-00EwGZ-1d;
	Tue, 03 Nov 2026 11:58:29 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: nathan@kernel.org
Cc: nsc@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hamdy.aea@protonmail.com
Subject: [PATCH] scripts: check-function-names: propagate nm failures
Date: Tue,  3 Nov 2026 11:58:29 +0100
Message-ID: <20261103105829.10511-1-info@daylightlinux.ch>
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
X-Infomaniak-Routing: alpha

From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

The symbol-name check pipes nm through awk and grep. If nm cannot read
an object file, its failure status is lost and the script reports
success without checking any symbols.

Capture nm output before filtering it and fail when nm fails. This
keeps the existing forbidden-name detection unchanged.

Tested with a malformed object (failure), a valid object (success),
and an object defining startup (failure).

Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/check-function-names.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/check-function-names.sh b/scripts/check-function-names.sh
index 94883e6..f07a0e1 100755
--- a/scripts/check-function-names.sh
+++ b/scripts/check-function-names.sh
@@ -13,7 +13,8 @@ if [ ! -f "$objfile" ]; then
 	exit 1
 fi
 
-bad_symbols=$(${NM:-nm} -p "$objfile" | awk '$2 ~ /^[TtWw]$/ {print $3}' |
+symbols=$(${NM:-nm} -p "$objfile") || exit 1
+bad_symbols=$(printf '%s\n' "$symbols" | awk '$2 ~ /^[TtWw]$/ {print $3}' |
 	      grep -E '^(startup|exit|split|unlikely|hot|unknown)(\.|$)')
 
 if [ -n "$bad_symbols" ]; then

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ABA42E8CE
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Jul 2026 07:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705386; cv=none; b=E8V480fdE+Jv6WTIsiDrCQy5q52aD4w30sdw8gE+a2tM64eKUAEGA70KrUQiXhZkqbnn1YywoxhiG3/R+GMnJB+Db8T8QpWW66qx70uEKKD6Tcf0cyqjOHn9TudmmCe/lBDRwABua513ZCTDf/8gYyJE3Xls0CR850s6te1ADEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705386; c=relaxed/simple;
	bh=H1YH7F/BZd3srrDRVjWQZ79cOct6AwLFox+DNsY7Afk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oxKBbZ77ZL8XWDwINpVfg2sebatHEyfsAdNG+kuVrB6IeGOIP1mhvgFf4gWSAXPRD2rQld1it3YOFuvrvNByEKVD1KpegL6IW3Thc40hNuKhEkkPnwJ/y3Qz0vQGegZAO9IiqLy5WLHnPKjIEpQIflNS8h+9XlEzqUC/dtcwpkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HEtyFhi9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HEtyFhi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784705377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7CPzPcDVtoLmEC1t99Wu2g2BhxFVMLMhbP4ZzEwFafE=;
	b=HEtyFhi9XMzv3kzvsqUa66n+7Sj512PrFxnUzGzGkGv5MKRLDFHHhQRVT3eJkz3vkKLndD
	FzftevN3cAxltYWnDgnMwYPhu4BgB2KdJd8Klhg0wLF0if3qyKTPw2fQRBTf5D66jtpL3N
	qOSmx2jYxF7K/dRPxxoSr+nJ8SOxIv8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-454-d1jvYm6HOsyPgbmxSK7RjA-1; Wed,
 22 Jul 2026 03:29:34 -0400
X-MC-Unique: d1jvYm6HOsyPgbmxSK7RjA-1
X-Mimecast-MFC-AGG-ID: d1jvYm6HOsyPgbmxSK7RjA_1784705372
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5E4E01977510;
	Wed, 22 Jul 2026 07:29:32 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.243])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B60A21954238;
	Wed, 22 Jul 2026 07:29:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Nicolas Schier <nsc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Huang <sef1548@gmail.com>,
	linux-kbuild@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2] scripts: headers_install.sh: Normalize __ASSEMBLY__ to __ASSEMBLER__
Date: Wed, 22 Jul 2026 09:29:28 +0200
Message-ID: <20260722072928.24500-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

From: Thomas Huth <thuth@redhat.com>

A previous patch to headers_install.sh normalized the usage of
__ASSEMBLER__ to __ASSEMBLY__ in the UAPI headers due to two reasons:

1) There was the concern that the UAPI headers might be used with
non-GCC-compatible compilers, which do not define __ASSEMBLER__
automatically.

But other C compilers like PCC (see
https://github.com/IanHarvey/pcc/blob/cvs2git/2018.09.20/cc/cc/cc.1#L405)
and Tiny-C (see https://repo.or.cz/tinycc.git/commitdiff/a25325e9be13e52a),
are defining __ASSEMBLER__ for compiling assembler files, too, so using
it in UAPI header files should really be fine.

2) During the migration phase, the UAPI headers will use a mix of *both*
__ASSEMBLY__ and __ASSEMBLER__ at the same time, which is ugly and
inconsistent.

That's true. But since we already shipped a couple of kernel versions
that used __ASSEMBLER__ in the UAPI headers for certain architectures,
we might now break user space programs that have been developed with
these kernel versions if we switch back to __ASSEMBLY__.

Thus let's better always use the macro that is defined by the compilers
and standardize on __ASSEMBLER__ instead of __ASSEMBLY__ in all of the
UAPI header files now.

Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Link: https://lore.kernel.org/all/2030a963-33bc-43fe-9a2b-9c626d7d8360@redhat.com/
Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Tested-by: Nicolas Schier <n.schier@fritz.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Updated patch description

 scripts/headers_install.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 83e4475968781..2f1d1767ca267 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -36,7 +36,7 @@ sed -E -e '
 	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
 	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
 	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
-	s/__ASSEMBLER__/__ASSEMBLY__/g
+	s/__ASSEMBLY__/__ASSEMBLER__/g
 ' $INFILE > $TMPFILE || exit 1
 
 scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
-- 
2.55.0


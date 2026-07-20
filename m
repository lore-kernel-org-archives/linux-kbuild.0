Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A3F39E176
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Jul 2026 10:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542250; cv=none; b=D79YNVVKDQnvWUhwo8jZcNuWHSJpoH0q8/GRkBTFuYBNxaLExR3KiWXjgEAMAJMRP8KYLaL7t87eGgsQsXo4N48TIoi4y/lejkth40nY3g/SK51/NoePD20kuZNy7PnokSJqT3yf8fYZlRKunQ5j7fKhsquI8z78JDh0bKJeM5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542250; c=relaxed/simple;
	bh=oyJQOP99+N6dWpzJXBul0remFWygZ9ZP/G10l7OV0QM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XNjczPysOUyoGhs9S3vpYkUosFG4RC9VRgHhxBhAkf2JMCMTwiYzsQI+ZWetPFuFymLbDhdjXy6YnbyTezyVxKTpD0ZqEsp4zdTBpB/RnNqrnYHJLOxQWV3O4I5HZIFXdYPxYb1XC9swC6tZsQ5WzEs1vvXvGFWcQJYrg1iEa5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M5HkvXWw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M5HkvXWw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784542236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OtSUmCzoqqJSTSdIF/cJg91jCnZccSjQ8qdx5VpAiew=;
	b=M5HkvXWwUmqpYLuHOdn4MOFimjIlkPgXbXX9jwFuVxHNqw7/obCjbx16C7df0DTa4C8Pvb
	AjoGIAz6TRvIr5eFOA4uLqMLftiodezzNB8pQ0x/7DZuzKmatog4Ghh8ygXZxKDxkHKNQO
	ymC7AiFM3hU10Sxzzw9ScrmsJBDJzWc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-322-sNlfF3gyOiCyBVia91oglQ-1; Mon,
 20 Jul 2026 06:10:31 -0400
X-MC-Unique: sNlfF3gyOiCyBVia91oglQ-1
X-Mimecast-MFC-AGG-ID: sNlfF3gyOiCyBVia91oglQ_1784542230
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B37E1944D33;
	Mon, 20 Jul 2026 10:10:30 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.34.82])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F1E2330001A2;
	Mon, 20 Jul 2026 10:10:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Nicolas Schier <nsc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Huang <sef1548@gmail.com>,
	linux-kbuild@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to __ASSEMBLER__
Date: Mon, 20 Jul 2026 12:10:25 +0200
Message-ID: <20260720101025.355623-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

From: Thomas Huth <thuth@redhat.com>

A previous patch to headers_install.sh normalized the usage of
__ASSEMBLER__ to __ASSEMBLY__ in the UAPI headers due to the
assumption that older versions of GCC might not define __ASSEMBLER__
automatically and thus using __ASSEMBLER__ in the UAPI headers might
break compilation with very old versions of GCC. However, as we now
reassured, even GCC 2.95 still defines __ASSEMBLER__ automatically
(and even older versions are hopefully not in use with the current
Linux UAPI headers anymore).
__ASSEMBLER__ is also set automatically by other C compilers like PCC
(see https://github.com/IanHarvey/pcc/blob/cvs2git/2018.09.20/cc/cc/cc.1#L405)
and Tiny-C (see https://repo.or.cz/tinycc.git/commitdiff/a25325e9be13e52a),
so using __ASSEMBLER__ in UAPI header files should really be fine.

Thus let's head forwards and standardize on __ASSEMBLER__ instead
of __ASSEMBLY__ in the UAPI header files now.

Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Link: https://lore.kernel.org/all/2030a963-33bc-43fe-9a2b-9c626d7d8360@redhat.com/
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Based-on: https://lore.kernel.org/all/20260630-uapi-assembly-v2-1-8e7bee2fe816@weissschuh.net/

 To avoid the churn, feel free to squash this patch with
 Thomas Weißschuh's original patch as long as it has not been
 merged to Linus' tree yet.

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


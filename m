Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3357DDC7
	for <linux-kbuild@vger.kernel.org>; Sat, 18 Nov 2023 06:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSiso1oa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9194CC433C8;
	Sat, 18 Nov 2023 06:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700288323;
	bh=V3VJI3SjIz+jkP5XcrMr2bBpfkub6tGz8QbK7xtABC4=;
	h=From:To:Cc:Subject:Date:From;
	b=WSiso1oaCQ9IPq67kO9DUYnHtccq3qFXNFWvLoWB1dl6nYscEM9Nl1KUl89qi1Y2w
	 Nx+j6es2fEkdbSrZkJaW1dnDGmc0Zy8t5pH0C2bLeFse2D54bpRMpNOcA6+L/T3gdd
	 IhSv9CeyypWnLJ1Oojk6+2UnpS5tM/fc1oXdGGr7um69XiUu8iTgm4PgxBkwOjGWCK
	 UNZB/YlgMn50Bxrt0Z/kKBZucshqANRb2MeTIxxpoVZqvNGwdeaOT2ak5lkKN5bzRO
	 7If+az3XoqeEx9KmreQBxHVP8neMM9YZ03xrsN6L21uTN/u7vDoPv+ZytJdbZipJY5
	 c/404DcyXcZzw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: remove error check for xrealloc()
Date: Sat, 18 Nov 2023 15:18:36 +0900
Message-Id: <20231118061836.1294582-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xrealloc() never returns NULL as it is checked in the callee.

This is a left-over of commit d717f24d8c68 ("kconfig: add xrealloc()
helper").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 4fe39b4bc5ed..1ee33e36459c 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -289,16 +289,12 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 #define LINE_GROWTH 16
 static int add_byte(int c, char **lineptr, size_t slen, size_t *n)
 {
-	char *nline;
 	size_t new_size = slen + 1;
+
 	if (new_size > *n) {
 		new_size += LINE_GROWTH - 1;
 		new_size *= 2;
-		nline = xrealloc(*lineptr, new_size);
-		if (!nline)
-			return -1;
-
-		*lineptr = nline;
+		*lineptr = xrealloc(*lineptr, new_size);
 		*n = new_size;
 	}
 
-- 
2.40.1


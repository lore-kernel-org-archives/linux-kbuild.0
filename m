Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B353A30DECE
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196870; cv=none; b=YwFiWkxpsNB3oCexJCjV2KUdUKwnAjkyXWR1zMAIaQwbQz8sSUqaFEGmNvqXdG0vrzuvCt3I2sM9U+AmfNDzA5QfWyagzPZ/fadHYrZDPoC0qJOET3C9EE1Q1tngIhNf/tZCfdVdL7r2/qNKh7Gf4VHyqBxU1MDDanOg7vpB9SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196870; c=relaxed/simple;
	bh=kggvnJycJsFAnh2i+OCqfJkWm8hhIDCqBxoCdeRLvLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Be0iYxb7i8BbL6QSjHIBOcMOqCCCCJfpmDVNZMQyXhNInMLseZMQ2PHbfsxYWFrp+fMgerKyQYGnqhUudHjETRMOKiQbW2FF/FnotLBmHNhiq/S0LM2AHIbBKxG/Lf0p++K5ICXmk6CSX9tyGEN45nkt+SyRk2yWRHkd3nMwbIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRn9fB3D; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRn9fB3D"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2a99so793795fac.3
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2026 03:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196867; x=1791801667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfNFTmG0Deh2nS7aGVDRGia8yVBmhaEcXB3fZ65gnZU=;
        b=XRn9fB3DkdZsM5NdfcWksOMSWMZUYY8W9Bn6RDaKvn1NQgSskyEPyaomtk5dj1Y5BV
         FJ3Ye4eqLsyCQSUcM81AvP9gOfRGsXmA7VFbZpJCoDlySrNe0lc9oPcBF3/jzrvXsqtT
         x72KR3GxKuKX9PG46HsUVOzOMxoeZvoxecd+z/Rqcz8K8j951GQEJpvi38hMB5QhzfTf
         +Qyx3DG0CEif4Q5TSg9Z77hDZ11NNI47ZkaCWl5/ZAeqM0QLbiQKVAi7DjZhjAQRux65
         NIEiPsP0eSl6O4o85NIZ9o1+2E+sB9Ary/PIF4M/WW7hefRV4GnDqN1kTBNxOLPoUZxp
         JOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196867; x=1791801667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sfNFTmG0Deh2nS7aGVDRGia8yVBmhaEcXB3fZ65gnZU=;
        b=gjX9XTmAnV7eXkMmMl0t1NcDCGNxUn+2XswDW8sZ1M00lERST4hlbq8YoL22gQFGEN
         rb2QlkZPKkwXWV9LqIi9FozBggotGcuiGmjAdmP72Ns1xJ4lnoM7J+HXpUFOS0TZwnsE
         mUqIwCuJbfNfBjWCu5G0CN+gekOoA7teycyGJNFWbDNYwfeqp4N5rElQl2bNhmujNrlK
         OcvJC6Fu5WYhqH5193VN/goTY3pe2+0Rvk3nUF6wxff22euaveGKoPeKlsH2Pcebov+f
         KhnMSvLmwQhxTJiU3cZq15JZ2seYKOnqBZrY7fsGTzsVhhbNoYwIAfoOzL8u83ksbNsj
         QZeA==
X-Forwarded-Encrypted: i=1; AKwUvBz2mqXuu0XvT6h297W8+jscyydfwwzG/byWtdxXtVEi3IEhxq0Z0fHJAAoeAf48UTahbc54luzY68Eucyw=@vger.kernel.org
X-Gm-Message-State: AFuF++l38Bcu2X8tYqg/rHVOyXp/9DICdEq8k/Xq2w3VaYm1FK1Lkrn3
	K/EQQwbujw92vKyAg0hnsoaZBWPCzZyljz3m4dGgyuBV5RQqgCPT9kMC
X-Gm-Gg: AYBFou26fng1x8MrhJXMvRgx3BDoJ7R6TefsMVVF1PaY3FnyoGR+iu9HGUFV1pIzkvb
	7Dqob6AErqVjO5GREtf5lfM0y5O/GcNZ9QG+R/JZ0ZRWu2qbO2PlKUospXUXeQHXZPWY5jTDKe/
	jFRuHXAasQPuOYJVaTmjnNxjRu9k/vlQcAC9JV9/st4OvAafSehGC2XumFOLaKYLQ8mlkr1I02A
	wwmdVZsoBjal5wOztKIxbU346jp2ESRXZZRhGd4dwOOto8gLzm+W4r7QEetYDEiUg/Q5KEBbs4C
	67aoWk0OmbjYHYk1mIR/fHqOtI7Vssu5lGmV9Z0JegBcVO4SZkorRVX06cbuUGvRhIZOAieKrjx
	e207TFGgbI1NI669FM53yLz9Kr+vFZu3zGhxGf+ZnwdQaydDnROYrBHFjCjHD2ZTEig3X+9t9Wp
	5/bTa4n2ryXq40kQ+6QkefSwLF4VjXKWyMrIUvGw3Y4AvkvwVfUOFGvaxexZ0LdWA6ndq3gHGQz
	72woeDK0lAipcoXBwi/l2A=
X-Received: by 2002:a05:6870:b44c:10b0:49e:5b59:abd0 with SMTP id 586e51a60fabf-49e5b59b7f6mr2174867fac.24.1791196867684;
        Mon, 05 Oct 2026 03:41:07 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:06 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] fixdep: fix out-of-bounds read on a comment ending with a backslash
Date: Mon,  5 Oct 2026 05:40:44 -0500
Message-Id: <20261005104050.1786222-4-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005104050.1786222-1-lzsx618@gmail.com>
References: <20261005104050.1786222-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

When skipping a comment, parse_dep_file() treats a backslash as escaping
the next character and skips it unconditionally. If the backslash is the
last character of the file, this steps over the terminating NUL and the
loop keeps reading beyond the end of the buffer:

  $ printf 'foo.o: foo.c\n# x\\' > foo.d
  $ touch foo.c
  $ scripts/basic/fixdep foo.d foo.o cc
  AddressSanitizer: heap-buffer-overflow ... in parse_dep_file

Only skip the character after the backslash if it is not the terminating
NUL.

Found by fuzzing fixdep with ASan/UBSan.

Fixes: bc6df812a152 ("fixdep: parse Makefile more correctly to handle comments etc.")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/basic/fixdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 54063d980..9b57fe555 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -280,7 +280,7 @@ static void parse_dep_file(char *p, const char *target)
 				 * escaped newlines continue the comment across
 				 * multiple lines.
 				 */
-				if (*p == '\\')
+				if (*p == '\\' && *(p + 1) != '\0')
 					p++;
 				p++;
 			}
-- 
2.34.1


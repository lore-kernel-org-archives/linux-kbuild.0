Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83FB3ADBA4
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477655; cv=none; b=iPwaNx1ze/v2wJ6ONZoqYCyHj512HGASuXoUukhN9iEgQtl02kj8qq4ogx3DEYMPgvzGoFHnQuQZawc0cV/SJFN9ITGsLXnPV7Bqje17s7Wnx/+6pu9AhvbMllaS2+9gh+rl2V8TqM9SgM7EB4fsOnFLccSVbr5n/2RpPWqflIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477655; c=relaxed/simple;
	bh=TbHXL5XflxbSzilJyxaLHrSNth6sSZOOxsGKAQPnCLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EF4faSYMcBOba3JkPqRALiQr99a1B+CXmotiF+DLpMZUccbPGY85YO9aoJlcCHrIjQGt4f0XqhCutrairoukCeth+eTFOMohl/2VoFvyo0eH64DtepYbpuc53L8lLSeEUi0U1VBbEXwxw7aBi1elYdnIw6hLusAl/u63WnYeGso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYLfoAI/; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYLfoAI/"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6de1fd5f572so1434599eaf.3
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2026 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477653; x=1792082453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9MC7qaWcROmES00Hk96fpRE/Vor1YORtZHWPl0gQA1w=;
        b=qYLfoAI/bXau7CJkOLKtgdo9ltU52ALqhUve/qGCzHpUHhBV1jMcrmmk6JmO98nlqR
         kDBhYXsvE8VP9ngigT4JdtQlB18GAn+nkvuf9P9zRqICGjMXBCI4rSTlX2/cCMe3jYVH
         FYeHwXOJEOqzsmHB14KBI6PXcunS6ZeC3EacNBbKvMa0iJJOhE2uQ3OurkjcrjMbNEFv
         7une0vAdhLcLpR6UWfGEABdlE7nOLpc5uNglq7fvhj+77aTfNPejZ/b7oO0vvBDCY6md
         KcPQjtKBHYRFpzeoTxoH4Jd+0wAanih9IDPlzZqJ6HZBGbHxjlyn1Lj/KpVljeVTbQYk
         mRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477653; x=1792082453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9MC7qaWcROmES00Hk96fpRE/Vor1YORtZHWPl0gQA1w=;
        b=WOjv4HizXQXMlzJxNHeTR28dlWVj3LWba1sFGbbiJv7q/T2imoMLPKBUa1QMyAVUE3
         NZSjLILTeYpdFgbpv7pny2frh5VjaI8FmohF1EPScIXsIol9xR0facxOMZ2+YFonzdj1
         pdz1ygXBw4IE+zKxnyLmb92DgnK32D7UwhLUOYCHxwKAC5eNaIzuQjz40MWJJLrbEEob
         AybqKGLpLp7lbY4Q29U1raiG1EvMg1lMNm/cedgC7skcCcHmbU1wv5ZIbIDiEU0/4WsS
         GW2oZBqvaAqjx9SswcUAsvc4T6E/rsA453JzzgsH5X9q3zotrtowmxAJFcwZnmezqqJK
         VEyA==
X-Forwarded-Encrypted: i=1; AKwUvByNZ+l4uovFMAS+jFOotiswGi4pwWw6EcFMoKBwnh9wTNm6UVgUYpCBTy0skTUUiKGyRVRrxec2VZFfYF8=@vger.kernel.org
X-Gm-Message-State: AFuF++lr0LEt+rAx8x9hWb1EuAau672LygvGwg3sfOP8Kfk8Nt8oJFfp
	YkrDmScjrvVtjeFUEZPcGmqwGSi9OA0vz1ktAxMPeYa9TmgSu/Pav5+S
X-Gm-Gg: AYBFou0QNIriqWHD53J2GbdPR4ykXX1HkMtKewgZDzhDNTefjh07I3lyQ8JHO0XjqYP
	KSZg1zP4Pb53OS6dYUxKidrFcIEywbB4kaByOuCyfWqEYYs2ow8/8stiKC+lRD/z03kWsvxzyJg
	tTb2z68GAprYXdBVVz4mp5AEnwoa+yA04E7qkkSlh7wzhN8QJWUSCfZ9QUA/FlHeCo0WeBbEIC2
	pGCt0SblXpSSyKWa6Bq0m4+yk887w1NmwarucDYYVSBxzmIjC7+HPrJJ8S5J/9+b1Bf8dmC4S2D
	D5XJIoFEULuVIlJEnHZXD5AU9dsFs1yMlDtfsdgFgcQNgTwPgiwyZNlMhCBVqJMZbb+9h9piGO8
	SXqBQhUWsJTsSI2W2kO45KxF2qkigUSmNkDqtTKLDjeGkLIEJ12v2s8FA4VktLdX6+4A7ZxEFDs
	9hk7C8P3z7WSAP8CvLoN0ImwZLykmCciyaRlOV5ThtnF8Omoh8kL6ryv3EKCPnp3Ntv2iJbkFpW
	qCbeKT5jYWA
X-Received: by 2002:a05:6820:7089:20b0:6df:ac2e:85b7 with SMTP id 006d021491bc7-6e7a8996551mr3648031eaf.15.1791477652571;
        Thu, 08 Oct 2026 09:40:52 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:51 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] kallsyms: do not call qsort() with a NULL table
Date: Thu,  8 Oct 2026 11:40:30 -0500
Message-Id: <20261008164035.3668885-4-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008164035.3668885-1-lzsx618@gmail.com>
References: <20261008164035.3668885-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

link-vmlinux.sh runs kallsyms on an empty input for the first link, in
which case table is NULL and table_cnt is 0. Passing NULL to qsort() is
undefined behaviour even for zero elements, and UBSan reports:

  scripts/kallsyms.c: runtime error: null pointer passed as argument 1,
  which is declared to never be null

Skip the sort when there are no symbols.

Fixes: c442db3f49f2 ("kbuild: remove PROVIDE() for kallsyms symbols")
Assisted-by: Claude:claude-opus-5-5 UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-5-lzsx618@gmail.com

 scripts/kallsyms.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index bd9e9ce20e..9300e10ad6 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -390,7 +390,8 @@ static int compare_names(const void *a, const void *b)
 
 static void sort_symbols_by_name(void)
 {
-	qsort(table, table_cnt, sizeof(table[0]), compare_names);
+	if (table_cnt)
+		qsort(table, table_cnt, sizeof(table[0]), compare_names);
 }
 
 static void write_src(FILE *out_bin_file, const char *out_bin_name)
@@ -822,7 +823,8 @@ static int compare_symbols(const void *a, const void *b)
 
 static void sort_symbols(void)
 {
-	qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
+	if (table_cnt)
+		qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
 }
 
 int main(int argc, char **argv)
-- 
2.34.1


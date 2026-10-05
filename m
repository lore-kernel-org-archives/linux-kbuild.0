Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641FE47986C
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196873; cv=none; b=jv4gC4dLBrEqoeNaQBRtSIimw+PspAPZFyBryaRoVJtJnPZQlNGvvOAVdPhgk64auyoZlK6Ivx3FR5cQoFiet1JIMQTIiC554lYUqoDinxDPSRDAtiYQt+JXmKKGsVnOh8OifnalhDUeN3eDzFVNEg3jeUgvGlqpkerKsUdz1TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196873; c=relaxed/simple;
	bh=Ey1yYT9UnaRjm0CxbeGFRiAUqkXaMzeNCgWbC1W/PQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aQOipH3Dpk22LDmcQd+MhjkRoJ/madrffMmtgl5TO/ADFC7/IbksMEDX10FKrOoOQgPpFwTymCCjDyXtXO7wKVQxzR9KWEpwxRLRDdKqNduUkc24KuA7cm2ctjWudl1THUePX+RmH5Od0qX2KGfxMJJBJ1y25ZA28G4/I4nzxB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9zi+o9+; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9zi+o9+"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49dd095da1aso1012155fac.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2026 03:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196870; x=1791801670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dABgea/zfXo4s11QxJz4tUQh2KTYl6wbNchnA/Xmw0o=;
        b=H9zi+o9+RNJ2/0cK+6ms1W5JrVFh74ejQFzKHjgJapa9jY8KWSZ+ZpBND6+cFtmHRj
         +LvudjnrZ8E9yb9z9g+T1CMA5R4MG9RBqFampPpcfE6IdVsatEMFZqJ0iiuWdboCAZwC
         EXaOdyN5oBpUokJUQ5CLSjDNdxZTqWoGlV5zUSBhL/lPcGVo112tgEByG+RycbDx59/O
         MaUTWktN8oy6GIR2hPUf/L6Wpp1IpGkHVpPSYgbwGoDifSccjkBm9HQ4FvltB4bNAoL3
         V41sfbwjXYZFfJaz5KtNj0fwKR2ZC0VjVeCKX7gQ8HCo1GBM/z0Aa5x65FnKlG/IuOmi
         mtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196870; x=1791801670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dABgea/zfXo4s11QxJz4tUQh2KTYl6wbNchnA/Xmw0o=;
        b=ITY3q/ZKuIjsMvAJmc8PJWo8bUt2lJ236//M7fyI50wIFxg4UEgw7ViqPvlR3uYDBj
         PxoYWEIlYWnGIDgIsef3trhAN+90BPipDGaSJECoWykYrt/KGcVN2QItUttvZZY7VHf6
         +4atWKR1HkqENCqp4G/KHqmAEQ2xYpcA4HJBkgLBH4Ia0+mLJe01lShgQ926M21OCMlB
         PZyUp5AfgqbjvYADlpODgG50rXMkrYsTX2SXp/2WOh39UldqCsvzKH2ZPGJIGxPwYLSc
         1eM74gmV2wcrnlzrMqlnasQmK6bAwO+gGq4XRHghp2JoOsqRh+8TdkFwnbjpyZF/VYYA
         cGdg==
X-Forwarded-Encrypted: i=1; AKwUvBzJAS3Lz7gz0MTEA1EEXUNoL9eeGtUOG+xGQ9qHXIgxoI59gyNVZM7XgE4S5iqvyVVIm4PFCNqBM9XsHd4=@vger.kernel.org
X-Gm-Message-State: AFuF++lrhwRXnw4p0W6QcmkriKE/IG+ezJAS8+RN5FgigJaR8yuo7CKN
	FuL63h5Y7ELYUpzUbBTdD5fAZqmLmNcoifShct3hGyBvFKEoYbXZb1Pq
X-Gm-Gg: AYBFou04Lq7Umk4PErc3flfKZOt74LoTFGpFucWV+doMx8GcIfDECp+4WDxsDIb4vY6
	9pD/Gk3gd1oDUKvJP+VrH1UIo6nl/k3sRjr2tf2hYEx8xfmKvNer+Emo5I3LrzxMiMmcfLrChSW
	wDDby6LcDYgUxx6NvVWWoIu30o0dVcXiPE8yn7bdivJDL4MOnlt8tlqDfiNqiyYEbHSaJ2/tup3
	nVBuYs9RtJtfxQtV3/cvzCXgq1ggVU1KqfuKZikI2eOGjlzVD8U13tDhmBDb8SbIzNatdgjiBoV
	r0KbQlS8FhmSdiEzzbUudxNcyVsnifLzctAHG6/qVQskupTQribR2f8iq31ZOeIZ4BXkm1JlaTr
	t3ja/jjwN0EinuKxI8Bz261M47MLSUy8SB640M1FV/qj7wZ/gnZyMwzPVncimHkJaxvatrL95QW
	35CGzeip0FT1Zg7b8ntOFRSXWKzpSCv+INp8NUd+rYOIW3yNGcHjRV7fNRaeB++98lphNDTYKwp
	soE+6P8W1oT
X-Received: by 2002:a05:6870:d308:b0:49d:f5ef:5d3c with SMTP id 586e51a60fabf-49e15f5b9f9mr8956731fac.55.1791196870267;
        Mon, 05 Oct 2026 03:41:10 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:09 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] kallsyms: do not call qsort() with a NULL table
Date: Mon,  5 Oct 2026 05:40:45 -0500
Message-Id: <20261005104050.1786222-5-lzsx618@gmail.com>
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

link-vmlinux.sh runs kallsyms on an empty input for the first link, in
which case table is NULL and table_cnt is 0. Passing NULL to qsort() is
undefined behaviour even for zero elements, and UBSan reports:

  scripts/kallsyms.c: runtime error: null pointer passed as argument 1,
  which is declared to never be null

Skip the sort when there are no symbols.

Fixes: c442db3f49f2 ("kbuild: remove PROVIDE() for kallsyms symbols")
Assisted-by: Claude:claude-opus-5-5 UBSan
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/kallsyms.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index bd9e9ce20..9300e10ad 100644
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


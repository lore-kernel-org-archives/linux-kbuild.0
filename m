Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268859;
	b=A07F9SSAXiANpoiL11cBZPRwITQyynpFUOpAGBLuxfRKVvdQkuRkRojlMWRpDpH95oJD
	 4eFyl7rXqJE26GKpeumGHtcpoEqIz32cRNPjgiX4rqozMfxfkMMyR4gE58RcrQA/eJmSF
	 5KOtDzACF98t4u9YKMBtv422hHhGj88vCcifuKClbebhCts95h8zeKPEwGWP25WmOxOac
	 /pcYouHlP1KbfU+y3LZs/ThW30+GQZd72n6oV7+EJNcD6ixTjybjRGZ8gLLHOzMtMAQF+
	 S32+V0YhgbYoZ6eo0JHyY+EYThLvcSpNdgqmdMIUC2mHVJjzc+MQdQrvDD0UvShKErw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=woMgWbnBZCej3NhmGThh4XJkIkbPAHVt5pI6FRHA4sI=;
	b=IpScKljBYS9YIdbINyNOVSg2d6W/9HNuXbBd/h/PD8C9vDl1g42Jjmzl4gxKd9m2+rnG
	 T13luHEAHJaimsXUwrKO4PIY2VqoQHUv20H2l6+9+Q4IXzZX7bxECR9eJ7Au8dBYoq+ux
	 6ToZecDDetdI7NjouZoK5SmyusRLve9Ix/QbY4jQxS6xPMr1xg+KygM7aqIh6JmMkCgZ6
	 RsSPbD6IgHQw/4nDYdejHMmPLEJGwA73udF41/i66B0e3wLD0hvQHBZiO2FVrUesGpHuQ
	 Qlkchl6VrndLBldcUYQbODqFnhFlUk46bbICsdQqrJ/g8a8RFLIZGBvbys1TWMUhWow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0EUApwtd;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4B160A262B
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 00:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE4B160A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0EUApwtd
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-53c156ba662so738007b6e.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Nov 2026 16:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268858; x=1794873658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=woMgWbnBZCej3NhmGThh4XJkIkbPAHVt5pI6FRHA4sI=;
        b=0EUApwtddQW4t7vBVbCqxXUdz3k2PhxAkpDWZrydBBeMO1g9iFgp0yt14Pn3k9UV77
         19YqrlYF7AC0v2fI/+NS5SK9oB1ik+gv0X+tF29wXqXBri0xzUBCaYdKLFL7AOMIcFJ1
         No0MigvZ0O2gr25cV7G2RGwM2JIwqeUD0jYf1cLnwuvK4rjAq9IQJUqfcW/cJV9GoFvo
         QzyeXidutuoGWAEBGPD4ma9uQPjTR1NXvuB1hlx/gLNqbXHvSpSvhsEjhCEDpB8rdQBN
         DcAZ6fftICgE5IAzuWOcJ4vo/2/9DxlC3BSAsaQojIeEO+ELZ+eCRkOWWRbg9Ahw3GHT
         P5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268858; x=1794873658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=woMgWbnBZCej3NhmGThh4XJkIkbPAHVt5pI6FRHA4sI=;
        b=EQ0S3vWiwkMjifMmTQFQH7IQ6m102PvGqT+Gi+erBGw12Pg1vQL9IIpX0qSTMSUQaS
         wPubG6abDeKW8M6l23tKm1UjcZYgWsY1sNjL5HrVR0enT0AtTAGs0KTOTVWNxxJZeiTd
         OdWL2iGe0XoAmstvTSbxP2mQuhLkXZ0UkfTwlNML0F6Hl1sQxyUTqPpJKpXmggxMgYAd
         Tt/ylV/FnKs+1eSOs/Wx0P51hkyE8w4yZYA+PUtOTlABd/dVa6l+A4loaQxiw4QJX9Rf
         kkBTrxKQY5OZx1dLg9YEr9XkfG1AxcCX6B9QSTRN6wn1CmbjU+sVsmfLWwgAxSnOmfoo
         DyJQ==
X-Forwarded-Encrypted: i=1; AL+hErGIuFMN5laghIYM3BK9E4S3bd9KVp/1FaW9w3ygS83MgNqXVi1d/BIQfWdqsqwVHOR6UbbPImHun7AtTa0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LdhvViswJ2NpgWEM+BMrhXXMvZ3vmPh5PjcyzKi3yfPlTeMZS
	BU4GC3c5RY0NxvRF/oEVEueeWqVehHiDSIe+mB0eyulhayak4I6V8//P
X-Gm-Gg: AYBFou1YB/WDbGrhZd8DJJcNGLo3OlAeBiljCO4bBB3R8eM7UjpE7hkEpa36qYANxGQ
	AvWpxFs1ESgN9A5OSCk/eKk2vcKJMR1zh/1+lsiQ8RRQZRvDHwYfD6OSRfzc/IncqFn5jCCZ0NE
	WWzAL3LGwA0dprGCERL5tKHujrYA8CmOvU8IZFFWyo9EMYxiX1sXItyV8GLtLmb6ON6ll9e9XOw
	tF8piSZ3gmYiVr+xvcI8k4S3aoTztgEA8dnoo+yoIjT7Pz6piZVI+rXHP0SdaqgaVu47FRWiGkB
	oeW+yEXF9T1Z86lpIzWB0WpNQipsyzWDaWZn4O5YSCnx9S1L6JlsxSV4StJlLwnBgH6QdS9ad3S
	uLwI6Py7R1YKrko/A3JDmvvjhIfV8pjWhmJHyi1K/qy49RCT2n3OCYwpfX6eQ5oxVstndgdDQdw
	oq0/+Fi735NueeByxHSjA4o1K5Y2qOb4QntNrmbRo2t/d+MshHORUEqWGwpvA0HNzQj0HT8PlZN
	GtnvtERQ2hWVU/8nkSYEL5oBwuCTJBnDScrJ38GDy6/NEKuJXbN8QsK1tFbsmDmmOzwxetUcYwv
	BuWc0UnfLkDI9dEgGy/B0OotYcZ6Q9P6J4xmKWLO/AI=
X-Received: by 2002:a05:6808:1829:b0:4e7:8f9b:1191 with SMTP id 5614622812f47-5683cd3fa9fmr880985b6e.52.1794268857786;
        Mon, 09 Nov 2026 16:00:57 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm623697b6e.7.2026.11.09.16.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:00:56 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: masahiroy@kernel.org,
	ardb@kernel.org,
	rostedt@goodmis.org,
	hpa@zytor.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH v3 2/6] kallsyms: do not call qsort() with a NULL table
Date: Mon,  9 Nov 2026 17:59:59 -0600
Message-Id: <20261110000003.1719966-3-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000003.1719966-1-lzsx618@gmail.com>
References: <20261110000003.1719966-1-lzsx618@gmail.com>
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

link-vmlinux.sh runs kallsyms on an empty input for the first link, in
which case table is NULL and table_cnt is 0. Passing NULL to qsort() is
undefined behaviour even for zero elements, and UBSan reports:

  scripts/kallsyms.c: runtime error: null pointer passed as argument 1,
  which is declared to never be null

Skip the sort when there are no symbols.

The problem was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: c442db3f49f2 ("kbuild: remove PROVIDE() for kallsyms symbols")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/kallsyms.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index ecb444078c1c..4bbf2e65cb38 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -389,7 +389,8 @@ static int compare_names(const void *a, const void *b)
 
 static void sort_symbols_by_name(void)
 {
-	qsort(table, table_cnt, sizeof(table[0]), compare_names);
+	if (table_cnt)
+		qsort(table, table_cnt, sizeof(table[0]), compare_names);
 }
 
 static void write_src(FILE *out_bin_file, const char *out_bin_name)
@@ -819,7 +820,8 @@ static int compare_symbols(const void *a, const void *b)
 
 static void sort_symbols(void)
 {
-	qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
+	if (table_cnt)
+		qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
 }
 
 int main(int argc, char **argv)
-- 
2.34.1


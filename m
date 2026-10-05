Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100D647AF5C
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196884; cv=none; b=lw00DfjfmRimRyC+Nv0LLI+o5Jv5YfL/a6xmnM5b6GfnntxNoY9bNawEcUCXnAnT7HGk5vuAorgScPlDMk5LLBrHAZkamY1lJruPWz0dtyrLmUDOMgw5nSXSDHRgMqcY7pvr0UYiMEDxSv/ga52re0KJ7WtIeOUhHNTBGOybz78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196884; c=relaxed/simple;
	bh=4XPT2N01JF/a8I8uCkZqD/PggQiktCdJnKLr2SOgQWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OTmKHzuChOuFDLrMaGOtyMgQTuU4NnhsxEgtZM1j8LmPRMw3dcx59IWmcH1RI+LCI0umNxe63g/+q5uEfEqMm+IfiYZUxbWYPWFazmppRF4WoyAeY+ECajDAC1EOdf2CAwDVg9EUuA8VCOpCVLRx4TBD36U2xeyY6fwo25B1Xjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHXLB1Zt; arc=none smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHXLB1Zt"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-49e4ffa5a7fso641220fac.0
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2026 03:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196881; x=1791801681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJDzU01PRMGfsOq91vpjrIzA8vEoMao+CRPEWuyQBK8=;
        b=MHXLB1Zt9KOUM6mCubT6hs0gBt7gNBOeqK4KhGHLDlosfkulaUX5tUrLaOdHPo4I5R
         1hHYMhDUheKKDsowKDVw7CCRQxJDlNI9aaNaoHUs0ZsWvauq1V5YgdpJIC+cv+hJRmQO
         RfK1FQ/ym3hGkSY3u3dsHaBSiix3M1sbYe4ob9Wn9ZvBP1Ht5s4kmC/e3pdPbFZlzjha
         Q+exr0UGuYFAcvUh8NYf7oY/IuvboUptNJDNSiwMmtB/PXtol7suLLjXYcYe5z1Fe0Gw
         2we4Md5XHRar86DvHsub2LPDPLhiDH8/rkYE6yRVUJvwn2qH23DOgvg7SiCI4QxTmXQi
         Vgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196881; x=1791801681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJDzU01PRMGfsOq91vpjrIzA8vEoMao+CRPEWuyQBK8=;
        b=u65WYWLvSQjjQNKc6+2TaTUL7quFhZ0e4ZLtdfy3e8gWPlXcoDheTsf8JUmtbvimDt
         TIL/Zx+mhXKfZZcBbNJ75I/UmPaLOf/otzVK87mq+GUEHqmF8BrCiUvFGfFQ+08EI3J5
         daNF+esZN7fKfa+2X/sKo8oBak9wn5XYxIDQScLa1DyHMSxSJc0v7KFeeW4U9hGjXffi
         QCg/GaG1UZBT2DkAnuHV0M8MNI5TYpe3LScjc12tXcssEJhGK+zz0MK4Im4Kq2/V0PQC
         UhHfW46BM8EbXaXEI1e4qBEWr4smx7NAFHRkiOKIHr6hJCj8t/sn1xi7Ld43CHeJJ5Im
         J3Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxLSR5levbqqr6IimSeyfpAJwDTAnZMn4L3SykejMd9WH7uIq9hadfX0uyvJO/T88B2i630SKGhadGY9KE=@vger.kernel.org
X-Gm-Message-State: AFuF++kO/keL19MCpIpswWPOnaUPcBxoegHnmB+uQE9jwTzGTbODAllh
	ixBT8FxU4jtj7mXDbYeU9oCgLaC6pd0qlQvAmusMgMKsCMbk6YBRU55MJMqO2DQo
X-Gm-Gg: AYBFou0FTnd6RBlRGmJ7G0lJVukdq1mZerx29emIJ44xE+0V7Ruo793+adgnFr9ozuF
	Ss9LxEzYYdb0vbogMp/+V0GzuTrc15U+ITzCogw0bNTorTMt7C39KS81gLA3mNias8jgzBoBT5L
	tH2azAJarmARx68vqnm1RdKv+zHg2VICIxGS1OlPWYtPOmM3vyiyCCbDgoqlzVEHKp9/XA4uJjx
	2M7NLaryfZqnvSoG5s3usZc7JDF576mWOdjsoPU1bEJWFsa5qgKpbhcKhUiVGpncJUgBeC9AERl
	DNlaivToXMCyspng39QV53ENX2KosKqWUIX7ikow0R7N9GphOITxHxOJrjxVHdVH0ak8ce4bgoa
	fb8jENGCm+1Cp5Gpn+zEgvLJ3ekNSJn16ZLny4/NE4oa2Aby7z9DyzBdXDN2TKqi2K6jnv3NY/7
	AM8FRrK9mHyfF1W1EsQx+CeQovDVzlAhDhpfSS2hWPqCtjp/7nFg7PioomxmcHYUZyNxFOL/vbV
	/OKbx43OlMz
X-Received: by 2002:a05:6870:c1cb:b0:486:8f66:d389 with SMTP id 586e51a60fabf-49e15c54c1cmr9259624fac.10.1791196880739;
        Mon, 05 Oct 2026 03:41:20 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:19 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] sorttable: avoid pointer arithmetic overflow when locating sort_needed
Date: Mon,  5 Oct 2026 05:40:49 -0500
Message-Id: <20261005104050.1786222-9-lzsx618@gmail.com>
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

The location of the main_extable_sort_needed variable is computed as

  (void *)ehdr + shdr_offset(sec) + sym_value(sym) - shdr_addr(sec)

which first adds the symbol's virtual address (e.g. 0xffffffff8...) to
the pointer and only then subtracts the section address. The
intermediate pointer overflows, which is undefined behaviour and is
reported by UBSan.

Subtract the section address from the symbol value first.

Fixes: a79f248b9b30 ("scripts: Add sortextable to sort the kernel's exception table.")
Assisted-by: Claude:claude-opus-5-5 UBSan
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/sorttable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 88e49a5c4..0425e00c4 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -788,7 +788,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 	sort_needed_sec = get_index(shdr_start, shentsize, sort_need_index);
 	sort_needed_loc = (void *)ehdr +
 		shdr_offset(sort_needed_sec) +
-		sym_value(sort_needed_sym) - shdr_addr(sort_needed_sec);
+		(sym_value(sort_needed_sym) - shdr_addr(sort_needed_sec));
 
 	/* extable has been sorted, clear the flag */
 	elf_parser.w(0, sort_needed_loc);
-- 
2.34.1


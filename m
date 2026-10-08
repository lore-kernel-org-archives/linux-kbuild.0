Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2899E3AE6E6
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477664; cv=none; b=fG4jtSJpc+hyW7x842K2zYOheJta/kzLlkY7BlHcRZgof5sZW59uHCTzHVH8NK3T39uY4Hxfct4Xk+LvvM21PT+VGtG9+nLLyjAdBE7ImEh1FG9a5TSMpYiYCXUbhtgwgbtLwyXiBuLrwi5g9MdJycOYUqaTNslcR3sKWIVSjSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477664; c=relaxed/simple;
	bh=czxqeqFESQJ1IDbCMIdR0MSKz9qKCLKWFtSqaZMBlOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mJhnw+aegXviJa0IkNaQuZ1ljo48iYz9BNl8IsJRqQXFK4pk+dVk59UlrzjvxmkqJiubiky5qJ7hiVmF0d4PB2mbXB19lZ09z3zPCz+JCvwTQgmg/JfLiRlbSAK9kHjl+K7kPgZsa6iimpftrkWJqvDu4vPsxe4RJ0vCd3MMzfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvZsdBQM; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvZsdBQM"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b19e291cc6so2716996eaf.2
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2026 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477658; x=1792082458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DfXJtzPnhDJqUStjePsSxjZK7EGw7DHoALi/EH99rg=;
        b=LvZsdBQMFsJ5mCb9SESG8LnwQaG6sqwtEHwT78aZaygG1zwXAlgf3TIMDwh+v3UbIS
         TTITMLpQhj+KM1hW7BK0xeBw6PLjV59Yq3Nso812jd3pcBJS2mAaH1bJ+BlCxKxHNkki
         n8nCHq/5pPctpLeG3YIfU/bJstMmxFF609RQTQxe2jo9yYXqZb3cnS1lhBU9MAJzK/xx
         OGoS7+BtxDrMYpBr3598oaETJ0D3jYsq22qvWIG4fP3J8FkR8Iorr5n2t1SzoCp+9sCO
         NWjwq/EdHmwtwfnpc2U/554bpW31Y/9FPOW6xavV+2/hp+CNDE2kzn5ryoSJdkjfcd+i
         lGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477658; x=1792082458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/DfXJtzPnhDJqUStjePsSxjZK7EGw7DHoALi/EH99rg=;
        b=up6G8ELfWjJ3oLW0y6G7N7cU/mBMDTJnLcAy1uN971LChnYPCQKInB2uCFsWz9ngWt
         q5nQLmZz9IkrlAwMdq58s7UD1KAkQR1A64ABB1mT0xerKM3j0wZAn9XdRRR0frn1Kbby
         8xoZvG7VPBI/5jR2mqDa36zOsnP177W+Nacww9hqbu/WCoEimyxhRSeEgHdCxW0ALTW/
         5Ns2Oh0fev58C8QWM89xH8mhljyZ2X/j0R8l2vXrhmy3j+EpbqS0wj67BZCTmKAdLXmG
         snIDu25RESf6wK7eYA+iust9OHRBTB5VSxDrR5vBq2oqLZ5IWT1RvV402PHZcTFUa35K
         8/qQ==
X-Forwarded-Encrypted: i=1; AKwUvByBb20wbr35uvniQpk+0nmcaLhxtoEc06WV2cYpAiVcLrCdSm/B0W8xC6Cit3unJgTV1lqVLPlD4ZXvMhE=@vger.kernel.org
X-Gm-Message-State: AFuF++mAO2h6YEtIQObIaVtZHwuKizbPPrM15fXbjKPimd/W9NsMvZXE
	ul2/Ns6rwNwJUFQXE8xUXMXJCj6ZdwJ+KOa+Vp8+D0uzW2iRhc+xfwuU
X-Gm-Gg: AYBFou2I45uJvntvj9lTLvUerVwtxdoZdn4KtZa6ljKSNujTGu5MOYIxAO323jR1d7j
	SGMoNMZmX1nxxyYdesZT/MCc/dxZYZKdqtLFh7EjhRpLRZ33PbmTe47lpPildyJTYicgBsPO6h6
	5x4t25mawJ3Ne+gpyLW9/Xz1LSfhGNBx+RRsUphpwH2NTl6XWY+x9OJgm+2nUNdejZP7LJARORo
	SzddNgILe2T3uYqv6mWv4v6JAxY1gXxDfHdpN0EWjYtbVPZRkbr8HVrqDztEEIAX1ait0IpQLRK
	SlsQ+Hvi4BbbxxJlJYe+R81P0I2nsVaR2NMPpL0N3uVv+zYptWM8pQZCjt4bOgoFOuqwJYEjNmj
	iTfZDJzyRokxeGSdPo/JLwI9nAnyJSZWzDetciqW0Qlj6iEdEcE7To4thAN5oblLHvtqRKMzI83
	HwzI21eC9TcCXWEUwEnmalU9/IDq60E1NgzhKOIRMcfH/rRzKIALJGXC9txQKK2Dc+BjdN3jTqB
	GTHV9rgONV7
X-Received: by 2002:a05:6820:8589:20b0:6d9:3d73:6e7d with SMTP id 006d021491bc7-6e7a77c50c8mr3867832eaf.26.1791477657979;
        Thu, 08 Oct 2026 09:40:57 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:57 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] sorttable: avoid pointer arithmetic overflow when locating sort_needed
Date: Thu,  8 Oct 2026 11:40:34 -0500
Message-Id: <20261008164035.3668885-8-lzsx618@gmail.com>
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

The location of the main_extable_sort_needed variable is computed as

  (void *)ehdr + shdr_offset(sec) + sym_value(sym) - shdr_addr(sec)

which first adds the symbol's virtual address (e.g. 0xffffffff8...) to
the pointer and only then subtracts the section address. The
intermediate pointer overflows, which is undefined behaviour and is
reported by UBSan.

Subtract the section address from the symbol value first.

Fixes: a79f248b9b30 ("scripts: Add sortextable to sort the kernel's exception table.")
Assisted-by: Claude:claude-opus-5-5 UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-9-lzsx618@gmail.com

 scripts/sorttable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 88e49a5c42..0425e00c49 100644
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


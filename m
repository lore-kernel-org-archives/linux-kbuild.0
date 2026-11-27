Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737637;
	b=eLg4DMBqswz/mK0UBW/E8b5I3B7ziHbA3qzY3nOmEznOZtenxLKNyI+PxVQMD4vB39uF
	 Nq5pUtIivCuWdnphAchhkXPy0/tCCCaBer3MYf/bt0u0PnPPtp530o+4JBxGklIqnB29F
	 pmTE+M97F7E0C/vkdcoZ8/gBXb50kefaR5Dt005THEFJAB8/WUS1odwIpasRjEJlhSHNH
	 2i3rzNCAqQ5PsaaFTHGQ91G98bk9Vo7uGkm7t1kCDRCmFPp+qQQJYGC8rNT+6Eqnd+F+X
	 Z2gtjF9lwICpEsuTi51cmqdVwgBNq9dE/NBRNSGIXHJ/VEni7fqRsjAJiONOI9O1g1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=bI5wgKSxHmXVhcmMGt1XWUXhGqSxXd41m+lLl/fjbr4=;
	b=aK0a5nZ3J0hHet2d80fVoMUuKbDa+LaQAtDVmzgS9kvulFczpskJMCcN/VmpUefBylsh
	 qxFhR4BwKUSn09+DTxvH+Dl5EJYovrRDfwlXZEBexTaS64DlUM470tI4b6e76iIZTjbv7
	 YJH0zhOOROadP5L/3+sRbp9D9ZFbyXgnj6+r/vFV4tsPO4FDYI++E9EaGJ22YFXbYf/tT
	 s6NiLL5WXUVsFxtQ15OuqXJOdXvBo9Kw95iTOdpNETxnbQvlPdXAfi2Ngv4J9VxmmlrWy
	 Ouq12Ft6fqJUUk9yw/eKs6V6aPrXeWtD/dpRJ1qR9cDiZOhuk1sBcHzwkfirzTp065Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QHUw1TNk;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E9B606A32F
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 00:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E9B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QHUw1TNk
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so6807192f8f.0
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Nov 2026 16:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795737635; x=1796342435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI5wgKSxHmXVhcmMGt1XWUXhGqSxXd41m+lLl/fjbr4=;
        b=QHUw1TNkXmTEOzQX8Nylpr11eeDYM5iLjNsukKHMgqk9V42oWhGyTLN+7wxZwRyM/w
         3csjlbjRDgpgcdzNVGtjc6xfg7iGxplIXyqnVoDNO9456MxYBoXS+Ek22/v6q7/8VJHA
         GzFR9sPBhg5pU+0egnAVpxipNLbXkj26Ol0V2GILslRJB+Gt3vIW4ckBRQW47yHxb1Bx
         39SWXFGql0DWFd+CppzSC7mg92CTrdd6fyQeBO8+a4A5A8pyokNg4D6Ng+JdFVzRiRbG
         BOOQl6M9H2JKfoQdZwiFMygnid5IGGZtPxuVlaeXlU5lm91lKTF88Ox3ZGXvxg1KAaLg
         Qocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795737635; x=1796342435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bI5wgKSxHmXVhcmMGt1XWUXhGqSxXd41m+lLl/fjbr4=;
        b=iHDNwbYXxbk1arq8WZx97U4PZtNiT48GhtlGEpBZffijvolX28WiMsssLhftjPvLm/
         fbYfles9INyyXYcWGsSz2gApQZyU0DCzGdllMXB4lIh5owiTzYv0ACg3q6u9zt5HxHS+
         YVPuu9e/1R59DNztG1w8RdOtgAP9fCw6DZraH4JPM/x+RkHarzXvjk3imiEgbH7IadWg
         yNwDRNFGJ+pRSIQ7g1nCpZ10+wF2Opq37aoWIg9tL20+wspgCTJK1wL9xCqKF3S4LiFT
         aG+EWEl6Pyu7jcGi5VV8AeNzkmOOmmr+XyhFyvtiTpXam94E1Flep2nsgdcz5JsxIN74
         fvoA==
X-Forwarded-Encrypted: i=1; AL+hErG88ya4lfDCSmVLhVy5TUz9HOOsQssOyKPt2qCXpwjiJeLZOZDqozAjpRp6+oEgYS5R7zq5UJiX6o/oHOY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tbd+mVvhlk+ojEDy5JdBPq6S5b4Ji0zcHGlXyO9SgAnv01CGH
	i1MjbyTHRygbKXBnboBIEjmDsFXFVAAqKu3AwLtrAv0czRhRVyEQUuAF
X-Gm-Gg: AZFdTZdnYhruYPHqLUqiSS/LQLiTCRdw+oyLbH8JjJBxjdRmQUA+gsoxi9sI1MpFOk+
	/MXrvhf1hZ4IESuGD1hxTkaRs3UI6FweuoSIXnrg3ILDSG7A3IpZLysSPVMA3U6ohlcVJuUAHpD
	29BHVxK9QUNxLy8rNPD9qqZmTpwwXpeJaopOc1T/5dSeGfSSxyA6mtz1clEO59cqmq2tSoLqElk
	8/TAS85Ams6gkum//p/lEidA+vK9HtANlX1Sme+Ck9mJ8RvHDbHoKkNwqGHJNo21j7t7CkodTyi
	ZeJhgU2HGNTu626VRy//hhUUDScFs4IaLxbP+fTWLqEKhEJrw0bvVKxkRiILDbEg9+BPkOjK+2P
	UU/OnZmjCxqSu103d1arIh1QksPzqU2i1yD22zmuo3lN6XF2bSsYppwnDeybqBhcT2C+ZvTEp3j
	uIcS1PilzsjcVnbl8bAKK5PyoHXoqGPEi9wb+5PokKpT678rhFPMpXXF246uMOKG8Ka52/+ca2s
	4qIK+KBW6Ts9Ev/Z9GBp0y0PeCEmPzQzdhiRBNZRrR7uSbS1fkF34sml8tofJ8zWJRtZGdyOHvl
	rUTXiJxNO5Ejw9PdIzrMxz0AHKfIZoiyrDuc6YxcySABjP6lJn0MGc3hk331ROGttP+i3a860/d
	qyNDVi9hUWwLw3IE9zg==
X-Received: by 2002:a05:6000:4b15:b0:48d:df08:307c with SMTP id ffacd0b85a97d-4abb8ac0d92mr39000455f8f.44.1795737635110;
        Thu, 26 Nov 2026 16:00:35 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm45536616f8f.29.2026.11.26.16.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:00:34 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: samitolvanen@google.com,
	torvalds@linux-foundation.org,
	ljs@kernel.org,
	david.laight.linux@gmail.com,
	sashal@kernel.org,
	lzsx618@gmail.com,
	zuoan.penguin@gmail.com,
	petr.pavlu@suse.com,
	jani.nikula@intel.com,
	xur@google.com,
	sidnayyar@google.com,
	robertusdchris@gmail.com,
	acourbot@nvidia.com,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH 5/5] kconfig: replace XOR with addition for expr_lookup() key generation
Date: Fri, 27 Nov 2026 00:00:15 +0000
Message-ID: <20261127000015.3662267-6-julianbraha@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127000015.3662267-1-julianbraha@gmail.com>
References: <20261127000015.3662267-1-julianbraha@gmail.com>
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

As Linus noted when reporting the 'make oldconfig' performance issue [1],
XOR of the hash_ptr() values will clear the shared bits, increasing hash
table collisions when l == r. In Kconfig, this happens when two sides of
an expression are equal, for example 'range 1 1' in fs/erofs/Kconfig.

Let's replace the XOR usage with addition, as Linus suggested.

Link: https://lore.kernel.org/all/CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com/ [1]
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/expr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 8dc73acb08ad..e30554807d12 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -35,7 +35,7 @@ static struct expr *expr_lookup(enum expr_type type, void *l, void *r)
 	struct expr *e;
 	int hash;
 
-	hash = hash_32((unsigned int)type ^ hash_ptr(l, 32) ^ hash_ptr(r, 32), 32);
+	hash = hash_32((unsigned int)type + hash_ptr(l, 32) + hash_ptr(r, 32), 32);
 
 	hash_for_each_possible(expr_hashtable, e, node, hash) {
 		if (e->type == type && e->left._initdata == l &&
-- 
2.56.0


Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3924919539F
	for <linux-kbuild@vger.kernel.org>; Sun, 15 Mar 2026 04:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773549886; cv=none; b=ZzRecYrn0t/i/e7sovIaCwcxY4AdRcMHiWTvEnUV8QJODexY31igbJDWo+/XYx/JN6PY666cntqnr/SOaoiyz4cCdJXzS1QNj551H4a5z9cPARiI2jNv1sRGSjdo7oNRYTsMEsYJfA6fjnT+15XKkzT66T5ymzTUgMRo4mszQv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773549886; c=relaxed/simple;
	bh=GUGXum2nqhCVs3VZdM1TKA46YirczaWn6gnaDBhw3HI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=YKVHChaU+/65d7ZDOgryPDHx5d3A+CvCut4YNurpwNkePPAGIITUD7htqUolrvjIu0VmOAsIQ8sum6k7VuaUb7iZGHAZiSTfeVyeJxH7CzPnCqILQYlj8kaxHBe7fkwnX2CvWSIkzcGx6QOxhBKjNAOrOlw/fi0X1mP/fkmiwtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberialabs.net; spf=pass smtp.mailfrom=cyberialabs.net; dkim=pass (2048-bit key) header.d=cyberialabs.net header.i=@cyberialabs.net header.b=y0Y1Oocr; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=bqSn7Igk; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberialabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberialabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cyberialabs.net header.i=@cyberialabs.net header.b="y0Y1Oocr";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="bqSn7Igk"
DKIM-Signature: a=rsa-sha256; b=y0Y1Oocr3S7FgOmEhvb29qAW5qnqqElhbW4Fa0dTQzy8yu7Dowg13Z4KJLQhllmnkoWH/1ePvf5PBFKhLKRBz8xeT/zOO7aoE/VabzSwsvGOwvfBk9MllLwKVeipLyWkqk06m9DEpcnLaTDWbghedgwQu6IhZ8ES8txMg7v4wmX5Krtv/NYTZT2jsOIiCilGRKSNhNmL8LifqrStSOgPCXHIX31hZW4PFmznbWsWtVPO7TovWs+XCIg4Zn14kwcCdU/00wQliW/FAB4Y4olTfxDJUXDXgX2soGg8fobuR5FeVMUXtYuqdlZcRtCtlUY2da2W0Id2y9mNHo1pWlJ1tw==; s=purelymail2; d=cyberialabs.net; v=1; bh=GUGXum2nqhCVs3VZdM1TKA46YirczaWn6gnaDBhw3HI=; h=Received:Date:From:To:Subject;
DKIM-Signature: a=rsa-sha256; b=bqSn7Igk2/p+ATZXB4jy34kwgjLcqUNs4Ma3F9OxBpogJXJ6w079cjNCESgulDGDekB5iU6tsRzuqE1tEmWqguUmKOlz9y02OGGaYS23HFj3O//fq3zsXV1nUseb2qRXTHunDy6NhQ1HuNegJxAk3jmnMsrpVe5D501L+z0DoFD81xoIftUT7tg/v5r9Eatc7EJTQaWMmJuR1ROgTg2pl9yivui5UyJj5ChEb8vOBdjZUCScIl2X8Yy1KrK1k0ABkEUHQlhdMUNhIhqWOvHsA+2+SQoY9H4Yd1dhrG2TWPnhw4RcX6XOLqm9lrV++ek8hCHHh8l+JGBnLX52p1FWlA==; s=purelymail2; d=purelymail.com; v=1; bh=GUGXum2nqhCVs3VZdM1TKA46YirczaWn6gnaDBhw3HI=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 6229:1532:null:purelymail
X-Pm-Original-To: linux-kbuild@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPA id 1342528512;
          Sun, 15 Mar 2026 04:44:31 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 14 Mar 2026 21:44:31 -0700
From: Alexander Coffin <alex@cyberialabs.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kbuild: Update the debug information notes
 in reproducible-builds.rst
In-Reply-To: <20260313-kbuild-docs-repro-builds-fdebug-prefix-map-updates-v1-1-3aeeef7fa710@kernel.org>
References: <20260313-kbuild-docs-repro-builds-fdebug-prefix-map-updates-v1-1-3aeeef7fa710@kernel.org>
User-Agent: Purely Mail via Roundcube/1.6.11
Message-ID: <54c081d15d727c87a6e6fce35f2ba561@purelymail.com>
X-Sender: alex@cyberialabs.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Nathan,

I finally got around to reviewing the reproducible builds again and I'm 
pretty sure it is supposed to be `-ffile-prefix-map` (not just 
`-fdebug-prefix-map`) with KCPPFLAGS to also handle macros, but I could 
be mistaken. I can try to build the kernel reproducibly again, but it 
has been a while since I did this (sorry).

- Alex

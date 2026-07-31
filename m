Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC372BEFF5
	for <linux-kbuild@vger.kernel.org>; Fri, 31 Jul 2026 09:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785490513; cv=none; b=ftGdzNJ1FurBMXXvs85PXZ0wJ/NI04MfA8RkyjjR8PuM3JLIk+cYl86RGodAWThbm5SfSeXGbHvKSaAAWlcxWyU/0dXAwfeS1xwS60YwHzfhQrk4pI+jp9guEQmnLgZCm+PC3FGaEFNYjB2KE0lUacknkt+Ujmd5ga/LF5jvyWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785490513; c=relaxed/simple;
	bh=TD3qbGmT7SiLuJPo5iSxSemNSrhEq28v0D6rRhrKe5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QCJIQbfjIAnLKVwcZomQnYAg9CYsgDc++xFTVqmzZP46BfzRVVnrid36a8f4eUl5/WhZcaFGUCl8PcTMVpMMagGGnq3WtqdZ3AruOl6ClIh/w8CD97CWs1dVIyNG1l3YjkK2q+CUd23vuUKf6QhS+u0cp/vFq3CS9r4R4GBbr6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+Zs0EqL; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+Zs0EqL"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a02aedabadso1138362a12.1
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Jul 2026 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785490510; x=1786095310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TD3qbGmT7SiLuJPo5iSxSemNSrhEq28v0D6rRhrKe5E=;
        b=O+Zs0EqLNNE38pu2aBg5SJ8xVt/fqwjMBdJlRLAor7eO50U5mqQqPzoK2mHZyzuooC
         5Is5W/XY3OQ0skG1orphyfn3UuLvJJRHRN+tufgLtKewGAl7YAq0yZH/CdpzqonMgYYt
         sxdlgTbW0uawJjLDjM0stAISZq4lURJVDuIz58YQwac1+8t0okcPs9+X8U4TMMe2YaMN
         WYsmNL5nPuuVtIE0/qmTrnDc8aBPBy4puOp520U4eNC76OPCbW70yY6/xKDkW/vHrXMK
         liSberHo9SM4aDQZ0ln717QD+ttdfEFM0jWtJBw48tBP+emy4zxzoSP2Dr7qmzgfS+Ep
         MlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785490510; x=1786095310;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TD3qbGmT7SiLuJPo5iSxSemNSrhEq28v0D6rRhrKe5E=;
        b=rfTCrbBAFW0SiQ+PTjPL62sHSEpRsEBmbYbsXp0b6IhfWLR6aw7r5YsdImyUoxDQ9J
         /4dbnBj8wrLVBPBDAHvMFQ9o3CyaVSco7CRwzhKWIIBuoRuvEC7F4C+pbtkG/8VB5FzO
         yX9Zuef+YlQLVGuE7iWIjBNfqUmFCsSUUde8EcWDWDq7JC5S9aBF+c/pQggCM3jBo6oW
         KFBdAAWz70rcggnEiJJgTA8IFR/sPfh/kH8qxTgo1mfHgPQhvKkkt3wUKp0R3UDBLxen
         1gSLv5/Ma+6lPorIa2mEznqwJjoW1pyFdVD4O+6Rcg7/OIzByaDqomEqE01we9OTtoLO
         Zg8A==
X-Forwarded-Encrypted: i=1; AHgh+RqLSNyuOvSJpAnThlvBfKpZaOb8YTYgKijuPt7gPiQn3jM3AKcdne9jQb8uhAySr73pQYl7y7YMeg4SEHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRJdX+UlPnHAYqrAat5hFv9OQa3oEjiik0JJRJwjHdlDQ//1sI
	mosd2Ocrv6PxQJMlw4Z0y0yYs3y/Jg7nw5AT8k0o8dvsHagZqkbQirhR
X-Gm-Gg: AR+sD131gTxX7sbesN64ypeOiWj7N1YSG6xVB/o01y1VMjAfkodG8fYabTj/girxonB
	IQtEES0PTAEWJiNe55jWB3BZSXvbKVNaaltX854gTX8EbofpnSWBg3ZDhQ5IivQGGCXYu56lGN3
	Q0Ipfm21tFgzUB2WJCL+5LWftbQ/JDKNWIXk257ZmfOl8ChAwRoq/1s9LDGwfcQQlmgoH39h7mO
	/WZ3uLxkELpA/mvaJv12hY0qGlqz2xpzvqeXvyTElguzFS7/uGa1tzi/Qlv0iOhGjvzuKXsBgP/
	gghricjzpfDccxGDkrqMBNvQ9xuWR3fGZCUaB+hHKB7qn+Eer6ISLlQ5Ugn7x+zfeUT7P4/n4Tj
	8HS0BxRx2yudK5KOI16wL2xf0lm1sajWIzGNuM0jHCnNKaJgB202C4B8m1QPEMePn0/7T/Tjm7+
	YHmQbINk1zd+wFM7UsYNexaXWqBGDo2b6dsG+7E9vSxSMOdiDL9D2z1aXl3qCM3+gmwQfV+y2zq
	LM3Rjx8ZzgJcE7e6l6lhGcO+8uJji7pGDi+L5YocZo4nYh2p0OeucqdvWi7P8JjVwRVZXZr2AJs
	T/WB/fQ=
X-Received: by 2002:a05:6402:4505:b0:6a0:97b3:6491 with SMTP id 4fb4d7f45d1cf-6a098ccc5femr607691a12.18.1785490509851;
        Fri, 31 Jul 2026 02:35:09 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e962:d100:1418:46b6:4675:1031? ([2001:8a0:e962:d100:1418:46b6:4675:1031])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c66109csm951329a12.26.2026.07.31.02.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 02:35:09 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <222d4234-f4b0-40a4-ab50-7f537ccc9b53@gmail.com>
Date: Fri, 31 Jul 2026 10:35:08 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: fix submenu rendering of negative dependencies
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, kees@kernel.org, xry111@xry111.site, hyc.lee@gmail.com,
 jeffbai@aosc.io, vegard.nossum@oracle.com, rdunlap@infradead.org,
 grahamr@qti.qualcomm.com, nico@fluxnic.net, masahiroy@kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721193028.313342-1-julianbraha@gmail.com>
 <178545960208.3004192.10262827405138720875.b4-review@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <178545960208.3004192.10262827405138720875.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nathan,

On 7/31/26 02:00, Nathan Chancellor wrote:
> I would prefer to have a short standalone blurb about the issue reported
> at that link so that the commit message is self-contained. Move the link
> to the trailers with the Closes: tag.

Thank you for reviewing, will send a v2 with this change.

- Julian Braha

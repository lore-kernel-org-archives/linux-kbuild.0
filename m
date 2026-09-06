Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3641C346E7E
	for <linux-kbuild@vger.kernel.org>; Sun,  6 Sep 2026 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788708147; cv=none; b=LPp3DVUdsTCx5BZFSThi/J+mi9ngZ6u3irzbnWe7pFtdy8R6OrybVXBANkNFYTObmM3Iyn9LRvWwIwKewZz46vSYsT+h2b1J8VJjhPnkeFjLMp2ppz8xs5NQUtn4Ov2e/9YHa/ElTrdsbKwpHhwCAbYJUkX7oR3IpoFirLOUGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788708147; c=relaxed/simple;
	bh=2RuwsSOghu+1sW6+flmIsf2dgGKOVqUcim+HV99LCPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BojVzHOdgb1HEpzUJnprwIdjr2Q35FEe4oa3zHEthAd17gbtjZZ2rUYf4ZBHf0/ip6VxmxuYljvr9mKRegc63NdjxsW6Dn5ouRBiFL3/cqmFgLJnruLmrt4DpaSpCxplwRb2Xgc/vitZW5OzF+7qpJRtWUcX9iPrFXaF24q94rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0/w3IiX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0/w3IiX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso23321185e9.0
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Sep 2026 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788708144; x=1789312944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQBEKZMfj7YKELN51p7vaiO9vxhxgKuR+dj6LxJhir8=;
        b=G0/w3IiXLP3dBYLWCeC24tkdTF63Z7WvkbX9KAYvLDm4s0hQnBlnVtBu+sQHytwOFH
         VDIvxZhSj1eT0Cb+jhVf9IWUlTSQux2v8b6uIHNMAvu7qga2u0e+zQ6K8M6izvGijvS9
         RZp8EfEoIZ1qbPbsEiV5khJ2JX5OO909c9kvzmdug26zqj9lpw+KyMx12LwPLKbLACWY
         j47jIJdF/kiB7l7Pc6yVv7Ggdx4VAZNN0TvOWeuIXT42inHQ0qLQbGZbfw/fYHclasKJ
         HplOM9vb9fEao9Nl57BNTBnY3rSNOoLd6VgzxdnN1r119k2AXMRDHMvWj+/e6rDVWAQe
         qWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788708144; x=1789312944;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mQBEKZMfj7YKELN51p7vaiO9vxhxgKuR+dj6LxJhir8=;
        b=kwnKcfkwxmn9E3nc0i+Of5IAPpuOCvpbZ3fS6jKi81nPGAWzHpR0cbzFq+FZWfMi5Q
         eX7XMIc5F7Ob5gQY+VHu4bo2dLauigr0uMdGGBsFwEQ/IkU3utls+guitKmZZCtEETd8
         Q5GbwL82KnCAGuuZ1i++od2l8LgGwaSeJKOT0QgXn6QTIwr9aNjdK6cir5BNBR1Eavky
         zaCOcMOibfnxyU6Bzpbl/d0xhYFMjpmPlnXUuwcI+DpefwqM/c+t7QdqhnIN1h4TmKJS
         JSHC80SEvQfEwXEIWqjUJJfZGTReRAR5StbhwmvnTl4f1GTkcBnpvMLQbIJJCBOz5POL
         o2jQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQvFQrIac0aUNsrGf9plYEcpmjIysdCZ/1bo8z4JgaUhcUGIu+6Rl4M1PXzGXpUCmLPU4TmOWqnwKiJ54=@vger.kernel.org
X-Gm-Message-State: AFuF++nj3V0UOtXT17e5OOnxCsFnBo30NJf5GKRnQtXN2AjC7l4E885Q
	u3ue7oJp70Q2mso2GOlbCXnP7cWtLDO+Np5opNdCuL2ofCRX/eGvTMjP
X-Gm-Gg: AYBFou0F5c9uH0JMy1l8sT2im5HV8KSOJptwFhYhLbcUnHQJUm4w7AlzUqwHv6SGx9L
	DjnvezqCVBCVEWTIzN0xPT7kANtfq7O9EaHuPNWBk0EKerdbNs3LN8EpFd0xsL0FXdnnuzz/pUL
	xIqMtJ3SyjPFb4ZPDKt9AEes42BBlpaDf/NkxtWuboJ5MX+IylzUjh7ykLF3FBCQz+1FRTvqg9W
	iJOAQ1WCV4v13izro5O/H66KwT7vVUS6tcC2Jmif1JD+QD9G9xx18OgK5Qnooa7kIjSO6Vb/q94
	Dcfw1ObDxO5phJt+1kS7TAhPtEjXHKsIR7lp+oCtlz/mrcjRuaBnH1bKsKC/UkClGZnyI4dK6aX
	sC4Q4uj3XsnY7c9K7w6j6HT/UYBhrJPkcfiCgylUPzHi8WXi/uAala5S30Xsh+cr+hGs5VoCSTp
	GLMXl7ZReXKAc+JER4VCLWpmnd/9HdpwAX//lkHX6QhYKxkc8KjhPJtHLazXaLeyB+PWFYEn8xW
	bc6ze3uq705yO2ShC4OXolLjfwSwl2IfMoQs+dSeS8o8HFK7irP1oJYD3iBBo+ueBU=
X-Received: by 2002:a05:600c:5247:b0:49c:ee3b:723d with SMTP id 5b1f17b1804b1-49cf81f69ddmr163847855e9.0.1788708144138;
        Sun, 06 Sep 2026 08:22:24 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0656e7bbsm137239825e9.10.2026.09.06.08.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 08:22:23 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <4bdaab67-87d7-4c5c-8cb5-ac0f9add4d97@gmail.com>
Date: Sun, 6 Sep 2026 16:22:21 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] add kconfirm
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, ojeda@kernel.org, akpm@linux-foundation.org,
 jani.nikula@linux.intel.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 arnd@arndb.de, ljs@kernel.org, andrew.jones@linux.dev, masahiroy@kernel.org,
 corbet@lwn.net, qingfang.deng@linux.dev, demiobenour@gmail.com, ej@inai.de,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260727001623.2794156-1-julianbraha@gmail.com>
 <51ade68e-7a0c-454e-a48a-4c72f7a730ac@gmail.com>
 <20260904220559.GB2787252@ax162>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260904220559.GB2787252@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/4/26 23:05, Nathan Chancellor wrote:

> My apologies for not getting to this sooner, I have been busy with some
> other projects. I will try to play around with this from a usability
> perspective (which is what I am most concerned with at this point). If a
> v5 is mostly prepared, I would not mind seeing it even if we want to go
> the in-tree interpreter checks. One option is to take kconfirm into the
> tree, fix up the warnings it generates, then moving the checks into the
> interpreter directly while dropping them from kconfirm (since the tree
> should be clean at that point). I am open to opinions on that though.
> 

Your strategy makes sense to me. I'll send v5 then, but I'd also like to
make sure that Nicolas is onboard with this idea.

- Julian Braha
